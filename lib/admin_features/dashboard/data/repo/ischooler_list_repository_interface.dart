import '../../../../common/ischooler_model.dart';

abstract class IschoolerListRepository {
  //model is sent here to get the type of request only
  Future<IschoolerListModel> getAllItems({
    required IschoolerListModel model,
    Map<String, dynamic>? eqMap,
  });
  Future<bool> addItem(
      {required IschoolerModel model, required bool addWithId});
  Future<bool> updateItem({required IschoolerModel model});
  Future<bool> deleteItem({required IschoolerModel model});
}
