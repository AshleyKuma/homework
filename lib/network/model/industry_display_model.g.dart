// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'industry_display_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndustryDisplayModel _$IndustryDisplayModelFromJson(
        Map<String, dynamic> json) =>
    IndustryDisplayModel(
      industryType:
          $enumDecodeNullable(_$IndustryTypeEnumMap, json['industryType']) ??
              IndustryType.unknown,
      companyCount: json['companyCount'] as int? ?? 0,
    );

Map<String, dynamic> _$IndustryDisplayModelToJson(
        IndustryDisplayModel instance) =>
    <String, dynamic>{
      'industryType': instance.industryType.toJson(),
      'companyCount': instance.companyCount,
    };

const _$IndustryTypeEnumMap = {
  IndustryType.cement: '01',
  IndustryType.food: '02',
  IndustryType.plastic: '03',
  IndustryType.fiber: '04',
  IndustryType.electricMachine: '05',
  IndustryType.cable: '06',
  IndustryType.glass: '08',
  IndustryType.paper: '09',
  IndustryType.iron: '10',
  IndustryType.rubber: '11',
  IndustryType.motor: '12',
  IndustryType.buildingMaterials: '14',
  IndustryType.air: '15',
  IndustryType.tourist: '16',
  IndustryType.finance: '17',
  IndustryType.department: '18',
  IndustryType.mixed: '19',
  IndustryType.others: '20',
  IndustryType.chemical: '21',
  IndustryType.biotechnology: '22',
  IndustryType.hybridGas: '23',
  IndustryType.semiconductor: '24',
  IndustryType.computer: '25',
  IndustryType.photoelectric: '26',
  IndustryType.internet: '27',
  IndustryType.electricComponent: '28',
  IndustryType.electricPathway: '29',
  IndustryType.it: '30',
  IndustryType.electricOther: '31',
  IndustryType.culture: '32',
  IndustryType.farmacy: '33',
  IndustryType.electricBusiness: '34',
  IndustryType.green: '35',
  IndustryType.cloud: '36',
  IndustryType.sports: '37',
  IndustryType.living: '38',
  IndustryType.stock: '80',
  IndustryType.unknown: null,
};
