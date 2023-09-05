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
  @JsonValue("04")
  fiber,
  @JsonValue("05")
  electricMachine,
  @JsonValue("06")
  cable,
  @JsonValue("08")
  glass,
  @JsonValue("09")
  paper,
  @JsonValue("10")
  iron,
  @JsonValue("11")
  rubber,
  @JsonValue("12")
  motor,
  @JsonValue("14")
  buildingMaterials,
  @JsonValue("15")
  air,
  @JsonValue("16")
  tourist,
  @JsonValue("17")
  finance,
  @JsonValue("18")
  department,
  @JsonValue("19")
  mixed,
  @JsonValue("20")
  others,
  @JsonValue("21")
  chemical,
  @JsonValue("22")
  biotechnology,
  @JsonValue("23")
  hybridGas,
  @JsonValue("24")
  semiconductor,
  @JsonValue("25")
  computer,
  @JsonValue("26")
  photoelectric,
  @JsonValue("27")
  internet,
  @JsonValue("28")
  electricComponent,
  @JsonValue("29")
  electricPathway,
  @JsonValue("30")
  it,
  @JsonValue("31")
  electricOther,
  @JsonValue("32")
  culture,
  @JsonValue("33")
  farmacy,
  @JsonValue("34")
  electricBusiness,
  @JsonValue("35")
  green,
  @JsonValue("36")
  cloud,
  @JsonValue("37")
  sports,
  @JsonValue("38")
  living,
  @JsonValue("80")
  stock,
  @JsonValue(null)
  unknown;

  String? toJson() => _$IndustryTypeEnumMap[this];
  String get desc {
    switch (this) {
      case IndustryType.cement:
        return "水泥工業";
      case IndustryType.food:
        return "食品工業";
      case IndustryType.plastic:
        return "塑膠工業";
      case IndustryType.fiber:
        return "紡織纖維";
      case IndustryType.electricMachine:
        return "電機機械";
      case IndustryType.cable:
        return "電器電纜";
      case IndustryType.glass:
        return "玻璃陶瓷";
      case IndustryType.paper:
        return "造紙工業";
      case IndustryType.iron:
        return "剛鐵工業";
      case IndustryType.rubber:
        return "橡膠工業";
      case IndustryType.motor:
        return "汽車工業";
      case IndustryType.buildingMaterials:
        return "建材營造";
      case IndustryType.air:
        return "航運業";
      case IndustryType.tourist:
        return "觀光餐旅";
      case IndustryType.finance:
        return "金融保險";
      case IndustryType.department:
        return "貿易百貨";
      case IndustryType.mixed:
        return "綜合";
      case IndustryType.others:
        return "其他";
      case IndustryType.chemical:
        return "化學工業";
      case IndustryType.biotechnology:
        return "生技醫療業";
      case IndustryType.hybridGas:
        return "油電燃氣業";
      case IndustryType.semiconductor:
        return "半導體業";
      case IndustryType.computer:
        return "電腦及週邊設備業";
      case IndustryType.photoelectric:
        return "光電業";
      case IndustryType.internet:
        return "通信網路業";
      case IndustryType.electricComponent:
        return "電子零組件業";
      case IndustryType.electricPathway:
        return "電子通路業";
      case IndustryType.it:
        return "資訊服務業";
      case IndustryType.electricOther:
        return "其他電子業";
      case IndustryType.culture:
        return "文化創意業";
      case IndustryType.farmacy:
        return "農業科技業";
      case IndustryType.electricBusiness:
        return "電子商務";
      case IndustryType.green:
        return "綠能環保";
      case IndustryType.cloud:
        return "數位雲端";
      case IndustryType.sports:
        return "運動休閒";
      case IndustryType.living:
        return "居家生活";
      case IndustryType.stock:
        return "管理股票";
      default:
        return "";
    }
  }
}
