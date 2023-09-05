// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'industry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Industry _$IndustryFromJson(Map<String, dynamic> json) => Industry(
      releaseDate: json['出表日期'] as String? ?? "",
      companyCodename: json['公司代號'] as String? ?? "",
      companyName: json['公司名稱'] as String? ?? "",
      companyNameShort: json['公司簡稱'] as String? ?? "",
      industryType: $enumDecodeNullable(_$IndustryTypeEnumMap, json['產業別'],
              unknownValue: IndustryType.unknown) ??
          IndustryType.unknown,
      address: json['住址'] as String? ?? "",
      guiNumber: json['營利事業統一編號'] as String? ?? "",
      ceo: json['董事長'] as String? ?? "",
      chairman: json['總經理'] as String? ?? "",
      spokesman: json['發言人'] as String? ?? "",
      spokesmanTitle: json['發言人職稱'] as String? ?? "",
      deputySpokesman: json['代理發言人'] as String? ?? "",
      tel: json['總機電話'] as String? ?? "",
      establishDate: json['成立日期'] as String? ?? "",
      listingDate: json['上市日期'] as String? ?? "",
      commonShareUnit: json['普通股每股面額'] as String? ?? "",
      capitalAmount: json['實收資本額'] as String? ?? "",
      specialShare: json['特別股'] as String? ?? "",
      website: json['網址'] as String? ?? "",
      issuedShare: json['已發行普通股數或TDR原股發行股數'] as String? ?? "",
    );

Map<String, dynamic> _$IndustryToJson(Industry instance) => <String, dynamic>{
      '出表日期': instance.releaseDate,
      '公司代號': instance.companyCodename,
      '公司名稱': instance.companyName,
      '公司簡稱': instance.companyNameShort,
      '產業別': instance.industryType.toJson(),
      '住址': instance.address,
      '營利事業統一編號': instance.guiNumber,
      '董事長': instance.ceo,
      '總經理': instance.chairman,
      '發言人': instance.spokesman,
      '發言人職稱': instance.spokesmanTitle,
      '代理發言人': instance.deputySpokesman,
      '總機電話': instance.tel,
      '成立日期': instance.establishDate,
      '上市日期': instance.listingDate,
      '普通股每股面額': instance.commonShareUnit,
      '實收資本額': instance.capitalAmount,
      '特別股': instance.specialShare,
      '網址': instance.website,
      '已發行普通股數或TDR原股發行股數': instance.issuedShare,
    };

const _$IndustryTypeEnumMap = {
  IndustryType.cement: '01',
  IndustryType.food: '02',
  IndustryType.plastic: '03',
  IndustryType.unknown: null,
};
