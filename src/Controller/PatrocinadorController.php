<?php

namespace App\Controller;

use App\Entity\Bono;
use App\Entity\Congreso;
use App\Entity\Empresa;
use App\Entity\Entrada;
use App\Entity\Evento;
use App\Entity\MetodoPago;
use App\Entity\Pago;
use App\Entity\Paquete;
use App\Entity\Patrocinador;
use App\Entity\Ponente;
use App\Entity\PuestoComida;
use App\Entity\Socio;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\SerializerInterface;
use function Sodium\add;

class PatrocinadorController extends AbstractController
{

    public function patrocinadores(SerializerInterface $serializer): Response
    {
        $patrocinadores = $this->getDoctrine()
            ->getManager()
            ->getRepository(Patrocinador::class)
            ->findAll();

        $patrocinadores = $serializer->serialize(
            $patrocinadores,
            'json', [
                'groups' =>[
                    'patrocinador',
                    'paquete',
                    'empresa'
                ]

            ]
        );

        return new Response($patrocinadores);
    }

    public function patrocinador(Request $request,SerializerInterface $serializer): Response
    {
        $cif= $request->get('cif_empresa');

        $empresa = $this->getDoctrine()
            ->getManager()
            ->getRepository(Empresa::class)
            ->findOneBy(['cif'=>$cif]);

        $patrocinador = $this->getDoctrine()
            ->getManager()
            ->getRepository(Patrocinador::class)
            ->findOneBy(['empresaCif'=>$empresa]);

        if($request->isMethod("POST")){ //Crear patrocinador nuevo
            $id_paquete=$request->get("paquete_id");

            $paquete = $this->getDoctrine()
                ->getManager()
                ->getRepository(Paquete::class)
                ->findOneBy(['id'=>$id_paquete]);

            $patrocinador=new Patrocinador();
            $patrocinador->setEmpresaCif($empresa);
            $patrocinador->setPaquete($paquete);

            $this->getDoctrine()
                ->getManager()
                ->persist($patrocinador);

            $this->getDoctrine()
                ->getManager()
                ->flush();
        }

        if($request->isMethod("DELETE")){ //Eliminar patrocinador

            $this->getDoctrine()
                ->getManager()
                ->remove($patrocinador);
            $this->getDoctrine()
                ->getManager()
                ->flush();

            return new Response('Borrado');
        }

        $patrocinadores = $serializer->serialize(
            $patrocinador,
            'json', [
                'groups' =>[
                    'patrocinador',
                    'paquete',
                    'empresa'
                ]

            ]
        );

        return new Response($patrocinadores);
    }

}