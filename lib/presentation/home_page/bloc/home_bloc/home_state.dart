part of 'home_bloc.dart';

/// Represents the state of Home in the application.

// ignore_for_file: must_be_immutable
class HomeState extends Equatable {
  HomeState({this.homeModelObj});

  HomeModel? homeModelObj;

  @override
  List<Object?> get props => [homeModelObj];
  HomeState copyWith({HomeModel? homeModelObj}) {
    return HomeState(
      homeModelObj: homeModelObj ?? this.homeModelObj,
    );
  }
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<Property> properties;

  HomeLoadedState({required this.properties});

  @override
  List<Object?> get props => [properties];
}

class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
