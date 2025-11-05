import 'package:equatable/equatable.dart';

class SleepData extends Equatable {
  final DateTime startTime;
  final DateTime endTime;
  final Duration duration;
  final String source;

  const SleepData({
    required this.startTime,
    required this.endTime,
    required this.duration,
    required this.source,
  });

  double get durationInHours => duration.inMinutes / 60.0;

  String get formattedDuration {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return '${hours}h ${minutes}m';
  }

  @override
  List<Object?> get props => [startTime, endTime, duration, source];
}