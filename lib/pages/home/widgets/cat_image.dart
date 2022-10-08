import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_trivia/blocs/home_bloc/home_bloc.dart';
import 'package:cat_trivia/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatImage extends StatelessWidget {
  const CatImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Expanded(
          flex: 2,
          child: state.catModel.url != ''
              ? CachedNetworkImage(
                  fit: BoxFit.fitHeight,
                  fadeInDuration: Duration.zero,
                  fadeOutDuration: Duration.zero,
                  imageUrl: state.catModel.url,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        backgroundColor: AppColors.primary5,
                        color: AppColors.accentBlue3,
                        value: downloadProgress.progress,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Container(),
        );
      },
    );
  }
}
