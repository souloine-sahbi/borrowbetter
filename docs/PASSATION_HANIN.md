# Passation : Souloine vers Hanin

## 1. Ce qui est prêt

Connexion e-mail et Google, document `users/{uid}` créé automatiquement, profil et modification, accueil, recherche (catégorie, lieu, texte), publication avec photos Cloudinary, détail d'un objet, traduction MyMemory, signalement, barre du bas à cinq éléments, Drawer, thèmes clair et sombre, trois langues avec RTL, publicités de test.
Provider du profil connecté : `utilisateurCourantProvider`. Session : `etatAuthProvider`. Objets : `objets_providers.dart`.

## 2. Premier jour

1. Cloner, suivre le README, lancer l'application avec ton compte Google.
2. Faire un petit changement (une chaîne dans les trois ARB), PR, relue par Souloine.
3. Lire `features/objets/` de bas en haut : `domain/objet.dart`, `data/depot_objets_firestore.dart`, `presentation/objets_providers.dart`, puis un écran.

## 3. Tes tâches, dans l'ordre

| # | Tâche | Écrans | Fini quand |
|---|---|---|---|
| 1 | Modèle `Demande`, statuts, machine d'états (code en section 4) | aucun | tests unitaires verts |
| 2 | `DepotDemandes` (interface, DTO, Firestore), anti-chevauchement dans une transaction | aucun | tests du DTO verts |
| 3 | Écran **Demande d'emprunt** (dates, message) et bouton « Demander à emprunter » du détail (actuellement « bientôt », masqué pour le propriétaire) | 8 | demande créée dans `borrowRequests` |
| 4 | **Détails d'une demande** : accepter, refuser, annuler, remis, rendu ; à l'acceptation, copier l'adresse dans `adresseRemise` | complémentaire | transitions autorisées uniquement |
| 5 | **Mes emprunts** et **Mes objets prêtés** : `TabBar` Actifs / Historique, remplacent la page « bientôt » de l'onglet Demandes | 9, 10 | quatre états (chargement, erreur, vide, données) |
| 6 | **Notifications** niveau B puis A (section 5) | 11 | liste temps réel, badge, appui ouvre la demande |
| 7 | **Avis** (une note par prêt terminé) et note moyenne sur le profil | complémentaire | doublon refusé par les règles |
| 8 | **Espace admin** A1 à A6 | A1 à A6 | accès refusé sans document `admins/{uid}` |
| 9 | Finition : traductions de tes écrans, tests des `Notifier`, mode avion | | |

L'onglet Demandes est une `EcranBientot` dans `routing/routeur.dart` : remplace-la. Le chemin `Chemins.demandes` existe déjà.

## 4. Démarrer sans attendre : modèle et machine d'états

`features/demandes/domain/statut_demande.dart` :

```dart
enum StatutDemande { enAttente, acceptee, refusee, annulee, enCours, terminee }

enum RoleDemande { emprunteur, proprietaire }

/// Transitions autorisées. Les règles Firestore appliquent les mêmes.
bool transitionAutorisee({
  required StatutDemande de,
  required StatutDemande vers,
  required RoleDemande role,
}) => switch ((de, vers, role)) {
  (StatutDemande.enAttente, StatutDemande.annulee, RoleDemande.emprunteur) => true,
  (StatutDemande.enAttente, StatutDemande.acceptee, RoleDemande.proprietaire) => true,
  (StatutDemande.enAttente, StatutDemande.refusee, RoleDemande.proprietaire) => true,
  (StatutDemande.acceptee, StatutDemande.enCours, RoleDemande.proprietaire) => true,
  (StatutDemande.enCours, StatutDemande.terminee, RoleDemande.proprietaire) => true,
  _ => false,
};
```

`test/features/demandes/domain/statut_demande_test.dart` :

```dart
import 'package:borrowbetter/src/features/demandes/domain/statut_demande.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('le propriétaire accepte une demande en attente', () {
    expect(
      transitionAutorisee(
        de: StatutDemande.enAttente,
        vers: StatutDemande.acceptee,
        role: RoleDemande.proprietaire,
      ),
      isTrue,
    );
  });

  test("l'emprunteur ne peut pas accepter sa propre demande", () {
    expect(
      transitionAutorisee(
        de: StatutDemande.enAttente,
        vers: StatutDemande.acceptee,
        role: RoleDemande.emprunteur,
      ),
      isFalse,
    );
  });

  test('on ne revient jamais en arrière', () {
    expect(
      transitionAutorisee(
        de: StatutDemande.terminee,
        vers: StatutDemande.enAttente,
        role: RoleDemande.proprietaire,
      ),
      isFalse,
    );
  });

  test("l'emprunteur n'annule plus une demande acceptée", () {
    expect(
      transitionAutorisee(
        de: StatutDemande.acceptee,
        vers: StatutDemande.annulee,
        role: RoleDemande.emprunteur,
      ),
      isFalse,
    );
  });
}
```

Document Firestore `borrowRequests` : `objetId`, `proprietaireId`, `emprunteurId`, `dateDebut`, `dateRetourPrevue`, `message`, `statut` (nom de l'enum), `createdAt`, `updatedAt`, `adresseRemise` (rempli à l'acceptation, `{cite, rue}`).
Anti-chevauchement : dans une transaction, lire les demandes `acceptee` ou `enCours` du même `objetId` et refuser si `[dateDebut, dateRetourPrevue]` croise l'une d'elles.

## 5. Notifications

**Niveau B (à faire d'abord).** À chaque événement, écrire dans `notifications` : `destinataireId`, `auteurId`, `type`, `demandeId`, `objetTitre`, `acteurNom`, `lu: false`, `creeLe`. Ne stocke pas de texte : stocke le type et les paramètres, puis compose le message avec les fichiers ARB. L'écran 11 observe la collection (`StreamProvider`, `where destinataireId == uid`, tri côté application). Enregistre le jeton FCM dans `users/{uid}.fcmToken` (`firebase_messaging`, `requestPermission()` sur Android 13).

**Niveau A (si le temps le permet).** Un Worker Cloudflare (gratuit, sans carte) :
1. L'application l'appelle après l'écriture de la notification, avec le jeton Firebase de l'utilisateur dans l'en-tête.
2. Le Worker valide le jeton (appel `accounts:lookup` de l'API Identity Toolkit), lit la notification avec ce même jeton (donc sous les règles Firestore), puis lit le `fcmToken` du destinataire.
3. Il envoie le push via l'API FCM HTTP v1. La clé de service Firebase est un secret du Worker (`wrangler secret put`), jamais dans l'application ni dans Git.
4. Côté application : `FirebaseMessaging.onMessage` (premier plan), `onBackgroundMessage` (fonction de haut niveau), `onMessageOpenedApp` et `getInitialMessage`, puis `router.go(...)` vers la demande.

Si seul B est livré, présente-le tel quel : l'arrière-plan complet exige A.

## 6. Règles Firestore

Déjà écrites dans `docs/firestore.rules` pour `borrowRequests`, `notifications`, `reviews`, `admins`, `adminActions`. Teste chaque règle avec un cas autorisé et un cas interdit (simulateur de la console). Crée à la main dans la console `admins/{ton uid}` pour tester l'espace admin.

## 7. Règles de travail

- Tu ne modifies pas `Utilisateur`, `Objet` et `Failure` sans en parler à Souloine ; toute modification d'un fichier de sa partie passe par une PR relue par lui.
- Chacun présente à la soutenance les modules qu'il a écrits : relis le code de chaque tâche avant de la fusionner.
- Parcours prioritaire : publier, rechercher, demander, accepter ou refuser, suivre, rendre.