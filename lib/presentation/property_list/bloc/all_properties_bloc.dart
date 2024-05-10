import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafah_fam_test/presentation/property_list/model/property_model.dart';
import 'package:rafah_fam_test/repositry/property_repository.dart';

part 'all_properties_event.dart';
part 'all_properties_state.dart';

class AllPropertybloc extends Bloc<AllPropertyEvent, AllPropertylistState> {
  AllPropertybloc({
    required this.propertyRepository,
  }) : super(const AllPropertylistState()) {
    on<Getproperty>(_mapGetGamesEventToState);
  }

  final PropertyRepository propertyRepository;

  void _mapGetGamesEventToState(
      Getproperty event, Emitter<AllPropertylistState> emit) async {
    try {
      emit(state.copyWith(status: AllPropertyliststatus.loading));
      final properties = await propertyRepository.getproperty();
      emit(
        state.copyWith(
          status: AllPropertyliststatus.success,
          property: properties,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: AllPropertyliststatus.error));
    }
  }
}
