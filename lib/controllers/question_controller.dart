import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:flutter_quiz/models/Questions.dart';
import 'package:flutter_quiz/screens/score/score_screen.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  // inisialisasi komponen yang dibutuhkan

  // controller yang menghandle animasi
  AnimationController _animationController;

  // inisialisasi untuk animasi
  Animation _animation;
  Animation get animation => _animation;

  // controller yang menghandle halaman
  PageController _pageController;
  PageController get pageController => this._pageController;

  // mapping dari list model menjadi list baru yang akan digunakan
  // di class question controller ini
  List<Question> _questions = sample_data
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();
  List<Question> get questions => this._questions;

  // apakah sudah dijawab?
  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  // jawaban benar
  int _correctAns;
  int get correctAns => this._correctAns;

  // jawaban yang terpilih
  int _selectedAns;
  int get selectedAns => this._selectedAns;

  // jumlah jawaban benar
  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  // nomor pertanyaan yang di observasi dengan keyword 'obs'
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  // fungsi yang dijalankan pertama kali
  @override
  void onInit() {
    // memulai animasi dengan durasi 60 detik
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // semacam setstate pada package getX
        update();
      });

    // ketika animasi selesai, lanjut ke pertanyaan selanjutnya
    _animationController.forward().whenComplete(nextQuestion);

    _pageController = PageController();

    super.onInit();
  }

  // fungsi yang dijalankan untuk menutup semua aktivitas
  @override
  void onClose() {
    _animationController.dispose();
    _pageController.dispose();
    super.onClose();
  }

  // fungsi untuk mengecek pertanyaan
  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    // jika jawaban yang dipilih benar, maka akan menambah jumlah jawaban benar
    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    // maka akan menghentikan animasi
    _animationController.stop();
    update();

    // dan melanjutkan ke pertanyaan selanjutnya dengan durasi 3 detik
    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  // fungsi untuk menjalankan pertanyan selanjutnya
  void nextQuestion() {
    // jika nilai nomor pertanyaan sudah tidak sama dengan panjangnya pertanyaan
    // maka
    if (_questionNumber.value != _questions.length) {
      // kondisi apakah sudah di jawab otomatis false
      _isAnswered = false;
      // controller halaman melakukan pindah halaman berikutnya
      _pageController.nextPage(
          // dengan durasi 250 ms dan animasi ease
          duration: Duration(milliseconds: 250),
          curve: Curves.ease);
      // controller animasi di reset
      _animationController.reset();
      // ketika animasi selesai, lanjut ke pertanyaan selanjutnya
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      // perintah untuk navigasi menggunakan package getX
      Get.to(ScoreScreen());
    }
  }

  // fungsi yang dijalankan untuk mengupdate nomor pertanyaan
  void updateQuestionNum(int index) {
    _questionNumber.value = index + 1;
  }
}
