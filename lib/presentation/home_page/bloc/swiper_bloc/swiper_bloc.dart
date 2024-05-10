import 'package:carousel_slider/carousel_slider.dart';
import 'package:rafah_fam_test/core/app_export.dart';

enum SwiperEvent { updateindex, pageChanged }

class SwiperBloc extends Bloc<SwiperEvent, int> {
  CarouselController carouselController = CarouselController();
  SwiperBloc() : super(0) {
    on<SwiperEvent>((event, emit) {
      switch (event) {
        case SwiperEvent.updateindex:
          {
            emit(state + 1);
          }
          break;

        case SwiperEvent.pageChanged:
          // Handle page change events here, if necessary
          carouselController.nextPage();
          break;
      }
    });
  }
}
