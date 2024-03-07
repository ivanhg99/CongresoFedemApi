<?php

namespace App\Entity;

use Symfony\Component\Serializer\Annotation\Groups;
use Doctrine\ORM\Mapping as ORM;

/**
 * Bono
 *
 * @ORM\Table(name="bono", indexes={@ORM\Index(name="fk_bono_puesto_comida1_idx", columns={"puesto_comida_id"})})
 * @ORM\Entity
 */
class Bono
{
    /**
     * @var int
     * @Groups("bono")
     * @ORM\Column(name="id", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var PuestoComida
     * @Groups("bono")
     * @ORM\ManyToOne(targetEntity="PuestoComida")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="puesto_comida_id", referencedColumnName="id")
     * })
     */
    private $puestoComida;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="Asistente", inversedBy="bono")
     * @ORM\JoinTable(name="bono_asistente",
     *   joinColumns={
     *     @ORM\JoinColumn(name="bono_id", referencedColumnName="id")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="asistente_id", referencedColumnName="id")
     *   }
     * )
     */
    private $asistente = array();

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->asistente = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * @return int
     */
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * @return PuestoComida
     */
    public function getPuestoComida(): PuestoComida
    {
        return $this->puestoComida;
    }

    /**
     * @return \Doctrine\Common\Collections\ArrayCollection|\Doctrine\Common\Collections\Collection
     */
    public function getAsistente()
    {
        return $this->asistente;
    }

    /**
     * @param PuestoComida $puestoComida
     */
    public function setPuestoComida(PuestoComida $puestoComida): void
    {
        $this->puestoComida = $puestoComida;
    }

    /**
     * @param \Doctrine\Common\Collections\ArrayCollection|\Doctrine\Common\Collections\Collection $asistente
     */
    public function setAsistente($asistente): void
    {
        $this->asistente = $asistente;
    }

}
