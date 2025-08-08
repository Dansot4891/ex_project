import 'package:ex_project/core/module/media/app_video_controller.dart';
import 'package:ex_project/core/module/media/app_youtube_controller.dart';
import 'package:ex_project/dalemy/features/wow/domain/entity/wow_entity.dart';

// Todo 화면에서 이용되는 데이터들을 담는 State
class WowState {
  final List<WowBoardEntity> wowBoards;
  final AppYoutubeController youtubeController;
  final AppVideoController videoPlayerController;
  final bool isLast;
  // 이외의 뷰에서 이용되는 추가 데이터들

  WowState({
    required this.wowBoards,
    required this.youtubeController,
    required this.videoPlayerController,
    required this.isLast,
  });

  WowState copyWith({
    List<WowBoardEntity>? wowBoards,
    bool? isLast,
    AppVideoController? videoPlayerController,
    AppYoutubeController? youtubeController,
  }) {
    return WowState(
      wowBoards: wowBoards ?? this.wowBoards,
      youtubeController: youtubeController ?? this.youtubeController,
      videoPlayerController:
          videoPlayerController ?? this.videoPlayerController,
      isLast: isLast ?? this.isLast,
    );
  }
}
