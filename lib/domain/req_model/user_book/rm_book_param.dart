class RemoveBookParam{
  final List<String> isbnList;

  const RemoveBookParam({required this.isbnList});

  Map<String,dynamic> toJson(){
    return {
      "isbn_list":isbnList,
    };
  }
}