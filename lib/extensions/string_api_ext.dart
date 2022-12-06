extension MyString on String {
  String toNameCase() {
    String word = this;
    String result = "";

    word = word.toLowerCase().trim();
    if (word.contains(" ")) {
      List<String> wordArr = [];
      List<String> words = word.split(" ");

      words.map(
        (String word) => wordArr.add(
          word.replaceFirst(
            word[0],
            word[0].toUpperCase(),
          ),
        ),
      );

      return wordArr.join(' ');
    }

    result = word.replaceFirst(word[0], word[0].toUpperCase());

    return result;
  }
}
