// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverException,
    required TResult Function(String message, Map<String, dynamic> errors)
        unProcessableEntity,
    required TResult Function(String? message) unAuthorized,
    required TResult Function() network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverException,
    TResult? Function(String message, Map<String, dynamic> errors)?
        unProcessableEntity,
    TResult? Function(String? message)? unAuthorized,
    TResult? Function()? network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverException,
    TResult Function(String message, Map<String, dynamic> errors)?
        unProcessableEntity,
    TResult Function(String? message)? unAuthorized,
    TResult Function()? network,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerException value) serverException,
    required TResult Function(_UnprocessableEntity value) unProcessableEntity,
    required TResult Function(_UnAuthorized value) unAuthorized,
    required TResult Function(_Network value) network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerException value)? serverException,
    TResult? Function(_UnprocessableEntity value)? unProcessableEntity,
    TResult? Function(_UnAuthorized value)? unAuthorized,
    TResult? Function(_Network value)? network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerException value)? serverException,
    TResult Function(_UnprocessableEntity value)? unProcessableEntity,
    TResult Function(_UnAuthorized value)? unAuthorized,
    TResult Function(_Network value)? network,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiExceptionCopyWith<$Res> {
  factory $ApiExceptionCopyWith(
          ApiException value, $Res Function(ApiException) then) =
      _$ApiExceptionCopyWithImpl<$Res, ApiException>;
}

/// @nodoc
class _$ApiExceptionCopyWithImpl<$Res, $Val extends ApiException>
    implements $ApiExceptionCopyWith<$Res> {
  _$ApiExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ServerExceptionImplCopyWith<$Res> {
  factory _$$ServerExceptionImplCopyWith(_$ServerExceptionImpl value,
          $Res Function(_$ServerExceptionImpl) then) =
      __$$ServerExceptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ServerExceptionImplCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res, _$ServerExceptionImpl>
    implements _$$ServerExceptionImplCopyWith<$Res> {
  __$$ServerExceptionImplCopyWithImpl(
      _$ServerExceptionImpl _value, $Res Function(_$ServerExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ServerExceptionImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServerExceptionImpl implements _ServerException {
  const _$ServerExceptionImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ApiException.serverException(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerExceptionImplCopyWith<_$ServerExceptionImpl> get copyWith =>
      __$$ServerExceptionImplCopyWithImpl<_$ServerExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverException,
    required TResult Function(String message, Map<String, dynamic> errors)
        unProcessableEntity,
    required TResult Function(String? message) unAuthorized,
    required TResult Function() network,
  }) {
    return serverException(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverException,
    TResult? Function(String message, Map<String, dynamic> errors)?
        unProcessableEntity,
    TResult? Function(String? message)? unAuthorized,
    TResult? Function()? network,
  }) {
    return serverException?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverException,
    TResult Function(String message, Map<String, dynamic> errors)?
        unProcessableEntity,
    TResult Function(String? message)? unAuthorized,
    TResult Function()? network,
    required TResult orElse(),
  }) {
    if (serverException != null) {
      return serverException(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerException value) serverException,
    required TResult Function(_UnprocessableEntity value) unProcessableEntity,
    required TResult Function(_UnAuthorized value) unAuthorized,
    required TResult Function(_Network value) network,
  }) {
    return serverException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerException value)? serverException,
    TResult? Function(_UnprocessableEntity value)? unProcessableEntity,
    TResult? Function(_UnAuthorized value)? unAuthorized,
    TResult? Function(_Network value)? network,
  }) {
    return serverException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerException value)? serverException,
    TResult Function(_UnprocessableEntity value)? unProcessableEntity,
    TResult Function(_UnAuthorized value)? unAuthorized,
    TResult Function(_Network value)? network,
    required TResult orElse(),
  }) {
    if (serverException != null) {
      return serverException(this);
    }
    return orElse();
  }
}

