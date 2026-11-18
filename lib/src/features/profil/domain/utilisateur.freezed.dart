// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'utilisateur.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Utilisateur {

 String get uid; String get nom; String get email; DateTime get creeLe; StatutCompte get statut; String? get photoUrl; String? get gouvernorat; String? get ville;
/// Create a copy of Utilisateur
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UtilisateurCopyWith<Utilisateur> get copyWith => _$UtilisateurCopyWithImpl<Utilisateur>(this as Utilisateur, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Utilisateur;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Utilisateur&&(identical(other.uid, _this.uid) || other.uid == _this.uid)&&(identical(other.nom, _this.nom) || other.nom == _this.nom)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.creeLe, _this.creeLe) || other.creeLe == _this.creeLe)&&(identical(other.statut, _this.statut) || other.statut == _this.statut)&&(identical(other.photoUrl, _this.photoUrl) || other.photoUrl == _this.photoUrl)&&(identical(other.gouvernorat, _this.gouvernorat) || other.gouvernorat == _this.gouvernorat)&&(identical(other.ville, _this.ville) || other.ville == _this.ville));
}


@override
int get hashCode {
  final _this = this as Utilisateur;
  return Object.hash(runtimeType,_this.uid,_this.nom,_this.email,_this.creeLe,_this.statut,_this.photoUrl,_this.gouvernorat,_this.ville);
}

@override
String toString() {
  final _this = this as Utilisateur;
  return 'Utilisateur(uid: ${_this.uid}, nom: ${_this.nom}, email: ${_this.email}, creeLe: ${_this.creeLe}, statut: ${_this.statut}, photoUrl: ${_this.photoUrl}, gouvernorat: ${_this.gouvernorat}, ville: ${_this.ville})';
}


}

/// @nodoc
abstract mixin class $UtilisateurCopyWith<$Res>  {
  factory $UtilisateurCopyWith(Utilisateur value, $Res Function(Utilisateur) _then) = _$UtilisateurCopyWithImpl;
@useResult
$Res call({
 String uid, String nom, String email, DateTime creeLe, StatutCompte statut, String? photoUrl, String? gouvernorat, String? ville
});




}
/// @nodoc
class _$UtilisateurCopyWithImpl<$Res>
    implements $UtilisateurCopyWith<$Res> {
  _$UtilisateurCopyWithImpl(this._self, this._then);

  final Utilisateur _self;
  final $Res Function(Utilisateur) _then;

/// Create a copy of Utilisateur
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? nom = null,Object? email = null,Object? creeLe = null,Object? statut = null,Object? photoUrl = freezed,Object? gouvernorat = freezed,Object? ville = freezed,}) {
  return _then(Utilisateur(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,nom: null == nom ? _self.nom : nom // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,creeLe: null == creeLe ? _self.creeLe : creeLe // ignore: cast_nullable_to_non_nullable
as DateTime,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutCompte,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,gouvernorat: freezed == gouvernorat ? _self.gouvernorat : gouvernorat // ignore: cast_nullable_to_non_nullable
as String?,ville: freezed == ville ? _self.ville : ville // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Utilisateur].
extension UtilisateurPatterns on Utilisateur {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Utilisateur value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Utilisateur() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Utilisateur value)  $default,){
final _that = this;
switch (_that) {
case _Utilisateur():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Utilisateur value)?  $default,){
final _that = this;
switch (_that) {
case _Utilisateur() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String nom,  String email,  DateTime creeLe,  StatutCompte statut,  String? photoUrl,  String? gouvernorat,  String? ville)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Utilisateur() when $default != null:
return $default(_that.uid,_that.nom,_that.email,_that.creeLe,_that.statut,_that.photoUrl,_that.gouvernorat,_that.ville);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String nom,  String email,  DateTime creeLe,  StatutCompte statut,  String? photoUrl,  String? gouvernorat,  String? ville)  $default,) {final _that = this;
switch (_that) {
case _Utilisateur():
return $default(_that.uid,_that.nom,_that.email,_that.creeLe,_that.statut,_that.photoUrl,_that.gouvernorat,_that.ville);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String nom,  String email,  DateTime creeLe,  StatutCompte statut,  String? photoUrl,  String? gouvernorat,  String? ville)?  $default,) {final _that = this;
switch (_that) {
case _Utilisateur() when $default != null:
return $default(_that.uid,_that.nom,_that.email,_that.creeLe,_that.statut,_that.photoUrl,_that.gouvernorat,_that.ville);case _:
  return null;

}
}

}

/// @nodoc


class _Utilisateur implements Utilisateur {
  const _Utilisateur({required this.uid, required this.nom, required this.email, required this.creeLe, this.statut = StatutCompte.actif, this.photoUrl, this.gouvernorat, this.ville});
  

@override final  String uid;
@override final  String nom;
@override final  String email;
@override final  DateTime creeLe;
@override@JsonKey() final  StatutCompte statut;
@override final  String? photoUrl;
@override final  String? gouvernorat;
@override final  String? ville;

/// Create a copy of Utilisateur
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UtilisateurCopyWith<_Utilisateur> get copyWith => __$UtilisateurCopyWithImpl<_Utilisateur>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Utilisateur&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.nom, nom) || other.nom == nom)&&(identical(other.email, email) || other.email == email)&&(identical(other.creeLe, creeLe) || other.creeLe == creeLe)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.gouvernorat, gouvernorat) || other.gouvernorat == gouvernorat)&&(identical(other.ville, ville) || other.ville == ville));
}


@override
int get hashCode {
    return Object.hash(runtimeType,uid,nom,email,creeLe,statut,photoUrl,gouvernorat,ville);
}

@override
String toString() {
    return 'Utilisateur(uid: $uid, nom: $nom, email: $email, creeLe: $creeLe, statut: $statut, photoUrl: $photoUrl, gouvernorat: $gouvernorat, ville: $ville)';
}


}

/// @nodoc
abstract mixin class _$UtilisateurCopyWith<$Res> implements $UtilisateurCopyWith<$Res> {
  factory _$UtilisateurCopyWith(_Utilisateur value, $Res Function(_Utilisateur) _then) = __$UtilisateurCopyWithImpl;
@override @useResult
$Res call({
 String uid, String nom, String email, DateTime creeLe, StatutCompte statut, String? photoUrl, String? gouvernorat, String? ville
});




}
/// @nodoc
class __$UtilisateurCopyWithImpl<$Res>
    implements _$UtilisateurCopyWith<$Res> {
  __$UtilisateurCopyWithImpl(this._self, this._then);

  final _Utilisateur _self;
  final $Res Function(_Utilisateur) _then;

/// Create a copy of Utilisateur
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? nom = null,Object? email = null,Object? creeLe = null,Object? statut = null,Object? photoUrl = freezed,Object? gouvernorat = freezed,Object? ville = freezed,}) {
  return _then(_Utilisateur(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,nom: null == nom ? _self.nom : nom // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,creeLe: null == creeLe ? _self.creeLe : creeLe // ignore: cast_nullable_to_non_nullable
as DateTime,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutCompte,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,gouvernorat: freezed == gouvernorat ? _self.gouvernorat : gouvernorat // ignore: cast_nullable_to_non_nullable
as String?,ville: freezed == ville ? _self.ville : ville // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
