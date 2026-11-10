// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'objet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Objet {

 String get id; String get proprietaireId; String get proprietaireNom; String get titre; String get description; CategorieObjet get categorie; EtatObjet get etat; String get gouvernoratId; String get villeId; String get langueAnnonce; StatutObjet get statut; DateTime get creeLe; List<String> get photos;
/// Create a copy of Objet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ObjetCopyWith<Objet> get copyWith => _$ObjetCopyWithImpl<Objet>(this as Objet, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Objet;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Objet&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.proprietaireId, _this.proprietaireId) || other.proprietaireId == _this.proprietaireId)&&(identical(other.proprietaireNom, _this.proprietaireNom) || other.proprietaireNom == _this.proprietaireNom)&&(identical(other.titre, _this.titre) || other.titre == _this.titre)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.categorie, _this.categorie) || other.categorie == _this.categorie)&&(identical(other.etat, _this.etat) || other.etat == _this.etat)&&(identical(other.gouvernoratId, _this.gouvernoratId) || other.gouvernoratId == _this.gouvernoratId)&&(identical(other.villeId, _this.villeId) || other.villeId == _this.villeId)&&(identical(other.langueAnnonce, _this.langueAnnonce) || other.langueAnnonce == _this.langueAnnonce)&&(identical(other.statut, _this.statut) || other.statut == _this.statut)&&(identical(other.creeLe, _this.creeLe) || other.creeLe == _this.creeLe)&&const DeepCollectionEquality().equals(other.photos, _this.photos));
}


@override
int get hashCode {
  final _this = this as Objet;
  return Object.hash(runtimeType,_this.id,_this.proprietaireId,_this.proprietaireNom,_this.titre,_this.description,_this.categorie,_this.etat,_this.gouvernoratId,_this.villeId,_this.langueAnnonce,_this.statut,_this.creeLe,const DeepCollectionEquality().hash(_this.photos));
}

@override
String toString() {
  final _this = this as Objet;
  return 'Objet(id: ${_this.id}, proprietaireId: ${_this.proprietaireId}, proprietaireNom: ${_this.proprietaireNom}, titre: ${_this.titre}, description: ${_this.description}, categorie: ${_this.categorie}, etat: ${_this.etat}, gouvernoratId: ${_this.gouvernoratId}, villeId: ${_this.villeId}, langueAnnonce: ${_this.langueAnnonce}, statut: ${_this.statut}, creeLe: ${_this.creeLe}, photos: ${_this.photos})';
}


}

