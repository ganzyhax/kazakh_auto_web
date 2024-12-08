import 'package:flutter/material.dart';
import 'package:kazakhi_auto_web/constants/app_colors.dart';

class HomeAdvantagesDesktopCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<_AdvantageItem> advantages = [
      _AdvantageItem(
        icon: Icons.speed,
        title: "Быстрая проверка VIN",
        description:
            "Полный отчет доступен мгновенно после оплаты, также мы бесплатно отправляем копию отчета в PDF.",
      ),
      _AdvantageItem(
        icon: Icons.lock,
        title: "Безопасная и удобная оплата",
        description:
            "Доступно несколько методов оплаты и скидки при покупке нескольких отчетов. Ваши платежные данные защищены.",
      ),
      _AdvantageItem(
        icon: Icons.money_off,
        title: "100% гарантия возврата денег",
        description:
            "Если отчет не соответствует описанию, вы можете получить полный возврат денег от покупки отчета.",
      ),
    ];

    return Container(
      padding: EdgeInsets.only(
          bottom: 45,
          left: MediaQuery.of(context).size.width / 5,
          right: MediaQuery.of(context).size.width / 5),
      child: Column(
        children: [
          Center(
            child: Text(
              'Наше примущество',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
              child: Column(
            children: advantages.map((e) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: _AdvantageCard(advantage: e),
              );
            }).toList(),
          )),
        ],
      ),
    );
  }
}

class _AdvantageItem {
  final IconData icon;
  final String title;
  final String description;

  _AdvantageItem(
      {required this.icon, required this.title, required this.description});
}

class _AdvantageCard extends StatelessWidget {
  final _AdvantageItem advantage;

  const _AdvantageCard({required this.advantage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColors.background),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(advantage.icon, size: 45, color: AppColors.primary),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    advantage.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    advantage.description,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
