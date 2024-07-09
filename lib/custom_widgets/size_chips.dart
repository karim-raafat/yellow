import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yellow/provider/app_provider.dart';

class SizeChips extends StatefulWidget {
  String label;

  SizeChips({super.key, required this.label});

  @override
  State<SizeChips> createState() => _SizeChipsState();
}

class _SizeChipsState extends State<SizeChips> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context,listen: false);
    return GestureDetector(
      onTap: () {
        setState(() {
          appProvider.size = widget.label;
          isSelected = !isSelected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey,width: 1)
        ),
        child: CircleAvatar(
          radius: 30,
          backgroundColor: (isSelected)? Colors.amber[200] : Colors.transparent,
          child: Text(
            widget.label,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
