import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoon_model.dart';
import 'package:webtoon/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: makeList(snapshot),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Column(
          children: [
            SizedBox(
              width: 100,
              // child: CachedNetworkImage(
              //   imageUrl: webtoon.img,
              //   placeholder: (context, url) =>
              //       const CircularProgressIndicator(),
              // ),
              child: Image.network(webtoon.img),
            ),
            Text(webtoon.title),
            // Image.network()

            // Image.network(webtoon.img),
            // Image.network(webtoon.img),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
    );
  }
}
