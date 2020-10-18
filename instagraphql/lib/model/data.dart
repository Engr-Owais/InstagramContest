import 'package:instagraphql/model/short_code_media.dart';

class Data {
  ShortcodeMedia shortcodeMedia;

  Data({this.shortcodeMedia});

  Data.fromJson(Map<String, dynamic> json) {
    shortcodeMedia = json['shortcode_media'] != null
        ? new ShortcodeMedia.fromJson(json['shortcode_media'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shortcodeMedia != null) {
      data['shortcode_media'] = this.shortcodeMedia.toJson();
    }
    return data;
  }
}
