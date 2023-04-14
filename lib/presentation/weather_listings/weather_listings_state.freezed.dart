// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_listings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherListingsState _$WeatherListingsStateFromJson(Map<String, dynamic> json) {
  return _WeatherListingsState.fromJson(json);
}

/// @nodoc
mixin _$WeatherListingsState {
  WeatherListing? get weathers => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherListingsStateCopyWith<WeatherListingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherListingsStateCopyWith<$Res> {
  factory $WeatherListingsStateCopyWith(WeatherListingsState value,
          $Res Function(WeatherListingsState) then) =
      _$WeatherListingsStateCopyWithImpl<$Res, WeatherListingsState>;
  @useResult
  $Res call({WeatherListing? weathers, bool isLoading});

  $WeatherListingCopyWith<$Res>? get weathers;
}

/// @nodoc
class _$WeatherListingsStateCopyWithImpl<$Res,
        $Val extends WeatherListingsState>
    implements $WeatherListingsStateCopyWith<$Res> {
  _$WeatherListingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weathers = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      weathers: freezed == weathers
          ? _value.weathers
          : weathers // ignore: cast_nullable_to_non_nullable
              as WeatherListing?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherListingCopyWith<$Res>? get weathers {
    if (_value.weathers == null) {
      return null;
    }

    return $WeatherListingCopyWith<$Res>(_value.weathers!, (value) {
      return _then(_value.copyWith(weathers: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WeatherListingsStateCopyWith<$Res>
    implements $WeatherListingsStateCopyWith<$Res> {
  factory _$$_WeatherListingsStateCopyWith(_$_WeatherListingsState value,
          $Res Function(_$_WeatherListingsState) then) =
      __$$_WeatherListingsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WeatherListing? weathers, bool isLoading});

  @override
  $WeatherListingCopyWith<$Res>? get weathers;
}

/// @nodoc
class __$$_WeatherListingsStateCopyWithImpl<$Res>
    extends _$WeatherListingsStateCopyWithImpl<$Res, _$_WeatherListingsState>
    implements _$$_WeatherListingsStateCopyWith<$Res> {
  __$$_WeatherListingsStateCopyWithImpl(_$_WeatherListingsState _value,
      $Res Function(_$_WeatherListingsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weathers = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$_WeatherListingsState(
      weathers: freezed == weathers
          ? _value.weathers
          : weathers // ignore: cast_nullable_to_non_nullable
              as WeatherListing?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherListingsState implements _WeatherListingsState {
  const _$_WeatherListingsState({this.weathers, this.isLoading = false});

  factory _$_WeatherListingsState.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherListingsStateFromJson(json);

  @override
  final WeatherListing? weathers;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'WeatherListingsState(weathers: $weathers, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherListingsState &&
            (identical(other.weathers, weathers) ||
                other.weathers == weathers) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, weathers, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherListingsStateCopyWith<_$_WeatherListingsState> get copyWith =>
      __$$_WeatherListingsStateCopyWithImpl<_$_WeatherListingsState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherListingsStateToJson(
      this,
    );
  }
}

abstract class _WeatherListingsState implements WeatherListingsState {
  const factory _WeatherListingsState(
      {final WeatherListing? weathers,
      final bool isLoading}) = _$_WeatherListingsState;

  factory _WeatherListingsState.fromJson(Map<String, dynamic> json) =
      _$_WeatherListingsState.fromJson;

  @override
  WeatherListing? get weathers;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherListingsStateCopyWith<_$_WeatherListingsState> get copyWith =>
      throw _privateConstructorUsedError;
}
