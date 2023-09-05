// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApiResultState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(CancelToken cancelToken) loading,
    required TResult Function(T result) success,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(CancelToken cancelToken)? loading,
    TResult? Function(T result)? success,
    TResult? Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(CancelToken cancelToken)? loading,
    TResult Function(T result)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiResultStateIdle<T> value) idle,
    required TResult Function(ApiResultStateLoading<T> value) loading,
    required TResult Function(ApiResultStateSuccess<T> value) success,
    required TResult Function(ApiResultStateError<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiResultStateIdle<T> value)? idle,
    TResult? Function(ApiResultStateLoading<T> value)? loading,
    TResult? Function(ApiResultStateSuccess<T> value)? success,
    TResult? Function(ApiResultStateError<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiResultStateIdle<T> value)? idle,
    TResult Function(ApiResultStateLoading<T> value)? loading,
    TResult Function(ApiResultStateSuccess<T> value)? success,
    TResult Function(ApiResultStateError<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResultStateCopyWith<T, $Res> {
  factory $ApiResultStateCopyWith(
          ApiResultState<T> value, $Res Function(ApiResultState<T>) then) =
      _$ApiResultStateCopyWithImpl<T, $Res, ApiResultState<T>>;
}

/// @nodoc
class _$ApiResultStateCopyWithImpl<T, $Res, $Val extends ApiResultState<T>>
    implements $ApiResultStateCopyWith<T, $Res> {
  _$ApiResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ApiResultStateIdleCopyWith<T, $Res> {
  factory _$$ApiResultStateIdleCopyWith(_$ApiResultStateIdle<T> value,
          $Res Function(_$ApiResultStateIdle<T>) then) =
      __$$ApiResultStateIdleCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ApiResultStateIdleCopyWithImpl<T, $Res>
    extends _$ApiResultStateCopyWithImpl<T, $Res, _$ApiResultStateIdle<T>>
    implements _$$ApiResultStateIdleCopyWith<T, $Res> {
  __$$ApiResultStateIdleCopyWithImpl(_$ApiResultStateIdle<T> _value,
      $Res Function(_$ApiResultStateIdle<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ApiResultStateIdle<T> extends ApiResultStateIdle<T> {
  const _$ApiResultStateIdle() : super._();

  @override
  String toString() {
    return 'ApiResultState<$T>.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ApiResultStateIdle<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(CancelToken cancelToken) loading,
    required TResult Function(T result) success,
    required TResult Function(String? message) error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(CancelToken cancelToken)? loading,
    TResult? Function(T result)? success,
    TResult? Function(String? message)? error,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(CancelToken cancelToken)? loading,
    TResult Function(T result)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiResultStateIdle<T> value) idle,
    required TResult Function(ApiResultStateLoading<T> value) loading,
    required TResult Function(ApiResultStateSuccess<T> value) success,
    required TResult Function(ApiResultStateError<T> value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiResultStateIdle<T> value)? idle,
    TResult? Function(ApiResultStateLoading<T> value)? loading,
    TResult? Function(ApiResultStateSuccess<T> value)? success,
    TResult? Function(ApiResultStateError<T> value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiResultStateIdle<T> value)? idle,
    TResult Function(ApiResultStateLoading<T> value)? loading,
    TResult Function(ApiResultStateSuccess<T> value)? success,
    TResult Function(ApiResultStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class ApiResultStateIdle<T> extends ApiResultState<T> {
  const factory ApiResultStateIdle() = _$ApiResultStateIdle<T>;
  const ApiResultStateIdle._() : super._();
}

/// @nodoc
abstract class _$$ApiResultStateLoadingCopyWith<T, $Res> {
  factory _$$ApiResultStateLoadingCopyWith(_$ApiResultStateLoading<T> value,
          $Res Function(_$ApiResultStateLoading<T>) then) =
      __$$ApiResultStateLoadingCopyWithImpl<T, $Res>;
  @useResult
  $Res call({CancelToken cancelToken});
}

/// @nodoc
class __$$ApiResultStateLoadingCopyWithImpl<T, $Res>
    extends _$ApiResultStateCopyWithImpl<T, $Res, _$ApiResultStateLoading<T>>
    implements _$$ApiResultStateLoadingCopyWith<T, $Res> {
  __$$ApiResultStateLoadingCopyWithImpl(_$ApiResultStateLoading<T> _value,
      $Res Function(_$ApiResultStateLoading<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cancelToken = null,
  }) {
    return _then(_$ApiResultStateLoading<T>(
      cancelToken: null == cancelToken
          ? _value.cancelToken
          : cancelToken // ignore: cast_nullable_to_non_nullable
              as CancelToken,
    ));
  }
}

/// @nodoc

class _$ApiResultStateLoading<T> extends ApiResultStateLoading<T> {
  const _$ApiResultStateLoading({required this.cancelToken}) : super._();

  @override
  final CancelToken cancelToken;

  @override
  String toString() {
    return 'ApiResultState<$T>.loading(cancelToken: $cancelToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResultStateLoading<T> &&
            (identical(other.cancelToken, cancelToken) ||
                other.cancelToken == cancelToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cancelToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResultStateLoadingCopyWith<T, _$ApiResultStateLoading<T>>
      get copyWith =>
          __$$ApiResultStateLoadingCopyWithImpl<T, _$ApiResultStateLoading<T>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(CancelToken cancelToken) loading,
    required TResult Function(T result) success,
    required TResult Function(String? message) error,
  }) {
    return loading(cancelToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(CancelToken cancelToken)? loading,
    TResult? Function(T result)? success,
    TResult? Function(String? message)? error,
  }) {
    return loading?.call(cancelToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(CancelToken cancelToken)? loading,
    TResult Function(T result)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(cancelToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiResultStateIdle<T> value) idle,
    required TResult Function(ApiResultStateLoading<T> value) loading,
    required TResult Function(ApiResultStateSuccess<T> value) success,
    required TResult Function(ApiResultStateError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiResultStateIdle<T> value)? idle,
    TResult? Function(ApiResultStateLoading<T> value)? loading,
    TResult? Function(ApiResultStateSuccess<T> value)? success,
    TResult? Function(ApiResultStateError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiResultStateIdle<T> value)? idle,
    TResult Function(ApiResultStateLoading<T> value)? loading,
    TResult Function(ApiResultStateSuccess<T> value)? success,
    TResult Function(ApiResultStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ApiResultStateLoading<T> extends ApiResultState<T> {
  const factory ApiResultStateLoading(
      {required final CancelToken cancelToken}) = _$ApiResultStateLoading<T>;
  const ApiResultStateLoading._() : super._();

  CancelToken get cancelToken;
  @JsonKey(ignore: true)
  _$$ApiResultStateLoadingCopyWith<T, _$ApiResultStateLoading<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiResultStateSuccessCopyWith<T, $Res> {
  factory _$$ApiResultStateSuccessCopyWith(_$ApiResultStateSuccess<T> value,
          $Res Function(_$ApiResultStateSuccess<T>) then) =
      __$$ApiResultStateSuccessCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T result});
}

/// @nodoc
class __$$ApiResultStateSuccessCopyWithImpl<T, $Res>
    extends _$ApiResultStateCopyWithImpl<T, $Res, _$ApiResultStateSuccess<T>>
    implements _$$ApiResultStateSuccessCopyWith<T, $Res> {
  __$$ApiResultStateSuccessCopyWithImpl(_$ApiResultStateSuccess<T> _value,
      $Res Function(_$ApiResultStateSuccess<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_$ApiResultStateSuccess<T>(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ApiResultStateSuccess<T> extends ApiResultStateSuccess<T> {
  const _$ApiResultStateSuccess({required this.result}) : super._();

  @override
  final T result;

  @override
  String toString() {
    return 'ApiResultState<$T>.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResultStateSuccess<T> &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResultStateSuccessCopyWith<T, _$ApiResultStateSuccess<T>>
      get copyWith =>
          __$$ApiResultStateSuccessCopyWithImpl<T, _$ApiResultStateSuccess<T>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(CancelToken cancelToken) loading,
    required TResult Function(T result) success,
    required TResult Function(String? message) error,
  }) {
    return success(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(CancelToken cancelToken)? loading,
    TResult? Function(T result)? success,
    TResult? Function(String? message)? error,
  }) {
    return success?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(CancelToken cancelToken)? loading,
    TResult Function(T result)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiResultStateIdle<T> value) idle,
    required TResult Function(ApiResultStateLoading<T> value) loading,
    required TResult Function(ApiResultStateSuccess<T> value) success,
    required TResult Function(ApiResultStateError<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiResultStateIdle<T> value)? idle,
    TResult? Function(ApiResultStateLoading<T> value)? loading,
    TResult? Function(ApiResultStateSuccess<T> value)? success,
    TResult? Function(ApiResultStateError<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiResultStateIdle<T> value)? idle,
    TResult Function(ApiResultStateLoading<T> value)? loading,
    TResult Function(ApiResultStateSuccess<T> value)? success,
    TResult Function(ApiResultStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ApiResultStateSuccess<T> extends ApiResultState<T> {
  const factory ApiResultStateSuccess({required final T result}) =
      _$ApiResultStateSuccess<T>;
  const ApiResultStateSuccess._() : super._();

  T get result;
  @JsonKey(ignore: true)
  _$$ApiResultStateSuccessCopyWith<T, _$ApiResultStateSuccess<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiResultStateErrorCopyWith<T, $Res> {
  factory _$$ApiResultStateErrorCopyWith(_$ApiResultStateError<T> value,
          $Res Function(_$ApiResultStateError<T>) then) =
      __$$ApiResultStateErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ApiResultStateErrorCopyWithImpl<T, $Res>
    extends _$ApiResultStateCopyWithImpl<T, $Res, _$ApiResultStateError<T>>
    implements _$$ApiResultStateErrorCopyWith<T, $Res> {
  __$$ApiResultStateErrorCopyWithImpl(_$ApiResultStateError<T> _value,
      $Res Function(_$ApiResultStateError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ApiResultStateError<T>(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ApiResultStateError<T> extends ApiResultStateError<T> {
  const _$ApiResultStateError({this.message}) : super._();

  @override
  final String? message;

  @override
  String toString() {
    return 'ApiResultState<$T>.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResultStateError<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResultStateErrorCopyWith<T, _$ApiResultStateError<T>> get copyWith =>
      __$$ApiResultStateErrorCopyWithImpl<T, _$ApiResultStateError<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(CancelToken cancelToken) loading,
    required TResult Function(T result) success,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(CancelToken cancelToken)? loading,
    TResult? Function(T result)? success,
    TResult? Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(CancelToken cancelToken)? loading,
    TResult Function(T result)? success,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiResultStateIdle<T> value) idle,
    required TResult Function(ApiResultStateLoading<T> value) loading,
    required TResult Function(ApiResultStateSuccess<T> value) success,
    required TResult Function(ApiResultStateError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiResultStateIdle<T> value)? idle,
    TResult? Function(ApiResultStateLoading<T> value)? loading,
    TResult? Function(ApiResultStateSuccess<T> value)? success,
    TResult? Function(ApiResultStateError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiResultStateIdle<T> value)? idle,
    TResult Function(ApiResultStateLoading<T> value)? loading,
    TResult Function(ApiResultStateSuccess<T> value)? success,
    TResult Function(ApiResultStateError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ApiResultStateError<T> extends ApiResultState<T> {
  const factory ApiResultStateError({final String? message}) =
      _$ApiResultStateError<T>;
  const ApiResultStateError._() : super._();

  String? get message;
  @JsonKey(ignore: true)
  _$$ApiResultStateErrorCopyWith<T, _$ApiResultStateError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
