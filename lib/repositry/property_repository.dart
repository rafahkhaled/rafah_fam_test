import 'package:rafah_fam_test/repositry/service/property_service.dart';

import '../presentation/property_list/model/property_model.dart';

class PropertyRepository {
  const PropertyRepository({
    required this.service,
  });
  final PropertyService service;

  Future<List<Property>> getproperty() async => service.fetchProperties();
}
