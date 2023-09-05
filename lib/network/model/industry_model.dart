import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'industry.dart';

part 'industry_model.g.dart';

@JsonSerializable(explicitToJson: true)
class IndustryModel extends Equatable {
  const IndustryModel({
    this.industryType = IndustryType.unknown,
    this.companyCount = 0,
  });

  final IndustryType industryType;
  final int companyCount;

  factory IndustryModel.fromJson(Map<String, dynamic> srcJson) => _$IndustryModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IndustryModelToJson(this);

  @override
  List<Object?> get props => [
        industryType,
        companyCount,
      ];
}
