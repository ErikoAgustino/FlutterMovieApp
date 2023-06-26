import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/pages/movie_detail_page.dart';
import 'package:movie_app/service/movie_services.dart';
import 'package:movie_app/service/strings.dart';
import 'package:movie_app/util/utils.dart';

class UpcomingPage extends StatefulWidget {
  const UpcomingPage({Key? key}) : super(key: key);

  @override
  State<UpcomingPage> createState() => _UpcomingState();
}

class _UpcomingState extends State<UpcomingPage> {
  late ScrollController scrollController = ScrollController();
  final List<Movie> movieList = [];
  final int maxLength = 100;

  int page = 1;
  bool isLoading = false;
  bool hasMore = true;

  getMovies() async {
    setState(() {
      isLoading = true;
    });
    final response = await MovieServices()
        .getUpcomingMovieData(page, context.locale.languageCode);

    if (response != null) {
      for (final e in response) {
        movieList.add(e);
      }
    }
    setState(() {
      isLoading = false;
      page += 1;
      hasMore = movieList.length < maxLength;
    });
  }

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent * 0.95 &&
          !isLoading) {
        if (hasMore) {
          getMovies();
        }
      }
    });
  }

  @override
  void didChangeDependencies() {
    getMovies();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
            child: ListView.builder(
      itemCount: movieList.length + (hasMore ? 1 : 0),
      controller: scrollController,
      itemBuilder: (context, index) {
        if (index == movieList.length) {
          return const SizedBox(
              height: 100, child: SpinKitDancingSquare(color: Colors.black));
        }
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailPage(
                    movie: movieList[index],
                    canOrder: false,
                  ),
                ));
          },
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    Strings.imageUrl + movieList[index].poster_path,
                    height: 150.0,
                    width: 100.0,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 150,
                  width: width * 0.6,
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          movieList[index].title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        movieList[index].overview,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:
                            Utils.getRatingStar(movieList[index].vote_average),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    )));
  }
}
