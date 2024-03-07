<?php

namespace App\Controller;

use App\Entity\Asistente;
use App\Entity\Bono;
use App\Entity\PuestoComida;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\SerializerInterface;

class BonoController extends AbstractController
{

    public function asistenteBonos(Request $request, SerializerInterface $serializer)
    {
        $id = $request->get('id_asistente');

        $asistente = $this->getDoctrine()->getManager()
            ->getRepository(Asistente::class)
            ->findOneBy(['id' => $id]);

        $bonos = $asistente->getBono();

        $bonos = $serializer->serialize($bonos, 'json', ['groups' => ['bono','puesto_comida']]);

        return new Response($bonos);

    }

    public function asistenteBono(Request $request, SerializerInterface $serializer)
    {

        $id = $request->get('id_asistente');
        $id_bono = $request->get('id_bono');

        $asistente = $this->getDoctrine()
            ->getRepository(Asistente::class)
            ->findOneBy(['id' => $id]);

        $bono = $this->getDoctrine()
            ->getManager()
            ->getRepository(Bono::class)
            ->findOneBy(['id' => $id_bono]);

        $bonos = $asistente->getBono();

        foreach ($bonos as $b){
            if($b === $bono){

                if ($request->isMethod("DELETE")) {

                    $asistenteBono = $b->getAsistente();

                    $asistenteBono->removeElement($asistente);
                    $bonos->removeElement($b);

                    $this->getDoctrine()->getManager()->persist($asistente);
                    $this->getDoctrine()->getManager()->flush();

                    $this->getDoctrine()->getManager()->persist($b);
                    $this->getDoctrine()->getManager()->flush();

                }

                $b = $serializer->serialize($b, 'json', ['groups' => ['bono', 'puesto_comida']]);
                return new Response($b);

            }
        }


        return new Response('No tiene ese bono');
    }

    public function anyadirBonosAsistente(Request $request, SerializerInterface $serializer){
        $id_asistente = $request->get('id_asistente');

        $asistente = $this->getDoctrine()
            ->getManager()
            ->getRepository(Asistente::class)
            ->findOneBy(['id' => $id_asistente]);

        $bonos = $this->getDoctrine()
            ->getManager()
            ->getRepository(Bono::class)
            ->findAll();

        foreach ($bonos as $bono){
            $bonosAsistente = $asistente->getBono();
            $asistentes = $bono->getAsistente();

            $bonosAsistente->add($bono);
            $asistentes->add($asistente);

            $this->getDoctrine()->getManager()->persist($bono);
            $this->getDoctrine()->getManager()->flush();
            $this->getDoctrine()->getManager()->persist($asistente);
            $this->getDoctrine()->getManager()->flush();
        }

        $asistente = $serializer->serialize(
            $asistente, 'json', ['groups' => ['asistente']]
        );

        return new Response($asistente);
    }
}
