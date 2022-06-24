<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Topic
 *
 * @ORM\Table(name="topic")
 * @ORM\Entity
 */
class Topic
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
     * @var string|null
     *
     * @ORM\Column(name="name", type="string", length=255, nullable=true)
     */
    private $name;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $image;

    // /**
    //  * @ORM\OneToMany(targetEntity=Quiz::class, mappedBy="topic",fetch="EAGER")
    //  */
    // private $quizzes;

    // public function __construct()
    // {
    //     $this->quizzes = new ArrayCollection();
    // }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(?string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(?string $image): self
    {
        $this->image = $image;

        return $this;
    }

    // /**
    //  * @return Collection<int, Quiz>
    //  */
    // public function getQuizzes(): Collection
    // {
    //     return $this->quizzes;
    // }

    // public function addQuiz(Quiz $quiz): self
    // {
    //     if (!$this->quizzes->contains($quiz)) {
    //         $this->quizzes[] = $quiz;
    //         $quiz->setTopic($this);
    //     }

    //     return $this;
    // }

    // public function removeQuiz(Quiz $quiz): self
    // {
    //     if ($this->quizzes->removeElement($quiz)) {
    //         // set the owning side to null (unless already changed)
    //         if ($quiz->getTopic() === $this) {
    //             $quiz->setTopic(null);
    //         }
    //     }

    //     return $this;
    // }


}
