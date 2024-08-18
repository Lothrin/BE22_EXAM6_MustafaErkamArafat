<?php

namespace App\Form;

use App\Entity\Event;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class EventType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', null, [
                'attr' => ['class' => 'form-control'],
            ])
            ->add('date', DateTimeType::class, [
                'attr' => ['class' => 'form-control'],
            ])
            ->add('description', null, [
                'attr' => ['class' => 'form-control'],
            ])
            ->add('image', null, [
                'attr' => ['class' => 'form-control'],
            ])
            ->add('capacity', null, [
                'attr' => ['class' => 'form-control'],
            ])
            ->add('email', null, [
                'attr' => ['class' => 'form-control'],
            ])
            ->add('phone_number', null, [
                'attr' => ['class' => 'form-control'],

            ])
            ->add('address', null, [
                'attr' => ['class' => 'form-control'],
            ])
            ->add('url', null, [
                'attr' => ['class' => 'form-control'],
            ])
            ->add('type', ChoiceType::class, [
                'choices' => [
                    '--- Please select a category!' => true,
                    'Arts' => 'arts',
                    'Cinema' => 'cinema',
                    'Music' => 'music',
                    'Sports' => 'sports',
                    'Theater' => 'theater',


                ],
                'attr' => ['class' => 'form-control'],
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Event::class,
        ]);
    }
}
