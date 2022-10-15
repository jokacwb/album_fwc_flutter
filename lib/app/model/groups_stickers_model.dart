// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'user_sticker_model.dart';

class GroupsStickersModel {
  final int id;
  final String countryCode;
  final String countryName;
  final int stickersStart;
  final int stickersEnd;
  final List<UserStickerModel> stickers;
  final String flag;
  GroupsStickersModel({
    required this.id,
    required this.countryCode,
    required this.countryName,
    required this.stickersStart,
    required this.stickersEnd,
    required this.stickers,
    required this.flag,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'country_code': countryCode,
      'country_name': countryName,
      'stickers_start': stickersStart,
      'stickers_end': stickersEnd,
      'stickers': stickers.map((x) => x.toMap()).toList(),
      'flag': flag,
    };
  }

  factory GroupsStickersModel.fromMap(Map<String, dynamic> map) {
    return GroupsStickersModel(
      id: map['id']?.toInt() ?? 0,
      countryCode: map['country_code'] ?? '',
      countryName: map['country_name'] ?? '',
      stickersStart: map['stickers_start']?.toInt() ?? 0,
      stickersEnd: map['stickers_end']?.toInt() ?? 0,
      stickers: List<UserStickerModel>.from(
        (map['stickers'] as List<dynamic>).map<UserStickerModel>(
          (x) => UserStickerModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      flag: map['flag'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupsStickersModel.fromJson(String source) => GroupsStickersModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
