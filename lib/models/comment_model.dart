import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class Comment {
  const Comment({
    required this.id,
    required this.postId,
    required this.body,
    required this.name,
    required this.email,
  });

  /// This will convert json data to comment model.
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);

  final int id;
  final int postId;
  final String name;
  final String email;
  final String body;
}
