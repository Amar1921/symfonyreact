<?php

namespace App\Controller;

use App\Entity\User;
use App\Repository\PossessionsRepository;
use App\Repository\UserRepository;
use DateTime;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AddUserController extends AbstractController
{
    /**
     * @Route("/add_user'", name="add_user", defaults={"reactRouting": null}, methods={"GET"})
     */
    /**
     * @Route("/add_user", name="add_user", methods={"POST"})
     */
    public function addUser(ManagerRegistry $doctrine, Request $request): Response
    {
        $entityManager = $doctrine->getManager();

        $user = new User();
        $user->setNom($request->request->get('nom'));
        $user->setPrenom($request->request->get('prenom'));
        $user->setEmail($request->request->get('email'));
        $user->setAdresse($request->request->get('adresse'));
        $user->setTel($request->request->get('tel'));
        $d = new DateTime($request->request->get('birthDate'));
        $user->setBirthday($d);


        $entityManager->persist($user);
        $entityManager->flush();

        return $this->json('Created new user successfully with id ' . $user->getId());
    }


}

//[Route('{reactRouting}/add/user', name: 'add_user']
