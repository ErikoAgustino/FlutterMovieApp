import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/model/credit.dart';
import 'package:movie_app/model/genre.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/pages/select_date_hour_page.dart';
import 'package:movie_app/service/credit_services.dart';
import 'package:movie_app/service/genre_services.dart';
import 'package:movie_app/service/strings.dart';
import 'package:movie_app/util/utils.dart';

// ignore: must_be_immutable
class MovieDetailPage extends StatelessWidget {
  Movie movie;
  final bool canOrder;

  MovieDetailPage({Key? key, required this.movie, required this.canOrder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)
                    .createShader(Rect.fromLTRB(bounds.width / 2,
                        bounds.height / 2, bounds.width, bounds.height));
              },
              blendMode: BlendMode.dstIn,
              child: Image.network(
                Strings.imageUrl +
                    (movie.backdrop_path != null
                        ? movie.backdrop_path!
                        : movie.poster_path),
                fit: BoxFit.fitWidth,
                height: 231,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              movie.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            FutureBuilder(
                future: GenreServices().getListGenreData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Genre> genreList = snapshot.data ?? [];
                    Genre findGenre(int id) =>
                        genreList.firstWhere((genre) => genre.id == id);

                    String genreString = "";
                    int genreLength = movie.genre_ids.length;
                    for (var x = 0; x < genreLength - 1; x++) {
                      genreString +=
                          "${findGenre(movie.genre_ids.elementAt(x)).name}, ";
                    }
                    genreString +=
                        findGenre(movie.genre_ids.elementAt(genreLength - 1))
                            .name;

                    return Text(
                      genreString,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                    );
                  }
                  return const SpinKitDancingSquare(color: Colors.black);
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: Utils.getRatingStar(movie.vote_average),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: const Text("cast",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
                  .tr(),
            ),
            FutureBuilder(
              future: CreditServices().getListCreditData(movie.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Credit> creditList = snapshot.data ?? [];

                  return Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 130,
                          aspectRatio: 2.0,
                          padEnds: false,
                          enlargeCenterPage: false,
                          pageSnapping: false,
                          enableInfiniteScroll: false,
                          viewportFraction: 0.2,
                          initialPage: 0,
                        ),
                        items: (creditList.length > 8
                                ? creditList.take(8)
                                : creditList)
                            .map((actor) => Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5.0)),
                                          child: Container(
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0))),
                                              child: (actor.profile_path != null
                                                  ? Image.network(
                                                      Strings.imageUrl +
                                                          actor.profile_path!)
                                                  : Container(
                                                      height: 75,
                                                      color: Colors.grey,
                                                    ))),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        actor.name,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
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
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text("synopsis",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500))
                        .tr(),
                  ),
                  const SizedBox(height: 5),
                  Text(movie.overview)
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: !canOrder
                  ? null
                  : () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SelectDateHourPage(movie: movie),
                          ));
                    },
              child: const Text("letsWatch").tr(),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      )),
    );
  }
}
