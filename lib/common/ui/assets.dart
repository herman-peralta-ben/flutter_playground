enum LocalImageAsset {
  mario64("assets/mario64.gif"),
  ;

  final String path;
  const LocalImageAsset(this.path);
}

enum RemoteImageAsset {
  flutter("https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png"),
  dash("https://docs.flutter.dev/assets/images/dash/Dash.png"),
  mario64(
      "https://64.media.tumblr.com/56cabd9f47ff8245734cdb0ba41072f7/6f50f9b0bb0df5fa-d8/s500x750/9d409752d3ed38fa7d0531339b6276d3ea23400e.gif"),
  ;

  final String url;
  const RemoteImageAsset(this.url);
}
