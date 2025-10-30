/// 오디오 코덱 타입
enum AudioCodec {
  aac('aac', 'AAC - 효율적, 범용적', false),
  alac('alac', 'ALAC - 무손실 압축', true),
  mp3('mp3', 'MP3 - 레거시 호환', false);

  const AudioCodec(this.value, this.description, this.isLossless);
  final String value;
  final String description;
  final bool isLossless;
}
