import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:post_crud/bloc/users/user/user_bloc.dart';
import 'package:post_crud/models/user_model.dart';
import 'package:post_crud/ui/users/widgets/user_loading_skeleton.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key, required this.userId}) : super(key: key);
  final int userId;

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final UserBloc _userBloc = UserBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: BlocProvider<UserBloc>(
        create: (context) => _userBloc,
        child: BlocBuilder<UserBloc, UserState>(
          builder: (BuildContext context, UserState state) {
            switch (state.status) {
              case UserStatus.success:
                return _buildUserInfo(state.user!);
              default:
                return const UserLoadingSkeleton();
            }
          },
        ),
      ),
    );
  }

  Widget _buildUserInfo(User user) {
    final CupertinoTextThemeData _theme = CupertinoTheme.of(context).textTheme;
    return Row(
      children: <Widget>[
        Container(
          width: 48,
          height: 48,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blue.withOpacity(0.2),
          ),
          child: SvgPicture.network(
            "https://avatars.dicebear.com/api/micah/${user.username}.svg",
            fit: BoxFit.scaleDown,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                user.username,
                style: _theme.textStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                user.email,
                style: _theme.textStyle.copyWith(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void _load() {
    debugPrint(widget.userId.toString());
    _userBloc.add(FetchUser(widget.userId));
  }
}
