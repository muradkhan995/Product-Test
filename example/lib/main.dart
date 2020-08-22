import 'package:flutter/material.dart';
import 'package:flutter_playout/player_state.dart';
import 'package:flutter_playout_example/video.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ProductBox",
      home: PlayoutExample(),
    );
  }
}

class PlayoutExample extends StatefulWidget {
  @override
  _PlayoutExampleState createState() => _PlayoutExampleState();
}

class _PlayoutExampleState extends State<PlayoutExample> {
  PlayerState _desiredState = PlayerState.PLAYING;
  bool _showPlayerControls = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "ProductBox Test",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.black,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.fromLTRB(17.0, 33.0, 17.0, 0.0),
                child: Text(
                  "Native Video Player",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.pink[500], fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.fromLTRB(17.0, 0.0, 17.0, 30.0),
                child: Text(
                  "This video can be share via Airplay and it plays video from a URL with background audio support and lock screen controls.",
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Colors.white70, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: VideoPlayout(
                desiredState: _desiredState,
                showPlayerControls: _showPlayerControls,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
