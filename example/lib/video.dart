import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_playout/multiaudio/HLSManifestLanguage.dart';
import 'package:flutter_playout/multiaudio/MultiAudioSupport.dart';
import 'package:flutter_playout/player_observer.dart';
import 'package:flutter_playout/player_state.dart';
import 'package:flutter_playout/video.dart';
import 'package:flutter_playout_example/hls/getManifestLanguages.dart';

class VideoPlayout extends StatefulWidget {
  final PlayerState desiredState;
  final bool showPlayerControls;

  const VideoPlayout({Key key, this.desiredState, this.showPlayerControls})
      : super(key: key);

  @override
  _VideoPlayoutState createState() => _VideoPlayoutState();
}

class _VideoPlayoutState extends State<VideoPlayout>
    with PlayerObserver, MultiAudioSupport {

//  final String _url = 'https://stream.mux.com/4kxxZAcVC546jFFP6aubqrAKL6hfApilqUzn67N7XaY.m3u8'; // this is mux API
  final String _url = 'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4';
 // List<HLSManifestLanguage> _hlsLanguages = List<HLSManifestLanguage>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _getHLSManifestLanguages);
  }

  Future<void> _getHLSManifestLanguages() async {
    if (!Platform.isIOS && _url != null && _url.isNotEmpty) {
    //  _hlsLanguages = await getManifestLanguages(_url);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          /* player */
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Video(
              autoPlay: true,
              showControls: widget.showPlayerControls,
              title: "Bug and rabbit",
              subtitle: "This is most beauitful animation I have every seen ",
              preferredAudioLanguage: "eng",
              isLiveStream: true,
              position: 0,
              url: _url,
              onViewCreated: _onViewCreated,
              desiredState: widget.desiredState,
            ),
          ),

        ],
      ),
    );
  }

  void _onViewCreated(int viewId) {
    listenForVideoPlayerEvents(viewId);
    enableMultiAudioSupport(viewId);
  }

  @override
  void onPlay() {
    // TODO: implement onPlay
    super.onPlay();
  }

  @override
  void onPause() {
    // TODO: implement onPause
    super.onPause();
  }

  @override
  void onComplete() {
    // TODO: implement onComplete
    super.onComplete();
  }

  @override
  void onTime(int position) {
    // TODO: implement onTime
    super.onTime(position);
  }

  @override
  void onSeek(int position, double offset) {
    // TODO: implement onSeek
    super.onSeek(position, offset);
  }

  @override
  void onDuration(int duration) {
    // TODO: implement onDuration
    super.onDuration(duration);
  }

  @override
  void onError(String error) {
    // TODO: implement onError
    super.onError(error);
  }
}
