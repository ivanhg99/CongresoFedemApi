<?php

namespace App\Controller;

use App\Entity\Asistente;
use App\Entity\Empresa;
use App\Entity\Socio;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\SerializerInterface;

class SocioController extends AbstractController
{

    public function socios(Request $request,SerializerInterface $serializer)
    {
        if ($request->isMethod("GET")) {
            $socio = $this->getDoctrine()
                ->getManager()
                ->getRepository(Socio::class)
                ->findAll();
        }

        $socio = $serializer->serialize(
            $socio, 'json', ['groups' => ['socio','empresa','asistente']]
        );
        return new Response($socio);
    }

    public function socio(Request $request,SerializerInterface $serializer)
    {
        $id_asistente = $request->get('id_asistente');
        
        $asistente = $this->getDoctrine()
            ->getManager()
            ->getRepository(Asistente::class)
            ->findOneBy(['id' => $id_asistente]);

        $socio = $this->getDoctrine()
            ->getManager()
            ->getRepository(Socio::class)
            ->findOneBy(['asistente' => $asistente]);

        if ($request->isMethod("GET")) {
            $socio = $serializer->serialize(
                $socio, 'json', ['groups' => ['socio','empresa','asistente']]
            );
        }

        if ($request->isMethod("DELETE")) {

            $this->getDoctrine()->getManager()->remove($socio);
            $this->getDoctrine()->getManager()->flush();

            return new Response("Eliminado");
        }

        return new Response($socio);
    }

    public function anyadirSocio(Request $request,SerializerInterface $serializer)
    {

        if ($request->isMethod("POST")) {

            $id_asistente = $request->get('id_asistente');
            $cargo = $request->get('cargo');
            $cif = $request->get('empresa');

            $asistente = $this->getDoctrine()
                ->getManager()
                ->getRepository(Asistente::class)
                ->findOneBy(['id' => $id_asistente]);

            $empresa = $this->getDoctrine()
                ->getManager()
                ->getRepository(Empresa::class)
                ->findOneBy(['cif' => $cif]);

            $socio = new Socio();
            $socio->setAsistente($asistente);
            $socio->setCargo($cargo);
            $socio->setEmpresa($empresa);

            $this->getDoctrine()->getManager()->persist($socio);
            $this->getDoctrine()->getManager()->flush();

        }

        $socio = $serializer->serialize(
            $socio, 'json', ['groups' => ['socio','empresa','asistente']]
        );
        return new Response($socio);
    }
}
