<?php

namespace App\Controller;

use App\Entity\Actividad;
use App\Entity\Evento;
use App\Entity\Ponente;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\Normalizer\DateTimeNormalizer;
use Symfony\Component\Serializer\SerializerInterface;

class EventoController extends AbstractController
{

    public function evento(Request $request,SerializerInterface $serializer) {

        $id = $request->get('id_evento');

        $evento = $this->getDoctrine()->getManager()
            ->getRepository(Evento::class)
            ->findOneBy(['id'=>$id]);

        $evento = $serializer->serialize(
            $evento, 'json', [
                DateTimeNormalizer::FORMAT_KEY=>'H:i',
                'groups' => ['evento']
            ]);


        return new Response($evento);

    }

    public function eventos(SerializerInterface $serializer) {

        $eventos = $this->getDoctrine()->getManager()->getRepository(Evento::class)->findAll();

        $eventos = $serializer->serialize($eventos, 'json', [DateTimeNormalizer::FORMAT_KEY=>'H:i','groups' => ['evento']]);


        return new Response($eventos);

    }

    public function eventoPonentes(Request $request, SerializerInterface $serializer)
    {

        $id = $request->get('id_evento');

        $evento = $this->getDoctrine()
            ->getRepository(Evento::class)
            ->findOneBy(['id' => $id]);

        $ponentes = $evento->getPonente();

        $ponentes = $serializer->serialize($ponentes, 'json', ['groups' => ['ponente', 'socio', 'asistente', 'empresa']]);

        return new Response($ponentes);

    }

    public function eventoAsistentes(Request $request, SerializerInterface $serializer)
    {

        $id = $request->get('id_evento');

        $evento = $this->getDoctrine()
            ->getRepository(Evento::class)
            ->findOneBy(['id' => $id]);

        $asistentes = $evento->getAjenoIdAjeno();

        $asistentes = $serializer->serialize($asistentes, 'json', ['groups' => ['asistente','ajeno']]);

        return new Response($asistentes);

    }

    public function ponenteEventos(Request $request, SerializerInterface $serializer)
    {

        $id = $request->get('id_ponente');

        $ponente = $this->getDoctrine()
            ->getRepository(Ponente::class)
            ->findOneBy(['id' => $id]);

        $eventos = $ponente->getEvento();

        $eventos = $serializer->serialize($eventos, 'json', [DateTimeNormalizer::FORMAT_KEY=>'H:i','groups' => ['evento', 'congreso', 'ponente', 'asistente']]);

        return new Response($eventos);

    }

    public function ponenteEvento(Request $request, SerializerInterface $serializer)
    {

        $id = $request->get('id_ponente');
        $id2 = $request->get('id_evento');

        $ponente = $this->getDoctrine()->getRepository(Ponente::class)->findOneBy(['id' => $id]);
        $evento = $this->getDoctrine()->getRepository(Evento::class)->findOneBy(['id' => $id2]);

        if ($request->isMethod("POST")) {

            $eventoPonente = $ponente->getEvento();

            $eventoPonente->add($evento);

            $ponente->setEvento($eventoPonente);

            $this->getDoctrine()->getManager()->persist($ponente);
            $this->getDoctrine()->getManager()->flush();

        }

        $evento = $serializer->serialize($evento, 'json', [DateTimeNormalizer::FORMAT_KEY=>'H:i','groups' => ['evento', 'congreso', 'ponente', 'asistente']]);

        return new Response($evento);
    }

}