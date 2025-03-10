import 'package:get/get.dart';
import 'package:straight_to_yard/app/core/get_di.dart';
import 'package:straight_to_yard/domain/repositories/remote_repository.dart';
import 'package:straight_to_yard/presentation/authorize/controllers/add_authorize_user_controller.dart';

class AddAuthorizeUserBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AddAuthorizeUserController(
      remoteRepository: find<RemoteRepository>(),
    ));
  }
}
