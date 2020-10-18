class PageInfo {
  bool hasNextPage;
  String endCursor;

  PageInfo({this.hasNextPage, this.endCursor});

  PageInfo.fromJson(Map<String, dynamic> json) {
    hasNextPage = json['has_next_page'];
    endCursor = json['end_cursor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['has_next_page'] = this.hasNextPage;
    data['end_cursor'] = this.endCursor;
    return data;
  }
}
