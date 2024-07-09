import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yellow/provider/app_provider.dart';

class FilterChips extends StatefulWidget {
  String label;
  FilterChips({super.key, required this.label});

  @override
  State<FilterChips> createState() => _FilterChipsState();
}

class _FilterChipsState extends State<FilterChips> {
  @override
  Widget build(BuildContext context) {
    AppProvider  appProvider = Provider.of<AppProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: FilterChip(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(
            color: Colors.transparent,

          ),
        ),
        backgroundColor: (appProvider.filters.contains(widget.label)) ? Colors.black : Colors.grey[200],
        labelStyle: TextStyle(
          color: (appProvider.filters.contains(widget.label)) ? Colors.white : Colors.black,
        ),
        label: Text(widget.label),
        selected: appProvider.filters.contains(widget.label),
        selectedColor: Colors.black,
        showCheckmark: false,
        onSelected: (value) {
          setState(() {});
          appProvider.addRemoveFilter(widget.label);
        },
      ),
    );
  }
}
