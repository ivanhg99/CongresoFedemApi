<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * Valoracion
 *
 * @ORM\Table(name="valoracion")
 * @ORM\Entity
 */
class Valoracion
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer", nullable=false, options={"unsigned"=true})
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var Asistente
     * @Groups("valoracion")
     * @ORM\ManyToOne(targetEntity="Asistente")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="asistente_id", referencedColumnName="id")
     * })
     */
    private $asistente;

    /**
     * @var Evento
     * @Groups("valoracion")
     * @ORM\ManyToOne(targetEntity="Evento")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="evento_id", referencedColumnName="id")
     * })
     */
    private $evento;

    /**
     * @var int
     * @Groups("valoracion")
     * @ORM\Column(name="valoracion", type="integer", nullable=false)
     */
    private $valoracion;

    /**
     * @return Asistente
     */
    public function getAsistente(): Asistente
    {
        return $this->asistente;
    }

    /**
     * @param Asistente $asistente
     */
    public function setAsistente(Asistente $asistente): void
    {
        $this->asistente = $asistente;
    }

    /**
     * @return Evento
     */
    public function getEvento(): Evento
    {
        return $this->evento;
    }

    /**
     * @param Evento $evento
     */
    public function setEvento(Evento $evento): void
    {
        $this->evento = $evento;
    }

    /**
     * @return int
     */
    public function getValoracion(): int
    {
        return $this->valoracion;
    }

    /**
     * @param int $valoracion
     */
    public function setValoracion(int $valoracion): void
    {
        $this->valoracion = $valoracion;
    }
}