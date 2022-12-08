// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(Client client) innerClientUpdate,
    required TResult Function(Object err) innerClientError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(Client client)? innerClientUpdate,
    TResult? Function(Object err)? innerClientError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(Client client)? innerClientUpdate,
    TResult Function(Object err)? innerClientError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Start value) start,
    required TResult Function(InnerClientUpdate value) innerClientUpdate,
    required TResult Function(InnerClientError value) innerClientError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Start value)? start,
    TResult? Function(InnerClientUpdate value)? innerClientUpdate,
    TResult? Function(InnerClientError value)? innerClientError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Start value)? start,
    TResult Function(InnerClientUpdate value)? innerClientUpdate,
    TResult Function(InnerClientError value)? innerClientError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartCopyWith<$Res> {
  factory _$$StartCopyWith(_$Start value, $Res Function(_$Start) then) =
      __$$StartCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res, _$Start>
    implements _$$StartCopyWith<$Res> {
  __$$StartCopyWithImpl(_$Start _value, $Res Function(_$Start) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Start implements Start {
  const _$Start();

  @override
  String toString() {
    return 'AuthEvent.start()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Start);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(Client client) innerClientUpdate,
    required TResult Function(Object err) innerClientError,
  }) {
    return start();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(Client client)? innerClientUpdate,
    TResult? Function(Object err)? innerClientError,
  }) {
    return start?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(Client client)? innerClientUpdate,
    TResult Function(Object err)? innerClientError,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Start value) start,
    required TResult Function(InnerClientUpdate value) innerClientUpdate,
    required TResult Function(InnerClientError value) innerClientError,
  }) {
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Start value)? start,
    TResult? Function(InnerClientUpdate value)? innerClientUpdate,
    TResult? Function(InnerClientError value)? innerClientError,
  }) {
    return start?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Start value)? start,
    TResult Function(InnerClientUpdate value)? innerClientUpdate,
    TResult Function(InnerClientError value)? innerClientError,
    required TResult orElse(),
  }) {
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class Start implements AuthEvent {
  const factory Start() = _$Start;
}

/// @nodoc
abstract class _$$InnerClientUpdateCopyWith<$Res> {
  factory _$$InnerClientUpdateCopyWith(
          _$InnerClientUpdate value, $Res Function(_$InnerClientUpdate) then) =
      __$$InnerClientUpdateCopyWithImpl<$Res>;
  @useResult
  $Res call({Client client});
}

/// @nodoc
class __$$InnerClientUpdateCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$InnerClientUpdate>
    implements _$$InnerClientUpdateCopyWith<$Res> {
  __$$InnerClientUpdateCopyWithImpl(
      _$InnerClientUpdate _value, $Res Function(_$InnerClientUpdate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? client = null,
  }) {
    return _then(_$InnerClientUpdate(
      null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as Client,
    ));
  }
}

/// @nodoc

class _$InnerClientUpdate implements InnerClientUpdate {
  const _$InnerClientUpdate(this.client);

  @override
  final Client client;

  @override
  String toString() {
    return 'AuthEvent.innerClientUpdate(client: $client)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InnerClientUpdate &&
            (identical(other.client, client) || other.client == client));
  }

  @override
  int get hashCode => Object.hash(runtimeType, client);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InnerClientUpdateCopyWith<_$InnerClientUpdate> get copyWith =>
      __$$InnerClientUpdateCopyWithImpl<_$InnerClientUpdate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(Client client) innerClientUpdate,
    required TResult Function(Object err) innerClientError,
  }) {
    return innerClientUpdate(client);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(Client client)? innerClientUpdate,
    TResult? Function(Object err)? innerClientError,
  }) {
    return innerClientUpdate?.call(client);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(Client client)? innerClientUpdate,
    TResult Function(Object err)? innerClientError,
    required TResult orElse(),
  }) {
    if (innerClientUpdate != null) {
      return innerClientUpdate(client);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Start value) start,
    required TResult Function(InnerClientUpdate value) innerClientUpdate,
    required TResult Function(InnerClientError value) innerClientError,
  }) {
    return innerClientUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Start value)? start,
    TResult? Function(InnerClientUpdate value)? innerClientUpdate,
    TResult? Function(InnerClientError value)? innerClientError,
  }) {
    return innerClientUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Start value)? start,
    TResult Function(InnerClientUpdate value)? innerClientUpdate,
    TResult Function(InnerClientError value)? innerClientError,
    required TResult orElse(),
  }) {
    if (innerClientUpdate != null) {
      return innerClientUpdate(this);
    }
    return orElse();
  }
}

abstract class InnerClientUpdate implements AuthEvent {
  const factory InnerClientUpdate(final Client client) = _$InnerClientUpdate;

  Client get client;
  @JsonKey(ignore: true)
  _$$InnerClientUpdateCopyWith<_$InnerClientUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InnerClientErrorCopyWith<$Res> {
  factory _$$InnerClientErrorCopyWith(
          _$InnerClientError value, $Res Function(_$InnerClientError) then) =
      __$$InnerClientErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Object err});
}

