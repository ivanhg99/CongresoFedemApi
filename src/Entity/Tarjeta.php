<?php

namespace App\Entity;

use Symfony\Component\Serializer\Annotation\Groups;
use Doctrine\ORM\Mapping as ORM;

/**
 * Tarjeta
 *
 * @ORM\Table(name="tarjeta", uniqueConstraints={@ORM\UniqueConstraint(name="numero_UNIQUE", columns={"numero_tarjeta"})}, indexes={@ORM\Index(name="fk_tarjeta_metodo_pago1_idx", columns={"metodo_pago_id"})})
 * @ORM\Entity
 */
class Tarjeta
{
    /**
     * @var int
     * @Groups("tarjeta")
     * @ORM\Column(name="numero_tarjeta", type="integer", nullable=false, options={"unsigned"=true})
     */
    private $numeroTarjeta;

    /**
     * @var MetodoPago
     * @Groups("tarjeta")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     * @ORM\OneToOne(targetEntity="MetodoPago")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="metodo_pago_id", referencedColumnName="id")
     * })
     */
    private $metodoPago;

    /**
     * @return int
     */
    public function getNumeroTarjeta(): int
    {
        return $this->numeroTarjeta;
    }

    /**
     * @return MetodoPago
     */
    public function getMetodoPago(): MetodoPago
    {
        return $this->metodoPago;
    }

    /**
     * @param int $numeroTarjeta
     */
    public function setNumeroTarjeta(int $numeroTarjeta): void
    {
        $this->numeroTarjeta = $numeroTarjeta;
    }


}
