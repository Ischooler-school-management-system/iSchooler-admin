import 'package:ischooler_admin/common/educonnect_model.dart';

abstract class IschoolerRepository {
  //model is sent here to get the type of request only
  Future<IschoolerListModel> getAllItems({required IschoolerListModel model});
  Future<bool> addItem(
      {required IschoolerModel model, required bool addWithId});
  Future<bool> updateItem({required IschoolerModel model});
  Future<bool> deleteItem({required IschoolerModel model});
}
