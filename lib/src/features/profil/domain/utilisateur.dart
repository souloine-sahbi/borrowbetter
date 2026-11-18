import 'package:freezed_annotation/freezed_annotation.dart';

part 'utilisateur.freezed.dart';

enum StatutCompte { actif, suspendu }

@freezed
abstract class Utilisateur with _$Utilisateur {
  // freezed impose la forme `factory Utilisateur(...)` : `factory new` est
  // interdit par Dart, donc le constructeur ne peut pas perdre son nom.
  // ignore: unnecessary_type_name_in_constructor
  const factory Utilisateur({
    required String uid,
    required String nom,
    required String email,
    required DateTime creeLe,
    @Default(StatutCompte.actif) StatutCompte statut,
    String? photoUrl,
    String? gouvernorat,
    String? ville,
  }) = _Utilisateur;
}
