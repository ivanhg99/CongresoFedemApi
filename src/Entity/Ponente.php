<?php

namespace App\Entity;

use Symfony\Component\Serializer\Annotation\Groups;
use Doctrine\ORM\Mapping as ORM;

/**
 * Ponente
 *
 * @ORM\Table(name="ponente", indexes={@ORM\Index(name="fk_ponente_socio1_idx", columns={"socio_id"})})
 * @ORM\Entity
 */
class Ponente
{
    /**
     * @var int
     * @Groups("ponente")
     * @ORM\Column(name="id", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var Socio
     * @Groups("ponente")
     * @ORM\ManyToOne(targetEntity="Socio")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="socio_id", referencedColumnName="id_socio")
     * })
     */
    private $socio;

    /**
     * @var \Doctrine\Common\Collections\Collection
     * @Groups("ponente")
     * @ORM\ManyToMany(targetEntity="Evento", mappedBy="ponente")
     */
    private $evento = array();

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->evento = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * @return int
     */
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * @return Socio
     */
    public function getSocio(): Socio
    {
        return $this->socio;
    }

    /**
     * @return \Doctrine\Common\Collections\ArrayCollection|\Doctrine\Common\Collections\Collection
     */
    public function getEvento()
    {
        return $this->evento;
    }

    /**
     * @param Socio $socio
     */
    public function setSocio(Socio $socio): void
    {
        $this->socio = $socio;
    }

    /**
     * @param \Doctrine\Common\Collections\ArrayCollection|\Doctrine\Common\Collections\Collection $evento
     */
    public function setEvento($evento): void
    {
        $this->evento = $evento;
    }

}