abstract class _ServerException implements ApiException {
  const factory _ServerException({required final String message}) =
      _$ServerExceptionImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ServerExceptionImplCopyWith<_$ServerExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnprocessableEntityImplCopyWith<$Res> {
  factory _$$UnprocessableEntityImplCopyWith(_$UnprocessableEntityImpl value,
          $Res Function(_$UnprocessableEntityImpl) then) =
      __$$UnprocessableEntityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, Map<String, dynamic> errors});
}

/// @nodoc
class __$$UnprocessableEntityImplCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res, _$UnprocessableEntityImpl>
    implements _$$UnprocessableEntityImplCopyWith<$Res> {
  __$$UnprocessableEntityImplCopyWithImpl(_$UnprocessableEntityImpl _value,
      $Res Function(_$UnprocessableEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? errors = null,
  }) {
    return _then(_$UnprocessableEntityImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$UnprocessableEntityImpl implements _UnprocessableEntity {
  const _$UnprocessableEntityImpl(
      {required this.message, required final Map<String, dynamic> errors})
      : _errors = errors;

  @override
  final String message;
  final Map<String, dynamic> _errors;
  @override
  Map<String, dynamic> get errors {
    if (_errors is EqualUnmodifiableMapView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_errors);
  }

  @override
  String toString() {
    return 'ApiException.unProcessableEntity(message: $message, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnprocessableEntityImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnprocessableEntityImplCopyWith<_$UnprocessableEntityImpl> get copyWith =>
      __$$UnprocessableEntityImplCopyWithImpl<_$UnprocessableEntityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverException,
    required TResult Function(String message, Map<String, dynamic> errors)
        unProcessableEntity,
    required TResult Function(String? message) unAuthorized,
    required TResult Function() network,
  }) {
    return unProcessableEntity(message, errors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverException,
    TResult? Function(String message, Map<String, dynamic> errors)?
        unProcessableEntity,
    TResult? Function(String? message)? unAuthorized,
    TResult? Function()? network,
  }) {
    return unProcessableEntity?.call(message, errors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverException,
    TResult Function(String message, Map<String, dynamic> errors)?
        unProcessableEntity,
    TResult Function(String? message)? unAuthorized,
    TResult Function()? network,
    required TResult orElse(),
  }) {
    if (unProcessableEntity != null) {
      return unProcessableEntity(message, errors);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerException value) serverException,
    required TResult Function(_UnprocessableEntity value) unProcessableEntity,
    required TResult Function(_UnAuthorized value) unAuthorized,
    required TResult Function(_Network value) network,
  }) {
    return unProcessableEntity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerException value)? serverException,
    TResult? Function(_UnprocessableEntity value)? unProcessableEntity,
    TResult? Function(_UnAuthorized value)? unAuthorized,
    TResult? Function(_Network value)? network,
  }) {
    return unProcessableEntity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerException value)? serverException,
    TResult Function(_UnprocessableEntity value)? unProcessableEntity,
    TResult Function(_UnAuthorized value)? unAuthorized,
    TResult Function(_Network value)? network,
    required TResult orElse(),
  }) {
    if (unProcessableEntity != null) {
      return unProcessableEntity(this);
    }
    return orElse();
  }
}

abstract class _UnprocessableEntity implements ApiException {
  const factory _UnprocessableEntity(
      {required final String message,
      required final Map<String, dynamic> errors}) = _$UnprocessableEntityImpl;

