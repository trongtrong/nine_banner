import 'package:nine_banner/model/banner_model.dart';

class ModelReminderHome {
  List<Reminders> _reminders;
  int _total;

  ModelReminderHome({List<Reminders> reminders, int total}) {
    this._reminders = reminders;
    this._total = total;
  }

  List<Reminders> get reminders => _reminders;
  set reminders(List<Reminders> reminders) => _reminders = reminders;
  int get total => _total;
  set total(int total) => _total = total;

  ModelReminderHome.fromJson(Map<String, dynamic> json) {
    if (json['reminders'] != null) {
      _reminders = [];
      json['reminders'].forEach((v) {
        _reminders.add(new Reminders.fromJson(v));
      });
    }
    _total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._reminders != null) {
      data['reminders'] = this._reminders.map((v) => v.toJson()).toList();
    }
    data['total'] = this._total;
    return data;
  }
}

///url: String : url for webview or brower
///action: int
///payment_id: String
///button_cta: String : title for button Reminder
///amount: int amount for service or payment with VND
///provider: string : provider for Topup, MG card, Phone-Data Card
class Reminders {
  String _router;
  int _id;
  bool _isClose;
  bool _isRead;
  String _feature;
  String _type;
  String _imageUrl;
  String _title;
  String _description;
  dynamic _params;

  Reminders({
    String router,
    int id,
    bool isClose,
    bool isRead,
    String feature,
    String type,
    String image,
    String title,
    String description,
    dynamic params,
  }) {
    this._router = router;
    this._id = id;
    this._isClose = isClose;
    this._feature = feature;
    this._type = type;
    this._params = params;
    this._title = title;
    this._description = description;

    this._imageUrl = imageUrl;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get router => _router;
  set router(String router) => _router = router;
  bool get isClose => _isClose;
  set isClose(bool isClose) => _isClose = isClose;
  bool get isRead => _isRead;
  set isRead(bool isRead) => _isRead = isRead;
  String get feature => _feature;
  set feature(String feature) => _feature = feature;
  String get type => _type;
  set type(String type) => _type = type;

  String get title => _title;
  set title(String title) => _title = title;
  String get description => _description;
  set description(String description) => _description = description;

  String get imageUrl => _imageUrl;
  set imageUrl(String imageUrl) => _imageUrl = imageUrl;

  dynamic get params => _params;
  set params(dynamic params) => _params = params;

  Reminders.fromJson(Map<String, dynamic> json) {
    _isClose = json['is_close'] != null ? json['is_close'] : false;
    _id = json['id'] != null ? json['id'] : null;
    _isRead = json['is_read'] != null ? json['is_read'] : null;
    _feature = json['feature'] != null ? json['feature'] : null;
    _type = json['type'] != null ? json['type'] : null;
    _title = json['title'] != null ? json['title'] : null;
    _description = json['description'] != null ? json['description'] : null;
    _imageUrl = json['image'] != null ? json['image'] : null;
    _router = json['router'] != null ? json['router'] : null;
    _params = json['params'] != null ? json['params'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['router'] = this._router;
    data['id'] = this._id;
    data['is_close'] = this._isClose;
    data['is_read'] = this._isRead;
    data['feature'] = this._feature;
    data['type'] = this._type;
    if (this._params != null) {
      data['params'] = this._params;
    }
    data['title'] = this._title;
    data['description'] = this._description;
    data['image'] = this._imageUrl;

    return data;
  }

  static Reminders convert(Target target) {
    return Reminders(router: target.value, params: target.params);
  }
}
