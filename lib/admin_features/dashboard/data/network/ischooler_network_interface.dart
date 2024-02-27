import '../../../../common/ischooler_model.dart';
import '../../../../common/network/ischooler_response.dart';

abstract class IschoolerNetwork {
  //model is sent here to get the type of request only
  Future<IschoolerResponse> getItem({required String id});
  Future<bool> addItem({required IschoolerModel model});
  Future<bool> updateItem({required IschoolerModel model});
  Future<bool> deleteItem({required IschoolerModel model});
}
