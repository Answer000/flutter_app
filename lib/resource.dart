import 'package:flutter/material.dart';

// enum ResourceType {
//   none,
//   image,
// }

class Resource {
  static ResourceImage image = ResourceImage();
}

class ResourceImage {

  ImageName imageName;
  // String get path => 'resource/${this.toString().split('.').last}@3x.png';
  // Image get assetImage => this.path.localImage;
}

extension String_extension on String {
  Image get localImage =>
      Image(image: AssetImage(this), fit: BoxFit.cover,);
}

extension ResourceExtension on ImageName {
  String get imagePath => 'resource/${this.toString().split('.').last}@3x.png';
  Image get assetImage => this.imagePath.localImage;
}

enum ImageName {
  cjm_tabbarIcon_fashionNormal,
  cjm_tabbarIcon_fashionSelected,
  cjm_tabbarIcon_homeNormal,
  cjm_tabbarIcon_homeSelected,
  cjm_tabbarIcon_nearbyNormal,
  cjm_tabbarIcon_nearbySelected,
  cjm_tabbarIcon_profileNormal,
  cjm_tabbarIcon_profileSelected,
  cjm_tabbarIcon_publish,
}