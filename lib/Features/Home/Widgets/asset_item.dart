import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:virtustyler/core/models/asset_model.dart';
import 'package:virtustyler/core/widgets/custom_button.dart';

class AssetItem extends StatefulWidget {
  const AssetItem({
    super.key,
    required this.model,
    required this.onTap,
  });
  final AssetModel model;
  final Function() onTap;
  @override
  State<AssetItem> createState() => _AssetItemState();
}

class _AssetItemState extends State<AssetItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              widget.model.iconUrl,
            ),
          ),
          CustomButton(
            buttonText: "Equipar",
            onPressed: widget.onTap,
          )
        ],
      ),
    );
  }
}
