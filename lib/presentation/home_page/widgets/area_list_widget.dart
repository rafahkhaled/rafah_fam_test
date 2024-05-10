import 'package:flutter/material.dart';
import 'package:rafah_fam_test/core/app_export.dart';

import '../../../widgets/custom_icon_button.dart';
import '../../property_list/bloc/all_properties_bloc.dart';
import '../bloc/home_bloc/home_bloc.dart';
import '../models/home_model.dart';

class ArealistWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, HomeModel?>(
        selector: (state) => state.homeModelObj,
        builder: (context, homeModelObj) {
          return Stack(
            alignment: Alignment.centerRight,
            children: [
              SizedBox(
                height: 50,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  controller:
                      BlocProvider.of<HomeBloc>(context).scrollController,
                  itemCount: homeModelObj != null
                      ? homeModelObj.cityItemList.length
                      : 5,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        context.read<AllPropertybloc>().add(Getproperty());
                      },
                      child: Container(
                        height: 40,
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomImageView(
                              imagePath:
                                  homeModelObj!.cityItemList[index].imagePath,
                              height: 35,
                              radius: BorderRadius.circular(50),
                              width: 35,
                              fit: BoxFit.contain,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.h),
                              child: Text(
                                homeModelObj.cityItemList[index].name!,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 12,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: CustomIconButton(
                  height: 40,
                  width: 40,
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context).add(ScrollToNextEvent());
                  },
                  decoration: AppDecoration.fillWhiteA.copyWith(
                      color: appTheme.whiteA700.withOpacity(0.8),
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: appTheme.gray10001,
                  ),
                ),
              )
            ],
          );
        });
  }
}
