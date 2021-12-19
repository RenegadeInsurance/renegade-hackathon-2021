import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:we_alert/modules/assist/screens/assist.dart';
import 'package:we_alert/modules/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:we_alert/modules/forum/bloc/forum_cubit/forum_cubit.dart';
import 'package:we_alert/modules/forum/repository/get_question_repo.dart';
import 'package:we_alert/modules/forum/screens/forum_page.dart';
import 'package:we_alert/modules/home/bloc/homepagecubit/home_page_cubit.dart';
import 'package:we_alert/modules/home/constants/color_const.dart';
import 'package:we_alert/modules/home/repository/fetchWeatherData/fetch_weather_repo.dart';
import 'package:we_alert/modules/home/screens/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavCubit>(
          create: (context) => BottomNavCubit(),
        ),
        BlocProvider<HomePageCubit>(
          create: (context) =>
              HomePageCubit(fetchWeatherRepo: context.read<FetchWeatherRepo>()),
        ),
        BlocProvider<ForumCubit>(
          create: (context) =>
              ForumCubit(getQuestionRepo: context.read<GetQuestionRepo>()),
        ),
      ],
      child: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          return Scaffold(
              backgroundColor: ColorConstants.scaffoldBgColour,
              bottomNavigationBar: CurvedNavigationBar(
                index: state.index,
                backgroundColor: ColorConstants.scaffoldBgColour,
                color: const Color(0xff786DF6),
                items: <Widget>[
                  SvgPicture.asset(
                    'assets/icons/form.svg',
                    color: ColorConstants.scaffoldBgColour,
                    height: 30,
                  ),
                  SvgPicture.asset(
                    'assets/icons/home.svg',
                    color: ColorConstants.scaffoldBgColour,
                    height: 30,
                  ),
                  SvgPicture.asset(
                    'assets/icons/map.svg',
                    color: ColorConstants.scaffoldBgColour,
                    height: 30,
                  ),
                ],
                onTap: (index) {
                  context.read<BottomNavCubit>().changeIndex(index: index);
                },
              ),
              body: state.index == 0
                  ? ForumPage(
                      forumCubit: context.read<ForumCubit>(),
                    )
                  : state.index == 2
                      ? Assists()
                      : HomePage(homePageCubit: context.read<HomePageCubit>()));
        },
      ),
    );
  }
}
