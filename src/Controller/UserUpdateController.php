<?php

namespace App\Controller;

use App\Entity\User;
use App\Repository\UserRepository;
use App\Form\UserUpdateType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;

use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Doctrine\ORM\EntityManagerInterface;

class UserUpdateController extends AbstractController
{

    #[Route('/profil/update', name: 'app_profil_update')]
    public function new(Request $request, UserPasswordHasherInterface $userPasswordHasher, EntityManagerInterface $entityManager, ManagerRegistry $doctrine): Response
    {
        $user = new User();
        // ...
        $entityManager = $doctrine->getManager();
        // $userUpdate = $entityManager->getRepository(User::class);
        $form = $this->createForm(UserUpdateType::class,  $user);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            // encode the plain password
            $user->setPassword(
                $userPasswordHasher->hashPassword(
                    $user,
                        $form->get('password')->getData()
                    )
            );
            
            // $entityManager->persist($user);
            // $entityManager->flush();
        }
        $title = "Update";

        return $this->renderForm('user_profil/updateProfil.html.twig', [
            'form' => $form,
            'page_title' => $title
        ]);
    }
}