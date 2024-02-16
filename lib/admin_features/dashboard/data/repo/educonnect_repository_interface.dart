import 'package:school_admin/common/educonnect_model.dart';

abstract class EduconnectRepository {
  //model is sent here to get the type of request only
  Future<EduconnectListModel> getAllItems({required EduconnectListModel model});
  Future<bool> addItem(
      {required EduconnectModel model, required bool addWithId});
  Future<bool> updateItem({required EduconnectModel model});
  Future<bool> deleteItem({required EduconnectModel model});
}
