import 'dict_model.dart';
import 'org_model.dart';

class CarSearchFilterModel {
  String? plateNumber; //车牌号
  DictModel? functionType; //功能类别
  DictModel? carType; //车型
  DictModel? operationalFunction; //作战功能
  DictModel? carLevel; //车辆等级
  DictModel? carStatus; //车辆状态
  DictModel? dutyStatus; //勤务状态
  OrgModel? institution; //所在机构
  String? no;

  CarSearchFilterModel(
      {this.plateNumber,
      this.functionType,
      this.carType,
      this.operationalFunction,
      this.carLevel,
      this.carStatus,
      this.dutyStatus,
      this.institution,
      this.no});
}
