import 'package:flutter/material.dart';
import 'package:test_app/src/styles.dart';

class ButtomPanel extends StatelessWidget {
  const ButtomPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.129,
      decoration: BoxDecoration(
        color: AppColors.bottomPanel,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/images/setting_icon.png'),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.10,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width * 0.35,
            padding: const EdgeInsets.fromLTRB(12, 16, 17, 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColors.bottomPanelButton,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/qr_icon.png'),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  'Мои коды',
                  style: AppStyles.s14w500,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.10,
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset('assets/images/profile_icon.png'),
        )
      ]),
    );
  }
}
