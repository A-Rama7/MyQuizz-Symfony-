<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220513134258 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE quiz (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, image VARCHAR(255) DEFAULT NULL, topic INT NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('DROP TABLE history_quiz');
        $this->addSql('ALTER TABLE answer CHANGE id_question question_id INT DEFAULT NULL, CHANGE text answer VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE question ADD topic_id INT DEFAULT NULL, CHANGE id_topic quiz_id INT DEFAULT NULL, CHANGE text name VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE question ADD CONSTRAINT FK_B6F7494E853CD175 FOREIGN KEY (quiz_id) REFERENCES quiz (id)');
        $this->addSql('CREATE INDEX IDX_B6F7494E853CD175 ON question (quiz_id)');
        $this->addSql('ALTER TABLE topic ADD image VARCHAR(255) DEFAULT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE question DROP FOREIGN KEY FK_B6F7494E853CD175');
        $this->addSql('CREATE TABLE history_quiz (id INT AUTO_INCREMENT NOT NULL, id_topic INT DEFAULT NULL, id_user INT DEFAULT NULL, date DATETIME DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_0900_ai_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('DROP TABLE quiz');
        $this->addSql('ALTER TABLE answer CHANGE question_id id_question INT DEFAULT NULL, CHANGE answer text VARCHAR(255) DEFAULT NULL');
        $this->addSql('DROP INDEX IDX_B6F7494E853CD175 ON question');
        $this->addSql('ALTER TABLE question ADD id_topic INT DEFAULT NULL, DROP quiz_id, DROP topic_id, CHANGE name text VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE topic DROP image');
    }
}
