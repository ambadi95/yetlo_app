// To parse this JSON data, do
//
//     final frameListResponse = frameListResponseFromMap(jsonString);

import 'dart:convert';

FrameListResponse frameListResponseFromMap(String str) => FrameListResponse.fromMap(json.decode(str));

String frameListResponseToMap(FrameListResponse data) => json.encode(data.toMap());

class FrameListResponse {
  final bool? success;
  final int? code;
  final String? message;
  final List<Re>? res;

  FrameListResponse({
    this.success,
    this.code,
    this.message,
    this.res,
  });

  factory FrameListResponse.fromMap(Map<String, dynamic> json) => FrameListResponse(
    success: json["success"],
    code: json["code"],
    message: json["message"],
    res: json["res"] == null ? [] : List<Re>.from(json["res"]!.map((x) => Re.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "code": code,
    "message": message,
    "res": res == null ? [] : List<dynamic>.from(res!.map((x) => x.toMap())),
  };
}

class Re {
  final int? framesId;
  final String? frameName;
  final String? img;
  final String? customerNameHeight;
  final String? customerNameWidth;
  final String? bussinessMarginLeft;
  final String? bussinessMarginRight;
  final String? bussinessPaddingLeft;
  final String? bussinessPaddingRight;
  final String? bussinessNameHeight;
  final String? bussinessNameWidth;
  final String? mobileHeight;
  final String? mobileWidth;
  final String? mobileMarginLeft;
  final String? mobileMarginRight;
  final String? mobilePaddingLeft;
  final String? mobilePaddingRight;
  final String? websiteHeight;
  final String? websiteWidth;
  final String? websiteMarginLeft;
  final String? websiteMarginRight;
  final String? websitePaddingLeft;
  final String? websitePaddingRight;
  final String? logoHeight;
  final String? logoWidth;
  final String? actualFrameSize;
  final Status? status;
  final DateTime? createdDate;
  final DateTime? updatedDate;
  final String? emailHeight;
  final String? emailWidth;
  final String? emailMarginLeft;
  final String? emailMarginRight;
  final String? emailPaddingLeft;
  final String? emailPaddingRight;
  final String? addressHeight;
  final String? addressWidth;
  final String? addressMarginLeft;
  final String? addressMarginRight;
  final String? addressPaddingLeft;
  final String? addressPaddingRight;
  final String? iconSize;
  final String? mobile;
  final String? website;
  final String? email;
  final String? location;

  Re({
    this.framesId,
    this.frameName,
    this.img,
    this.customerNameHeight,
    this.customerNameWidth,
    this.bussinessMarginLeft,
    this.bussinessMarginRight,
    this.bussinessPaddingLeft,
    this.bussinessPaddingRight,
    this.bussinessNameHeight,
    this.bussinessNameWidth,
    this.mobileHeight,
    this.mobileWidth,
    this.mobileMarginLeft,
    this.mobileMarginRight,
    this.mobilePaddingLeft,
    this.mobilePaddingRight,
    this.websiteHeight,
    this.websiteWidth,
    this.websiteMarginLeft,
    this.websiteMarginRight,
    this.websitePaddingLeft,
    this.websitePaddingRight,
    this.logoHeight,
    this.logoWidth,
    this.actualFrameSize,
    this.status,
    this.createdDate,
    this.updatedDate,
    this.emailHeight,
    this.emailWidth,
    this.emailMarginLeft,
    this.emailMarginRight,
    this.emailPaddingLeft,
    this.emailPaddingRight,
    this.addressHeight,
    this.addressWidth,
    this.addressMarginLeft,
    this.addressMarginRight,
    this.addressPaddingLeft,
    this.addressPaddingRight,
    this.iconSize,
    this.mobile,
    this.website,
    this.email,
    this.location,
  });

  factory Re.fromMap(Map<String, dynamic> json) => Re(
    framesId: json["frames_id"],
    frameName: json["frame_name"],
    img: json["img"],
    customerNameHeight: json["customer_name_height"],
    customerNameWidth: json["customer_name_width"],
    bussinessMarginLeft: json["bussiness_margin_left"],
    bussinessMarginRight: json["bussiness_margin_right"],
    bussinessPaddingLeft: json["bussiness_padding_left"],
    bussinessPaddingRight: json["bussiness_padding_right"],
    bussinessNameHeight: json["bussiness_name_height"],
    bussinessNameWidth: json["bussiness_name_width"],
    mobileHeight: json["mobile_height"],
    mobileWidth: json["mobile_width"],
    mobileMarginLeft: json["mobile_margin_left"],
    mobileMarginRight: json["mobile_margin_right"],
    mobilePaddingLeft: json["mobile_padding_left"],
    mobilePaddingRight: json["mobile_padding_right"],
    websiteHeight: json["website_height"],
    websiteWidth: json["website_width"],
    websiteMarginLeft: json["website_margin_left"],
    websiteMarginRight: json["website_margin_right"],
    websitePaddingLeft: json["website_padding_left"],
    websitePaddingRight: json["website_padding_right"],
    logoHeight: json["logo_height"],
    logoWidth: json["logo_width"],
    actualFrameSize: json["actual_frame_size"],
    status: statusValues.map[json["status"]]!,
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    updatedDate: json["updated_date"] == null ? null : DateTime.parse(json["updated_date"]),
    emailHeight: json["email_height"],
    emailWidth: json["email_width"],
    emailMarginLeft: json["email_margin_left"],
    emailMarginRight: json["email_margin_right"],
    emailPaddingLeft: json["email_padding_left"],
    emailPaddingRight: json["email_padding_right"],
    addressHeight: json["address_height"],
    addressWidth: json["address_width"],
    addressMarginLeft: json["address_margin_left"],
    addressMarginRight: json["address_margin_right"],
    addressPaddingLeft: json["address_padding_left"],
    addressPaddingRight: json["address_padding_right"],
    iconSize: json["icon_size"],
    mobile: json["mobile"],
    website: json["website"],
    email: json["email"],
    location: json["location"],
  );

  Map<String, dynamic> toMap() => {
    "frames_id": framesId,
    "frame_name": frameName,
    "img": img,
    "customer_name_height": customerNameHeight,
    "customer_name_width": customerNameWidth,
    "bussiness_margin_left": bussinessMarginLeft,
    "bussiness_margin_right": bussinessMarginRight,
    "bussiness_padding_left": bussinessPaddingLeft,
    "bussiness_padding_right": bussinessPaddingRight,
    "bussiness_name_height": bussinessNameHeight,
    "bussiness_name_width": bussinessNameWidth,
    "mobile_height": mobileHeight,
    "mobile_width": mobileWidth,
    "mobile_margin_left": mobileMarginLeft,
    "mobile_margin_right": mobileMarginRight,
    "mobile_padding_left": mobilePaddingLeft,
    "mobile_padding_right": mobilePaddingRight,
    "website_height": websiteHeight,
    "website_width": websiteWidth,
    "website_margin_left": websiteMarginLeft,
    "website_margin_right": websiteMarginRight,
    "website_padding_left": websitePaddingLeft,
    "website_padding_right": websitePaddingRight,
    "logo_height": logoHeight,
    "logo_width": logoWidth,
    "actual_frame_size": actualFrameSize,
    "status": statusValues.reverse[status],
    "created_date": createdDate?.toIso8601String(),
    "updated_date": updatedDate?.toIso8601String(),
    "email_height": emailHeight,
    "email_width": emailWidth,
    "email_margin_left": emailMarginLeft,
    "email_margin_right": emailMarginRight,
    "email_padding_left": emailPaddingLeft,
    "email_padding_right": emailPaddingRight,
    "address_height": addressHeight,
    "address_width": addressWidth,
    "address_margin_left": addressMarginLeft,
    "address_margin_right": addressMarginRight,
    "address_padding_left": addressPaddingLeft,
    "address_padding_right": addressPaddingRight,
    "icon_size": iconSize,
    "mobile": mobile,
    "website": website,
    "email": email,
    "location": location,
  };
}

enum Status {
  A
}

final statusValues = EnumValues({
  "A": Status.A
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
