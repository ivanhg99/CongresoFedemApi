<?php

namespace App\Controller;

use App\Entity\Actividad;
use App\Entity\Ajeno;
use App\Entity\Asistente;
use App\Entity\Evento;
use App\Entity\PuestoComida;
use App\Entity\Valoracion;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\SerializerInterface;

class PuestoComidaController extends AbstractController
{
    public function puestosComida(SerializerInterface $serializer){
        $puestos_comida = $this->getDoctrine()
            ->getManager()
            ->getRepository(PuestoComida::class)
            ->findAll();

        $puestos_comida = $serializer->serialize(
            $puestos_comida,'json', ['groups' => ['puesto_comida']]);

        return new Response($puestos_comida);
    }

    public function puestoComida(Request $request, SerializerInterface $serializer){
        $id = $request->get('id_puesto_comida');
        $puestos_comida = $this->getDoctrine()
            ->getManager()
            ->getRepository(PuestoComida::class)
            ->findOneBy(['id'=>$id]);

        $puestos_comida = $serializer->serialize(
            $puestos_comida,'json', ['groups' => ['puesto_comida']]);

        return new Response($puestos_comida);
    }


}