import 'package:cat_trivia/blocs/home_bloc/home_bloc.dart';
import 'package:cat_trivia/resources/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = '/';

  static Widget create() {
    return const HomePage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                Image.network(state.imageUrl),
                Spacer(),
                IconButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(GetFact());
                  },
                  icon: SvgPicture.asset(
                    AppIcons.search,
                  ),
                ),
                Spacer(),
                Text(state.factModel.fact),
                Spacer(),
                Container(
                  width: double.infinity,
                  height: 200,
                  child: ListView.builder(
                      itemCount: state.historyList.length,
                      itemBuilder: (context, item) {
                        return Row(
                          children: [
                            Text(
                              state.historyList[item].time,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 10),
                            ),
                            Text(
                              state.historyList[item].text,
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 10),
                            ),
                          ],
                        );
                      }),
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(ClearHistory());
                    },
                    icon: Icon(Icons.ac_unit)),
                Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
