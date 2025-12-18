import 'package:get/get.dart';
import '../../data/model/home_model.dart';

class HomeController extends GetxController {
  final userName = 'Madiha Arqa'.obs;
  final quizzes = <QuizModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyData();
  }

  void loadDummyData() {
    quizzes.assignAll([
      QuizModel(
        title: 'Serving & Receiving Quiz',
        questions: 5,
        tag: 'Most Popular',
        image: 'assets/images/quiz1_icon.png',
      ),
      QuizModel(
        title: 'Serving & Foot Faults Quiz',
        questions: 8,
        tag: 'Most Popular',
        image: 'assets/images/quiz2_Icon.png',
      ),
      QuizModel(
        title: 'Hindrances: All About the Ball',
        questions: 5,
        tag: 'Newest Quiz',
        image: 'assets/images/quiz3_Icon.png',
      ),
      QuizModel(
        title: 'Hindrances: Those Opponents',
        questions: 7,
        tag: 'Newest Quiz',
        image: 'assets/images/quiz4_Icon.png',
      ),
    ]);
  }
}
