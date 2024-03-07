<?php

namespace App\Entity;

use Symfony\Component\Serializer\Annotation\Groups;
use Doctrine\ORM\Mapping as ORM;

/**
 * Asistente
 *
 * @ORM\Table(name="asistente")
 * @ORM\Entity
 */
class Asistente
{
    /**
     * @var int
     * @Groups("asistente")
     * @ORM\Column(name="id", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string
     * @Groups("asistente")
     * @ORM\Column(name="nombre", type="string", length=45, nullable=false)
     */
    private $nombre;

    /**
     * @var string
     * @Groups("asistente")
     * @ORM\Column(name="apellido", type="string", length=45, nullable=false)
     */
    private $apellido;

    /**
     * @var string
     * @Groups("asistente")
     * @ORM\Column(name="nombre_usuario", type="string", length=45, nullable=false)
     */
    private $nombreUsuario;

    /**
     * @var string
     * @Groups("asistente")
     * @ORM\Column(name="contrasenya", type="string", length=45, nullable=false)
     */
    private $contrasenya;

    /**
     * @var string
     * @Groups("asistente")
     * @ORM\Column(name="codigo_postal", type="string", length=45, nullable=false)
     */
    private $codigoPostal;

    /**
     * @var string
     * @Groups("asistente")
     * @ORM\Column(name="provincia", type="string", length=45, nullable=false)
     */
    private $provincia;

    /**
     * @var string
     * @Groups("asistente")
     * @ORM\Column(name="genero", type="string", length=1, nullable=false, options={"fixed"=true})
     */
    private $genero;

    /**
     * @var string|null
     * @Groups("asistente")
     * @ORM\Column(name="imagen", type="string", length=255, nullable=true)
     */
    private $imagen;

    /**
     * @var string|null
     * @Groups("asistente")
     * @ORM\Column(name="biografia", type="string", length=245, nullable=true)
     */
    private $biografia;

    /**
     * @var string
     * @Groups("asistente")
     * @ORM\Column(name="correo", type="string", length=255, nullable=false)
     */
    private $correo;

    /**
     * @var boolean|null
     * @Groups("asistente")
     * @ORM\Column(name="tipo", type="boolean", nullable=true)
     */
    private $tipo;

    /**
     * @var string|null
     * @Groups("asistente")
     * @ORM\Column(name="dni", type="string", length=255, nullable=true)
     */
    private $dni;

    /**
     * @var string|null
     * @Groups("asistente")
     * @ORM\Column(name="telefono", type="string", length=245, nullable=true)
     */
    private $telefono;

    /**
     * @var string|null
     * @Groups("asistente")
     * @ORM\Column(name="telefono_contacto", type="string", length=245, nullable=true)
     */
    private $telefonoContacto;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="Bono", mappedBy="asistente")
     */
    private $bono = array();

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->bono = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * @return int
     */
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * @return string
     */
    public function getNombre(): string
    {
        return $this->nombre;
    }

    /**
     * @return string
     */
    public function getApellido(): string
    {
        return $this->apellido;
    }

    /**
     * @return string
     */
    public function getNombreUsuario(): string
    {
        return $this->nombreUsuario;
    }

    /**
     * @return string
     */
    public function getContrasenya(): string
    {
        return $this->contrasenya;
    }

    /**
     * @return string
     */
    public function getCodigoPostal(): string
    {
        return $this->codigoPostal;
    }

    /**
     * @return string
     */
    public function getProvincia(): string
    {
        return $this->provincia;
    }

    /**
     * @return string
     */
    public function getGenero(): string
    {
        return $this->genero;
    }

    /**
     * @return string|null
     */
    public function getImagen(): ?string
    {
        return $this->imagen;
    }

    /**
     * @return string|null
     */
    public function getBiografia(): ?string
    {
        return $this->biografia;
    }

    /**
     * @return string
     */
    public function getCorreo(): string
    {
        return $this->correo;
    }

    /**
     * @return \Doctrine\Common\Collections\ArrayCollection|\Doctrine\Common\Collections\Collection
     */
    public function getBono()
    {
        return $this->bono;
    }

    /**
     * @param string $nombre
     */
    public function setNombre(string $nombre): void
    {
        $this->nombre = $nombre;
    }

    /**
     * @param string $apellido
     */
    public function setApellido(string $apellido): void
    {
        $this->apellido = $apellido;
    }

    /**
     * @param string $nombreUsuario
     */
    public function setNombreUsuario(string $nombreUsuario): void
    {
        $this->nombreUsuario = $nombreUsuario;
    }

    /**
     * @param string $contrasenya
     */
    public function setContrasenya(string $contrasenya): void
    {
        $this->contrasenya = $contrasenya;
    }

    /**
     * @param string $codigoPostal
     */
    public function setCodigoPostal(string $codigoPostal): void
    {
        $this->codigoPostal = $codigoPostal;
    }

    /**
     * @param string $provincia
     */
    public function setProvincia(string $provincia): void
    {
        $this->provincia = $provincia;
    }

    /**
     * @param string $genero
     */
    public function setGenero(string $genero): void
    {
        $this->genero = $genero;
    }

    /**
     * @param string|null $imagen
     */
    public function setImagen(?string $imagen): void
    {
        $this->imagen = $imagen;
    }

    /**
     * @param string|null $biografia
     */
    public function setBiografia(?string $biografia): void
    {
        $this->biografia = $biografia;
    }

    /**
     * @param string $correo
     */
    public function setCorreo(string $correo): void
    {
        $this->correo = $correo;
    }

    /**
     * @param \Doctrine\Common\Collections\ArrayCollection|\Doctrine\Common\Collections\Collection $bono
     */
    public function setBono($bono): void
    {
        $this->bono = $bono;
    }

    /**
     * @return bool|null
     */
    public function getTipo(): ?bool
    {
        return $this->tipo;
    }

    /**
     * @param bool|null $tipo
     */
    public function setTipo(?bool $tipo): void
    {
        $this->tipo = $tipo;
    }

    /**
     * @return string|null
     */
    public function getDni(): ?string
    {
        return $this->dni;
    }

    /**
     * @param string|null $dni
     */
    public function setDni(?string $dni): void
    {
        $this->dni = $dni;
    }

    /**
     * @return string|null
     */
    public function getTelefono(): ?string
    {
        return $this->telefono;
    }

    /**
     * @param string|null $telefono
     */
    public function setTelefono(?string $telefono): void
    {
        $this->telefono = $telefono;
    }

    /**
     * @return string|null
     */
    public function getTelefonoContacto(): ?string
    {
        return $this->telefonoContacto;
    }

    /**
     * @param string|null $telefonoContacto
     */
    public function setTelefonoContacto(?string $telefonoContacto): void
    {
        $this->telefonoContacto = $telefonoContacto;
    }
}
