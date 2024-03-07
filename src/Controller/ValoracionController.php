<?php

namespace App\Controller;

use App\Entity\Actividad;
use App\Entity\Ajeno;
use App\Entity\Asistente;
use App\Entity\Evento;
use App\Entity\Valoracion;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Serializer\Normalizer\DateTimeNormalizer;

class ValoracionController extends AbstractController
{
    public function eventoValoraciones(Request $request,SerializerInterface $serializer) {

        $id_evento = $request->get('id_evento');

        $evento = $this->getDoctrine()->getManager()
            ->getRepository(Valoracion::class)
            ->findOneBy(['id' => $id_evento]);

        $valoraciones = $this->getDoctrine()->getManager()
            ->getRepository(Valoracion::class)
            ->findBy(['evento' => $evento]);

        $suma = 0;
        foreach ($valoraciones as $valoracion){
            $suma = $suma + $valoracion->getValoracion();
        }

        $media = $suma/count($valoraciones);

        return new JsonResponse($media);
    }

    public function eventoAsistentes(Request $request,SerializerInterface $serializer) {

        $id_evento = $request->get('id_evento');

        $evento = $this->getDoctrine()->getManager()
            ->getRepository(Evento::class)
            ->findOneBy(['id' => $id_evento]);

        $valoraciones = $this->getDoctrine()->getManager()
            ->getRepository(Valoracion::class)
            ->findBy(['evento' => $evento]);

        $asistentes = [];
        foreach ($valoraciones as $valoracion){
            $asistentes[] = $valoracion->getAsistente();
        }

        $asistentes = $serializer->serialize($asistentes, 'json', ['groups' => ['asistente']]);

        return new Response($asistentes);
    }

    public function valoracion(Request $request,SerializerInterface $serializer) {

        $id_asistente = $request->get('id_asistente');
        $id_evento = $request->get('id_evento');

        $evento = $this->getDoctrine()->getManager()
            ->getRepository(Evento::class)
            ->findOneBy(['id' => $id_evento]);

        $asistente = $this->getDoctrine()->getManager()
            ->getRepository(Asistente::class)
            ->findOneBy(['id' => $id_asistente]);

        $valoracion = $this->getDoctrine()->getManager()
            ->getRepository(Valoracion::class)
            ->findOneBy(['asistente' => $asistente, 'evento' => $evento]);

        if ($request->isMethod("POST")) {

            $nota = $request->get('valoracion');

            $valoracion = new Valoracion();
            $valoracion->setAsistente($asistente);
            $valoracion->setEvento($evento);
            $valoracion->setValoracion($nota);

            $this->getDoctrine()->getManager()->persist($valoracion);
            $this->getDoctrine()->getManager()->flush();

        }

        $valoracion = $serializer->serialize($valoracion, 'json', ['groups' => ['valoracion','asistente','evento']]);

        return new Response($valoracion);
    }

    public function asistenteEventos(Request $request,SerializerInterface $serializer) {

        $id_asistente = $request->get('id_asistente');

        $asistente = $this->getDoctrine()->getManager()
            ->getRepository(Asistente::class)
            ->findOneBy(['id' => $id_asistente]);

        $valoraciones = $this->getDoctrine()->getManager()
            ->getRepository(Valoracion::class)->findBy(['asistente' => $asistente]);

        $eventos = [];

        foreach ($valoraciones as $e) {

            $eventos[] = $e->getEvento();

        }

        $eventos = $serializer->serialize($eventos, 'json', [DateTimeNormalizer::FORMAT_KEY=>'H:i','groups' => ['evento']]);

        return new Response($eventos);

    }

}
