class WebtoonModel {
  final String title, img, _id, service;

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        img = json['img'],
        _id = json['_id'],
        service = json['service'];
}
