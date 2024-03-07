<?php

namespace App\Controller;

use App\Entity\Asistente;
use App\Entity\Congreso;
use App\Entity\Entrada;
use App\Entity\MetodoPago;
use App\Entity\Pago;
use App\Entity\Ponente;
use App\Entity\Socio;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\Normalizer\DateTimeNormalizer;
use Symfony\Component\Serializer\SerializerInterface;

class PagoController extends AbstractController
{

    public function pago(Request $request, SerializerInterface $serializer)
    {
        $id_entrada = $request->get('id_entrada');

        $entrada = $this->getDoctrine()
            ->getManager()
            ->getRepository(Entrada::class)
            ->findOneBy(['id' => $id_entrada]);

        $pago = $this->getDoctrine()
            ->getManager()
            ->getRepository(Pago::class)
            ->findOneBy(['entrada' => $entrada]);

        if ($request->isMethod("DELETE")) {
            $this->getDoctrine()->getManager()->remove($pago);
            $this->getDoctrine()->getManager()->flush();

            return new Response("Eliminado");
        }

        if ($request->isMethod("POST")) {
            $total = $request->get('total');

            $metodo = $request->get('metodopago');

            if($metodo==1 or $metodo=='paypal'){
                $metodopago = $this->getDoctrine()
                    ->getManager()
                    ->getRepository(MetodoPago::class)
                    ->findOneBy(['id' => 1]);

                $this->getDoctrine()->getManager()->persist($metodopago);
                $this->getDoctrine()->getManager()->flush();

            }else if($metodo==2 or $metodo=='tarjeta'){
                $metodopago = $this->getDoctrine()
                    ->getManager()
                    ->getRepository(MetodoPago::class)
                    ->findOneBy(['id' => 2]);

                $this->getDoctrine()->getManager()->persist($metodopago);
                $this->getDoctrine()->getManager()->flush();
            }else return new Response('Método de pago incorrecto');

            $pago = new Pago();

            $pago->setEntrada($entrada);
            $pago->setFecha(new \DateTime);
            $pago->setMetodoPago($metodopago);
            $pago->setTotal($total);

            $this->getDoctrine()->getManager()->persist($pago);
            $this->getDoctrine()->getManager()->flush();

        }

        $pago = $serializer->serialize(
            $pago, 'json', [DateTimeNormalizer::FORMAT_KEY=>'d-m-Y H:i','groups' => ['pago','entrada','tarjeta','paypal']]
        );
        return new Response($pago);
    }


}