// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test_app/src/app_controller.dart';

import '../../styles.dart';

class MainListView extends StatelessWidget {
  const MainListView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AppController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(21, 0, 9, 0),
        child: Scrollbar(
          thumbVisibility: true,
          child: ListView.separated(
            padding: const EdgeInsets.only(right: 12),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              );
            },
            itemCount: controller.items.results!.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.084,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.colors[index].withOpacity(0.3)),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(18, 14, 18, 14),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    color: AppColors.colors[index]),
                                padding: const EdgeInsets.all(9),
                                child: Image.network(
                                    controller.items.results![index].icon ??
                                        ''),
                              ),
                            ),
                            Text(
                              controller.items.results![index].title ??
                                  "Loading",
                              style: AppStyles.s18w500,
                            )
                          ],
                        )),
                  ));
            },
          ),
        ),
      ),
    );
  }
}
