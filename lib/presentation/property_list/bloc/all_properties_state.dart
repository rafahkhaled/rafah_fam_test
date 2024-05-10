part of 'all_properties_bloc.dart';

enum AllPropertyliststatus { initial, success, error, loading }

extension AllPropertyliststatusX on AllPropertyliststatus {
  bool get isInitial => this == AllPropertyliststatus.initial;
  bool get isSuccess => this == AllPropertyliststatus.success;
  bool get isError => this == AllPropertyliststatus.error;
  bool get isLoading => this == AllPropertyliststatus.loading;
}

class AllPropertylistState extends Equatable {
  const AllPropertylistState({
    this.status = AllPropertyliststatus.initial,
    List<Property>? property,
  }) : property = property ?? const [];

  final List<Property> property;
  final AllPropertyliststatus status;

  @override
  List<Object?> get props => [status, property];

  AllPropertylistState copyWith({
    List<Property>? property,
    AllPropertyliststatus? status,
  }) {
    return AllPropertylistState(
      property: property ?? this.property,
      status: status ?? this.status,
    );
  }
}
