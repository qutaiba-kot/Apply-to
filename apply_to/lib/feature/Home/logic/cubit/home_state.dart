import 'package:equatable/equatable.dart';

sealed class HomeState extends Equatable {
  final bool isLoading;

  HomeState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

final class homeloading extends HomeState {
  homeloading({required super.isLoading});
}
