<?php

namespace App\Entity;

use Symfony\Component\Serializer\Annotation\Groups;
use Doctrine\ORM\Mapping as ORM;

/**
 * Paypal
 *
 * @ORM\Table(name="paypal", uniqueConstraints={@ORM\UniqueConstraint(name="username_paypal_UNIQUE", columns={"username_paypal"})}, indexes={@ORM\Index(name="fk_paypal_metodo_pago1_idx", columns={"metodo_pago_id"})})
 * @ORM\Entity
 */
class Paypal
{
    /**
     * @var string
     * @Groups("paypal")
     * @ORM\Column(name="username_paypal", type="string", length=255, nullable=false)
     */
    private $usernamePaypal;

    /**
     * @var MetodoPago
     * @Groups("paypal")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     * @ORM\OneToOne(targetEntity="MetodoPago")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="metodo_pago_id", referencedColumnName="id")
     * })
     */
    private $metodoPago;

    /**
     * @return string
     */
    public function getUsernamePaypal(): string
    {
        return $this->usernamePaypal;
    }

    /**
     * @return MetodoPago
     */
    public function getMetodoPago(): MetodoPago
    {
        return $this->metodoPago;
    }

    /**
     * @param string $usernamePaypal
     */
    public function setUsernamePaypal(string $usernamePaypal): void
    {
        $this->usernamePaypal = $usernamePaypal;
    }


}
