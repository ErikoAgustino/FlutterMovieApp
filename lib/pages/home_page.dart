import 'package:carousel_slider/carousel_slider.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/pages/more_page.dart';
import 'package:movie_app/pages/movie_detail_page.dart';
import 'package:movie_app/service/movie_services.dart';
import 'package:movie_app/service/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int movieIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "nowShowing",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                    ).tr(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MorePage(initialPage: 0),
                            ));
                      },
                      child: Row(
                        children: [
                          const Text(
                            "more",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ).tr(),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 14.0,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: MovieServices()
                    .getNowPlayingMovieData(1, context.locale.languageCode),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Movie> movieList = snapshot.data ?? [];

                    return Column(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                              height: 300,
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                              viewportFraction: 0.5,
                              initialPage: movieIndex,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  movieIndex = index;
                                });
                              }),
                          items: (movieList.length > 5
                                  ? movieList.take(5)
                                  : movieList)
                              .map((item) => GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MovieDetailPage(
                                              movie: item,
                                              canOrder: true,
                                            ),
                                          ));
                                    },
                                    child: Container(
                                      width: 200,
                                      margin: const EdgeInsets.all(5.0),
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5.0)),
                                          child: DropShadowImage(
                                            borderRadius: 10,
                                            blurRadius: 5,
                                            image: Image.network(
                                              Strings.imageUrl +
                                                  item.poster_path,
                                              fit: BoxFit.cover,
                                            ),
                                          )),
                                    ),
                                  ))
                              .toList(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          movieList.elementAt(movieIndex).title,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w500),
                        )
                      ],
                    );
                  }
                  return const SpinKitDancingSquare(color: Colors.black);
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Divider(height: 1.0, color: Colors.grey),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "comingSoon",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ).tr(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MorePage(initialPage: 1),
                                ));
                          },
                          child: Row(
                            children: [
                              const Text(
                                "more",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ).tr(),
                              const Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 14.0,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "amazingmoviethatwillsoonhitthetheater",
                          style: TextStyle(color: Colors.grey),
                        ).tr())
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              FutureBuilder(
                future: MovieServices()
                    .getUpcomingMovieData(1, context.locale.languageCode),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Movie> movieList = snapshot.data ?? [];

                    return Column(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 300,
                            aspectRatio: 2.0,
                            padEnds: false,
                            enlargeCenterPage: false,
                            pageSnapping: false,
                            enableInfiniteScroll: false,
                            viewportFraction: 0.4,
                            initialPage: 0,
                          ),
                          items: (movieList.length > 5
                                  ? movieList.take(5)
                                  : movieList)
                              .map((item) => GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MovieDetailPage(
                                              movie: item,
                                              canOrder: false,
                                            ),
                                          ));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: 200,
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5.0)),
                                              child: Image.network(
                                                Strings.imageUrl +
                                                    item.poster_path,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            item.title,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ],
                    );
                  }
                  return const SpinKitDancingSquare(color: Colors.black);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
