<?php

namespace App\Entity;

use Symfony\Component\Serializer\Annotation\Groups;
use Doctrine\ORM\Mapping as ORM;

/**
 * MetodoPago
 *
 * @ORM\Table(name="metodo_pago")
 * @ORM\Entity
 */
class MetodoPago
{
    /**
     * @var int
     * @Groups("metodo_pago")
     * @ORM\Column(name="id", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @return int
     */
    public function getId(): int
    {
        return $this->id;
    }


}
