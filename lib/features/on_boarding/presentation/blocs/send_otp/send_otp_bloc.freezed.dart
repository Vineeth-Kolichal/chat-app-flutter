// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_otp_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SendOtpEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sendOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sendOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sendOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendOtp value) sendOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendOtp value)? sendOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendOtp value)? sendOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendOtpEventCopyWith<$Res> {
  factory $SendOtpEventCopyWith(
          SendOtpEvent value, $Res Function(SendOtpEvent) then) =
      _$SendOtpEventCopyWithImpl<$Res, SendOtpEvent>;
}

/// @nodoc
class _$SendOtpEventCopyWithImpl<$Res, $Val extends SendOtpEvent>
    implements $SendOtpEventCopyWith<$Res> {
  _$SendOtpEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SendOtpImplCopyWith<$Res> {
  factory _$$SendOtpImplCopyWith(
          _$SendOtpImpl value, $Res Function(_$SendOtpImpl) then) =
      __$$SendOtpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendOtpImplCopyWithImpl<$Res>
    extends _$SendOtpEventCopyWithImpl<$Res, _$SendOtpImpl>
    implements _$$SendOtpImplCopyWith<$Res> {
  __$$SendOtpImplCopyWithImpl(
      _$SendOtpImpl _value, $Res Function(_$SendOtpImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SendOtpImpl implements SendOtp {
  const _$SendOtpImpl();

  @override
  String toString() {
    return 'SendOtpEvent.sendOtp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SendOtpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() sendOtp,
  }) {
    return sendOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? sendOtp,
  }) {
    return sendOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? sendOtp,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SendOtp value) sendOtp,
  }) {
    return sendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SendOtp value)? sendOtp,
  }) {
    return sendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SendOtp value)? sendOtp,
    required TResult orElse(),
  }) {
    if (sendOtp != null) {
      return sendOtp(this);
    }
    return orElse();
  }
}

abstract class SendOtp implements SendOtpEvent {
  const factory SendOtp() = _$SendOtpImpl;
}

/// @nodoc
mixin _$SendOtpState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isOtpSend => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SendOtpStateCopyWith<SendOtpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendOtpStateCopyWith<$Res> {
  factory $SendOtpStateCopyWith(
          SendOtpState value, $Res Function(SendOtpState) then) =
      _$SendOtpStateCopyWithImpl<$Res, SendOtpState>;
  @useResult
  $Res call({bool isLoading, bool isOtpSend, String? error});
}

/// @nodoc
class _$SendOtpStateCopyWithImpl<$Res, $Val extends SendOtpState>
    implements $SendOtpStateCopyWith<$Res> {
  _$SendOtpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isOtpSend = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isOtpSend: null == isOtpSend
          ? _value.isOtpSend
          : isOtpSend // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $SendOtpStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isOtpSend, String? error});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SendOtpStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isOtpSend = null,
    Object? error = freezed,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isOtpSend: null == isOtpSend
          ? _value.isOtpSend
          : isOtpSend // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isLoading, required this.isOtpSend, this.error});

  @override
  final bool isLoading;
  @override
  final bool isOtpSend;
  @override
  final String? error;

  @override
  String toString() {
    return 'SendOtpState(isLoading: $isLoading, isOtpSend: $isOtpSend, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isOtpSend, isOtpSend) ||
                other.isOtpSend == isOtpSend) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isOtpSend, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements SendOtpState {
  const factory _Initial(
      {required final bool isLoading,
      required final bool isOtpSend,
      final String? error}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  bool get isOtpSend;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
