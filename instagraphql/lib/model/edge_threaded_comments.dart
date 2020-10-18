import 'package:instagraphql/model/page_info.dart';

class EdgeThreadedComments {
  int count;
  PageInfo pageInfo;
  // List<Null> edges;

  EdgeThreadedComments({this.count, this.pageInfo});

  EdgeThreadedComments.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pageInfo = json['page_info'] != null
        ? new PageInfo.fromJson(json['page_info'])
        : null;
    // if (json['edges'] != null) {
    //   edges = new List<Null>();
    //   json['edges'].forEach((v) {
    //     edges.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.pageInfo != null) {
      data['page_info'] = this.pageInfo.toJson();
    }
    // if (this.edges != null) {
    //   data['edges'] = this.edges.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
