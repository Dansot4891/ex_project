import 'package:ex_project/app/di/app_di.dart';
import 'package:ex_project/core/module/error/result.dart';
import 'package:ex_project/core/module/media/app_video_controller.dart';
import 'package:ex_project/core/module/media/app_youtube_controller.dart';
import 'package:ex_project/dalemy/features/wow/domain/use_case/get_wows_use_case.dart';
import 'package:ex_project/dalemy/features/wow/domain/entity/wow_entity.dart';
import 'package:ex_project/dalemy/features/wow/presentation/wow_board/controller/wow_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wow_provider.g.dart';

// Todo 화면의 비즈니스 로직, 상태 변화, view에 notifier를 담당하는
// 일종의 ViewModel 역할을 하는 provider
// ---
// riverpod generator를 이용
@riverpod
class WowProvider extends _$WowProvider {
  @override
  Future<WowState> build() async {
    final videoController = locator<AppVideoController>();
    final youtubeController = locator<AppYoutubeController>();

    // 해당 화면 전환시 비디오 컨트롤러 해제
    ref.onDispose(() {
      videoController.dispose();
      youtubeController.dispose();
    });

    final result = await locator<GetWowBoardsUseCase>().execute();
    switch (result) {
      case Success<List<WowBoardEntity>>():
        return WowState(
          wowBoards: result.data,
          isLast: false,
          youtubeController: youtubeController,
          videoPlayerController: videoController,
        );
      case Error<List<WowBoardEntity>>():
        state = AsyncValue.error(result.error, StackTrace.current);
        throw result.error;
    }
  }
}
