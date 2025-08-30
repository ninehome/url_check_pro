
import 'package:flutter/material.dart';


class SrImageWidget {

  static Widget pngImage(String path, {Size? size, Color? color, BoxFit? fit}) {
    String path1 = "assets/images/$path.png";
    return Image.asset(
      path1,
      width: size?.width,
      height: size?.height,
      color: color,
      fit: fit ?? BoxFit.cover,
    );
  }

  static Widget webpImage(String path, {Size? size, Color? color, BoxFit? fit}) {
    String path1 = "assets/images/$path.webp";
    return Image.asset(
      path1,
      width: size?.width,
      height: size?.height,
      color: color,
      fit: fit ?? BoxFit.cover,
    );
  }
}


