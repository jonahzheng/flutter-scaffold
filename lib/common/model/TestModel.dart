import 'package:json_annotation/json_annotation.dart';

part 'TestModel.g.dart';

@JsonSerializable()
class TestModel {
  String title;
  String url;

  TestModel(this.title, this.url);

  factory TestModel.fromJson(Map<String, dynamic> json) => _$TestModelFromJson(json);

  Map<String, dynamic> toJson() => _$TestModelToJson(this);
}