/// @nodoc
abstract mixin class $ObjetCopyWith<$Res>  {
  factory $ObjetCopyWith(Objet value, $Res Function(Objet) _then) = _$ObjetCopyWithImpl;
@useResult
$Res call({
 String id, String proprietaireId, String proprietaireNom, String titre, String description, CategorieObjet categorie, EtatObjet etat, String gouvernoratId, String villeId, String langueAnnonce, StatutObjet statut, DateTime creeLe, List<String> photos
});




}
/// @nodoc
class _$ObjetCopyWithImpl<$Res>
    implements $ObjetCopyWith<$Res> {
  _$ObjetCopyWithImpl(this._self, this._then);

  final Objet _self;
  final $Res Function(Objet) _then;

/// Create a copy of Objet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? proprietaireId = null,Object? proprietaireNom = null,Object? titre = null,Object? description = null,Object? categorie = null,Object? etat = null,Object? gouvernoratId = null,Object? villeId = null,Object? langueAnnonce = null,Object? statut = null,Object? creeLe = null,Object? photos = null,}) {
  return _then(Objet(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,proprietaireId: null == proprietaireId ? _self.proprietaireId : proprietaireId // ignore: cast_nullable_to_non_nullable
as String,proprietaireNom: null == proprietaireNom ? _self.proprietaireNom : proprietaireNom // ignore: cast_nullable_to_non_nullable
as String,titre: null == titre ? _self.titre : titre // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categorie: null == categorie ? _self.categorie : categorie // ignore: cast_nullable_to_non_nullable
as CategorieObjet,etat: null == etat ? _self.etat : etat // ignore: cast_nullable_to_non_nullable
as EtatObjet,gouvernoratId: null == gouvernoratId ? _self.gouvernoratId : gouvernoratId // ignore: cast_nullable_to_non_nullable
as String,villeId: null == villeId ? _self.villeId : villeId // ignore: cast_nullable_to_non_nullable
as String,langueAnnonce: null == langueAnnonce ? _self.langueAnnonce : langueAnnonce // ignore: cast_nullable_to_non_nullable
as String,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutObjet,creeLe: null == creeLe ? _self.creeLe : creeLe // ignore: cast_nullable_to_non_nullable
as DateTime,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [Objet].
extension ObjetPatterns on Objet {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Objet value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Objet() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Objet value)  $default,){
final _that = this;
switch (_that) {
case _Objet():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Objet value)?  $default,){
final _that = this;
switch (_that) {
case _Objet() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String proprietaireId,  String proprietaireNom,  String titre,  String description,  CategorieObjet categorie,  EtatObjet etat,  String gouvernoratId,  String villeId,  String langueAnnonce,  StatutObjet statut,  DateTime creeLe,  List<String> photos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Objet() when $default != null:
return $default(_that.id,_that.proprietaireId,_that.proprietaireNom,_that.titre,_that.description,_that.categorie,_that.etat,_that.gouvernoratId,_that.villeId,_that.langueAnnonce,_that.statut,_that.creeLe,_that.photos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String proprietaireId,  String proprietaireNom,  String titre,  String description,  CategorieObjet categorie,  EtatObjet etat,  String gouvernoratId,  String villeId,  String langueAnnonce,  StatutObjet statut,  DateTime creeLe,  List<String> photos)  $default,) {final _that = this;
switch (_that) {
case _Objet():
return $default(_that.id,_that.proprietaireId,_that.proprietaireNom,_that.titre,_that.description,_that.categorie,_that.etat,_that.gouvernoratId,_that.villeId,_that.langueAnnonce,_that.statut,_that.creeLe,_that.photos);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String proprietaireId,  String proprietaireNom,  String titre,  String description,  CategorieObjet categorie,  EtatObjet etat,  String gouvernoratId,  String villeId,  String langueAnnonce,  StatutObjet statut,  DateTime creeLe,  List<String> photos)?  $default,) {final _that = this;
switch (_that) {
case _Objet() when $default != null:
return $default(_that.id,_that.proprietaireId,_that.proprietaireNom,_that.titre,_that.description,_that.categorie,_that.etat,_that.gouvernoratId,_that.villeId,_that.langueAnnonce,_that.statut,_that.creeLe,_that.photos);case _:
  return null;

}
}

}

/// @nodoc


class _Objet implements Objet {
  const _Objet({required this.id, required this.proprietaireId, required this.proprietaireNom, required this.titre, required this.description, required this.categorie, required this.etat, required this.gouvernoratId, required this.villeId, required this.langueAnnonce, required this.statut, required this.creeLe,  List<String> photos = const <String>[]}): _photos = photos;
  

@override final  String id;
@override final  String proprietaireId;
@override final  String proprietaireNom;
@override final  String titre;
@override final  String description;
@override final  CategorieObjet categorie;
@override final  EtatObjet etat;
@override final  String gouvernoratId;
@override final  String villeId;
@override final  String langueAnnonce;
@override final  StatutObjet statut;
@override final  DateTime creeLe;
 final  List<String> _photos;
@override@JsonKey() List<String> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}


/// Create a copy of Objet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ObjetCopyWith<_Objet> get copyWith => __$ObjetCopyWithImpl<_Objet>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Objet&&(identical(other.id, id) || other.id == id)&&(identical(other.proprietaireId, proprietaireId) || other.proprietaireId == proprietaireId)&&(identical(other.proprietaireNom, proprietaireNom) || other.proprietaireNom == proprietaireNom)&&(identical(other.titre, titre) || other.titre == titre)&&(identical(other.description, description) || other.description == description)&&(identical(other.categorie, categorie) || other.categorie == categorie)&&(identical(other.etat, etat) || other.etat == etat)&&(identical(other.gouvernoratId, gouvernoratId) || other.gouvernoratId == gouvernoratId)&&(identical(other.villeId, villeId) || other.villeId == villeId)&&(identical(other.langueAnnonce, langueAnnonce) || other.langueAnnonce == langueAnnonce)&&(identical(other.statut, statut) || other.statut == statut)&&(identical(other.creeLe, creeLe) || other.creeLe == creeLe)&&const DeepCollectionEquality().equals(other.photos, _photos));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,proprietaireId,proprietaireNom,titre,description,categorie,etat,gouvernoratId,villeId,langueAnnonce,statut,creeLe,const DeepCollectionEquality().hash(_photos));
}

@override
String toString() {
    return 'Objet(id: $id, proprietaireId: $proprietaireId, proprietaireNom: $proprietaireNom, titre: $titre, description: $description, categorie: $categorie, etat: $etat, gouvernoratId: $gouvernoratId, villeId: $villeId, langueAnnonce: $langueAnnonce, statut: $statut, creeLe: $creeLe, photos: $photos)';
}


}

