import 'package:flutter_iknow_tennis/core/base/base_controller.dart';
import 'package:flutter_iknow_tennis/features/Home/data/model/quiz_category_response_model.dart';
import 'package:flutter_iknow_tennis/features/Home/domain/home_repo.dart';
import 'package:get/get.dart';
import '../../data/model/quiz_response_model.dart';

class HomeController extends BaseController {
  final HomeRepository _homeRepository;
  // final userName = 'Madiha Arqa'.obs;

  HomeController(this._homeRepository);
  // final quizzes = Rx<QuizResponseModel?>(null);
  

final quizzes = RxList<QuizResponseModel>([]);
final quizCat = RxList<QuizCategoryResponse>([]);



  @override
  void onInit() {
    super.onInit();
    // loadDummyData();
  }
Future<void> fetchAllQuizzes() async {
  setLoading(true);

  final result = await _homeRepository.getAllQuiz();

  result.fold(
    (fail) {
      setError(fail.message);
      setLoading(false);
    },
    (success) {
      // success.data should be List<QuizResponseModel>
      quizzes.assignAll(success.data ?? []); 
      setLoading(false);
    },
  );
}

Future<void> fetchCategories() async {
  setLoading(true);

  final result = await _homeRepository.getAllQuizCat();

  result.fold(
    (fail) {
      setError(fail.message);
      setLoading(false);
    },
    (success) {
      // success.data should be List<QuizResponseModel>
      quizCat.assignAll(success.data ?? []); 
      setLoading(false);
    },
  );
}


  // void loadDummyData() {
  //   quizzes.assignAll([
  //     // QuizModel(
  //     //   title: 'Serving & Receiving Quiz',
  //     //   questions: 5,
  //     //   tag: 'Most Popular',
  //     //   image: 'assets/images/quiz1_icon.png',
  //     // ),
  //     // QuizModel(
  //     //   title: 'Serving & Foot Faults Quiz',
  //     //   questions: 8,
  //     //   tag: 'Most Popular',
  //     //   image: 'assets/images/quiz2_Icon.png',
  //     // ),
  //     // QuizModel(
  //     //   title: 'Hindrances: All About the Ball',
  //     //   questions: 5,
  //     //   tag: 'Newest Quiz',
  //     //   image: 'assets/images/quiz3_Icon.png',
  //     // ),
  //     // QuizModel(
  //     //   title: 'Hindrances: Those Opponents',
  //     //   questions: 7,
  //     //   tag: 'Newest Quiz',
  //     //   image: 'assets/images/quiz4_Icon.png',
  //     // ),
  //   ]);
  // }
}
