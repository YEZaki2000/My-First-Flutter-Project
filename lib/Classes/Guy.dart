class Guy {
  late bool _needBj;

  Guy({required bool needBj}) {
    _needBj = needBj;
  }

  String _wouldYouLikeABj() {
    return _needBj ? "Yes." : "No.";
  }
}

// void main() {
Guy guy = Guy(needBj: true);
String hisAnswer = guy._wouldYouLikeABj();

String replyTo(String answer) {
  return answer == "Yes." ? "Text me." : "Your loss.";
}

String reply = replyTo(hisAnswer);
// }
