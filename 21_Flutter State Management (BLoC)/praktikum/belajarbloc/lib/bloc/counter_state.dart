import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int value;

  const CounterState(this.value);

  @override
  List<Object?> get props => [value];
}
