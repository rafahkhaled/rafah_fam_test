import 'package:flutter/material.dart';
import 'package:rafah_fam_test/presentation/property_list/bloc/all_properties_bloc.dart';
import 'package:rafah_fam_test/repositry/service/property_service.dart';
import '../../core/app_export.dart';
import '../../repositry/property_repository.dart';
import 'bloc/home_bloc/home_bloc.dart';
import 'home_layout.dart';
import 'models/home_model.dart';

// ignore_for_file: must_be_immutable

class HomePage extends StatelessWidget {
  const HomePage({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return RepositoryProvider(
      create: (context) => PropertyRepository(service: PropertyService()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(
              HomeState(
                homeModelObj: HomeModel(),
              ),
              scrollController,
            )..add(
                HomeInitialEvent(),
              ),
          ),
          BlocProvider<AllPropertybloc>(
            create: (context) => AllPropertybloc(
              propertyRepository: context.read<PropertyRepository>(),
            )..add(Getproperty()),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return HomeLayout();
  }
}
