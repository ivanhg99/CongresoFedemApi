<?php

namespace App\Entity;

use Symfony\Component\Serializer\Annotation\Groups;
use Doctrine\ORM\Mapping as ORM;

/**
 * Pago
 *
 * @ORM\Table(name="pago", indexes={@ORM\Index(name="fk_pago_metodo_pago1_idx", columns={"metodo_pago_id"}), @ORM\Index(name="fk_entrada_id_idx", columns={"entrada_id"})})
 * @ORM\Entity
 */
class Pago
{
    /**
     * @var int
     * @Groups("pago")
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var float
     * @Groups("pago")
     * @ORM\Column(name="total", type="float", precision=10, scale=0, nullable=false)
     */
    private $total;

    /**
     * @var \DateTime
     * @Groups("pago")
     * @ORM\Column(name="fecha", type="datetime", nullable=false)
     */
    private $fecha;

    /**
     * @var MetodoPago
     * @Groups("pago")
     * @ORM\ManyToOne(targetEntity="MetodoPago")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="metodo_pago_id", referencedColumnName="id")
     * })
     */
    private $metodoPago;

    /**
     * @var Entrada
     * @Groups("pago")
     * @ORM\ManyToOne(targetEntity="Entrada")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="entrada_id", referencedColumnName="id")
     * })
     */
    private $entrada;

    /**
     * @return int
     */
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * @return float
     */
    public function getTotal(): float
    {
        return $this->total;
    }

    /**
     * @return \DateTime
     */
    public function getFecha(): \DateTime
    {
        return $this->fecha;
    }

    /**
     * @return MetodoPago
     */
    public function getMetodoPago(): MetodoPago
    {
        return $this->metodoPago;
    }

    /**
     * @return Entrada
     */
    public function getEntrada(): Entrada
    {
        return $this->entrada;
    }

    /**
     * @param float $total
     */
    public function setTotal(float $total): void
    {
        $this->total = $total;
    }

    /**
     * @param \DateTime $fecha
     */
    public function setFecha(\DateTime $fecha): void
    {
        $this->fecha = $fecha;
    }

    /**
     * @param MetodoPago $metodoPago
     */
    public function setMetodoPago(MetodoPago $metodoPago): void
    {
        $this->metodoPago = $metodoPago;
    }

    /**
     * @param Entrada $entrada
     */
    public function setEntrada(Entrada $entrada): void
    {
        $this->entrada = $entrada;
    }


}
