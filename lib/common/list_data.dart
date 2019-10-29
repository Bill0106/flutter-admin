class ListData<T> {
  final int total;
  final List<dynamic> dynamicList;
  List<T> list;

  ListData.fromJson(Map<String, dynamic> json)
      : dynamicList = json['list'],
        total = json['total'];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'list': dynamicList,
        'total': total,
      };
}
