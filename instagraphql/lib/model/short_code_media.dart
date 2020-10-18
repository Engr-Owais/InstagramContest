import 'package:instagraphql/model/edge_media_to_parent_comment.dart';

class ShortcodeMedia {
  EdgeMediaToParentComment edgeMediaToParentComment;

  ShortcodeMedia({this.edgeMediaToParentComment});

  ShortcodeMedia.fromJson(Map<String, dynamic> json) {
    edgeMediaToParentComment = json['edge_media_to_parent_comment'] != null
        ? new EdgeMediaToParentComment.fromJson(
            json['edge_media_to_parent_comment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.edgeMediaToParentComment != null) {
      data['edge_media_to_parent_comment'] =
          this.edgeMediaToParentComment.toJson();
    }
    return data;
  }
}
