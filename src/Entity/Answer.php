<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Answer
 *
 * @ORM\Table(name="answer")
 * @ORM\Entity
 */
class Answer
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var int|null
     *
     * @ORM\Column(name="question_id", type="integer", nullable=true)
     */
    private $idQuestion;

    /**
     * @var string|null
     *
     * @ORM\Column(name="answer", type="string", length=255, nullable=true)
     */
    private $answer;

    /**
     * @var bool|null
     *
     * @ORM\Column(name="answer_expected", type="boolean", nullable=true)
     */
    private $answerExpected;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getIdQuestion(): ?int
    {
        return $this->idQuestion;
    }

    public function setIdQuestion(?int $idQuestion): self
    {
        $this->idQuestion = $idQuestion;

        return $this;
    }

    public function getAnswer(): ?string
    {
        return $this->answer;
    }

    public function setAnswer(?string $answer): self
    {
        $this->answer = $answer;

        return $this;
    }

    public function getAnswerExpected(): ?bool
    {
        return $this->answerExpected;
    }

    public function setAnswerExpected(?bool $answerExpected): self
    {
        $this->answerExpected = $answerExpected;

        return $this;
    }

}
