/// 비디오 코덱 타입
enum VideoCodec {
  h264('h264', 'H.264/AVC - 범용 호환성'),
  h265('h265', 'H.265/HEVC - 높은 압축률'),
  hevc('hevc', 'H.265/HEVC - 높은 압축률');

  const VideoCodec(this.value, this.description);
  final String value;
  final String description;
}
