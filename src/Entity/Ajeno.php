<?php

namespace App\Entity;

use Symfony\Component\Serializer\Annotation\Groups;
use Doctrine\ORM\Mapping as ORM;

/**
 * Ajeno
 *
 * @ORM\Table(name="ajeno", indexes={@ORM\Index(name="fk_ajeno_asistente1_idx", columns={"asistente_id"})})
 * @ORM\Entity
 */
class Ajeno
{
    /**
     * @var int
     * @Groups("ajeno")
     * @ORM\Column(name="id_ajeno", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idAjeno;

    /**
     * @var Asistente
     * @Groups("ajeno")
     * @ORM\ManyToOne(targetEntity="Asistente")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="asistente_id", referencedColumnName="id")
     * })
     */
    private $asistente;

    /**
     * @var \Doctrine\Common\Collections\Collection
     * @Groups("ajeno")
     * @ORM\ManyToMany(targetEntity="Actividad", mappedBy="ajenoIdAjeno")
     */
    private $actividad = array();

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->actividad = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * @return int
     */
    public function getIdAjeno(): int
    {
        return $this->idAjeno;
    }

    /**
     * @return Asistente
     */
    public function getAsistente(): Asistente
    {
        return $this->asistente;
    }

    /**
     * @return \Doctrine\Common\Collections\ArrayCollection|\Doctrine\Common\Collections\Collection
     */
    public function getActividad()
    {
        return $this->actividad;
    }

    /**
     * @param Asistente $asistente
     */
    public function setAsistente(Asistente $asistente): void
    {
        $this->asistente = $asistente;
    }

    /**
     * @param \Doctrine\Common\Collections\ArrayCollection|\Doctrine\Common\Collections\Collection $actividad
     */
    public function setActividad($actividad): void
    {
        $this->actividad = $actividad;
    }

}
