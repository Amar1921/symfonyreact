<?php

namespace App\DataFixtures;

use App\Entity\Possessions;
use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $faker = Factory::create('fr_FR');
        for($i = 0; $i <30; $i++){
            $user = new User();
            $possession = new Possessions();
            $user->setPrenom($faker->firstName)
                ->setNom($faker->lastName)
                ->setEmail($faker->email)
                ->setAdresse($faker->address)
                ->setTel($faker->phoneNumber)
                ->setBirthday($faker->dateTime);
                $possession->setNom($faker->company)
                    ->addUser($user)
                    ->setType($faker->company)
                    ->setValeur($faker->randomFloat(13))
                    ->setNom($faker->currencyCode);

                $manager->persist($possession);
                $manager->persist($user);
        }
           // $manager->persist($user);
        $manager->flush();
    }

}
