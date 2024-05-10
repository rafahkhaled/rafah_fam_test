import 'package:flutter/material.dart';

import '../presentation/home_page/home_page.dart';
import '../presentation/view_on_map_screen/view_on_map_screen.dart';

class AppRoutes {
  static const String homePage = '/home_page';

  static const String viewOnMapScreen = '/view_on_map_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        viewOnMapScreen: ViewOnMapScreen.builder,
        initialRoute: HomePage.builder
      };
}
