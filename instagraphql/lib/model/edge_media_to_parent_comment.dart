import 'package:instagraphql/model/edges.dart';
import 'package:instagraphql/model/page_info.dart';

class EdgeMediaToParentComment {
  int count;
  PageInfo pageInfo;
  List<Edges> edges;

  EdgeMediaToParentComment({this.count, this.pageInfo, this.edges});

  EdgeMediaToParentComment.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pageInfo = json['page_info'] != null
        ? new PageInfo.fromJson(json['page_info'])
        : null;
    if (json['edges'] != null) {
      edges = new List<Edges>();
      json['edges'].forEach((v) {
        edges.add(new Edges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.pageInfo != null) {
      data['page_info'] = this.pageInfo.toJson();
    }
    if (this.edges != null) {
      data['edges'] = this.edges.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
