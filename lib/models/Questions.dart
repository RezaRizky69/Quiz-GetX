class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "Flutter adalah open-source UI software development kit yang dibuat oleh ______",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "Kapan Google merilis Flutter?",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "Sebuah lokasi memori yang memuat satu huruf atau angka",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "Apa perintah untuk menampilkan output data ke layar?",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": 2,
  },
  {
    "id": 5,
    "question": "Apa tipe data untuk menangani kegiatan asynchronous?",
    "options": ['Int', 'String', 'Future', 'Double'],
    "answer_index": 2,
  },
  {
    "id": 6,
    "question": "Saat menggunakan async keyword, juga harus menggunakan?",
    "options": ['Await', 'Stream', 'Builder', 'Lateinit'],
    "answer_index": 0,
  },
  {
    "id": 7,
    "question": "Dimana tempat menambahkan dependencies?",
    "options": ['Main', 'Assets', 'Lib', 'Pubspec.yaml'],
    "answer_index": 3,
  },
  {
    "id": 8,
    "question": "Kelas yang digunakan untuk data class adalah?",
    "options": ['Controller', 'View', 'Model', 'UI'],
    "answer_index": 2,
  },
  {
    "id": 9,
    "question": "Widget untuk mengisi space yang tersisa adalah?",
    "options": ['Text', 'Spacer', 'Column', 'Expanded'],
    "answer_index": 3,
  },
  {
    "id": 10,
    "question": "Untuk menguasai Flutter maka harus?",
    "options": ['Belajar', 'Tidur', 'Makan', 'Terserah'],
    "answer_index": 0,
  },
];