part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class PostRequested extends PostEvent {
  PostRequested({required this.id});
  final int id;
}
