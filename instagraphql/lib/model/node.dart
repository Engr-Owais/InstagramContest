import 'package:instagraphql/model/edge_like_by.dart';
import 'package:instagraphql/model/edge_threaded_comments.dart';
import 'package:instagraphql/model/owner.dart';

class Node {
  String id;
  String text;
  int createdAt;
  bool didReportAsSpam;
  Owner owner;
  bool viewerHasLiked;
  EdgeLikedBy edgeLikedBy;
  EdgeThreadedComments edgeThreadedComments;

  Node(
      {this.id,
      this.text,
      this.createdAt,
      this.didReportAsSpam,
      this.owner,
      this.viewerHasLiked,
      this.edgeLikedBy,
      this.edgeThreadedComments});

  Node.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    createdAt = json['created_at'];
    didReportAsSpam = json['did_report_as_spam'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    viewerHasLiked = json['viewer_has_liked'];
    edgeLikedBy = json['edge_liked_by'] != null
        ? new EdgeLikedBy.fromJson(json['edge_liked_by'])
        : null;
    edgeThreadedComments = json['edge_threaded_comments'] != null
        ? new EdgeThreadedComments.fromJson(json['edge_threaded_comments'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['created_at'] = this.createdAt;
    data['did_report_as_spam'] = this.didReportAsSpam;
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    data['viewer_has_liked'] = this.viewerHasLiked;
    if (this.edgeLikedBy != null) {
      data['edge_liked_by'] = this.edgeLikedBy.toJson();
    }
    if (this.edgeThreadedComments != null) {
      data['edge_threaded_comments'] = this.edgeThreadedComments.toJson();
    }
    return data;
  }
}
