import 'package:flutter/material.dart';
import 'package:kazakhi_auto_web/constants/app_colors.dart';

class VinCheckSectionsDesktopCard extends StatefulWidget {
  @override
  _VinCheckSectionsDesktopCardState createState() =>
      _VinCheckSectionsDesktopCardState();
}

class _VinCheckSectionsDesktopCardState
    extends State<VinCheckSectionsDesktopCard> {
  final List<_FeatureItem> features = [
    _FeatureItem(
      icon: Icons.camera_alt,
      label: "Фотография Автомобиля",
      color: AppColors.primary,
    ),
    _FeatureItem(
      icon: Icons.speed,
      label: "Фактический пробег автомобиля",
      color: AppColors.primary,
    ),
    _FeatureItem(
      icon: Icons.car_crash,
      label: "ДТП и повреждения",
      color: AppColors.primary,
    ),
    _FeatureItem(
      icon: Icons.people,
      label: "История о владельцев",
      color: AppColors.primary,
    ),
    _FeatureItem(
      icon: Icons.directions_car,
      label: "Формы использования автомобиля",
      color: AppColors.primary,
    ),
    _FeatureItem(
      icon: Icons.car_repair,
      label: "База угнанных автомобилей",
      color: AppColors.primary,
    ),
    _FeatureItem(
      icon: Icons.settings,
      label: "Технические данные автомобиля",
      color: AppColors.primary,
    ),
    _FeatureItem(
      icon: Icons.error_outline,
      label: "Производственные дефекты автомобиля",
      color: AppColors.primary,
    ),
  ];

  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondary,
      padding: EdgeInsets.only(
          top: 45,
          bottom: 45,
          left: MediaQuery.of(context).size.width / 5,
          right: MediaQuery.of(context).size.width / 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: const Text(
              "Почему вы должны проверить отчет VIN перед покупкой автомобиля",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: showAll ? features.length : 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: _FeatureCard(feature: features[index]),
              );
            },
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  showAll = !showAll;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        showAll ? "Показать меньше" : "Показать больше",
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        (showAll)
                            ? Icons.keyboard_arrow_up_sharp
                            : Icons.keyboard_arrow_down,
                        color: AppColors.primary,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureItem {
  final IconData icon;
  final String label;
  final Color color;

  _FeatureItem({required this.icon, required this.label, required this.color});
}

class _FeatureCard extends StatelessWidget {
  final _FeatureItem feature;

  const _FeatureCard({required this.feature});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(feature.icon, size: 45, color: feature.color),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              feature.label,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
