import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_state.freezed.dart';
part 'counter_state.g.dart';

///最初はエラーがでるので、以下コマンドをターミナルで実行する
///flutter pub run build_runner build --delete-conflicting-outputs
/// ※注意点は以下二つのおまじないを書いておくこと。build_runnerが上手く生成されない。
/// part 'counter_state.freezed.dart';
/// part 'counter_state.g.dart';
///
/// ここではint型のcountとcount10、という変数を宣言している。
@freezed
abstract class CounterState with _$CounterState {
  const factory CounterState({
    @Default(0) int count,
    @Default(0) int count10,
  }) = _CounterState;
  factory CounterState.fromJson(Map<String, dynamic> json) =>
      _$CounterStateFromJson(json);
}
