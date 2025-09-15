class RxDartState {
  final String title;
  final List<String> list;
  final bool isLoading;
  final List<String> searchList;

  RxDartState({
    required this.title,
    required this.list,
    required this.isLoading,
    required this.searchList,
  });

  RxDartState copyWith({
    String? title,
    List<String>? list,
    bool? isLoading,
    List<String>? searchList,
  }) {
    return RxDartState(
      title: title ?? this.title,
      list: list ?? this.list,
      isLoading: isLoading ?? this.isLoading,
      searchList: searchList ?? this.searchList,
    );
  }
}
