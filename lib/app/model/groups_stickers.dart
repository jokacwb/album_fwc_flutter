// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fwc_album/app/model/user_sticker_model.dart';

class GroupsStickers {
  final int id;
  final String cointryCode;
  final String countryName;
  final int stickersStart;
  final int stickersEnd;
  final List<UserStickerModel> stickers;
  final String flag;
  GroupsStickers({
    required this.id,
    required this.cointryCode,
    required this.countryName,
    required this.stickersStart,
    required this.stickersEnd,
    required this.stickers,
    required this.flag,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cointry_code': cointryCode,
      'country_name': countryName,
      'stickers_start': stickersStart,
      'stickers_end': stickersEnd,
      'stickers': stickers.map((x) => x.toMap()).toList(),
      'flag': flag,
    };
  }

  factory GroupsStickers.fromMap(Map<String, dynamic> map) {
    return GroupsStickers(
      id: map['id'] as int,
      cointryCode: map['cointry_code'] as String,
      countryName: map['country_name'] as String,
      stickersStart: map['stickers_start'] as int,
      stickersEnd: map['stickers_end'] as int,
      stickers: List<UserStickerModel>.from(
        (map['stickers'] as List<int>).map<UserStickerModel>(
          (x) => UserStickerModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      flag: map['flag'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupsStickers.fromJson(String source) => GroupsStickers.fromMap(json.decode(source) as Map<String, dynamic>);
}
