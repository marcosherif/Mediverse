import 'package:mediverse/Features/PatientDashboard/Appointment/BookingScreen/data/models/item_list_model/item_model.dart';

class ItemListModel {
  List<OrderItemModel>? orders;

  ItemListModel({this.orders});

  factory ItemListModel.fromJson(Map<String, dynamic> json) => ItemListModel(
        orders: (json['items'] as List<dynamic>?)
            ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'items': orders?.map((e) => e.toJson()).toList(),
      };
}
