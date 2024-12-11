part of 'report_bloc.dart';

@immutable
sealed class ReportEvent {}

final class ReportLoad extends ReportEvent {
  final String vinCode;
  ReportLoad({required this.vinCode});
}
