<?php

namespace App\Entity;

use Symfony\Component\Serializer\Annotation\Groups;
use Doctrine\ORM\Mapping as ORM;

/**
 * Empresa
 *
 * @ORM\Table(name="empresa", indexes={@ORM\Index(name="empresa_id_idx", columns={"id"})})
 * @ORM\Entity
 */
class Empresa
{
    /**
     * @var int
     * @Groups("empresa")
     * @ORM\Column(name="id", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string
     * @Groups("empresa")
     * @ORM\Column(name="nombre", type="string", length=45, nullable=false)
     */
    private $nombre;

    /**
     * @var string
     * @Groups("empresa")
     * @ORM\Column(name="enlace", type="string", length=255, nullable=false)
     */
    private $enlace;

    /**
     * @var string
     * @Groups("empresa")
     * @ORM\Column(name="direccion", type="string", length=255, nullable=false)
     */
    private $direccion;

    /**
     * @var string
     * @Groups("empresa")
     * @ORM\Column(name="logo", type="string", length=255, nullable=false)
     */
    private $logo;

    /**
     * @var string
     * @Groups("empresa")
     * @ORM\Column(name="cif", type="string", length=255, nullable=false)
     */
    private $cif;

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
    public function getDireccion(): string
    {
        return $this->direccion;
    }

    /**
     * @return string
     */
    public function getLogo(): string
    {
        return $this->logo;
    }

    /**
     * @return string
     */
    public function getCif(): string
    {
        return $this->cif;
    }

    /**
     * @param string $nombre
     */
    public function setNombre(string $nombre): void
    {
        $this->nombre = $nombre;
    }

    /**
     * @param string $direccion
     */
    public function setDireccion(string $direccion): void
    {
        $this->direccion = $direccion;
    }

    /**
     * @param string $logo
     */
    public function setLogo(string $logo): void
    {
        $this->logo = $logo;
    }

    /**
     * @param string $cif
     */
    public function setCif(string $cif): void
    {
        $this->cif = $cif;
    }

    /**
     * @return string
     */
    public function getEnlace(): string
    {
        return $this->enlace;
    }

    /**
     * @param string $enlace
     */
    public function setEnlace(string $enlace): void
    {
        $this->enlace = $enlace;
    }


}
