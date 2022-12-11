import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rick_and_morty/app_assets.dart';
import 'package:rick_and_morty/features/presentation/theme/colors.dart';
import 'package:rick_and_morty/features/presentation/theme/styles.dart';

class CountBar extends StatefulWidget {
  CountBar(
      {Key? key,
      required this.count,
      required this.view,
      required this.onPressed,
      required this.searched})
      : super(key: key);

  final int? count;
  bool view;
  final Function() onPressed;
  bool searched = false;

  @override
  State<CountBar> createState() => _CountBarState();
}

class _CountBarState extends State<CountBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          // widget.searched
          //     ? 'РЕЗУЛЬТАТЫ ПОИСКА'
          //     :
          'ВСЕГО ПЕРСОНАЖЕЙ: ${widget.count}',
          style: Styles.s14w400.copyWith(color: AppColors.tF5b69),
        ),
        IconButton(
          splashRadius: 20,
          onPressed: widget.onPressed,
          icon: SizedBox(
            height: 20,
            width: 20,
            child: widget.view
                ? Image.asset(AppAssets.grids)
                : Image.asset(AppAssets.list),
          ),
        )
      ],
    );
  }
}
