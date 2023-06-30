class MessageModel {
  String? message;
  String? subject;
  String? display;

  MessageModel({this.message, this.subject, this.display});

  MessageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    subject = json['subject'];
    display = json['display'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['subject'] = this.subject;
    data['display'] = this.display;
    return data;
  }
}
