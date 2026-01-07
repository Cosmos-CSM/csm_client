/// {model} class.
///
/// Defines an options data model class to specify how [Pagination] widget will draw an behave.
final class PaginationData {
  /// Current data page.
  final int page;

  /// Actual total of available data pages.
  final int pages;

  /// Items range per page.
  final int range;

  /// Available ranges selection.
  final List<int> ranges;

  /// Actual quanity of items calcualted for this page.
  final int pageCount;

  /// Actual total quantity of items withouth paging.
  final int total;

  /// Creates a new [PaginationData] instance.
  PaginationData({
    required this.range,
    required this.page,
    required this.pages,
    required this.ranges,
    required this.total,
    required this.pageCount,
  });

  ///
  PaginationData clone({
    int? page,
    int? pages,
    int? range,
    List<int>? ranges,
    int? pageCount,
    int? total,
  }) {
    return PaginationData(
      range: range ?? this.range,
      page: page ?? this.page,
      pages: pages ?? this.pages,
      ranges: ranges ?? this.ranges,
      total: total ?? this.total,
      pageCount: pageCount ?? this.pageCount,
    );
  }
}
