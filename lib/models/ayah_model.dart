class Ayah {
  final int index;
  final String text;
  final String? bismillah;

  Ayah({
    required this.index,
    required this.text,
    this.bismillah,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) {
    return Ayah(
      index: json['index'],
      text: json['text'],
      bismillah: json['bismillah'],
    );
  }
}