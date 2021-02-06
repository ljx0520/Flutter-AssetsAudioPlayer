import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State {
  final audios = <Audio>[
    Audio.network(
      "https://files.freemusicarchive.org/storage-freemusicarchive-org/music/Music_for_Video/springtide/Sounds_strange_weird_but_unmistakably_romantic_Vol1/springtide_-_03_-_We_Are_Heading_to_the_East.mp3",
      headers: {"x": "x"}, // COMMENT IT OUT TO MAKE IT WORK
      metas: Metas(
        id: "Online",
        title: "Online",
        artist: "Florent Champigny",
        album: "OnlineAlbum",
        image: MetasImage.network(
            "https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg"),
      ),
    ),
    Audio.network(
      "https://files.freemusicarchive.org/storage-freemusicarchive-org/music/ccCommunity/Chad_Crouch/Arps/Chad_Crouch_-_Algorithms.mp3",
      headers: {"x": "x"}, // COMMENT IT OUT TO MAKE IT WORK
      metas: Metas(
        id: "Online",
        title: "Online",
        artist: "Florent Champigny",
        album: "OnlineAlbum",
        image: MetasImage.network(
            "https://image.shutterstock.com/image-vector/pop-music-text-art-colorful-600w-515538502.jpg"),
      ),
    ),
  ];
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RaisedButton(
              child: Text("Click"),
              onPressed: () {
                if (!_assetsAudioPlayer.isPlaying.value) {
                  _assetsAudioPlayer.open(
                    audios.first,
                    autoStart: true,
                    showNotification: true,
                  );
                } else {
                  _assetsAudioPlayer.stop();
                }
              }),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }
}