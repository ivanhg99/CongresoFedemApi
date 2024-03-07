<?php

namespace App\Entity;

use Symfony\Component\Serializer\Annotation\Groups;
use Doctrine\ORM\Mapping as ORM;

/**
 * Congreso
 *
 * @ORM\Table(name="congreso")
 * @ORM\Entity
 */
class Congreso
{
    /**
     * @var int
     * @Groups("congreso")
     * @ORM\Column(name="id", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string
     * @Groups("congreso")
     * @ORM\Column(name="nombre", type="string", length=45, nullable=false)
     */
    private $nombre;

    /**
     * @var string
     * @Groups("congreso")
     * @ORM\Column(name="descripcion", type="string", length=245, nullable=false)
     */
    private $descripcion;

    /**
     * @var \DateTime
     * @Groups("congreso")
     * @ORM\Column(name="fecha_inicio", type="datetime", nullable=false)
     */
    private $fechaInicio;

    /**
     * @var \DateTime
     * @Groups("congreso")
     * @ORM\Column(name="fecha_fin", type="datetime", nullable=false)
     */
    private $fechaFin;

    /**
     * @var int
     * @Groups("congreso")
     * @ORM\Column(name="aforo", type="integer", nullable=false)
     */
    private $aforo;

    /**
     * @var string
     * @Groups("congreso")
     * @ORM\Column(name="localizacion", type="string", length=255, nullable=false)
     */
    private $localizacion;

    /**
     * @var string
     * @Groups("congreso")
     * @ORM\Column(name="logo", type="string", length=255, nullable=false)
     */
    private $logo;

    /**
     * @var \Doctrine\Common\Collections\Collection
     * @Groups("congreso")
     * @ORM\ManyToMany(targetEntity="Patrocinador", inversedBy="congreso")
     * @ORM\JoinTable(name="congreso_tiene_patrocinador",
     *   joinColumns={
     *     @ORM\JoinColumn(name="congreso_id", referencedColumnName="id")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="patrocinador_id", referencedColumnName="id")
     *   }
     * )
     */
    private $patrocinador = array();

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->patrocinador = new \Doctrine\Common\Collections\ArrayCollection();
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
    public function getDescripcion(): string
    {
        return $this->descripcion;
    }

    /**
     * @return \DateTime
     */
    public function getFechaInicio(): \DateTime
    {
        return $this->fechaInicio;
    }

    /**
     * @return \DateTime
     */
    public function getFechaFin(): \DateTime
    {
        return $this->fechaFin;
    }

    /**
     * @return int
     */
    public function getAforo(): int
    {
        return $this->aforo;
    }

    /**
     * @return string
     */
    public function getLocalizacion(): string
    {
        return $this->localizacion;
    }

    /**
     * @return string
     */
    public function getLogo(): string
    {
        return $this->logo;
    }

    /**
     * @return \Doctrine\Common\Collections\ArrayCollection|\Doctrine\Common\Collections\Collection
     */
    public function getPatrocinador()
    {
        return $this->patrocinador;
    }

    /**
     * @param string $nombre
     */
    public function setNombre(string $nombre): void
    {
        $this->nombre = $nombre;
    }

    /**
     * @param string $descripcion
     */
    public function setDescripcion(string $descripcion): void
    {
        $this->descripcion = $descripcion;
    }

    /**
     * @param \DateTime $fechaInicio
     */
    public function setFechaInicio(\DateTime $fechaInicio): void
    {
        $this->fechaInicio = $fechaInicio;
    }

    /**
     * @param \DateTime $fechaFin
     */
    public function setFechaFin(\DateTime $fechaFin): void
    {
        $this->fechaFin = $fechaFin;
    }

    /**
     * @param int $aforo
     */
    public function setAforo(int $aforo): void
    {
        $this->aforo = $aforo;
    }

    /**
     * @param string $localizacion
     */
    public function setLocalizacion(string $localizacion): void
    {
        $this->localizacion = $localizacion;
    }

    /**
     * @param string $logo
     */
    public function setLogo(string $logo): void
    {
        $this->logo = $logo;
    }

    /**
     * @param \Doctrine\Common\Collections\ArrayCollection|\Doctrine\Common\Collections\Collection $patrocinador
     */
    public function setPatrocinador($patrocinador): void
    {
        $this->patrocinador = $patrocinador;
    }

}
