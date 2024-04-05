int calculateReadingTime(String content) {
  int wordCount = content.split(RegExp('/s+')).length;
  return (wordCount / 225).ceil();
}