/// @nodoc
class __$$InnerClientErrorCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$InnerClientError>
    implements _$$InnerClientErrorCopyWith<$Res> {
  __$$InnerClientErrorCopyWithImpl(
      _$InnerClientError _value, $Res Function(_$InnerClientError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? err = null,
  }) {
    return _then(_$InnerClientError(
      null == err ? _value.err : err,
    ));
  }
}

/// @nodoc

class _$InnerClientError implements InnerClientError {
  const _$InnerClientError(this.err);

  @override
  final Object err;

  @override
  String toString() {
    return 'AuthEvent.innerClientError(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InnerClientError &&
            const DeepCollectionEquality().equals(other.err, err));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(err));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InnerClientErrorCopyWith<_$InnerClientError> get copyWith =>
      __$$InnerClientErrorCopyWithImpl<_$InnerClientError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() start,
    required TResult Function(Client client) innerClientUpdate,
    required TResult Function(Object err) innerClientError,
  }) {
    return innerClientError(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? start,
    TResult? Function(Client client)? innerClientUpdate,
    TResult? Function(Object err)? innerClientError,
  }) {
    return innerClientError?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? start,
    TResult Function(Client client)? innerClientUpdate,
    TResult Function(Object err)? innerClientError,
    required TResult orElse(),
  }) {
    if (innerClientError != null) {
      return innerClientError(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Start value) start,
    required TResult Function(InnerClientUpdate value) innerClientUpdate,
    required TResult Function(InnerClientError value) innerClientError,
  }) {
    return innerClientError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Start value)? start,
    TResult? Function(InnerClientUpdate value)? innerClientUpdate,
    TResult? Function(InnerClientError value)? innerClientError,
  }) {
    return innerClientError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Start value)? start,
    TResult Function(InnerClientUpdate value)? innerClientUpdate,
    TResult Function(InnerClientError value)? innerClientError,
    required TResult orElse(),
  }) {
    if (innerClientError != null) {
      return innerClientError(this);
    }
    return orElse();
  }
}

abstract class InnerClientError implements AuthEvent {
  const factory InnerClientError(final Object err) = _$InnerClientError;

  Object get err;
  @JsonKey(ignore: true)
  _$$InnerClientErrorCopyWith<_$InnerClientError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() errorConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? errorConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? errorConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(ErrorConnection value) errorConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(ErrorConnection value)? errorConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(ErrorConnection value)? errorConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() errorConnection,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? errorConnection,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? errorConnection,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(ErrorConnection value) errorConnection,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(ErrorConnection value)? errorConnection,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(ErrorConnection value)? errorConnection,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements AuthState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$Loading>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() errorConnection,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? errorConnection,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? errorConnection,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(ErrorConnection value) errorConnection,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(ErrorConnection value)? errorConnection,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(ErrorConnection value)? errorConnection,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements AuthState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class _$$SuccessCopyWith<$Res> {
  factory _$$SuccessCopyWith(_$Success value, $Res Function(_$Success) then) =
      __$$SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$Success>
    implements _$$SuccessCopyWith<$Res> {
  __$$SuccessCopyWithImpl(_$Success _value, $Res Function(_$Success) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Success implements Success {
  const _$Success();

  @override
  String toString() {
    return 'AuthState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Success);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() errorConnection,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? errorConnection,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? errorConnection,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(ErrorConnection value) errorConnection,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(ErrorConnection value)? errorConnection,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(ErrorConnection value)? errorConnection,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements AuthState {
  const factory Success() = _$Success;
}

/// @nodoc
abstract class _$$ErrorConnectionCopyWith<$Res> {
  factory _$$ErrorConnectionCopyWith(
          _$ErrorConnection value, $Res Function(_$ErrorConnection) then) =
      __$$ErrorConnectionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorConnectionCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$ErrorConnection>
    implements _$$ErrorConnectionCopyWith<$Res> {
  __$$ErrorConnectionCopyWithImpl(
      _$ErrorConnection _value, $Res Function(_$ErrorConnection) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorConnection implements ErrorConnection {
  const _$ErrorConnection();

  @override
  String toString() {
    return 'AuthState.errorConnection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorConnection);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() errorConnection,
  }) {
    return errorConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? errorConnection,
  }) {
    return errorConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? errorConnection,
    required TResult orElse(),
  }) {
    if (errorConnection != null) {
      return errorConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
    required TResult Function(ErrorConnection value) errorConnection,
  }) {
    return errorConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Success value)? success,
    TResult? Function(ErrorConnection value)? errorConnection,
  }) {
    return errorConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    TResult Function(ErrorConnection value)? errorConnection,
    required TResult orElse(),
  }) {
    if (errorConnection != null) {
      return errorConnection(this);
    }
    return orElse();
  }
}

abstract class ErrorConnection implements AuthState {
  const factory ErrorConnection() = _$ErrorConnection;
}
