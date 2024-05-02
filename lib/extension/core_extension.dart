import 'package:flutter/cupertino.dart';

extension ListExtension on List {
  static List<T> separate<T>(int len, T Function(int) generator,T Function(int) separatorGenerator){
    assert(len>=0);
    List<T> res=[];
    for(int i=0;i<len-1;++i){
      res.add(generator(i));
      res.add(separatorGenerator(i));
    }
    if(len>=1){
      res.add(generator(len-1));
    }
    return res;
  }
}