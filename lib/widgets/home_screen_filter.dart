import 'package:bds_appdata/config/palette.dart';
import 'package:flutter/material.dart';

class HomeScreenFilter extends StatefulWidget {
  final String filterName;
  final List<String> filterOptions;

  const HomeScreenFilter({
    @required this.filterName,
    @required this.filterOptions,
  });

  @override
  _HomeScreenFilterState createState() => _HomeScreenFilterState();
}

class _HomeScreenFilterState extends State<HomeScreenFilter> {
  String _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 120.0,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          style: TextStyle(
            fontSize: 15.0,
            color: Palette.grey,
          ),
          hint: Text(widget.filterName),
          value: _selectedOption,
          items: widget.filterOptions
              .map(
                (option) => DropdownMenuItem(
                  value: option,
                  child: Text(option),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              _selectedOption = value;
            });
          },
        ),
      ),
    );
  }
}
