<?php

namespace App\Controller;

define("DBHOST", "localhost");
define("DBUSER", "user");
define("DBPASSWORD", "password");
define("DBNAME", "quiz");
define("DBPORT", "3306");

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;


use App\Entity\Quiz;
use App\Entity\Topic;
use App\Repository\QuizRepository;
use App\Repository\TopicRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Response;

class QuizController1 extends AbstractController {

    public function __construct()
    {
        $this->db = new \PDO("mysql:dbname=".DBNAME.";host=".DBHOST.";port:".DBPORT, DBUSER, DBPASSWORD);
    }


    /*--------------------*\
        QUESTION
    \*--------------------*/

    #[Route(path: '/create/question', name: 'create_question')]
    public function display_create_question_form() {
        return $this->render('question-creation-form.html.twig', []);
    }

    #[Route(path: '/question/creation', name: 'question_creation')]
    public function create_question() {
        $name = $_POST["question-name"];
        $topicId = $_POST["topic-id"];
        $request = 'INSERT INTO `question`(`topic_id`, `name`, `quiz_id`) VALUES('.$topicId.', "'.$name.'", '.$topicId.');';
        $this->db->exec($request);
        $request = 'SELECT `id` FROM `question` WHERE `name` = "'.$name.'";';
        $request = $this->db->query($request)->fetch();
        $id = $request[0];
        $request = 'INSERT INTO `answer`(`answer_expected`, `question_id`, `answer`) VALUES(0, '.$id.', "'.$_POST["answer-1"].'");';
        $this->db->exec($request);
        $request = 'INSERT INTO `answer`(`answer_expected`, `question_id`, `answer`) VALUES(0, '.$id.', "'.$_POST["answer-2"].'");';
        $this->db->exec($request);
        $request = 'INSERT INTO `answer`(`answer_expected`, `question_id`, `answer`) VALUES(0, '.$id.', "'.$_POST["answer-3"].'");';
        $this->db->exec($request);
        $request = 'INSERT INTO `answer`(`answer_expected`, `question_id`, `answer`) VALUES(0, '.$id.', "'.$_POST["answer-4"].'");';
        $this->db->exec($request);
        $request = 'UPDATE `answer` SET `answer_expected` = 1 WHERE `answer` = "'.$_POST["answer-".$_POST["solution"]].'" AND `question_id` = '.$id.';';
        $this->db->exec($request);
        return $this->render('index.html.twig', []);
    }

    /*--------------------*\
        QUIZ
    \*--------------------*/

    #[Route(path: '/create/quiz', name: 'quiz_question')]
    public function display_create_quiz_form() {
        return $this->render('quiz-creation-form.html.twig', []);
    }

    #[Route(path: '/quiz/creation', name: 'quiz_creation')]
    public function create_quiz() {
        $request = 'INSERT INTO `quiz`(`name`, `image`, `topic`) VALUES("'.$_POST["quiz-name"].'", "'.$_POST["image"].'", '.$_POST["topic"].');';
        $this->db->exec($request);
        return $this->render('index.html.twig', []);
    }
}

/*

    #[Route(path: '/create/question', name: 'create_question')]
    public function create_question(Request $request, EntityManagerInterface $manager)
    {
        $question = new \App\Entity\Question();
        $form = $this->createFormBuilder($question)
                     ->add('text')
                     ->add('id_topic')
                     ->getForm();

        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()) {
            $manager->persist($question);
            $manager->flush();
            return $this->redirectToRoute('quiz', []);
        }

        return $this->render('quiz-creation-form.html.twig', [
            'form' => $form->createView(),
            'mode' => $question->getId() !== null
        ]);
    }

    public function add_question() {
    }

    #[Route(path: '/create/quiz', name: 'create_quiz')]
    public function create_quiz(Request $request, EntityManagerInterface $manager)
    {
        $quiz = new \App\Entity\Question();
        $form = $this->createFormBuilder($quiz)
                     ->add('id_topic')
                     ->add('id_question_1', ChoiceType::class, [
                         'mapped' => false
                     ])
                     ->add('id_question_2', ChoiceType::class, [
                        'mapped' => false
                    ])
                     ->add('id_question_3', ChoiceType::class, [
                        'mapped' => false
                    ])
                     ->add('id_question_4', ChoiceType::class, [
                        'mapped' => false
                    ])
                     ->add('id_question_5', ChoiceType::class, [
                        'mapped' => false
                    ])
                     ->add('id_question_6', ChoiceType::class, [
                        'mapped' => false
                    ])
                     ->add('id_question_7', ChoiceType::class, [
                        'mapped' => false
                    ])
                     ->add('id_question_8', ChoiceType::class, [
                        'mapped' => false
                    ])
                     ->add('id_question_9', ChoiceType::class, [
                        'mapped' => false
                    ])
                     ->add('id_question_10', ChoiceType::class, [
                        'mapped' => false
                    ])
                     ->getForm();

        $form->handleRequest($request);
        if($form->isSubmitted() && $form->isValid()) {
            $manager->persist($quiz);
            $manager->flush();
            return $this->redirectToRoute('quiz', []);
        }

        return $this->render('quiz-creation-form.html.twig', [
            'form' => $form->createView(),
            'mode' => $quiz->getId() !== null
        ]);
    }

    */