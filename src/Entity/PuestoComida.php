<?php

namespace App\Entity;

use Symfony\Component\Serializer\Annotation\Groups;
use Doctrine\ORM\Mapping as ORM;

/**
 * PuestoComida
 *
 * @ORM\Table(name="puesto_comida", indexes={@ORM\Index(name="fk_puesto_comida_congreso_idx", columns={"congreso_id"})})
 * @ORM\Entity
 */
class PuestoComida
{
    /**
     * @var int
     * @Groups("puesto_comida")
     * @ORM\Column(name="id", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string
     * @Groups("puesto_comida")
     * @ORM\Column(name="nombre", type="string", length=45, nullable=false)
     */
    private $nombre;

    /**
     * @var string
     * @Groups("puesto_comida")
     * @ORM\Column(name="tipo_comida", type="string", length=45, nullable=false)
     */
    private $tipoComida;

    /**
     * @var string
     * @Groups("puesto_comida")
     * @ORM\Column(name="lugar", type="string", length=45, nullable=false)
     */
    private $lugar;

    /**
     * @var string
     * @Groups("puesto_comida")
     * @ORM\Column(name="descripcion", type="string", length=255, nullable=false)
     */
    private $descripcion;

    /**
     * @var string
     * @Groups("puesto_comida")
     * @ORM\Column(name="imagen", type="string", length=255, nullable=false)
     */
    private $imagen;

    /**
     * @var Congreso
     * @Groups("puesto_comida")
     * @ORM\ManyToOne(targetEntity="Congreso")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="congreso_id", referencedColumnName="id")
     * })
     */
    private $congreso;

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
    public function getTipoComida(): string
    {
        return $this->tipoComida;
    }

    /**
     * @return string
     */
    public function getLugar(): string
    {
        return $this->lugar;
    }

    /**
     * @return string
     */
    public function getDescripcion(): string
    {
        return $this->descripcion;
    }

    /**
     * @return string
     */
    public function getImagen(): string
    {
        return $this->imagen;
    }

    /**
     * @return Congreso
     */
    public function getCongreso(): Congreso
    {
        return $this->congreso;
    }

    /**
     * @param string $nombre
     */
    public function setNombre(string $nombre): void
    {
        $this->nombre = $nombre;
    }

    /**
     * @param string $tipoComida
     */
    public function setTipoComida(string $tipoComida): void
    {
        $this->tipoComida = $tipoComida;
    }

    /**
     * @param string $lugar
     */
    public function setLugar(string $lugar): void
    {
        $this->lugar = $lugar;
    }

    /**
     * @param string $descripcion
     */
    public function setDescripcion(string $descripcion): void
    {
        $this->descripcion = $descripcion;
    }

    /**
     * @param string $imagen
     */
    public function setImagen(string $imagen): void
    {
        $this->imagen = $imagen;
    }

    /**
     * @param Congreso $congreso
     */
    public function setCongreso(Congreso $congreso): void
    {
        $this->congreso = $congreso;
    }


}
