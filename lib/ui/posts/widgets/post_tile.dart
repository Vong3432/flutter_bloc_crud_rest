import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:post_crud/bloc/posts/lists/posts_bloc.dart';
import 'package:post_crud/models/post_model.dart';
import 'package:post_crud/ui/posts/form/post_form.dart';
import 'package:post_crud/ui/posts/post_detail.dart';

class PostTile extends StatelessWidget {
  const PostTile({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final TextTheme _theme = Theme.of(context).textTheme;

    return Material(
      child: ListTile(
        onTap: () => _onPostTapped(context),
        tileColor: Colors.white,
        title: Text(
          post.title,
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
          maxLines: 2,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            post.body,
            style: CupertinoTheme.of(context)
                .textTheme
                .textStyle
                .copyWith(color: Colors.black.withOpacity(0.6)),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(
              onPressed: () => _onEditTapped(context),
              child: const Text("Edit"),
            ),
            CupertinoButton(
              onPressed: () => _onDelete(context),
              child: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }

  void _onEditTapped(BuildContext context) {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => PostForm(
        post: post,
        isEditing: true,
      ),
    );
  }

  void _onDelete(BuildContext context) {
    BlocProvider.of<PostsBloc>(context).add(PostsDelete(post.id));
  }

  void _onPostTapped(BuildContext context) {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => PostDetail(
        post: post,
      ),
    );
  }
}
