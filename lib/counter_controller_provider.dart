import 'package:counter_freezed_state/counter_controller.dart';
import 'package:counter_freezed_state/counter_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//このProviderがあるおかげで、countが変更したときの状態を監視できる
final counterStateControllerProvider =
    StateNotifierProvider<CounterStateController, CounterState>(
        (ref) => CounterStateController());
