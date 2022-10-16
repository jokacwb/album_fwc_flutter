import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class RegisterStickerModelDto {
  final String stickerCode;
  final String stickerName;
  final String stickerNumber;

  RegisterStickerModelDto({
    required this.stickerCode,
    required this.stickerName,
    required this.stickerNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sticker_code': stickerCode,
      'sticker_name': stickerName,
      'sticker_number': stickerNumber,
    };
  }

  factory RegisterStickerModelDto.fromMap(Map<String, dynamic> map) {
    return RegisterStickerModelDto(
      stickerCode: map['sticker_code'] as String,
      stickerName: map['sticker_name'] as String,
      stickerNumber: map['sticker_number'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterStickerModelDto.fromJson(String source) => RegisterStickerModelDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
