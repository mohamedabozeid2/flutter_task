import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/home_cubit/home_cubit.dart';
import '../../controller/home_cubit/home_states.dart';
import '../chat_screen/chat_screen.dart';
import '../favorite_screen/favorite_screen.dart';
import '../home_screen/home_screen.dart';
import '../profile_screen/profile_screen.dart';
import 'widgets/bottom_nav_bar.dart';

class Layout extends StatelessWidget {
  final List<Widget> screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      bottomNavigationBar: const BottomNavBar(),
      body: BlocConsumer<HomeCubit, HomeStates>(
        buildWhen: (previous, current) => current is ChangeBotNavBarState,
        listener: (context, state) {},
        builder: (context, state) {
          return screens[HomeCubit.get(context).botNavCurrentIndex];
        },
      ),
    );
  }
}
