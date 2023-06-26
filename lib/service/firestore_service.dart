import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static CollectionReference ticketsCollection =
      FirebaseFirestore.instance.collection("tickets");
  static CollectionReference seatsCollection =
      FirebaseFirestore.instance.collection("seats");
  static CollectionReference walletCollection =
      FirebaseFirestore.instance.collection("wallet");

  static Future<void> createTicket(
      String uid,
      int movieId,
      String seatNumber,
      String cinema,
      String date,
      int time,
      int ticketAmount,
      String movieTitle,
      String moviePoster,
      String? movieBackPoster,
      double movieVoteAverage,
      double price) async {
    await ticketsCollection.doc(uid).set({'dummy': 'dummy'});

    await ticketsCollection.doc(uid).collection("order").add({
      'movie': movieId,
      'seatNumber': seatNumber,
      'cinema': cinema,
      'date': date,
      'time': time,
      'ticketAmount': ticketAmount,
      'movieTitle': movieTitle,
      'moviePoster': moviePoster,
      'movieBackPoster': movieBackPoster,
      'movieVoteAverage': movieVoteAverage,
      'price': price
    });
  }

  static Future<void> createUpdateSeats(int movieId, String seats) async {
    await seatsCollection.doc(movieId.toString()).set({'seats': seats});
  }

  static Future<void> createUpdateWallet(String uid, double amount) async {
    await walletCollection
        .doc(uid)
        .set({'amount': amount}, SetOptions(merge: true));
  }
}
