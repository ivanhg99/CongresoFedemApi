<?php

namespace App\Controller;

use App\Entity\Evento;
use App\Entity\Ponente;
use App\Entity\Socio;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\SerializerInterface;

class PonenteController extends AbstractController
{

    public function ponentes(Request $request, SerializerInterface $serializer)
    {
        if ($request->isMethod("GET")) {
            $ponentes = $this->getDoctrine()
                ->getManager()
                ->getRepository(Ponente::class)
                ->findAll();
        }

        $ponentes = $serializer->serialize(
            $ponentes, 'json', ['groups' => ['ponente', 'socio', 'asistente', 'empresa']]
        );
        return new Response($ponentes);
    }


    public function ponenteSocio(Request $request, SerializerInterface $serializer)
    {
        $id_socio = $request->get('id_socio');

        $socio = $this->getDoctrine()
            ->getManager()
            ->getRepository(Socio::class)
            ->findOneBy(['idSocio' => $id_socio]);

        $ponente = $this->getDoctrine()
            ->getManager()
            ->getRepository(Ponente::class)
            ->findOneBy(['socio' => $socio]);

        if ($request->isMethod("GET")) {
            if(is_null($ponente)) return new Response("Ese socio no es ponente");
        }

        if ($request->isMethod("POST")) {
            $ponente = new Ponente();
            $ponente->setSocio($socio);
            $this->getDoctrine()->getManager()->persist($ponente);
            $this->getDoctrine()->getManager()->flush();
        }
        if ($request->isMethod("DELETE")) {

            $this->getDoctrine()->getManager()->remove($ponente);
            $this->getDoctrine()->getManager()->flush();

            return new Response("Eliminado");
        }
        $ponente = $serializer->serialize(
            $ponente, 'json', ['groups' => ['ponente', 'socio', 'asistente', 'empresa']]
        );
        return new Response($ponente);
    }
}