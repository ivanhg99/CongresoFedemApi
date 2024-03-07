<?php

namespace App\Controller;

use App\Entity\Actividad;
use App\Entity\Ajeno;
use App\Entity\Evento;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\Normalizer\DateTimeNormalizer;
use Symfony\Component\Serializer\SerializerInterface;

class ActividadController extends AbstractController
{

    public function actividades(SerializerInterface $serializer) {

        $actividades = $this->getDoctrine()->getManager()->getRepository(Actividad::class)->findAll();

        $actividades = $serializer->serialize($actividades, 'json', [DateTimeNormalizer::FORMAT_KEY=>'H:i','groups' => ['actividad']]);

        return new Response($actividades);

    }

    public function actividad(Request $request, SerializerInterface $serializer) {

        $id = $request->get('id');

        $actividad = $this->getDoctrine()->getManager()->getRepository(Actividad::class)->findOneBy(['id' => $id]);

        $actividad = $serializer->serialize($actividad, 'json', [DateTimeNormalizer::FORMAT_KEY=>'H:i','groups' => ['actividad']]);

        return new Response($actividad);

    }

    public function actividadesAjeno(Request $request, SerializerInterface $serializer) {

        $id_ajeno = $request->get('id_ajeno');

        $ajeno = $this->getDoctrine()->getManager()
            ->getRepository(Ajeno::class)
            ->findOneBy(['idAjeno' => $id_ajeno]);

        $actividades=$ajeno->getActividad();

        $actividades= $serializer->serialize($actividades, 'json', [DateTimeNormalizer::FORMAT_KEY=>'H:i','groups' => ['actividad']]);

        return new Response($actividades);

    }



    public function ajenoActividad(Request $request, Request $request2, SerializerInterface $serializer) {

        $idAjeno = $request->get('id_ajeno');
        $idActividad = $request2->get('id_actividad');

        $ajeno = $this->getDoctrine()->getManager()
            ->getRepository(Ajeno::class)
            ->findOneBy(['idAjeno' => $idAjeno]);

        $actividad = $this->getDoctrine()->getManager()
            ->getRepository(Actividad::class)
            ->findOneBy(['id' => $idActividad]);

        $ajenos = $actividad->getAjenoIdAjeno();

        if ($request->isMethod("POST")) {

            $ajenos->add($ajeno);

            $this->getDoctrine()->getManager()->persist($actividad);
            $this->getDoctrine()->getManager()->flush();

        }

        if ($request->isMethod("DELETE")) {

            $ajenos->removeElement($ajeno);

            $this->getDoctrine()->getManager()->persist($actividad);
            $this->getDoctrine()->getManager()->flush();

        }

        $actividad = $serializer->serialize($actividad, 'json', [DateTimeNormalizer::FORMAT_KEY=>'H:i','groups' => ['actividad']]);

        return new Response($actividad);

    }

    public function actividadAsistentes(Request $request, SerializerInterface $serializer)
    {

        $id = $request->get('id_actividad');

        $actividad = $this->getDoctrine()
            ->getRepository(Actividad::class)
            ->findOneBy(['id' => $id]);

        $asistentes = $actividad->getAjenoIdAjeno();

        $asistentes = $serializer->serialize($asistentes, 'json', ['groups' => ['asistente','ajeno']]);

        return new Response($asistentes);

    }


}
