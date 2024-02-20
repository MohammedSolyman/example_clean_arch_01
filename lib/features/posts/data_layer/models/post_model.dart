import 'package:my_clean/features/posts/domain_layer/entities/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel(
      {required super.userId,
      required super.id,
      required super.title,
      required super.body});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      body: map['body'],
    );
  }

  factory PostModel.fromEntity(PostEntity postEntity) {
    return PostModel(
      userId: postEntity.userId,
      id: postEntity.id,
      title: postEntity.title,
      body: postEntity.body,
    );
  }
}
