<?php

namespace App\Controller;

use App\Entity\Asistente;
use App\Entity\Bono;
use App\Entity\Congreso;
use App\Entity\Entrada;
use App\Entity\Evento;
use App\Entity\MetodoPago;
use App\Entity\Pago;
use App\Entity\Ponente;
use App\Entity\PuestoComida;
use App\Entity\Socio;
use App\Entity\Valoracion;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\Normalizer\DateTimeNormalizer;
use Symfony\Component\Serializer\SerializerInterface;
use function Sodium\add;

class EntradaController extends AbstractController
{

    public function entradas(Request $request,SerializerInterface $serializer): Response
    {

        $entradas = $this->getDoctrine()
            ->getManager()
            ->getRepository(Entrada::class)
            ->findAll();

        $entradas = $serializer->serialize(
            $entradas,
            'json', [DateTimeNormalizer::FORMAT_KEY=>'d-m-Y',
                'groups' =>[
                    'entrada', 'asistente', 'congreso'
                ]
            ]
        );
        return new Response($entradas);
    }

    public function entrada(Request $request, SerializerInterface $serializer)
    {
        $id_asistente = $request->get('id_asistente');
        $codigoQr = $request->get('codigo_qr');
        $tipo = $request->get('tipo');

        $asistente = $this->getDoctrine()
            ->getManager()
            ->getRepository(Asistente::class)
            ->findOneBy(['id' => $id_asistente]);

        $entrada = $this->getDoctrine()
            ->getManager()
            ->getRepository(Entrada::class)
            ->findOneBy(['asistente' => $asistente]);


        if ($request->isMethod("POST")) {

            $entrada = new Entrada();

            $entrada->setAsistente($asistente);
            $entrada->setCodigoQr($codigoQr);
            $entrada->setCongresoId(1);
            $entrada->setTipo($tipo);

            $fechaactual = new \DateTime();
            $entrada->setFechaCompra($fechaactual);


            $this->getDoctrine()->getManager()->persist($entrada);
            $this->getDoctrine()->getManager()->flush();
        }

        if ($request->isMethod("DELETE")) {

            $this->getDoctrine()->getManager()->remove($entrada);
            $this->getDoctrine()->getManager()->flush();

            return new Response("Eliminada");
        }

        $entrada = $serializer->serialize(
            $entrada, 'json', [DateTimeNormalizer::FORMAT_KEY=>'d-m-Y','groups' => ['entrada','asistente']]
        );
        return new Response($entrada);
    }





}