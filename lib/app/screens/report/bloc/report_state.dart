part of 'report_bloc.dart';

@immutable
sealed class ReportState {}

final class ReportInitial extends ReportState {}

final class ReportLoaded extends ReportState {
  final data;
  ReportLoaded({required this.data});
}
