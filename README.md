# BorrowBetter

Prêt et emprunt d'objets entre particuliers. Flutter, Riverpod, go_router, Firebase (plan gratuit), Cloudinary, Gemini via Firebase AI Logic.

## Lancer le projet

1. `flutter pub get`
2. Copier `env.example.json` vers `env.json` et remplir les valeurs (transmises hors du dépôt).
3. Placer `android/app/google-services.json` (console Firebase, jamais versionné).
4. Ajouter ton empreinte SHA-1 et SHA-256 dans la console Firebase (Paramètres du projet, application Android), sinon Google Sign-In échoue (`INVALID_CERT_HASH`).
5. `dart run build_runner build`
6. `flutter run --dart-define-from-file=env.json`

## Contrôle avant chaque commit

```
flutter gen-l10n
dart run build_runner build
dart format lib test
flutter analyze   # doit afficher « No issues found »
flutter test
```

## Architecture

Par fonctionnalité, trois couches dans chacune : `presentation` (écrans, providers), `domain` (modèles, interfaces de dépôt, `Failure`), `data` (DTO, sources, dépôts). Une flèche ne remonte jamais : `data` ignore les widgets. Aucun import de `dio`, `cloud_firestore` ou `firebase_ai` hors de `data/`.

Ajouter une fonctionnalité : copier la structure de `features/objets/` (modèle freezed, interface de dépôt, DTO nullable avec conversion, implémentation Firestore, provider, écran).

## Conventions

- Branches `sahbi/...` et `hanin/...`, une PR par tâche, relue par l'autre. Jamais de commit direct sur `main`.
- `flutter analyze` sans aucun avertissement. `dart format` avant commit.
- Aucune chaîne visible en dur : tout passe par les fichiers ARB (3 langues).
- Aucune couleur ni taille de police en dur : rôles du thème, `Espacements`.
- `ref.watch` dans `build`, `ref.read` dans les callbacks, `ref.listen` pour les effets. État remplacé, jamais muté.
- `dispose()` pour chaque contrôleur ; `mounted` après chaque `await`.
- Riverpod 3 : `AsyncValue.value` (pas `valueOrNull`). Constructeurs écrits `const new(...)` ; ne pas les « corriger ». Un `factory` freezed garde le nom de la classe (`// ignore:` documenté).
- Après modification d'un modèle freezed : supprimer le `*.freezed.dart`, relancer `build_runner`.

## Sécurité

- Aucun secret dans Git : `env.json`, `google-services.json`, clés de service. La clé secrète Cloudinary n'est jamais dans l'application. Aucune clé Gemini dans l'application.
- Ne jamais lier de compte de facturation au projet Firebase (plan Spark gratuit).
- Les règles Firestore sont dans la console ET dans `docs/firestore.rules` : les mettre à jour aux deux endroits.

## Limites connues

- Les règles ne vérifient pas le chevauchement de dates (transaction côté application).
- N'importe quel utilisateur connecté peut créer une notification pour un autre.
- Les images supprimées restent sur Cloudinary (suppression impossible sans serveur).
- Preset Cloudinary non signé : quota exposé en cas d'abus.