/// @nodoc
abstract mixin class _$ObjetCopyWith<$Res> implements $ObjetCopyWith<$Res> {
  factory _$ObjetCopyWith(_Objet value, $Res Function(_Objet) _then) = __$ObjetCopyWithImpl;
@override @useResult
$Res call({
 String id, String proprietaireId, String proprietaireNom, String titre, String description, CategorieObjet categorie, EtatObjet etat, String gouvernoratId, String villeId, String langueAnnonce, StatutObjet statut, DateTime creeLe, List<String> photos
});




}
/// @nodoc
class __$ObjetCopyWithImpl<$Res>
    implements _$ObjetCopyWith<$Res> {
  __$ObjetCopyWithImpl(this._self, this._then);

  final _Objet _self;
  final $Res Function(_Objet) _then;

/// Create a copy of Objet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? proprietaireId = null,Object? proprietaireNom = null,Object? titre = null,Object? description = null,Object? categorie = null,Object? etat = null,Object? gouvernoratId = null,Object? villeId = null,Object? langueAnnonce = null,Object? statut = null,Object? creeLe = null,Object? photos = null,}) {
  return _then(_Objet(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,proprietaireId: null == proprietaireId ? _self.proprietaireId : proprietaireId // ignore: cast_nullable_to_non_nullable
as String,proprietaireNom: null == proprietaireNom ? _self.proprietaireNom : proprietaireNom // ignore: cast_nullable_to_non_nullable
as String,titre: null == titre ? _self.titre : titre // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categorie: null == categorie ? _self.categorie : categorie // ignore: cast_nullable_to_non_nullable
as CategorieObjet,etat: null == etat ? _self.etat : etat // ignore: cast_nullable_to_non_nullable
as EtatObjet,gouvernoratId: null == gouvernoratId ? _self.gouvernoratId : gouvernoratId // ignore: cast_nullable_to_non_nullable
as String,villeId: null == villeId ? _self.villeId : villeId // ignore: cast_nullable_to_non_nullable
as String,langueAnnonce: null == langueAnnonce ? _self.langueAnnonce : langueAnnonce // ignore: cast_nullable_to_non_nullable
as String,statut: null == statut ? _self.statut : statut // ignore: cast_nullable_to_non_nullable
as StatutObjet,creeLe: null == creeLe ? _self.creeLe : creeLe // ignore: cast_nullable_to_non_nullable
as DateTime,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
mixin _$BrouillonObjet {

 String get titre; String get description; CategorieObjet get categorie; EtatObjet get etat; String get gouvernoratId; String get villeId; String get langueAnnonce; String get cite; String? get rue;
/// Create a copy of BrouillonObjet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BrouillonObjetCopyWith<BrouillonObjet> get copyWith => _$BrouillonObjetCopyWithImpl<BrouillonObjet>(this as BrouillonObjet, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BrouillonObjet;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BrouillonObjet&&(identical(other.titre, _this.titre) || other.titre == _this.titre)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.categorie, _this.categorie) || other.categorie == _this.categorie)&&(identical(other.etat, _this.etat) || other.etat == _this.etat)&&(identical(other.gouvernoratId, _this.gouvernoratId) || other.gouvernoratId == _this.gouvernoratId)&&(identical(other.villeId, _this.villeId) || other.villeId == _this.villeId)&&(identical(other.langueAnnonce, _this.langueAnnonce) || other.langueAnnonce == _this.langueAnnonce)&&(identical(other.cite, _this.cite) || other.cite == _this.cite)&&(identical(other.rue, _this.rue) || other.rue == _this.rue));
}


@override
int get hashCode {
  final _this = this as BrouillonObjet;
  return Object.hash(runtimeType,_this.titre,_this.description,_this.categorie,_this.etat,_this.gouvernoratId,_this.villeId,_this.langueAnnonce,_this.cite,_this.rue);
}

@override
String toString() {
  final _this = this as BrouillonObjet;
  return 'BrouillonObjet(titre: ${_this.titre}, description: ${_this.description}, categorie: ${_this.categorie}, etat: ${_this.etat}, gouvernoratId: ${_this.gouvernoratId}, villeId: ${_this.villeId}, langueAnnonce: ${_this.langueAnnonce}, cite: ${_this.cite}, rue: ${_this.rue})';
}


}

/// @nodoc
abstract mixin class $BrouillonObjetCopyWith<$Res>  {
  factory $BrouillonObjetCopyWith(BrouillonObjet value, $Res Function(BrouillonObjet) _then) = _$BrouillonObjetCopyWithImpl;
@useResult
$Res call({
 String titre, String description, CategorieObjet categorie, EtatObjet etat, String gouvernoratId, String villeId, String langueAnnonce, String cite, String? rue
});




}
/// @nodoc
class _$BrouillonObjetCopyWithImpl<$Res>
    implements $BrouillonObjetCopyWith<$Res> {
  _$BrouillonObjetCopyWithImpl(this._self, this._then);

  final BrouillonObjet _self;
  final $Res Function(BrouillonObjet) _then;

/// Create a copy of BrouillonObjet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? titre = null,Object? description = null,Object? categorie = null,Object? etat = null,Object? gouvernoratId = null,Object? villeId = null,Object? langueAnnonce = null,Object? cite = null,Object? rue = freezed,}) {
  return _then(BrouillonObjet(
titre: null == titre ? _self.titre : titre // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categorie: null == categorie ? _self.categorie : categorie // ignore: cast_nullable_to_non_nullable
as CategorieObjet,etat: null == etat ? _self.etat : etat // ignore: cast_nullable_to_non_nullable
as EtatObjet,gouvernoratId: null == gouvernoratId ? _self.gouvernoratId : gouvernoratId // ignore: cast_nullable_to_non_nullable
as String,villeId: null == villeId ? _self.villeId : villeId // ignore: cast_nullable_to_non_nullable
as String,langueAnnonce: null == langueAnnonce ? _self.langueAnnonce : langueAnnonce // ignore: cast_nullable_to_non_nullable
as String,cite: null == cite ? _self.cite : cite // ignore: cast_nullable_to_non_nullable
as String,rue: freezed == rue ? _self.rue : rue // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BrouillonObjet].
extension BrouillonObjetPatterns on BrouillonObjet {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BrouillonObjet value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BrouillonObjet() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BrouillonObjet value)  $default,){
final _that = this;
switch (_that) {
case _BrouillonObjet():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BrouillonObjet value)?  $default,){
final _that = this;
switch (_that) {
case _BrouillonObjet() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String titre,  String description,  CategorieObjet categorie,  EtatObjet etat,  String gouvernoratId,  String villeId,  String langueAnnonce,  String cite,  String? rue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BrouillonObjet() when $default != null:
return $default(_that.titre,_that.description,_that.categorie,_that.etat,_that.gouvernoratId,_that.villeId,_that.langueAnnonce,_that.cite,_that.rue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String titre,  String description,  CategorieObjet categorie,  EtatObjet etat,  String gouvernoratId,  String villeId,  String langueAnnonce,  String cite,  String? rue)  $default,) {final _that = this;
switch (_that) {
case _BrouillonObjet():
return $default(_that.titre,_that.description,_that.categorie,_that.etat,_that.gouvernoratId,_that.villeId,_that.langueAnnonce,_that.cite,_that.rue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String titre,  String description,  CategorieObjet categorie,  EtatObjet etat,  String gouvernoratId,  String villeId,  String langueAnnonce,  String cite,  String? rue)?  $default,) {final _that = this;
switch (_that) {
case _BrouillonObjet() when $default != null:
return $default(_that.titre,_that.description,_that.categorie,_that.etat,_that.gouvernoratId,_that.villeId,_that.langueAnnonce,_that.cite,_that.rue);case _:
  return null;

}
}

}

/// @nodoc


class _BrouillonObjet implements BrouillonObjet {
  const _BrouillonObjet({required this.titre, required this.description, required this.categorie, required this.etat, required this.gouvernoratId, required this.villeId, required this.langueAnnonce, required this.cite, this.rue});
  

@override final  String titre;
@override final  String description;
@override final  CategorieObjet categorie;
@override final  EtatObjet etat;
@override final  String gouvernoratId;
@override final  String villeId;
@override final  String langueAnnonce;
@override final  String cite;
@override final  String? rue;

/// Create a copy of BrouillonObjet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BrouillonObjetCopyWith<_BrouillonObjet> get copyWith => __$BrouillonObjetCopyWithImpl<_BrouillonObjet>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BrouillonObjet&&(identical(other.titre, titre) || other.titre == titre)&&(identical(other.description, description) || other.description == description)&&(identical(other.categorie, categorie) || other.categorie == categorie)&&(identical(other.etat, etat) || other.etat == etat)&&(identical(other.gouvernoratId, gouvernoratId) || other.gouvernoratId == gouvernoratId)&&(identical(other.villeId, villeId) || other.villeId == villeId)&&(identical(other.langueAnnonce, langueAnnonce) || other.langueAnnonce == langueAnnonce)&&(identical(other.cite, cite) || other.cite == cite)&&(identical(other.rue, rue) || other.rue == rue));
}


@override
int get hashCode {
    return Object.hash(runtimeType,titre,description,categorie,etat,gouvernoratId,villeId,langueAnnonce,cite,rue);
}

@override
String toString() {
    return 'BrouillonObjet(titre: $titre, description: $description, categorie: $categorie, etat: $etat, gouvernoratId: $gouvernoratId, villeId: $villeId, langueAnnonce: $langueAnnonce, cite: $cite, rue: $rue)';
}


}

/// @nodoc
abstract mixin class _$BrouillonObjetCopyWith<$Res> implements $BrouillonObjetCopyWith<$Res> {
  factory _$BrouillonObjetCopyWith(_BrouillonObjet value, $Res Function(_BrouillonObjet) _then) = __$BrouillonObjetCopyWithImpl;
@override @useResult
$Res call({
 String titre, String description, CategorieObjet categorie, EtatObjet etat, String gouvernoratId, String villeId, String langueAnnonce, String cite, String? rue
});




}
/// @nodoc
class __$BrouillonObjetCopyWithImpl<$Res>
    implements _$BrouillonObjetCopyWith<$Res> {
  __$BrouillonObjetCopyWithImpl(this._self, this._then);

  final _BrouillonObjet _self;
  final $Res Function(_BrouillonObjet) _then;

/// Create a copy of BrouillonObjet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? titre = null,Object? description = null,Object? categorie = null,Object? etat = null,Object? gouvernoratId = null,Object? villeId = null,Object? langueAnnonce = null,Object? cite = null,Object? rue = freezed,}) {
  return _then(_BrouillonObjet(
titre: null == titre ? _self.titre : titre // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categorie: null == categorie ? _self.categorie : categorie // ignore: cast_nullable_to_non_nullable
as CategorieObjet,etat: null == etat ? _self.etat : etat // ignore: cast_nullable_to_non_nullable
as EtatObjet,gouvernoratId: null == gouvernoratId ? _self.gouvernoratId : gouvernoratId // ignore: cast_nullable_to_non_nullable
as String,villeId: null == villeId ? _self.villeId : villeId // ignore: cast_nullable_to_non_nullable
as String,langueAnnonce: null == langueAnnonce ? _self.langueAnnonce : langueAnnonce // ignore: cast_nullable_to_non_nullable
as String,cite: null == cite ? _self.cite : cite // ignore: cast_nullable_to_non_nullable
as String,rue: freezed == rue ? _self.rue : rue // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
