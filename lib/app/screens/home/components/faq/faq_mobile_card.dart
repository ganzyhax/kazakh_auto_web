import 'package:flutter/material.dart';
import 'package:kazakhi_auto_web/constants/app_colors.dart';

class FAQSectionMobile extends StatelessWidget {
  final List<Map<String, String>> faqItems = [
    {
      "question": "Что такое VIN код?",
      "answer":
          "Идентификационный номер транспортного средства (VIN) - это уникальный идентификатор для каждого транспорта. VIN код состоит из 17 символов и уникален для каждого автомобиля. Нет двух автомобилей с одинаковым VIN кодом. Символы VIN, включая заглавные буквы и цифры, представляют конкретную информацию об автомобиле. К ним относятся марка автомобиля, модель, страна происхождения, год и т.д. Используя VIN-декодер VINinspect, Вы можете получить отчет об истории Вашего транспортного средства с VIN кодом Вашего транспорта. Щелкните здесь, чтобы проверить свой VIN."
    },
    {
      "question": "Где я могу найти VIN код своего автомобиля?",
      "answer":
          "Проверьте следующие места в автомобиле, чтобы найти его VIN код:\nПриборная панель\nПод капотом\nБрандмауэр двигателя\nНа водительской двери"
    },
    {
      "question":
          "Где я могу найти VIN код своего автомобиля в его документах?",
      "answer":
          "Чтобы найти VIN код, Вы можете проверить в документах следующее:\nСертификат о регистрации транспортного средства\nСтраховой полис\nСервисные записи"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondary,
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Часто задаваемые вопросы",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ...faqItems.map((faq) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ExpansionTile(
                    title: Text(
                      faq['question']!,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          faq['answer']!,
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
