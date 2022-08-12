<?php

namespace App\Controller;
use App\Entity\User;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Psr\Log\LoggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\Encoder\JsonEncode;
use Symfony\Component\Serializer\Encoder\JsonEncoder;
use Symfony\Component\Serializer\Normalizer\AbstractNormalizer;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;
use Symfony\Component\Serializer\Serializer;
use Symfony\Component\Serializer\SerializerInterface;

class UserController extends AbstractController
{
    /**
     * @Route("/{reactRouting}", name="home", defaults={"reactRouting": null})
     */
    public function index(): Response
    {
        return $this->render('user/index.html.twig', [
            'controller_name' => 'UserController',
        ]);
    }

    /**
     * @Route ("api/users/{id}", name="remove_user",defaults={"reactRouting": null}, methods= {"GET", "DELETE"})
     */
    public function remove($id, UserRepository $userRepository): Response
    {
        $user = $userRepository->find($id);
        if ($user) {
            $userRepository->remove($user, true);
            return new Response("user deleted");
        }
        return new Response("user not found");
    }

    /**
     * @Route ("/{reactRouting}/users/infos/{id}", name="infos", methods= {"GET"})
     */

    public function show(ManagerRegistry $doctrine, int $id): Response
    {
        $user = $doctrine->getRepository(User::class)->find($id);

        if (!$user) {

            return $this->json('No project found for id' . $id, 404);
        }

        $data =  [
            'id' => $user->getId(),
            'name' => $user->getPrenom(),
            'prenom' => $user->getNom(),
            'adresse' => $user->getAdresse(),
            'tel' =>$user->getTel(),
            'birthday'=>$user->getBirthday(),
            'possessions'=>$user->getPossessions()
        ];

        return $this->json($data);
    }

    /**
     * @Route("/api/users", name="users", defaults={"reactRouting": null}, methods={"GET"})
     */
    public function getUsers(EntityManagerInterface $entityManager, SerializerInterface $serializer, UserRepository $userRepository, LoggerInterface $logger): Response
    {

        $userRepository = $entityManager->getRepository(User::class);
        $users = $userRepository->findAll();
        $encoders = [new JsonEncoder()];
        $defaultContext = [
            AbstractNormalizer::CIRCULAR_REFERENCE_HANDLER => function ($object, $format, $context) {
                return $object->getNom();
            },
        ];
        $normalizers = [new ObjectNormalizer(null, null, null, null, null, null, $defaultContext)];
        $serializer = new Serializer($normalizers, $encoders);
        $serializedData = $serializer->serialize($users, 'json');
//        var_dump($serializedData);
        $response = new Response($serializedData);
        /*________*/
        $response->headers->set('Content-Type', 'application/json');
        $response->headers->set('Access-Control-Allow-Origin', '*');
//       $response->setContent(json_encode($serializedData));

        return $response;

    }


}
