import 'package:cat_trivia/cubits/navigation_index_cubit/navigation_index_cubit.dart';
import 'package:cat_trivia/resources/app_colors.dart';
import 'package:cat_trivia/resources/app_icon.dart';
import 'package:cat_trivia/resources/app_typography.dart';
import 'package:cat_trivia/services/locator.dart';
import 'package:cat_trivia/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../pages/pages.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: kBottomNavigationBarHeight,
        color: Colors.white,
        alignment: Alignment.center,
        child: BlocBuilder<NavigationIndexCubit, NavigationIndexState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(
                top: 6.0,
                bottom: 3.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<NavigationIndexCubit>().changeIndex(0);
                      locator<NavigationService>().navigateTo(
                        HomePage.routeName,
                      );
                    },
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          state.currentIndex == 0
                              ? SvgPicture.asset(
                                  AppIcons.homeFill,
                                )
                              : SvgPicture.asset(
                                  AppIcons.home,
                                  color: AppColors.primary8,
                                ),
                          Text(
                            'Home',
                            style: AppTypography.navigation.copyWith(
                              color: state.currentIndex == 0
                                  ? AppColors.primary5
                                  : AppColors.primary8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<NavigationIndexCubit>().changeIndex(1);
                      locator<NavigationService>().navigateTo(
                        HistoryPage.routeName,
                      );
                    },
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          state.currentIndex == 1
                              ? SvgPicture.asset(
                                  AppIcons.technology,
                                )
                              : SvgPicture.asset(
                                  AppIcons.technology,
                                  color: AppColors.primary8,
                                ),
                          Text(
                            'History',
                            style: AppTypography.navigation.copyWith(
                              color: state.currentIndex == 1
                                  ? AppColors.primary5
                                  : AppColors.primary8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
