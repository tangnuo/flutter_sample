import 'package:json_annotation/json_annotation.dart';

import 'car_list_detail_model.dart';

part 'car_list_model.g.dart';

@JsonSerializable(nullable: true)
class CarListModel {
   List<CarListDetailModel> content;
   bool first;
   bool last;
   int number;
   int numberOfElements;
   int size;
   int totalElements;
   int totalPages;

   CarListModel({this.content, this.first, this.last, this.number,
      this.numberOfElements, this.size, this.totalElements, this.totalPages});

   //反序列化
   factory CarListModel.fromJson(Map<String, dynamic> json) =>
       _$CarListModelFromJson(json);

   //序列化
   Map<String, dynamic> toJson() => _$CarListModelToJson(this);
}