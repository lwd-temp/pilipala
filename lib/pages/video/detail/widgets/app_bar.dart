import 'package:flutter/material.dart';
import 'package:flutter_meedu_media_kit/meedu_player.dart';

class ScrollAppBar extends StatelessWidget {
  final double scrollVal;
  Function callback;
  final PlayerStatus playerStatus;

  ScrollAppBar(
    this.scrollVal,
    this.callback,
    this.playerStatus,
  );

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final videoHeight = MediaQuery.of(context).size.width * 9 / 16;
    return Positioned(
      top: -videoHeight + scrollVal + kToolbarHeight + 0.5,
      left: 0,
      right: 0,
      child: Opacity(
        opacity: scrollVal / (videoHeight - kToolbarHeight),
        child: Container(
          height: statusBarHeight + kToolbarHeight,
          color: Theme.of(context).colorScheme.background,
          padding: EdgeInsets.only(top: statusBarHeight),
          child: AppBar(
            primary: false,
            elevation: 0,
            scrolledUnderElevation: 0,
            centerTitle: true,
            title: TextButton(
              onPressed: () => callback(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.play_arrow_rounded),
                  Text(
                    playerStatus == PlayerStatus.paused
                        ? '继续播放'
                        : playerStatus == PlayerStatus.completed
                            ? '重新播放'
                            : '播放中',
                  )
                ],
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    size: 20,
                  )),
              const SizedBox(width: 12)
            ],
          ),
        ),
      ),
    );
  }
}
