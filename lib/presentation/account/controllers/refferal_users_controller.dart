import 'package:get/get.dart';
import 'package:straight_to_yard/data/models/refferal_user/refferal_user.dart';
import 'package:straight_to_yard/data/models/requests/offset_request/offset_request.dart';
import 'package:straight_to_yard/domain/repositories/remote_repository.dart';
import 'package:straight_to_yard/presentation/mixin/pagination_service.dart';

class RefferalUsersController extends GetxController
    with PaginationService<RefferalUser> {
  final RemoteRepository _remoteRepository;

  RefferalUsersController({
    required RemoteRepository remoteRepository,
  }) : _remoteRepository = remoteRepository;

  @override
  void onInit() {
    initlizieController();
    super.onInit();
  }

  @override
  void onClose() {
    disposeController();
    super.onClose();
  }

  @override
  Future<List<RefferalUser>> listener(
    int pageKey, {
    String keyToSearch = '',
  }) async {
    final res = await _remoteRepository.getRefferalUsers(OffsetRequest(
      offset: pageKey.toString(),
      keyword: keyToSearch,
    ));
    return res.data.users;
  }
}
