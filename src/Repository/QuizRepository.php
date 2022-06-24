<?php

namespace App\Repository;

use App\Entity\Quiz;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\ORM\ORMException;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Quiz>
 *
 * @method Quiz|null find($id, $lockMode = null, $lockVersion = null)
 * @method Quiz|null findOneBy(array $criteria, array $orderBy = null)
 * @method Quiz[]    findAll()
 * @method Quiz[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class QuizRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Quiz::class);
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function add(Quiz $entity, bool $flush = true): void
    {
        $this->_em->persist($entity);
        if ($flush) {
            $this->_em->flush();
        }
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function remove(Quiz $entity, bool $flush = true): void
    {
        $this->_em->remove($entity);
        if ($flush) {
            $this->_em->flush();
        }
    }

    public function findQuiz($value): ?Quiz
    {
        return $this->createQueryBuilder('q')
            ->addSelect('a', 't')
            ->where('q.topic = :val')
            ->setParameter('val', $value)
            ->innerJoin('p.author', 'a')
            ->getQuery()
            ->getOneOrNullResult();
    }

    public function findAllQuizTopic(int $topic): array
    {
        $conn = $this->getEntityManager()->getConnection();

        $sql = '
            SELECT q.id,q.name,q.image,t.name as topic_name FROM quiz q
            INNER JOIN topic t ON t.id = topic
            WHERE q.topic = :topic';
        $stmt = $conn->prepare($sql);
        $resultSet = $stmt->executeQuery(['topic' => $topic]);
        return $resultSet->fetchAllAssociative();
    }

    public function nombreQuestion(int $quiz_id): array
    {
        $conn = $this->getEntityManager()->getConnection();

        $sql = '
            SELECT a.question_id
            FROM question q
            INNER JOIN answer a ON a.question_id = q.id
            WHERE quiz_id = :quiz_id
            GROUP BY question_id;';
        $stmt = $conn->prepare($sql);
        $resultSet = $stmt->executeQuery(['quiz_id' => $quiz_id]);
        return $resultSet->fetchAllAssociative();
    }

    public function firstQuestionId(int $quiz_id): array
    {
        $conn = $this->getEntityManager()->getConnection();

        $sql = '
           SELECT question_id FROM question q
           INNER JOIN answer a on q.id = a.question_id
            WHERE quiz_id = :quiz_id  limit 1;';
        $stmt = $conn->prepare($sql);
        $resultSet = $stmt->executeQuery(['quiz_id' => $quiz_id]);
        return $resultSet->fetchAllAssociative();
    }

    public function findAllQuizTopicAnwer(int $quiz_id, int $question_id): array
    {
        $conn = $this->getEntityManager()->getConnection();

        $sql = '
            SELECT q.id,a.id, q.name AS question, quiz_id,a.id AS answer_id, a.answer,a.answer_expected,a.question_id, q2.image AS quiz_image, q2.name AS quiz_name
            FROM question q
            INNER JOIN answer a on q.id = a.question_id
            INNER JOIN quiz q2 on q2.id = q.quiz_id
            WHERE quiz_id = :quiz_id AND question_id = :question_id;';
        $stmt = $conn->prepare($sql);
        $resultSet = $stmt->executeQuery(['quiz_id' => $quiz_id, 'question_id' => $question_id]);

        return $resultSet->fetchAllAssociative();
    }


    public function checkIsAnswer(int $question,int $answer)
    {
        $conn = $this->getEntityManager()->getConnection();
         $sql = 'SELECT *
            FROM question q
            INNER JOIN answer a ON a.question_id = q.id
            WHERE question_id = :question AND a.id = :answer AND answer_expected = 1';
        $stmt = $conn->prepare($sql);
        $resultSet = $stmt->executeQuery(['question' => $question, 'answer' => $answer]);
        return !empty($resultSet->fetchAllAssociative());
    }

}
