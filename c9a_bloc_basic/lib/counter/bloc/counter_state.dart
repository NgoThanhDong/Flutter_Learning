import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int count;
  final bool isLoading;

  const CounterState({
    required this.count,
    required this.isLoading,
  });

  CounterState copyWith({
    int? count,
    bool? isLoading,
  }) {
    return CounterState(
      count: count ?? this.count,
      isLoading: isLoading ?? this.isLoading,
    );
  }
  
  @override
  List<Object> get props => [count, isLoading];
}
