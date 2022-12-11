import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rick_and_morty/app_assets.dart';
import 'package:rick_and_morty/features/presentation/theme/colors.dart';

class FilterPage extends StatefulWidget {
  FilterPage({
    required this.filters,
    required this.filtersIsChecked,
    Key? key,
  }) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
  final List<String> filters;
  List<bool> filtersIsChecked;
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Column(
            children: [
              Container(
                color: AppColors.dartTheme,
              ),
              AppBar(
                title: const Text(
                  'Filters',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(
                      [widget.filters, widget.filtersIsChecked],
                    );
                  },
                ),
              ),
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sort',
              style: TextStyle(
                color: Color(0xff5B6975),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'By alphabet',
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    IconButton(
                      splashRadius: 1,
                      onPressed: () {
                        widget.filtersIsChecked[6] = true;
                        setState(() {});
                      },
                      icon: Image.asset(
                        AppAssets.az,
                        width: 25,
                        height: 25,
                        color: widget.filtersIsChecked[6]
                            ? const Color(0xff22A2BD)
                            : const Color(0xff5B6975),
                      ),
                    ),
                    IconButton(
                      splashRadius: 1,
                      onPressed: () {
                        widget.filtersIsChecked[6] = false;
                        setState(() {});
                      },
                      icon: Image.asset(
                        AppAssets.za,
                        width: 25,
                        height: 25,
                        color: widget.filtersIsChecked[6]
                            ? const Color(0xff5B6975)
                            : const Color(0xff22A2BD),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const Divider(
              thickness: 2,
              color: Color(0xff152A3A),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'STATUS',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            CheckBoxParameters(
              isChecked: widget.filtersIsChecked[0],
              filterName: 'Alive',
              filters: widget.filters,
              filterValue: 0,
              index: 0,
              filtersIsChecked: widget.filtersIsChecked,
            ),
            CheckBoxParameters(
              isChecked: widget.filtersIsChecked[1],
              filterName: 'Dead',
              filters: widget.filters,
              filterValue: 0,
              index: 1,
              filtersIsChecked: widget.filtersIsChecked,
            ),
            CheckBoxParameters(
              isChecked: widget.filtersIsChecked[2],
              filterName: 'Unknown',
              filters: widget.filters,
              filterValue: 0,
              index: 2,
              filtersIsChecked: widget.filtersIsChecked,
            ),
            const SizedBox(
              height: 25,
            ),
            const Divider(
              thickness: 2,
              color: Color(0xff152A3A),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'GENDER',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xff5B6975),
              ),
            ),
            CheckBoxParameters(
              isChecked: widget.filtersIsChecked[3],
              filterName: 'Male',
              filters: widget.filters,
              filterValue: 1,
              index: 3,
              filtersIsChecked: widget.filtersIsChecked,
            ),
            CheckBoxParameters(
              isChecked: widget.filtersIsChecked[4],
              filterName: 'Female',
              filters: widget.filters,
              filterValue: 1,
              index: 4,
              filtersIsChecked: widget.filtersIsChecked,
            ),
            CheckBoxParameters(
              isChecked: widget.filtersIsChecked[5],
              filterName: 'Genderless',
              filters: widget.filters,
              filterValue: 1,
              index: 5,
              filtersIsChecked: widget.filtersIsChecked,
            )
          ],
        ),
      ),
    );
  }
}

class CheckBoxParameters extends StatefulWidget {
  CheckBoxParameters(
      {Key? key,
      required this.isChecked,
      required this.filterName,
      required this.filters,
      required this.filterValue,
      required this.index,
      required this.filtersIsChecked})
      : super(key: key);

  @override
  State<CheckBoxParameters> createState() => _CheckBoxParametersState();
  bool isChecked = false;
  final String filterName;
  final List<String> filters;
  final int filterValue;
  final int index;
  final List<bool> filtersIsChecked;
}

class _CheckBoxParametersState extends State<CheckBoxParameters> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                  side: const BorderSide(
                    color: Color(0xff5B6975),
                  ),
                  value: widget.isChecked,
                  onChanged: (bool? newValue) {
                    widget.isChecked = newValue!;
                    if (newValue == true) {
                      widget.filters[widget.filterValue] = widget.filterName;
                    } else {
                      widget.filters[widget.filterValue] = '';
                    }
                    widget.filtersIsChecked[widget.index] = widget.isChecked;
                    setState(() {});
                  }),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              widget.filterName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ],
    );
  }
}
