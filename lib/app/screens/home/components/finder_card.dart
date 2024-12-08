import 'package:flutter/material.dart';
import 'package:kazakhi_auto_web/app/functions/global_function.dart';
import 'package:kazakhi_auto_web/app/widgets/buttons/custom_button.dart';
import 'package:kazakhi_auto_web/app/widgets/textfields/custom_textfield.dart';
import 'package:kazakhi_auto_web/constants/app_colors.dart';

class HomeVinFinderContainer extends StatelessWidget {
  const HomeVinFinderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceType = GlobalFunction().getDeviceType(context);

    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColors.secondary),
      child: Padding(
        padding: (deviceType == DeviceType.mobile)
            ? EdgeInsets.all(20)
            : EdgeInsets.all(0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/black_car.png',
              width: (deviceType == DeviceType.mobile)
                  ? MediaQuery.of(context).size.width * 0.7
                  : MediaQuery.of(context).size.width * 0.3,
              height: (deviceType == DeviceType.desktop)
                  ? MediaQuery.of(context).size.height * 0.2
                  : null,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 15,
            ),
            (deviceType == DeviceType.mobile)
                ? Column(
                    children: [
                      CustomTextfield(
                        hintText: 'Введите VIN код',
                        rightIcon: Icons.search,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomButton(text: 'Найти', onTap: () {}),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: CustomTextfield(
                          hintText: 'Введите VIN код',
                          rightIcon: Icons.search,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                          width: (deviceType == DeviceType.desktop)
                              ? MediaQuery.of(context).size.width * 0.1
                              : null,
                          child: CustomButton(text: 'Найти', onTap: () {})),
                    ],
                  ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Где найти VIN код?',
              style: TextStyle(color: AppColors.primary),
            )
          ],
        ),
      ),
    );
  }
}
