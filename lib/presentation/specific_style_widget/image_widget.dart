import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget getCustomCachedImage({
  required String url,
  required double width,
  required double height,
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