<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230202153545 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {

        $this->addSql('ALTER TABLE asistente ADD tipo TINYINT(1) DEFAULT NULL, ADD dni VARCHAR(255) NOT NULL, ADD telefono VARCHAR(245) DEFAULT NULL, ADD telefono_contacto VARCHAR(245) DEFAULT NULL');

    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE asistente DROP tipo, DROP dni, DROP telefono, DROP telefono_contacto');

    }
}
