<?php

namespace App\Controller;

use App\Entity\Asistente;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\SerializerInterface;

class AsistenteController extends AbstractController
{

    public function asistentes(Request $request, SerializerInterface $serializer) {

        $asistentes = $this->getDoctrine()->getManager()->getRepository(Asistente::class)->findAll();

        if ($request->isMethod("POST")) {

            $nombre = $request->get("nombre");
            $apellido = $request->get("apellido");
            $nombreUsuario = $request->get("nombre_usuario");
            $contrasenya = $request->get("contrasenya");
            $codigoPostal = $request->get("codigo_postal");
            $provincia = $request->get("provincia");
            $genero = $request->get("genero");
            $imagen = $request->get("imagen");
            $biografia = $request->get("biografia");
            $correo = $request->get("correo");
            $tipo = $request->get("tipo");
            $dni = $request->get("dni");
            $telefono = $request->get("telefono");
            $telefonoContacto = $request->get("telefonoContacto");

            $asistente = new Asistente();

            $asistente->setNombre($nombre);
            $asistente->setApellido($apellido);
            $asistente->setNombreUsuario($nombreUsuario);
            $asistente->setContrasenya($contrasenya);
            $asistente->setCodigoPostal($codigoPostal);
            $asistente->setProvincia($provincia);
            $asistente->setGenero($genero);
            $asistente->setImagen($imagen);
            $asistente->setBiografia($biografia);
            $asistente->setCorreo($correo);
            $asistente->setTipo($tipo);
            $asistente->setDni($dni);
            $asistente->setTelefono($telefono);
            $asistente->setTelefonoContacto($telefonoContacto);

            $this->getDoctrine()->getManager()->persist($asistente);
            $this->getDoctrine()->getManager()->flush();

        }


        $asistentes = $serializer->serialize($asistentes, 'json', ['groups' => ['asistente']]);


        return new Response($asistentes);

    }

    public function asistente(Request $request, SerializerInterface $serializer) {

        $id = $request->get('id');

        $asistente = $this->getDoctrine()->getManager()->getRepository(Asistente::class)->findOneBy(['id' => $id]);

        if ($request->isMethod("PUT")) {

            $nombre = $request->get("nombre");
            $apellido = $request->get("apellido");
            $nombreUsuario = $request->get("nombreUsuario");
            $contrasenya = $request->get("contrasenya");
            $codigoPostal = $request->get("codigoPostal");
            $provincia = $request->get("provincia");
            $genero = $request->get("genero");
            $imagen = $request->get("imagen");
            $biografia = $request->get("biografia");
            $correo = $request->get("correo");
            $tipo = $request->get("tipo");
            $dni = $request->get("dni");
            $telefono = $request->get("telefono");
            $telefonoContacto = $request->get("telefonoContacto");

            if (!empty($nombre))

                $asistente->setNombre($nombre);

            if (!empty($apellido))

                $asistente->setApellido($apellido);

            if (!empty($nombreUsuario))

                $asistente->setNombreUsuario($nombreUsuario);

            if (!empty($contrasenya))

                $asistente->setContrasenya($contrasenya);

            if (!empty($codigoPostal))

                $asistente->setCodigoPostal($codigoPostal);

            if (!empty($provincia))

                $asistente->setProvinvia($provincia);

            if (!empty($genero))

                $asistente->setGenero($genero);

            if (!empty($imagen))

                $asistente->setImagen($imagen);

            if (!empty($biografia))

                $asistente->setBiografia($biografia);

            if (!empty($correo))

                $asistente->setCorreo($correo);

            if (!empty($tipo))

                $asistente->setTipo($tipo);

            if (!empty($dni))

                $asistente->setDni($dni);

            if (!empty($telefono))

                $asistente->setTelefono($telefono);

            if (!empty($telefonoContacto))

                $asistente->setTelefonoContacto($telefonoContacto);

            $this->getDoctrine()->getManager()->persist($asistente);
            $this->getDoctrine()->getManager()->flush();

        }

        if ($request->isMethod("DELETE")) {

            $this->getDoctrine()->getManager()->remove($asistente);
            $this->getDoctrine()->getManager()->flush();

            return new Response('Borrado');

        }

        $asistente = $serializer->serialize($asistente, 'json', ['groups' => ['asistente']]);

        return new Response($asistente);

    }

    public function logearAsistente(Request $request, SerializerInterface $serializer) {

        $username = $request->get('username');
        $password = $request->get('password');

        $asistente = $this->getDoctrine()->getManager()
            ->getRepository(Asistente::class)
            ->findOneBy(['nombreUsuario' => $username,'contrasenya' =>$password]);

        $asistente = $serializer->serialize($asistente, 'json', ['groups' => ['asistente']]);

        return new Response($asistente);

    }

}