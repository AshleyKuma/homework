import 'package:json_annotation/json_annotation.dart';

part 'industry.g.dart';

@JsonSerializable(explicitToJson: true)
class Industry extends Object {
  Industry({
    this.releaseDate = "",
  });

  @JsonKey(name: "出表日期")
  final String releaseDate;

  factory Industry.fromJson(Map<String, dynamic> srcJson) => _$IndustryFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IndustryToJson(this);
}
