// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filtres_recherche.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FiltresRecherche {

 String get texte; CategorieObjet? get categorie; String? get gouvernoratId; String? get villeId;
/// Create a copy of FiltresRecherche
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FiltresRechercheCopyWith<FiltresRecherche> get copyWith => _$FiltresRechercheCopyWithImpl<FiltresRecherche>(this as FiltresRecherche, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FiltresRecherche;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FiltresRecherche&&(identical(other.texte, _this.texte) || other.texte == _this.texte)&&(identical(other.categorie, _this.categorie) || other.categorie == _this.categorie)&&(identical(other.gouvernoratId, _this.gouvernoratId) || other.gouvernoratId == _this.gouvernoratId)&&(identical(other.villeId, _this.villeId) || other.villeId == _this.villeId));
}


@override
int get hashCode {
  final _this = this as FiltresRecherche;
  return Object.hash(runtimeType,_this.texte,_this.categorie,_this.gouvernoratId,_this.villeId);
}

@override
String toString() {
  final _this = this as FiltresRecherche;
  return 'FiltresRecherche(texte: ${_this.texte}, categorie: ${_this.categorie}, gouvernoratId: ${_this.gouvernoratId}, villeId: ${_this.villeId})';
}


}

/// @nodoc
abstract mixin class $FiltresRechercheCopyWith<$Res>  {
  factory $FiltresRechercheCopyWith(FiltresRecherche value, $Res Function(FiltresRecherche) _then) = _$FiltresRechercheCopyWithImpl;
@useResult
$Res call({
 String texte, CategorieObjet? categorie, String? gouvernoratId, String? villeId
});




}
/// @nodoc
class _$FiltresRechercheCopyWithImpl<$Res>
    implements $FiltresRechercheCopyWith<$Res> {
  _$FiltresRechercheCopyWithImpl(this._self, this._then);

  final FiltresRecherche _self;
  final $Res Function(FiltresRecherche) _then;

/// Create a copy of FiltresRecherche
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? texte = null,Object? categorie = freezed,Object? gouvernoratId = freezed,Object? villeId = freezed,}) {
  return _then(FiltresRecherche(
texte: null == texte ? _self.texte : texte // ignore: cast_nullable_to_non_nullable
as String,categorie: freezed == categorie ? _self.categorie : categorie // ignore: cast_nullable_to_non_nullable
as CategorieObjet?,gouvernoratId: freezed == gouvernoratId ? _self.gouvernoratId : gouvernoratId // ignore: cast_nullable_to_non_nullable
as String?,villeId: freezed == villeId ? _self.villeId : villeId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FiltresRecherche].
extension FiltresRecherchePatterns on FiltresRecherche {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FiltresRecherche value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FiltresRecherche() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FiltresRecherche value)  $default,){
final _that = this;
switch (_that) {
case _FiltresRecherche():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FiltresRecherche value)?  $default,){
final _that = this;
switch (_that) {
case _FiltresRecherche() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String texte,  CategorieObjet? categorie,  String? gouvernoratId,  String? villeId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FiltresRecherche() when $default != null:
return $default(_that.texte,_that.categorie,_that.gouvernoratId,_that.villeId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String texte,  CategorieObjet? categorie,  String? gouvernoratId,  String? villeId)  $default,) {final _that = this;
switch (_that) {
case _FiltresRecherche():
return $default(_that.texte,_that.categorie,_that.gouvernoratId,_that.villeId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String texte,  CategorieObjet? categorie,  String? gouvernoratId,  String? villeId)?  $default,) {final _that = this;
switch (_that) {
case _FiltresRecherche() when $default != null:
return $default(_that.texte,_that.categorie,_that.gouvernoratId,_that.villeId);case _:
  return null;

}
}

}

/// @nodoc


class _FiltresRecherche implements FiltresRecherche {
  const _FiltresRecherche({this.texte = '', this.categorie, this.gouvernoratId, this.villeId});
  

@override@JsonKey() final  String texte;
@override final  CategorieObjet? categorie;
@override final  String? gouvernoratId;
@override final  String? villeId;

/// Create a copy of FiltresRecherche
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FiltresRechercheCopyWith<_FiltresRecherche> get copyWith => __$FiltresRechercheCopyWithImpl<_FiltresRecherche>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FiltresRecherche&&(identical(other.texte, texte) || other.texte == texte)&&(identical(other.categorie, categorie) || other.categorie == categorie)&&(identical(other.gouvernoratId, gouvernoratId) || other.gouvernoratId == gouvernoratId)&&(identical(other.villeId, villeId) || other.villeId == villeId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,texte,categorie,gouvernoratId,villeId);
}

@override
String toString() {
    return 'FiltresRecherche(texte: $texte, categorie: $categorie, gouvernoratId: $gouvernoratId, villeId: $villeId)';
}


}

/// @nodoc
abstract mixin class _$FiltresRechercheCopyWith<$Res> implements $FiltresRechercheCopyWith<$Res> {
  factory _$FiltresRechercheCopyWith(_FiltresRecherche value, $Res Function(_FiltresRecherche) _then) = __$FiltresRechercheCopyWithImpl;
@override @useResult
$Res call({
 String texte, CategorieObjet? categorie, String? gouvernoratId, String? villeId
});




}
/// @nodoc
class __$FiltresRechercheCopyWithImpl<$Res>
    implements _$FiltresRechercheCopyWith<$Res> {
  __$FiltresRechercheCopyWithImpl(this._self, this._then);

  final _FiltresRecherche _self;
  final $Res Function(_FiltresRecherche) _then;

/// Create a copy of FiltresRecherche
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? texte = null,Object? categorie = freezed,Object? gouvernoratId = freezed,Object? villeId = freezed,}) {
  return _then(_FiltresRecherche(
texte: null == texte ? _self.texte : texte // ignore: cast_nullable_to_non_nullable
as String,categorie: freezed == categorie ? _self.categorie : categorie // ignore: cast_nullable_to_non_nullable
as CategorieObjet?,gouvernoratId: freezed == gouvernoratId ? _self.gouvernoratId : gouvernoratId // ignore: cast_nullable_to_non_nullable
as String?,villeId: freezed == villeId ? _self.villeId : villeId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
