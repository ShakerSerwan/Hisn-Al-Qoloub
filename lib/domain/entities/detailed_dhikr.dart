class DetailedDhikr {
  final String text;
  final String source;
  final int repeat;
  final bool hasBasmala;

  DetailedDhikr({
    required this.text,
    required this.source,
    required this.repeat,
    this.hasBasmala = false,
  });
}