import 'package:equatable/equatable.dart';

class Property extends Equatable {
  final int? buildingId;
  final int? developerId;
  final int? areaId;
  final int? seq;
  final String? buildingName;
  final String? areaName;
  final String? developerName;
  final int? totalViews;
  final int? startingPrice;
  final String? developerImage;
  final String? coordinates;
  final List<Images>? images;
  final String? buildingLaunchDate;
  final String? buildingCompletionDate;
  final dynamic buildingCompletionPercent;
  final String? hasOffer;
  final String? isSavedBuilding;
  final String? isFollowedBuilding;
  final String? shareUrl;

  Property({
    this.buildingId,
    this.developerId,
    this.areaId,
    this.seq,
    this.buildingName,
    this.areaName,
    this.developerName,
    this.totalViews,
    this.startingPrice,
    this.developerImage,
    this.coordinates,
    this.images,
    this.buildingLaunchDate,
    this.buildingCompletionDate,
    this.buildingCompletionPercent,
    this.hasOffer,
    this.isSavedBuilding,
    this.isFollowedBuilding,
    this.shareUrl,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    var imagesList = json['images'] as List?;
    List<Images>? images;
    if (imagesList != null) {
      images = imagesList.map((item) => Images.fromJson(item)).toList();
    }

    return Property(
      buildingId: json['building_id'],
      developerId: json['developer_id'],
      areaId: json['area_id'],
      seq: json['seq'],
      buildingName: json['building_name'],
      areaName: json['area_name'],
      developerName: json['developer_name'],
      totalViews: json['total_views'],
      startingPrice: json['starting_price'],
      developerImage: json['developer_image'],
      coordinates: json['coordinates'],
      images: images,
      buildingLaunchDate: json['building_launch_date'],
      buildingCompletionDate: json['building_completion_date'],
      buildingCompletionPercent: json['building_completion_percent'],
      hasOffer: json['has_offer'],
      isSavedBuilding: json['is_saved_building'],
      isFollowedBuilding: json['is_followed_building'],
      shareUrl: json['share_url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['building_id'] = buildingId;
    data['developer_id'] = developerId;
    data['area_id'] = areaId;
    data['seq'] = seq;
    data['building_name'] = buildingName;
    data['area_name'] = areaName;
    data['developer_name'] = developerName;
    data['total_views'] = totalViews;
    data['starting_price'] = startingPrice;
    data['developer_image'] = developerImage;
    data['coordinates'] = coordinates;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['building_launch_date'] = buildingLaunchDate;
    data['building_completion_date'] = buildingCompletionDate;
    data['building_completion_percent'] = buildingCompletionPercent;
    data['has_offer'] = hasOffer;
    data['is_saved_building'] = isSavedBuilding;
    data['is_followed_building'] = isFollowedBuilding;
    data['share_url'] = shareUrl;
    return data;
  }

  @override
  List<Object?> get props => [
        buildingId,
        developerId,
        areaId,
        seq,
        buildingName,
        areaName,
        developerName,
        totalViews,
        startingPrice,
        developerImage,
        coordinates,
        images,
        buildingLaunchDate,
        buildingCompletionDate,
        buildingCompletionPercent,
        hasOffer,
        isSavedBuilding,
        isFollowedBuilding,
        shareUrl,
      ];
}

class Images extends Equatable {
  final int? imageId;
  final String? imageUrl;

  Images({this.imageId, this.imageUrl});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      imageId: json['image_id'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_id'] = imageId;
    data['image_url'] = imageUrl;
    return data;
  }

  @override
  List<Object?> get props => [imageId, imageUrl];
}
