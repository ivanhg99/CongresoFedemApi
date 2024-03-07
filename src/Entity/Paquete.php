<?php

namespace App\Entity;

use Symfony\Component\Serializer\Annotation\Groups;
use Doctrine\ORM\Mapping as ORM;

/**
 * Paquete
 *
 * @ORM\Table(name="paquete")
 * @ORM\Entity
 */
class Paquete
{
    /**
     * @var int
     * @Groups("paquete")
     * @ORM\Column(name="id", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var string
     * @Groups("paquete")
     * @ORM\Column(name="tipo", type="string", length=45, nullable=false)
     */
    private $tipo;

    /**
     * @var string
     * @Groups("paquete")
     * @ORM\Column(name="precio", type="string", length=45, nullable=false)
     */
    private $precio;

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
    public function getTipo(): string
    {
        return $this->tipo;
    }

    /**
     * @return string
     */
    public function getPrecio(): string
    {
        return $this->precio;
    }

    /**
     * @param string $tipo
     */
    public function setTipo(string $tipo): void
    {
        $this->tipo = $tipo;
    }

    /**
     * @param string $precio
     */
    public function setPrecio(string $precio): void
    {
        $this->precio = $precio;
    }


}
