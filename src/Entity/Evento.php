<?php

namespace App\Entity;

use Symfony\Component\Serializer\Annotation\Groups;
use Doctrine\ORM\Mapping as ORM;

/**
 * Evento
 *
 * @ORM\Table(name="evento", indexes={@ORM\Index(name="fk_evento_congreso1_idx", columns={"congreso_id"})})
 * @ORM\Entity
 */
class Evento
{
    /**
     * @var int
     * @Groups("evento")
     * @ORM\Column(name="id", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string
     * @Groups("evento")
     * @ORM\Column(name="nombre", type="string", length=45, nullable=false)
     */
    private $nombre;

    /**
     * @var string
     * @Groups("evento")
     * @ORM\Column(name="descripcion", type="string", length=245, nullable=false)
     */
    private $descripcion;

    /**
     * @var string
     * @Groups("evento")
     * @ORM\Column(name="lugar", type="string", length=45, nullable=false)
     */
    private $lugar;

    /**
     * @var \DateTime
     * @Groups("evento")
     * @ORM\Column(name="hora_inicio", type="time", nullable=false)
     */
    private $horaInicio;

    /**
     * @var \DateTime
     * @Groups("evento")
     * @ORM\Column(name="hora_fin", type="time", nullable=false)
     */
    private $horaFin;

    /**
     * @var string
     * @Groups("evento")
     * @ORM\Column(name="imagen", type="string", length=255, nullable=false)
     */
    private $imagen;

    /**
     * @var int
     * @Groups("evento")
     * @ORM\Column(name="dia", type="integer", nullable=false, options={"unsigned"=true})
     */
    private $dia;

    /**
     * @var int
     * @Groups("evento")
     * @ORM\Column(name="mes", type="integer", nullable=false)
     */
    private $mes;

    /**
     * @var Congreso
     * @Groups("evento")
     * @ORM\ManyToOne(targetEntity="Congreso")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="congreso_id", referencedColumnName="id")
     * })
     */
    private $congreso;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="Ponente", inversedBy="evento")
     * @ORM\JoinTable(name="evento_ponente",
     *   joinColumns={
     *     @ORM\JoinColumn(name="evento_id", referencedColumnName="id")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="ponente_id", referencedColumnName="id")
     *   }
     * )
     */
    private $ponente = array();

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->ponente = new \Doctrine\Common\Collections\ArrayCollection();
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
     * @return string
     */
    public function getLugar(): string
    {
        return $this->lugar;
    }

    /**
     * @return \DateTime
     */
    public function getHoraInicio(): \DateTime
    {
        return $this->horaInicio;
    }

    /**
     * @return \DateTime
     */
    public function getHoraFin(): \DateTime
    {
        return $this->horaFin;
    }

    /**
     * @return string
     */
    public function getImagen(): string
    {
        return $this->imagen;
    }

    /**
     * @return int
     */
    public function getDia(): int
    {
        return $this->dia;
    }

    /**
     * @return int
     */
    public function getMes(): int
    {
        return $this->mes;
    }

    /**
     * @return Congreso
     */
    public function getCongreso(): Congreso
    {
        return $this->congreso;
    }

    /**
     * @return \Doctrine\Common\Collections\ArrayCollection|\Doctrine\Common\Collections\Collection
     */
    public function getPonente()
    {
        return $this->ponente;
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
     * @param string $lugar
     */
    public function setLugar(string $lugar): void
    {
        $this->lugar = $lugar;
    }

    /**
     * @param \DateTime $horaInicio
     */
    public function setHoraInicio(\DateTime $horaInicio): void
    {
        $this->horaInicio = $horaInicio;
    }

    /**
     * @param \DateTime $horaFin
     */
    public function setHoraFin(\DateTime $horaFin): void
    {
        $this->horaFin = $horaFin;
    }

    /**
     * @param string $imagen
     */
    public function setImagen(string $imagen): void
    {
        $this->imagen = $imagen;
    }

    /**
     * @param int $dia
     */
    public function setDia(int $dia): void
    {
        $this->dia = $dia;
    }

    /**
     * @param int $mes
     */
    public function setMes(int $mes): void
    {
        $this->mes = $mes;
    }

    /**
     * @param Congreso $congreso
     */
    public function setCongreso(Congreso $congreso): void
    {
        $this->congreso = $congreso;
    }

    /**
     * @param \Doctrine\Common\Collections\ArrayCollection|\Doctrine\Common\Collections\Collection $ponente
     */
    public function setPonente($ponente): void
    {
        $this->ponente = $ponente;
    }


}
