<?php

namespace App\Controller;

use App\Entity\Congreso;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\Normalizer\DateTimeNormalizer;
use Symfony\Component\Serializer\SerializerInterface;

class CongresoController extends AbstractController
{

    public function congreso(SerializerInterface $serializer) {

        $congreso = $this->getDoctrine()->getManager()->getRepository(Congreso::class)->findAll();

        $congreso = $serializer->serialize($congreso, 'json', [DateTimeNormalizer::FORMAT_KEY=>'d-m-Y','groups' => ['congreso', 'patrocinador']]);

        return new Response($congreso);

    }

}