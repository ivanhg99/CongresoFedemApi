<?php

namespace App\Controller;

use App\Entity\Ajeno;
use App\Entity\Asistente;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\SerializerInterface;

class AjenoController extends AbstractController
{

    public function ajenos(SerializerInterface $serializer) {

        $ajenos = $this->getDoctrine()->getManager()->getRepository(Ajeno::class)->findAll();

        $ajenos = $serializer->serialize($ajenos, 'json', ['groups' => ['ajeno', 'asistente']]);

        return new Response($ajenos);

    }

    public function ajeno(Request $request, SerializerInterface $serializer) {

        $id = $request->get('id_asistente');
        
        $asistente = $this->getDoctrine()->getManager()
            ->getRepository(Asistente::class)
            ->findOneBy(['id' => $id]);

        $ajeno = $this->getDoctrine()->getManager()
            ->getRepository(Ajeno::class)
            ->findOneBy(['asistente' => $asistente]);

        if ($request->isMethod("DELETE")) {

            $this->getDoctrine()->getManager()->remove($ajeno);
            $this->getDoctrine()->getManager()->flush();

            return new Response('Borrado');

        }

        $ajeno = $serializer->serialize($ajeno, 'json', ['groups' => ['ajeno', 'asistente']]);

        return new Response($ajeno);

    }

    public function asistente_ajeno(Request $request, SerializerInterface $serializer) {

        $id = $request->get('id');

        $asistenteObj = $this->getDoctrine()->getManager()->getRepository(Asistente::class)->findOneBy(['id' => $id]);

        $ajenoObj = new Ajeno();

        $ajenoObj->setAsistente($asistenteObj);

        $this->getDoctrine()->getManager()->persist($ajenoObj);
        $this->getDoctrine()->getManager()->flush();

        $ajenoObj = $serializer->serialize($ajenoObj, 'json', ['groups' => ['ajeno', 'asistente']]);

        return new Response($ajenoObj);

    }

}
