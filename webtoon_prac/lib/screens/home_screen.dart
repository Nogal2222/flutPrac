import 'package:flutter/material.dart';
import 'package:webtoon_prac/models/webtoon_model.dart';
import 'package:webtoon_prac/servieces/api_service.dart';
import 'package:webtoon_prac/widgets/webtoon_widget.dart';

// stateful을 이용한 기초적인 방식의 Data 사용
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<WebtoonModel> webtoons = [];
//   bool isLoading = true;

//   void waitForWebToons() async {
//     webtoons = await ApiService.getTodaysToons();
//     isLoading = false;
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     waitForWebToons();
//   }

// FutureBuilder를 이용해서 Stateless로 간단히 구현할 수 있음.
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          // 데이터가 있을 때 UI
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  // child: makeList_builder(snapshot),
                  child: makeListSeperated(snapshot),
                ),
              ],
            );
          }
          // 에러가 발생했을 때 UI
          else if (snapshot.hasError) {
            return const Text("Error Occured");
          }
          // 데이터가 들어오기 전 UI
          return Container(
            color: Colors.black.withOpacity(0.3),
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            ),
          );
        },
      ),
    );
  }

  // 보이는 화면만 Build 할 수 있도록 하는 ListView (builder)
  ListView makeListBuilder(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Text(webtoon.title);
      },
    );
  }

  // 리스트 사이에 widget을 넣을 수 있는 ListView (seperated)
  ListView makeListSeperated(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        // 커스텀 컴포넌트 사용방법
        return WebtoonWidget(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
