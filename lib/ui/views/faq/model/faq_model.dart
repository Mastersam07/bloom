import 'dart:convert';

class FAQModel {
  final String question;
  final String answer;

  FAQModel(this.question, this.answer);

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'answer': answer,
    };
  }

  factory FAQModel.fromMap(Map<String, dynamic> map) {
    return FAQModel(
      map['question'],
      map['answer'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FAQModel.fromJson(String source) =>
      FAQModel.fromMap(json.decode(source));
}
