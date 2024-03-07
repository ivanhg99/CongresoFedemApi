<?php

namespace App\Entity;

use Symfony\Component\Serializer\Annotation\Groups;
use Doctrine\ORM\Mapping as ORM;

/**
 * Patrocinador
 *
 * @ORM\Table(name="patrocinador", indexes={@ORM\Index(name="fk_patrocinador_paquete1_idx", columns={"paquete_id"}), @ORM\Index(name="fk_patrocinador_empresa1_idx", columns={"empresa_cif"})})
 * @ORM\Entity
 */
class Patrocinador
{
    /**
     * @var int
     * @Groups("patrocinador")
     * @ORM\Column(name="id", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var Empresa
     * @Groups("patrocinador")
     * @ORM\ManyToOne(targetEntity="Empresa")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="empresa_cif", referencedColumnName="id")
     * })
     */
    private $empresaCif;

    /**
     * @var Paquete
     * @Groups("patrocinador")
     * @ORM\ManyToOne(targetEntity="Paquete")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="paquete_id", referencedColumnName="id")
     * })
     */
    private $paquete;

    /**
     * @var \Doctrine\Common\Collections\Collection
     * @Groups("patrocinador")
     * @ORM\ManyToMany(targetEntity="Congreso", mappedBy="patrocinador")
     */
    private $congreso = array();

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->congreso = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * @return int
     */
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * @return Empresa
     */
    public function getEmpresaCif(): Empresa
    {
        return $this->empresaCif;
    }

    /**
     * @return Paquete
     */
    public function getPaquete(): Paquete
    {
        return $this->paquete;
    }

    /**
     * @return \Doctrine\Common\Collections\ArrayCollection|\Doctrine\Common\Collections\Collection
     */
    public function getCongreso()
    {
        return $this->congreso;
    }

    /**
     * @param Empresa $empresaCif
     */
    public function setEmpresaCif(Empresa $empresaCif): void
    {
        $this->empresaCif = $empresaCif;
    }

    /**
     * @param Paquete $paquete
     */
    public function setPaquete(Paquete $paquete): void
    {
        $this->paquete = $paquete;
    }

    /**
     * @param \Doctrine\Common\Collections\ArrayCollection|\Doctrine\Common\Collections\Collection $congreso
     */
    public function setCongreso($congreso): void
    {
        $this->congreso = $congreso;
    }

}
