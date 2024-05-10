import 'package:flutter/material.dart';
import 'package:rafah_fam_test/core/app_export.dart';
import 'package:rafah_fam_test/presentation/property_list/widget/property_item_widget.dart';
import 'package:rafah_fam_test/presentation/property_list/bloc/all_properties_bloc.dart';

import '../../core/utils/shimmar_loading.dart';

class AllpropertyWidget extends StatelessWidget {
  const AllpropertyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllPropertybloc, AllPropertylistState>(
      builder: (context, state) {
        return state.status.isSuccess
            ? SizedBox(
                height: SizeUtils.height,
                child: Center(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return PropertyItemWidget(state.property[index]);
                      },
                      separatorBuilder: (context, index) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Divider(
                              color: appTheme.gray10001,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        );
                      },
                      itemCount: state.property.length),
                ),
              )
            : state.status.isLoading
                ? ShimmerPropertyList()
                : state.status.isError
                    ? Text('Something went wrong')
                    : Column(
                        children: [
                          const SizedBox(),
                        ],
                      );
      },
    );
  }
}
