// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_otp_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VerifyOtpEvent {
  String get phone => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) verifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? verifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? verifyOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VerifyOtp value) verifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VerifyOtp value)? verifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VerifyOtp value)? verifyOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerifyOtpEventCopyWith<VerifyOtpEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpEventCopyWith<$Res> {
  factory $VerifyOtpEventCopyWith(
          VerifyOtpEvent value, $Res Function(VerifyOtpEvent) then) =
      _$VerifyOtpEventCopyWithImpl<$Res, VerifyOtpEvent>;
  @useResult
  $Res call({String phone});
}

/// @nodoc
class _$VerifyOtpEventCopyWithImpl<$Res, $Val extends VerifyOtpEvent>
    implements $VerifyOtpEventCopyWith<$Res> {
  _$VerifyOtpEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyOtpImplCopyWith<$Res>
    implements $VerifyOtpEventCopyWith<$Res> {
  factory _$$VerifyOtpImplCopyWith(
          _$VerifyOtpImpl value, $Res Function(_$VerifyOtpImpl) then) =
      __$$VerifyOtpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phone});
}

/// @nodoc
class __$$VerifyOtpImplCopyWithImpl<$Res>
    extends _$VerifyOtpEventCopyWithImpl<$Res, _$VerifyOtpImpl>
    implements _$$VerifyOtpImplCopyWith<$Res> {
  __$$VerifyOtpImplCopyWithImpl(
      _$VerifyOtpImpl _value, $Res Function(_$VerifyOtpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
  }) {
    return _then(_$VerifyOtpImpl(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VerifyOtpImpl implements VerifyOtp {
  const _$VerifyOtpImpl({required this.phone});

  @override
  final String phone;

  @override
  String toString() {
    return 'VerifyOtpEvent.verifyOtp(phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpImpl &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpImplCopyWith<_$VerifyOtpImpl> get copyWith =>
      __$$VerifyOtpImplCopyWithImpl<_$VerifyOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) verifyOtp,
  }) {
    return verifyOtp(phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? verifyOtp,
  }) {
    return verifyOtp?.call(phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? verifyOtp,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VerifyOtp value) verifyOtp,
  }) {
    return verifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VerifyOtp value)? verifyOtp,
  }) {
    return verifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VerifyOtp value)? verifyOtp,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(this);
    }
    return orElse();
  }
}

abstract class VerifyOtp implements VerifyOtpEvent {
  const factory VerifyOtp({required final String phone}) = _$VerifyOtpImpl;

  @override
  String get phone;
  @override
  @JsonKey(ignore: true)
  _$$VerifyOtpImplCopyWith<_$VerifyOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VerifyOtpState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerifyOtpStateCopyWith<VerifyOtpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpStateCopyWith<$Res> {
  factory $VerifyOtpStateCopyWith(
          VerifyOtpState value, $Res Function(VerifyOtpState) then) =
      _$VerifyOtpStateCopyWithImpl<$Res, VerifyOtpState>;
  @useResult
  $Res call({bool isLoading, String? error, bool isVerified});
}

/// @nodoc
class _$VerifyOtpStateCopyWithImpl<$Res, $Val extends VerifyOtpState>
    implements $VerifyOtpStateCopyWith<$Res> {
  _$VerifyOtpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? isVerified = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $VerifyOtpStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? error, bool isVerified});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$VerifyOtpStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? error = freezed,
    Object? isVerified = null,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required this.isLoading, this.error, required this.isVerified});

  @override
  final bool isLoading;
  @override
  final String? error;
  @override
  final bool isVerified;

  @override
  String toString() {
    return 'VerifyOtpState(isLoading: $isLoading, error: $error, isVerified: $isVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, error, isVerified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements VerifyOtpState {
  const factory _Initial(
      {required final bool isLoading,
      final String? error,
      required final bool isVerified}) = _$InitialImpl;

  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  bool get isVerified;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