  String get message;
  Map<String, dynamic> get errors;
  @JsonKey(ignore: true)
  _$$UnprocessableEntityImplCopyWith<_$UnprocessableEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnAuthorizedImplCopyWith<$Res> {
  factory _$$UnAuthorizedImplCopyWith(
          _$UnAuthorizedImpl value, $Res Function(_$UnAuthorizedImpl) then) =
      __$$UnAuthorizedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$UnAuthorizedImplCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res, _$UnAuthorizedImpl>
    implements _$$UnAuthorizedImplCopyWith<$Res> {
  __$$UnAuthorizedImplCopyWithImpl(
      _$UnAuthorizedImpl _value, $Res Function(_$UnAuthorizedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$UnAuthorizedImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnAuthorizedImpl implements _UnAuthorized {
  const _$UnAuthorizedImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'ApiException.unAuthorized(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnAuthorizedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnAuthorizedImplCopyWith<_$UnAuthorizedImpl> get copyWith =>
      __$$UnAuthorizedImplCopyWithImpl<_$UnAuthorizedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverException,
    required TResult Function(String message, Map<String, dynamic> errors)
        unProcessableEntity,
    required TResult Function(String? message) unAuthorized,
    required TResult Function() network,
  }) {
    return unAuthorized(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverException,
    TResult? Function(String message, Map<String, dynamic> errors)?
        unProcessableEntity,
    TResult? Function(String? message)? unAuthorized,
    TResult? Function()? network,
  }) {
    return unAuthorized?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverException,
    TResult Function(String message, Map<String, dynamic> errors)?
        unProcessableEntity,
    TResult Function(String? message)? unAuthorized,
    TResult Function()? network,
    required TResult orElse(),
  }) {
    if (unAuthorized != null) {
      return unAuthorized(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerException value) serverException,
    required TResult Function(_UnprocessableEntity value) unProcessableEntity,
    required TResult Function(_UnAuthorized value) unAuthorized,
    required TResult Function(_Network value) network,
  }) {
    return unAuthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerException value)? serverException,
    TResult? Function(_UnprocessableEntity value)? unProcessableEntity,
    TResult? Function(_UnAuthorized value)? unAuthorized,
    TResult? Function(_Network value)? network,
  }) {
    return unAuthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerException value)? serverException,
    TResult Function(_UnprocessableEntity value)? unProcessableEntity,
    TResult Function(_UnAuthorized value)? unAuthorized,
    TResult Function(_Network value)? network,
    required TResult orElse(),
  }) {
    if (unAuthorized != null) {
      return unAuthorized(this);
    }
    return orElse();
  }
}

abstract class _UnAuthorized implements ApiException {
  const factory _UnAuthorized({final String? message}) = _$UnAuthorizedImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$UnAuthorizedImplCopyWith<_$UnAuthorizedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkImplCopyWith<$Res> {
  factory _$$NetworkImplCopyWith(
          _$NetworkImpl value, $Res Function(_$NetworkImpl) then) =
      __$$NetworkImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NetworkImplCopyWithImpl<$Res>
    extends _$ApiExceptionCopyWithImpl<$Res, _$NetworkImpl>
    implements _$$NetworkImplCopyWith<$Res> {
  __$$NetworkImplCopyWithImpl(
      _$NetworkImpl _value, $Res Function(_$NetworkImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NetworkImpl implements _Network {
  const _$NetworkImpl();

  @override
  String toString() {
    return 'ApiException.network()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NetworkImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverException,
    required TResult Function(String message, Map<String, dynamic> errors)
        unProcessableEntity,
    required TResult Function(String? message) unAuthorized,
    required TResult Function() network,
  }) {
    return network();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverException,
    TResult? Function(String message, Map<String, dynamic> errors)?
        unProcessableEntity,
    TResult? Function(String? message)? unAuthorized,
    TResult? Function()? network,
  }) {
    return network?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverException,
    TResult Function(String message, Map<String, dynamic> errors)?
        unProcessableEntity,
    TResult Function(String? message)? unAuthorized,
    TResult Function()? network,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ServerException value) serverException,
    required TResult Function(_UnprocessableEntity value) unProcessableEntity,
    required TResult Function(_UnAuthorized value) unAuthorized,
    required TResult Function(_Network value) network,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ServerException value)? serverException,
    TResult? Function(_UnprocessableEntity value)? unProcessableEntity,
    TResult? Function(_UnAuthorized value)? unAuthorized,
    TResult? Function(_Network value)? network,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ServerException value)? serverException,
    TResult Function(_UnprocessableEntity value)? unProcessableEntity,
    TResult Function(_UnAuthorized value)? unAuthorized,
    TResult Function(_Network value)? network,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class _Network implements ApiException {
  const factory _Network() = _$NetworkImpl;
}
