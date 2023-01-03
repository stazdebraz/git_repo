// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:test_app/src/app_controller.dart';
import 'package:test_app/src/styles.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final AppController controller;

  @override
  State<CategoriesListView> createState() => _CategoriesListView();
}

List<String> categories = ['Все коды', 'Избранное', 'Машина', 'Добавить'];

class _CategoriesListView extends State<CategoriesListView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.03,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(41)),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 21),
              separatorBuilder: (context, index) => const SizedBox(
                width: 8,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CategoryItem(
                isActive: widget.controller.currentIndex == index,
                onTap: () {
                  widget.controller.selectCategory(index);
                },
                text: categories[index],
              ),
              itemCount: categories.length,
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    this.isActive = false,
    this.text = '',
    required this.onTap,
  }) : super(key: key);
  final bool isActive;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: StadiumBorder(
            side: BorderSide(
                color: isActive
                    ? AppColors.categoryActive
                    : AppColors.categoryBorder,
                width: 2),
          ),
          backgroundColor: isActive
              ? AppColors.categoryActive
              : AppColors.categoryBackground),
      onPressed: onTap,
      child: Text(
        text,
        style: AppStyles.s14w400.copyWith(
            color: isActive ? AppColors.categoryTextActive : AppColors.black),
      ),
    );
  }
}
