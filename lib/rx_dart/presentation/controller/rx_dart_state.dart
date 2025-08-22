class RxDartState {
  final String title;
  final List<String> list;
  final bool isLoading;

  RxDartState({
    required this.title,
    required this.list,
    required this.isLoading,
  });

  RxDartState copyWith({String? title, List<String>? list, bool? isLoading}) {
    return RxDartState(
      title: title ?? this.title,
      list: list ?? this.list,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
