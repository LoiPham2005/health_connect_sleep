import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health/health.dart';
import '../models/sleep_data.dart';
import '../utils/health_helper.dart';
import 'health_connect_state.dart';

class HealthConnectCubit extends Cubit<HealthConnectState> {
  final Health _health = Health();

  HealthConnectCubit() : super(const HealthConnectState());

  Future<void> checkHealthConnectStatus() async {
    emit(state.copyWith(status: HealthConnectStatus.checking));

    try {
      // Check if Health Connect is available
      bool isAvailable = await HealthHelper.isHealthConnectAvailable();

      if (!isAvailable) {
        emit(state.copyWith(status: HealthConnectStatus.notInstalled));
        return;
      }

      // Configure health plugin
      await _health.configure();

      emit(state.copyWith(status: HealthConnectStatus.installed));

      // Check permissions
      await checkPermissions();
    } catch (e) {
      emit(state.copyWith(
        status: HealthConnectStatus.error,
        errorMessage: 'Error checking Health Connect: $e',
      ));
    }
  }

  Future<void> checkPermissions() async {
    try {
      final types = [HealthDataType.SLEEP_SESSION];

      // Check if we have permission
      bool? hasPermission = await _health.hasPermissions(types);

      if (hasPermission == true) {
        emit(state.copyWith(status: HealthConnectStatus.permissionGranted));
        await fetchSleepData();
      } else {
        emit(state.copyWith(status: HealthConnectStatus.permissionDenied));
      }
    } catch (e) {
      emit(state.copyWith(
        status: HealthConnectStatus.error,
        errorMessage: 'Error checking permissions: $e',
      ));
    }
  }

  Future<void> requestPermissions() async {
    try {
      final types = [HealthDataType.SLEEP_SESSION];

      // Request permissions
      bool authorized = await _health.requestAuthorization(types);

      if (authorized) {
        emit(state.copyWith(status: HealthConnectStatus.permissionGranted));
        await fetchSleepData();
      } else {
        emit(state.copyWith(status: HealthConnectStatus.permissionDenied));
      }
    } catch (e) {
      emit(state.copyWith(
        status: HealthConnectStatus.error,
        errorMessage: 'Error requesting permissions: $e',
      ));
    }
  }

  Future<void> fetchSleepData() async {
    emit(state.copyWith(status: HealthConnectStatus.loading));

    try {
      final now = DateTime.now();
      final sevenDaysAgo = now.subtract(const Duration(days: 7));

      // Fetch sleep data
      List<HealthDataPoint> healthData = await _health.getHealthDataFromTypes(
        types: [HealthDataType.SLEEP_SESSION],
        startTime: sevenDaysAgo,
        endTime: now,
      );

      // Convert to SleepData model
      List<SleepData> sleepDataList = healthData.map((point) {
        return SleepData(
          startTime: point.dateFrom,
          endTime: point.dateTo,
          duration: point.dateTo.difference(point.dateFrom),
          source: point.sourceName,
        );
      }).toList();

      // Sort by date (most recent first)
      sleepDataList.sort((a, b) => b.startTime.compareTo(a.startTime));

      emit(state.copyWith(
        status: HealthConnectStatus.loaded,
        sleepData: sleepDataList,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HealthConnectStatus.error,
        errorMessage: 'Error fetching sleep data: $e',
      ));
    }
  }

  void reset() {
    emit(const HealthConnectState());
  }
}