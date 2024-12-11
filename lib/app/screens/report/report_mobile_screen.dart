import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kazakhi_auto_web/app/functions/global_function.dart';
import 'package:kazakhi_auto_web/app/screens/home/components/headers/header_desktop.dart';
import 'package:kazakhi_auto_web/app/screens/home/components/headers/header_mobile.dart';
import 'package:kazakhi_auto_web/app/screens/report/bloc/report_bloc.dart';
import 'package:kazakhi_auto_web/app/widgets/buttons/custom_button.dart';
import 'package:kazakhi_auto_web/constants/app_colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ReportScreenMobile extends StatelessWidget {
  final String vin;
  const ReportScreenMobile({super.key, required this.vin});

  @override
  Widget build(BuildContext context) {
    var deviceType = GlobalFunction().getDeviceType(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocProvider(
        create: (context) => ReportBloc()..add(ReportLoad(vinCode: vin)),
        child: BlocBuilder<ReportBloc, ReportState>(
          builder: (context, state) {
            if (state is ReportLoaded) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 100),
                        Center(
                          child: Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width / 1.7,
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          3.2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Получить отчет по VIN: $vin',
                                            style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          Row(
                                            children: [
                                              Container(
                                                height: 150,
                                                width: 200,
                                                color: Colors.grey.shade300,
                                                child: const Icon(
                                                    Icons.image_not_supported,
                                                    size: 50,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '2013 Toyota Sienna',
                                                      style: const TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    RichText(
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                            text:
                                                                'Комплектация: ',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                        TextSpan(
                                                          text:
                                                              'XLE FWD 8-Passenger',
                                                        )
                                                      ]),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    RichText(
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                            text: 'Двигатель: ',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                        TextSpan(
                                                          text:
                                                              '3.5L V6 EFI DOHC 24V',
                                                        )
                                                      ]),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    RichText(
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                            text:
                                                                'Тип кузова: ',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                        TextSpan(
                                                          text: 'SPORTS VAN',
                                                        )
                                                      ]),
                                                    ),
                                                    const SizedBox(height: 8),
                                                    RichText(
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                            text: 'MSRP: ',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                        TextSpan(
                                                          text: '\$33,360 USD',
                                                        )
                                                      ]),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // Vehicle Image Placeholder
                                            ],
                                          ),
                                          const SizedBox(height: 16),
                                          // Warning Section
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.red),
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            padding: const EdgeInsets.all(12),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'ВНИМАНИЕ! Авто может быть повреждено!',
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Row(
                                                  children: const [
                                                    Expanded(
                                                      child: Text(
                                                          'История владения: Отчет готов'),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                          'Данные NMVTIS: Отчет готов'),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 8),
                                                Row(
                                                  children: const [
                                                    Expanded(
                                                      child: Text(
                                                          'Отзывные кампании: 6 Записей(-ей)'),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                          'Записи о продаже: 3 Записи(-ей)'),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          // Content Grid
                                          const Text(
                                            'Что включает полный отчет об истории по VIN?',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          GridView.count(
                                            shrinkWrap: true,
                                            crossAxisCount: 2,
                                            childAspectRatio: 5,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            children: const [
                                              ListTile(
                                                leading: Icon(
                                                  Icons.people,
                                                  color: AppColors.primary,
                                                ),
                                                title: Text('История владения'),
                                              ),
                                              ListTile(
                                                leading: Icon(
                                                  Icons.description,
                                                  color: AppColors.primary,
                                                ),
                                                title: Text(
                                                    'История отметок в ПТС'),
                                              ),
                                              ListTile(
                                                leading: Icon(
                                                  Icons.speed,
                                                  color: AppColors.primary,
                                                ),
                                                title:
                                                    Text('Показатели одометра'),
                                              ),
                                              ListTile(
                                                leading: Icon(
                                                  Icons.warning,
                                                  color: AppColors.primary,
                                                ),
                                                title: Text(
                                                    'Аварийный/Утиль/Восстановлен'),
                                              ),
                                              ListTile(
                                                leading: Icon(
                                                  Icons.car_repair,
                                                  color: AppColors.primary,
                                                ),
                                                title:
                                                    Text('Отзывные кампании'),
                                              ),
                                              ListTile(
                                                leading: Icon(
                                                  Icons.warning,
                                                  color: AppColors.primary,
                                                ),
                                                title: Text(
                                                    'Аварийный/Утиль/Восстановлен'),
                                              ),
                                              ListTile(
                                                leading: Icon(
                                                  Icons.car_repair,
                                                  color: AppColors.primary,
                                                ),
                                                title:
                                                    Text('Отзывные кампании'),
                                              ),
                                              ListTile(
                                                leading: Icon(
                                                  Icons.warning,
                                                  color: AppColors.primary,
                                                ),
                                                title: Text(
                                                    'Аварийный/Утиль/Восстановлен'),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 36),
                                          Center(
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  7,
                                              child: CustomButton(
                                                  isHole: true,
                                                  onTap: () {},
                                                  text: 'Пример отчета'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            padding: const EdgeInsets.all(16.0),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.grey.shade300,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.shade200,
                                                  blurRadius: 6,
                                                  offset: const Offset(0, 4),
                                                ),
                                              ],
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Выберите количество отчетов',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(height: 8),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors
                                                            .grey.shade300,
                                                        width: 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      ...[
                                                        {
                                                          'label': '1 отчет',
                                                          'price': '\$15.99',
                                                          'sub': '',
                                                        },
                                                        {
                                                          'label': '3 отчета',
                                                          'price': '\$23.99',
                                                          'sub':
                                                              'Экономь \$23.99!',
                                                        },
                                                        {
                                                          'label': '5 отчетов',
                                                          'price': '\$28.99',
                                                          'sub':
                                                              'ЛУЧШЕЕ ПРЕДЛОЖЕНИЕ!',
                                                        },
                                                      ].map((option) {
                                                        return ListTile(
                                                          leading: Radio(
                                                              value: option[
                                                                  'label'],
                                                              groupValue: '',
                                                              onChanged:
                                                                  (_) {}),
                                                          title: Text(
                                                              option['label']!),
                                                          subtitle: option[
                                                                      'sub']!
                                                                  .isNotEmpty
                                                              ? Text(
                                                                  option[
                                                                      'sub']!,
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .green))
                                                              : null,
                                                          trailing: Text(
                                                              option['price']!),
                                                        );
                                                      }).toList(),
                                                    ],
                                                  ),
                                                ),
                                                const Divider(
                                                    height: 32, thickness: 1),
                                                const Text(
                                                  'Способ оплаты - Банковская карта',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(height: 8),
                                                TextFormField(
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        'Адрес эл. почты',
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: [
                                                    MaskTextInputFormatter(
                                                        mask:
                                                            '#### #### #### ####',
                                                        initialText:
                                                            'XXXX XXXX XXXX XXXX'),
                                                  ],
                                                  decoration: InputDecoration(
                                                    focusColor:
                                                        AppColors.primary,
                                                    hoverColor:
                                                        AppColors.primary,
                                                    fillColor:
                                                        AppColors.primary,
                                                    labelText: 'Номер карты',
                                                    prefixIcon: Icon(
                                                      Icons.credit_card,
                                                      color: AppColors.primary,
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: TextFormField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        inputFormatters: [
                                                          MaskTextInputFormatter(
                                                              mask: '##/##',
                                                              initialText: '/'),
                                                        ],
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'MM / YY',
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 16),
                                                    Expanded(
                                                      child: TextFormField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        inputFormatters: [
                                                          MaskTextInputFormatter(
                                                              mask: '###',
                                                              initialText: ''),
                                                        ],
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'CCV код',
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 16),
                                                const Text(
                                                    'Общая сумма к оплате: \$28.99'),
                                                const SizedBox(height: 16),
                                                Row(
                                                  children: [
                                                    Checkbox(
                                                        value: false,
                                                        onChanged: (_) {}),
                                                    const Text(
                                                        'Подписаться на рассылку'),
                                                  ],
                                                ),
                                                const SizedBox(height: 16),
                                                CustomButton(
                                                    text: 'Получить отчет',
                                                    onTap: () {})
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Payment Section
                                  ],
                                ),
                                SizedBox(
                                  height: 22,
                                ),
                                Text(
                                  'Для чего Вам отчет Kazakh Auto Group?',
                                  style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                    'Рассматривая покупку автомобиля на вторичном рынке, важно проверить текущее состояние и историю каждого из интересующих вас вариантов. С ClearVin вы получите развернутый отчет об истории транспортного средства и фото авто с аукциона по самой доступной цене на рынке. Скачивайте отчет и совершайте только выгодные покупки!')
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Header
                  Align(
                    alignment: Alignment.topRight,
                    child: (deviceType == DeviceType.mobile)
                        ? const HomeHeaderMobileCard()
                        : const HomeHeaderDesktopCard(),
                  ),
                ],
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
