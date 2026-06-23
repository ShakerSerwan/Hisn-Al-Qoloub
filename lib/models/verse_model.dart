class Verse {
  final int index;
  final String text;
  final String? bismillah;

  Verse({
    required this.index,
    required this.text,
    this.bismillah,
  });

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
      index: json['index'],
      text: json['text'],
      bismillah: json['bismillah'],
    );
  }
}