import 'package:school_admin/common/educonnect_model.dart';
import 'package:school_admin/common/network/educonnect_response.dart';

abstract class EduconnectNetwork {
  //model is sent here to get the type of request only
  Future<EduconnectResponse> getAllItems({required EduconnectListModel model});
  Future<bool> addItem({required EduconnectModel model});
  Future<bool> updateItem({required EduconnectModel model});
  Future<bool> deleteItem({required EduconnectModel model});
}
