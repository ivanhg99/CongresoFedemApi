<?php

namespace App\Controller;

use App\Entity\Empresa;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\SerializerInterface;

class EmpresaController extends AbstractController
{

    public function empresas(SerializerInterface $serializer) {

        $empresas = $this->getDoctrine()->getManager()->getRepository(Empresa::class)->findAll();

        $empresas = $serializer->serialize($empresas, 'json', ['groups' => ['empresa']]);

        return new Response($empresas);

    }



    public function empresa(Request $request, SerializerInterface $serializer) {

        $id = $request->get('id');

        $empresa = $this->getDoctrine()->getManager()->getRepository(Empresa::class)->findOneBy(['id' => $id]);

        $empresa = $serializer->serialize($empresa, 'json', ['groups' => ['empresa']]);

        return new Response($empresa);

    }

}