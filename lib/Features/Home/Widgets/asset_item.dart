import 'package:flutter/material.dart';
import 'package:virtustyler/core/models/asset_model.dart';

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
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(20),
      ),
      width: 100,
      height: 100,
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              widget.model.iconUrl,
            ),
          ),
          ElevatedButton(
            onPressed: widget.onTap,
            child: const Text("Equipar"),
          ),
        ],
      ),
    );
  }
}
