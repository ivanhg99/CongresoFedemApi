<?php

namespace App\Entity;

use Symfony\Component\Serializer\Annotation\Groups;
use Doctrine\ORM\Mapping as ORM;

/**
 * Socio
 *
 * @ORM\Table(name="socio", indexes={@ORM\Index(name="fk_socio_asistente1_idx", columns={"asistente_id"}), @ORM\Index(name="fk_socio_empresa1_idx", columns={"empresa_id"})})
 * @ORM\Entity
 */
class Socio
{
    /**
     * @var int
     * @Groups("socio")
     * @ORM\Column(name="id_socio", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idSocio;

    /**
     * @var string
     * @Groups("socio")
     * @ORM\Column(name="cargo", type="string", length=45, nullable=false)
     */
    private $cargo;

    /**
     * @var Asistente
     * @Groups("socio")
     * @ORM\ManyToOne(targetEntity="Asistente")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="asistente_id", referencedColumnName="id")
     * })
     */
    private $asistente;

    /**
     * @var Empresa
     * @Groups("socio")
     * @ORM\ManyToOne(targetEntity="Empresa")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="empresa_id", referencedColumnName="id")
     * })
     */
    private $empresa;

    /**
     * @return int
     */
    public function getIdSocio(): int
    {
        return $this->idSocio;
    }

    /**
     * @return string
     */
    public function getCargo(): string
    {
        return $this->cargo;
    }

    /**
     * @return Asistente
     */
    public function getAsistente(): Asistente
    {
        return $this->asistente;
    }

    /**
     * @return Empresa
     */
    public function getEmpresa(): Empresa
    {
        return $this->empresa;
    }

    /**
     * @param string $cargo
     */
    public function setCargo(string $cargo): void
    {
        $this->cargo = $cargo;
    }

    /**
     * @param Asistente $asistente
     */
    public function setAsistente(Asistente $asistente): void
    {
        $this->asistente = $asistente;
    }

    /**
     * @param Empresa $empresa
     */
    public function setEmpresa(Empresa $empresa): void
    {
        $this->empresa = $empresa;
    }


}
