import 'package:FloorFour/UI/elements/Cursor.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class LandingVideo extends StatefulWidget {
  @required
  final bool mobile;
  final Function onEnd;
  const LandingVideo({Key key, this.mobile, this.onEnd}) : super(key: key);
  @override
  _LandingVideoState createState() => _LandingVideoState();
}

class _LandingVideoState extends State<LandingVideo> {
  VideoPlayerController cont;

  @override
  void initState() {
    super.initState();

    cont = VideoPlayerController.network(
      !widget.mobile
          ? 'https://firebasestorage.googleapis.com/v0/b/floorfourweb.appspot.com/o/Landing%20Video%2Flanding.mp4?alt=media&token=37d8514e-92ad-4fcc-8320-2a54ff3b1c59'
          : 'https://firebasestorage.googleapis.com/v0/b/floorfourweb.appspot.com/o/Landing%20Video%2Fiphone%20x%20landing.mp4?alt=media&token=6aff9ce5-7c93-4be3-9260-941ffecc88a2',
    )..initialize().then((value) {
        setState(() {
          cont.setVolume(0);
          //  cont.play();
          cont.addListener(() {
            checkVideo();
          });
        });
      });
  }

  void checkVideo() {
    if (cont.value.position == cont.value.duration) {
      widget.onEnd();
      cont.removeListener(() {
        checkVideo();
      });
      print(cont.hasListeners);
      cont.dispose();

      cont = null;
      dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.aspectRatio);
    ChewieController chewieController;
    if (cont.value.isInitialized) {
      chewieController = ChewieController(
        autoInitialize: false,
        allowMuting: true,
        showControls: false,
        videoPlayerController: cont,
        aspectRatio: !widget.mobile ? 16 / 10 : 3 / 5,
        autoPlay: true,
        looping: false,
      );
    }
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.transparent,
        ),
        cont.value.isInitialized
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: FittedBox(
                  fit: !widget.mobile ? BoxFit.fitWidth : BoxFit.fill,
                  child: Chewie(
                    controller: chewieController,
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ],
    );
  }
}
