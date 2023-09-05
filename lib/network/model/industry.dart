import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'industry.g.dart';

@JsonSerializable(explicitToJson: true)
class Industry extends Equatable {
  const Industry({
    this.releaseDate = "",
    this.companyCodename = "",
    this.companyName = "",
    this.companyNameShort = "",
    this.industryType = IndustryType.unknown,
    this.address = "",
    this.guiNumber = "",
    this.ceo = "",
    this.chairman = "",
    this.spokesman = "",
    this.spokesmanTitle = "",
    this.deputySpokesman = "",
    this.tel = "",
    this.establishDate = "",
    this.listingDate = "",
    this.commonShareUnit = "",
    this.capitalAmount = "",
    this.specialShare = "",
    this.website = "",
    this.issuedShare = "",
  });

  @JsonKey(name: "出表日期")
  final String releaseDate;

  @JsonKey(name: "公司代號")
  final String companyCodename;

  @JsonKey(name: "公司名稱")
  final String companyName;

  @JsonKey(name: "公司簡稱")
  final String companyNameShort;

  @JsonKey(name: "產業別", unknownEnumValue: IndustryType.unknown)
  final IndustryType industryType;

  @JsonKey(name: "住址")
  final String address;

  @JsonKey(name: "營利事業統一編號")
  final String guiNumber;

  @JsonKey(name: "董事長")
  final String ceo;

  @JsonKey(name: "總經理")
  final String chairman;

  @JsonKey(name: "發言人")
  final String spokesman;

  @JsonKey(name: "發言人職稱")
  final String spokesmanTitle;

  @JsonKey(name: "代理發言人")
  final String deputySpokesman;

  @JsonKey(name: "總機電話")
  final String tel;

  @JsonKey(name: "成立日期")
  final String establishDate;

  @JsonKey(name: "上市日期")
  final String listingDate;

  @JsonKey(name: "普通股每股面額")
  final String commonShareUnit;

  @JsonKey(name: "實收資本額")
  final String capitalAmount;

  @JsonKey(name: "特別股")
  final String specialShare;

  @JsonKey(name: "網址")
  final String website;

  @JsonKey(name: "已發行普通股數或TDR原股發行股數")
  final String issuedShare;

  factory Industry.fromJson(Map<String, dynamic> srcJson) => _$IndustryFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IndustryToJson(this);

  @override
  List<Object?> get props => [
        releaseDate,
        companyCodename,
        companyName,
        companyNameShort,
        industryType,
        address,
        guiNumber,
        ceo,
        chairman,
        spokesman,
        spokesmanTitle,
        deputySpokesman,
        tel,
        establishDate,
        listingDate,
        commonShareUnit,
        capitalAmount,
        specialShare,
        website,
        issuedShare,
      ];
}

enum IndustryType {
  @JsonValue("01")
  cement,
  @JsonValue("02")
  food,
  @JsonValue("03")
  plastic,
  @JsonValue(null)
  unknown;

  String? toJson() => _$IndustryTypeEnumMap[this];
  String get desc {
    switch (this) {
      case IndustryType.cement:
        return "水泥工業";
      case IndustryType.food:
        return "食物工業";
      case IndustryType.plastic:
        return "塑膠工業";
      default:
        return "";
    }
  }
}
