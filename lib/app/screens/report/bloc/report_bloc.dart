import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:kazakhi_auto_web/api/api.dart';
import 'package:kazakhi_auto_web/app/functions/global_function.dart';
import 'package:meta/meta.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  ReportBloc() : super(ReportInitial()) {
    on<ReportEvent>((event, emit) async {
      if (event is ReportLoad) {
        final result =
            await ApiClient.get('api/vin/preview?vin=' + event.vinCode);
        if (result['success'] == true) {
          log(result['data']['result'].toString());
        } else {}
        emit(ReportLoaded(data: result['data']['result']));
      }
    });
  }
}
