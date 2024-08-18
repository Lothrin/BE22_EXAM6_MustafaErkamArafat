<?php

namespace App\Controller;

use App\Entity\Event;
use App\Form\EventType;
use App\Repository\EventRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/event')]
class EventController extends AbstractController
{
    #[Route('/index', name: 'app_event_index', methods: ['GET'])]
    public function index(EventRepository $eventRepository): Response
    {
        return $this->render('event/index.html.twig', [
            'events' => $eventRepository->findAll(),
        ]);
    }
    #[Route('/arts', name: 'app_event_arts', methods: ['GET'])]
    public function arts(EventRepository $eventRepository): Response
    {
        $events = $eventRepository->findByType('arts');
        return $this->render('event/categories/arts.html.twig', [
            'events' => $events,
        ]);
    }

    #[Route('/cinema', name: 'app_event_cinema', methods: ['GET'])]
    public function cinema(EventRepository $eventRepository): Response
    {
        $events = $eventRepository->findByType('cinema');
        return $this->render('event/categories/cinema.html.twig', [
            'events' => $events,
        ]);
    }
    #[Route('/music', name: 'app_event_music', methods: ['GET'])]
    public function music(EventRepository $eventRepository): Response
    {
        $events = $eventRepository->findByType('music');
        return $this->render('event/categories/music.html.twig', [
            'events' => $events,
        ]);
    }
    #[Route('/sports', name: 'app_event_sports', methods: ['GET'])]
    public function sports(EventRepository $eventRepository): Response
    {
        $events = $eventRepository->findByType('sports');
        return $this->render('event/categories/sports.html.twig', [
            'events' => $events,
        ]);
    }
    #[Route('/theater', name: 'app_event_theater', methods: ['GET'])]
    public function theater(EventRepository $eventRepository): Response
    {
        $events = $eventRepository->findByType('theater');
        return $this->render('event/categories/theater.html.twig', [
            'events' => $events,
        ]);
    }


    #[Route('/new', name: 'app_event_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $event = new Event();
        $form = $this->createForm(EventType::class, $event);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($event);
            $entityManager->flush();

            return $this->redirectToRoute('app_event_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('event/new.html.twig', [
            'event' => $event,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_event_show', methods: ['GET'])]
    public function show(Event $event): Response
    {
        return $this->render('event/show.html.twig', [
            'event' => $event,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_event_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Event $event, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(EventType::class, $event);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_event_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('event/edit.html.twig', [
            'event' => $event,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_event_delete', methods: ['POST'])]
    public function delete(Request $request, Event $event, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete' . $event->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($event);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_event_index', [], Response::HTTP_SEE_OTHER);
    }
}
