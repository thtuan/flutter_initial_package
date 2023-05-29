import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  factory Task.initial({required String name}) = InitialTask;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
