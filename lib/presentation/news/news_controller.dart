import 'package:get/get.dart';
import 'package:straight_to_yard/data/models/news/news.dart';
import 'package:straight_to_yard/data/models/requests/offset_request/offset_request.dart';
import 'package:straight_to_yard/domain/repositories/remote_repository.dart';
import 'package:straight_to_yard/presentation/mixin/pagination_service.dart';

class NewsController extends GetxController with PaginationService<News> {
  final RemoteRepository _remoteRepository;
  NewsController({required RemoteRepository remoteRepository})
      : _remoteRepository = remoteRepository;

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
  Future<List<News>> listener(int pageKey, {String keyToSearch = ''}) async {
    final result = await _remoteRepository.getNews(
      OffsetRequest(offset: '$pageKey', keyword: keyToSearch),
    );
    return result.data.news;
  }
}
