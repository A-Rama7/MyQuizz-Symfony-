<?php

namespace App\Controller;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;


use App\Entity\Quiz;
use App\Entity\Topic;
use App\Repository\QuizRepository;
use App\Repository\TopicRepository;
<<<<<<< HEAD
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Response;

=======

use Symfony\Component\HttpFoundation\Request;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Session\Session;
>>>>>>> quiz
class QuizController extends AbstractController
{
    #[Route('/', name: 'quiz_index')]
    public function index(): Response
    {
        return $this->render('quiz/index.html.twig', [
            'controller_name' => 'QuizController',
        ]);
    }

    #[Route('/quiz', methods: ['GET'], name: 'quiz_all')]
    public function quizAll(ManagerRegistry $doctrine): Response
    {
        $data = $doctrine->getRepository(Quiz::class)->findAll();
        
        return $this->render('quiz/index.html.twig', [
            'quizz' => $data,
        ]);
    }

    #[Route('quiz/{id}/result', methods: ['GET'], name: 'quiz_result')]
    public function result($id): Response
    {
        $session = new Session();
        $session->set('nextQuestion', 0);
        return $this->render('quiz/result.html.twig');
    }

    #[Route('/quiz/next-question/{id}/{quiz}', methods: ['GET'], name: 'quiz_show_next')]
    public function quizShow_next($id,$quiz, QuizRepository $quizz)
    {
        $session = new Session();
        $session->start();
        
        $session->set('nextQuestion', $id);
        // $session->set('score', 0);
        $count = $quizz->nombreQuestion($id);
        // dd(count($count) - 1);

        if($id == count($count) - 1)
        {
            $session->set('nextQuestion', 0);
        }
        
    
        return $this->redirect('/quiz/'.$quiz);
        // session_start();

        // Page was not reloaded via a button press
        // if (!isset($_POST['add'])) {
        //     $_SESSION['attnum'] = 1; // Reset counter
        // }
    }

    #[Route('/quiz/{id}', methods: ['GET'], name: 'quiz_show')]
    public function quizShow($id, Request $request, Quiz $quiz, QuizRepository $quizz): Response
    {
        $session = new Session();
        // $session->set('nextQuestion', 0);
        $nextQuestion = $session->get('nextQuestion');
        // dd($nextQuestion);
        $path = $request->getPathInfo();

        $num = intval($path);
        // dd($num);
        $score = [];
        // $nextQuestion = 0;
        dump($nextQuestion);
        // $nextQuestion +=1;
        $swich = false;

        $isAnswer = "";

        // dump($request->query->get('next-question'));
       
        // dd($request->query->has('next-question'));
        // ,intval($next) == $nextQuestion + 1

        //  function next_question($request, $nextQuestion, $path)
        // {

        
        //  $next = $request->query->get('next-question');
         
        // $isNext = $request->query->has('next-question');

        // if($isNext)
        // {
        //     dump($nextQuestion);
        //     $session->set('nextQuestion', 3);
        //     // dd($nextQuestion);

        //     dump("helo", $nextQuestion);
        //     dump($nextQuestion);
        //     dd($nextQuestion);
        //      return $this->redirect($path);
        //     // header('Location:'.$path);
        //     // return $this->redirect($path);
            
        //     // dd($path);
        // }
        
        // dump($request->query->get('answer'));

        $question = $request->query->get('question');
        $answer = $request->query->get('answer');

        if($question != null && $answer != null )
        {
            $isAnswer = $quizz->checkIsAnswer($question,$answer);
            $swich = true;
            if($isAnswer == true){

                // $scores = $session->get('nextQuestion');
                // $session->set('score', $scores );
                // array_push($score,['question' => $question, 'answer' => $answer,'score'=> 1]);
            }
        }
        
        dump($isAnswer);

        
        // $firstQuestionId = $quizz->firstQuestionId($id);
        
        $questionsId = $quizz->nombreQuestion($id);

        dump($questionsId);
        // dd($questionsId);
        
        $data = $quizz->findAllQuizTopicAnwer($id, $questionsId[$nextQuestion]['question_id']);
        // dd($nextQuestion);


        // dd($questionsId);
        return $this->render('quiz/quiz.html.twig', [
            'quiz' => $data,
            'questionId' => $questionsId,
            'path' => $path,
            'isAnswer' => $isAnswer,
            'swich' => $swich,
            'nextQuestion' => $nextQuestion
        ]);
    }


    

    #[Route('quiz/topic/{id}', methods: ['GET'], name: 'quiz_topic')]
    public function quizShowREZ($id, Quiz $quiz, QuizRepository $quizz): Response
    {
        $quizzTopic = $quizz->findAllQuizTopic($id);

        return $this->render('quiz/show.html.twig', [
            'quizzTopic' => $quizzTopic,
        ]);
    }

    #[Route('/topic', methods: ['GET'], name: 'quiz_topic_all')]
    public function topic(ManagerRegistry $doctrine): Response
    {
        $data = $doctrine->getRepository(Topic::class)->findAll();
        // dd($data);
        return $this->render('topic/index.html.twig', [
            'quizz' => $data,
        ]);
    }

    #[Route('/topic/{id}', methods: ['GET'], name: 'quiz_topic_show')]
    public function topicShow($id,Topic $topic, TopicRepository $topics): Response
    {
        $data = $topics->find($id);

        return $this->render('topic/show.html.twig', [
            'topic' => $data,
        ]);
    }

}

