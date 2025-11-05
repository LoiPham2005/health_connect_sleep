import 'package:equatable/equatable.dart';
import '../models/sleep_data.dart';

enum HealthConnectStatus {
  initial,
  checking,
  notInstalled,
  installed,
  permissionDenied,
  permissionGranted,
  loading,
  loaded,
  error,
}

class HealthConnectState extends Equatable {
  final HealthConnectStatus status;
  final List<SleepData> sleepData;
  final String? errorMessage;

  const HealthConnectState({
    this.status = HealthConnectStatus.initial,
    this.sleepData = const [],
    this.errorMessage,
  });

  HealthConnectState copyWith({
    HealthConnectStatus? status,
    List<SleepData>? sleepData,
    String? errorMessage,
  }) {
    return HealthConnectState(
      status: status ?? this.status,
      sleepData: sleepData ?? this.sleepData,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, sleepData, errorMessage];
}