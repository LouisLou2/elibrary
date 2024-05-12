import 'book_info.dart';

/*Owner和Book类不与数据库以及服务端交互，只为了客户端编程的方便*/
class Owner{
  final int id;
  final List<String> locations;
  const Owner({
    required this.id,
    required this.locations,
  });
  String get libName=> 'Unset';
}
class Book{
  BookInfo bookInfo;
  List<Owner>? owners;
  Book({
    required this.bookInfo,
    this.owners,
  });
  // setter
  void addOwner(Owner owner){
    owners ??= [];
    owners!.add(owner);
  }
  void removeOwner(Owner owner){
    owners?.remove(owner);
  }
}
/*对于一个isbn*/
// [
//   {
//     id: 1,
//     location:[
//       'AXIE 1045',
//       'FGTY 7890'
//     ]
//   },
//   {
//   id: 2,
//   location:[
//     'AXIE 1045',
//     'FGTY 7890'
//     ]
//   },
// ]