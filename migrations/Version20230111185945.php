<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230111185945 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE valoracion ADD id INT UNSIGNED AUTO_INCREMENT NOT NULL, CHANGE asistente_id asistente_id INT UNSIGNED DEFAULT NULL, CHANGE evento_id evento_id INT UNSIGNED DEFAULT NULL, CHANGE valoracion valoracion INT NOT NULL, DROP PRIMARY KEY, ADD PRIMARY KEY (id)');
        $this->addSql('ALTER TABLE valoracion RENAME INDEX fk_valoracion_asistente1_idx TO IDX_6D3DE0F411FECD4E');
        $this->addSql('ALTER TABLE valoracion RENAME INDEX fk_valoracion_evento1_idx TO IDX_6D3DE0F487A5F842');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP INDEX `PRIMARY` ON valoracion');
        $this->addSql('ALTER TABLE valoracion DROP id, CHANGE asistente_id asistente_id INT UNSIGNED NOT NULL, CHANGE evento_id evento_id INT UNSIGNED NOT NULL, CHANGE valoracion valoracion TINYINT(1) NOT NULL');
        $this->addSql('ALTER TABLE valoracion ADD PRIMARY KEY (asistente_id, evento_id)');
        $this->addSql('ALTER TABLE valoracion RENAME INDEX idx_6d3de0f487a5f842 TO fk_valoracion_evento1_idx');
        $this->addSql('ALTER TABLE valoracion RENAME INDEX idx_6d3de0f411fecd4e TO fk_valoracion_asistente1_idx');
    }
}
