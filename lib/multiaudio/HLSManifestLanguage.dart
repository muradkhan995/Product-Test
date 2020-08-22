class HLSManifestLanguage {
  final String code;
  final String name;
  final String nativeName;
  String url;
/*Audio & Video player in Flutter. This plugin provides audio/video playback with background audio support
and lock screen controls for both iOS & Android. Also provides player events such as onPlay, onPause, onTime etc.
See example for more details.
Video supports HLS and Progressive Steaming for both iOS & Android with multi-audio support.
 */
  HLSManifestLanguage(this.code, this.name, {this.nativeName, this.url});

  factory HLSManifestLanguage.fromJson(Map<String, dynamic> json) {
    return HLSManifestLanguage(
      json["code"],
      json["name"],
      nativeName: json["nativeName"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'nativeName': nativeName,
      'url': url,
    };
  }

  static List<dynamic> toJsonFromList(List<HLSManifestLanguage> languages) {
    if (languages == null) return List<dynamic>();
    return languages.map((a) => a.toJson()).toList();
  }
}
