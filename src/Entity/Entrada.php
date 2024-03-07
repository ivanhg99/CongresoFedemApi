<?php

namespace App\Entity;

use Symfony\Component\Serializer\Annotation\Groups;
use Doctrine\ORM\Mapping as ORM;

/**
 * Entrada
 *
 * @ORM\Table(name="entrada", indexes={@ORM\Index(name="fk_entrada_congreso1_idx", columns={"congreso_id"}), @ORM\Index(name="fk_entrada_asistente1_idx", columns={"asistente_id"})})
 * @ORM\Entity
 */
class Entrada
{
    /**
     * @var int
     * @Groups("entrada")
     * @ORM\Column(name="id", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var int
     * @Groups("entrada")
     * @ORM\Column(name="congreso_id", type="integer", nullable=false, options={"unsigned"=true})
     */
    private $congresoId;

    /**
     * @var string
     * @Groups("entrada")
     * @ORM\Column(name="codigo_qr", type="string", length=255, nullable=false)
     */
    private $codigoQr;

    /**
     * @var \DateTime
     * @Groups("entrada")
     * @ORM\Column(name="fecha_compra", type="datetime", nullable=false)
     */
    private $fechaCompra;

    /**
     * @var string
     * @Groups("entrada")
     * @ORM\Column(name="tipo", type="string", length=45, nullable=false)
     */
    private $tipo;

    /**
     * @var Asistente
     * @Groups("entrada")
     * @ORM\ManyToOne(targetEntity="Asistente")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="asistente_id", referencedColumnName="id")
     * })
     */
    private $asistente;

    /**
     * @return int
     */
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * @return int
     */
    public function getCongresoId(): int
    {
        return $this->congresoId;
    }

    /**
     * @return string
     */
    public function getCodigoQr(): string
    {
        return $this->codigoQr;
    }

    /**
     * @return \DateTime
     */
    public function getFechaCompra(): \DateTime
    {
        return $this->fechaCompra;
    }

    /**
     * @return string
     */
    public function getTipo(): string
    {
        return $this->tipo;
    }

    /**
     * @return Asistente
     */
    public function getAsistente(): Asistente
    {
        return $this->asistente;
    }

    /**
     * @param int $congresoId
     */
    public function setCongresoId(int $congresoId): void
    {
        $this->congresoId = $congresoId;
    }

    /**
     * @param string $codigoQr
     */
    public function setCodigoQr(string $codigoQr): void
    {
        $this->codigoQr = $codigoQr;
    }

    /**
     * @param \DateTime $fechaCompra
     */
    public function setFechaCompra(\DateTime $fechaCompra): void
    {
        $this->fechaCompra = $fechaCompra;
    }

    /**
     * @param string $tipo
     */
    public function setTipo(string $tipo): void
    {
        $this->tipo = $tipo;
    }

    /**
     * @param Asistente $asistente
     */
    public function setAsistente(Asistente $asistente): void
    {
        $this->asistente = $asistente;
    }


}
