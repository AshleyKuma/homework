import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'industry.dart';

part 'industry_display_model.g.dart';

@JsonSerializable(explicitToJson: true)
class IndustryDisplayModel extends Equatable {
  const IndustryDisplayModel({
    this.industryType = IndustryType.unknown,
    this.companyCount = 0,
  });

  final IndustryType industryType;
  final int companyCount;

  factory IndustryDisplayModel.fromJson(Map<String, dynamic> srcJson) => _$IndustryDisplayModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IndustryDisplayModelToJson(this);

  @override
  List<Object?> get props => [
        industryType,
        companyCount,
      ];
}
