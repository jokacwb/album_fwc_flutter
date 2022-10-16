abstract class StickerDetailView {
  void screenLoaded(
    bool hasSticker,
    String countryCode,
    String stickerNumber,
    String countryName,
    int amount,
  );

  void updateAmount(int i);

  //está declarado aqui esse metodo, para podermos ter acesso na presenter,
  //porem não há encessidade de implementar na stickers_detail_view_impl, pq o mixin Loader vai fazer o trabalho sujo
  void showLoader();

  void saveSuccess();

  void error(String s);
}
