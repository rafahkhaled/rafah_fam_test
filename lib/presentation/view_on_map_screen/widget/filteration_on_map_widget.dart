import 'package:flutter/material.dart';
import 'package:rafah_fam_test/core/app_export.dart';

class FilterationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeUtils.width * 0.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildItem("Schools", index: 0),
          _buildItem("Metros", index: 1),
          _buildItem("Landmarks", index: 2)
        ],
      ),
    );
  }

  Widget _buildItem(String text, {required int index}) {
    bool isEven = index.isEven;
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: isEven ? Colors.green : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: appTheme.gray10001, width: 2),
            ),
            child: isEven
                ? Icon(Icons.check, color: Colors.white, size: 16)
                : null,
          ),
          SizedBox(width: 8),
          Text(
            text,
            style: theme.textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
