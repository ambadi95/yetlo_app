// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromMap(jsonString);

import 'dart:convert';

ProfileResponse profileResponseFromMap(String str) => ProfileResponse.fromMap(json.decode(str));

String profileResponseToMap(ProfileResponse data) => json.encode(data.toMap());

class ProfileResponse {
    final bool? success;
    final int? code;
    final String? message;
    final List<Re>? res;

    ProfileResponse({
        this.success,
        this.code,
        this.message,
        this.res,
    });

    factory ProfileResponse.fromMap(Map<String, dynamic> json) => ProfileResponse(
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
    final int? id;
    final int? customerId;
    final String? category;
    final String? businessName;
    final String? phone;
    final String? email;
    final String? website;
    final dynamic state;
    final dynamic city;
    final dynamic instagram;
    final dynamic facebook;
    final dynamic youtube;
    final dynamic linkedin;
    final dynamic twitter;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? image;
    final String? status;
    final String? whatsapp;
    final String? address;

    Re({
        this.id,
        this.customerId,
        this.category,
        this.businessName,
        this.phone,
        this.email,
        this.website,
        this.state,
        this.city,
        this.instagram,
        this.facebook,
        this.youtube,
        this.linkedin,
        this.twitter,
        this.createdAt,
        this.updatedAt,
        this.image,
        this.status,
        this.whatsapp,
        this.address,
    });

    factory Re.fromMap(Map<String, dynamic> json) => Re(
        id: json["id"],
        customerId: json["customer_id"],
        category: json["category"],
        businessName: json["business_name"],
        phone: json["phone"],
        email: json["email"],
        website: json["website"],
        state: json["state"],
        city: json["city"],
        instagram: json["instagram"],
        facebook: json["facebook"],
        youtube: json["youtube"],
        linkedin: json["linkedin"],
        twitter: json["twitter"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        image: json["image"],
        status: json["status"],
        whatsapp: json["whatsapp"],
        address: json["address"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "customer_id": customerId,
        "category": category,
        "business_name": businessName,
        "phone": phone,
        "email": email,
        "website": website,
        "state": state,
        "city": city,
        "instagram": instagram,
        "facebook": facebook,
        "youtube": youtube,
        "linkedin": linkedin,
        "twitter": twitter,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image": image,
        "status": status,
        "whatsapp": whatsapp,
        "address": address,
    };
}
