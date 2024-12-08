import 'package:flutter/material.dart';
import 'package:kazakhi_auto_web/app/functions/global_function.dart';
import 'package:kazakhi_auto_web/app/screens/home/components/advantages/advantages_desktop.dart';
import 'package:kazakhi_auto_web/app/screens/home/components/advantages/advantages_mobile.dart';
import 'package:kazakhi_auto_web/app/screens/home/components/faq/faq_desktop_card.dart';
import 'package:kazakhi_auto_web/app/screens/home/components/faq/faq_mobile_card.dart';
import 'package:kazakhi_auto_web/app/screens/home/components/finder_card.dart';
import 'package:kazakhi_auto_web/app/screens/home/components/headers/header_desktop.dart';
import 'package:kazakhi_auto_web/app/screens/home/components/headers/header_mobile.dart';
import 'package:kazakhi_auto_web/app/screens/home/components/vin_why_check/vin_check_desktop_card.dart';
import 'package:kazakhi_auto_web/app/screens/home/components/vin_why_check/vin_check_mobile_card.dart';
import 'package:kazakhi_auto_web/constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceType = GlobalFunction().getDeviceType(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Padding(
                      padding: (deviceType == DeviceType.mobile)
                          ? EdgeInsets.all(30.0)
                          : (deviceType == DeviceType.desktop)
                              ? EdgeInsets.only(
                                  top: 90,
                                  left: MediaQuery.of(context).size.width / 5,
                                  right: MediaQuery.of(context).size.width / 5)
                              : EdgeInsets.all(5),
                      child: Padding(
                        padding: (deviceType == DeviceType.desktop)
                            ? EdgeInsets.only(left: 200, right: 200)
                            : EdgeInsets.all(0),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                "ДАВАЙТЕ НАЙДЕМ ВАШ АВТОМОБИЛЬ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: (deviceType == DeviceType.desktop)
                                        ? 45
                                        : 30,
                                    fontWeight:
                                        (deviceType == DeviceType.desktop)
                                            ? FontWeight.w700
                                            : FontWeight.w700,
                                    color: AppColors.primary),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                                child: Text(
                              "Введите идентификационный номер вашего автомобиля (VIN), чтобы узнать о его характеристиках, спецификациях и многом другом.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: (deviceType == DeviceType.desktop)
                                      ? 18
                                      : 17,
                                  fontWeight: FontWeight.w600),
                            )),
                            const SizedBox(
                              height: 30,
                            ),
                            const HomeVinFinderContainer(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    (deviceType == DeviceType.mobile)
                        ? VinCheckSectionsMobileCard()
                        : VinCheckSectionsDesktopCard(),
                    SizedBox(
                      height: 30,
                    ),
                    (deviceType == DeviceType.mobile)
                        ? HomeAdvantagesMobile()
                        : HomeAdvantagesDesktopCard(),
                    SizedBox(
                      height: 30,
                    ),
                    (deviceType == DeviceType.mobile)
                        ? FAQSectionMobile()
                        : FAQSectionDesktop(),
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: (deviceType == DeviceType.mobile)
                ? HomeHeaderMobileCard()
                : HomeHeaderDesktopCard(),
          ),
        ],
      ),
    );
  }
}
