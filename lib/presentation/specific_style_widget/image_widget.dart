import 'package:cached_network_image/cached_network_image.dart';
import 'package:elibrary/constant/app_transaction_param.dart';
import 'package:flutter/material.dart';

Widget getCustomCachedImage({
  required String url,
  double? width,
  double? height,
}){
  return CachedNetworkImage(
    imageUrl: url,
    fit: BoxFit.cover,
    width: width,
    height: height,
    placeholder: (context, url) => const Center(
      child: CircularProgressIndicator(),
    ),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}

Widget getCustomFadeInImage({
  required String url,
  double? width,
  double? height,
}){
  return FadeInImage.assetNetwork(
    fadeInDuration: const Duration(milliseconds: 150),
    fadeOutDuration: const Duration(milliseconds: 150),
    placeholder: UIConst.defImageHolder,
    image: url,
    fit: BoxFit.cover,
    width: width,
    height: height,
  );
}