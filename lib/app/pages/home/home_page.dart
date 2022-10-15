import 'package:flutter/material.dart';
import 'package:fwc_album/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album/app/core/ui/widgets/button.dart';
import 'package:fwc_album/app/pages/home/presenter/home_presenter.dart';
import 'package:fwc_album/app/pages/home/view/home_view_impl.dart';
import 'package:fwc_album/app/pages/home/widgets/status_tile.dart';
import 'package:fwc_album/app/pages/home/widgets/sticker_percent.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;

  const HomePage({super.key, required this.presenter});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomeViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.colors.primary,
        actions: [
          IconButton(
            onPressed: () => widget.presenter.logout(),
            icon: const Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/background.png'), fit: BoxFit.cover),
        ),
        child: LayoutBuilder(
          builder: (_, constrains) {
            return ConstrainedBox(
              constraints: BoxConstraints(maxHeight: constrains.maxHeight),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 35),
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'assets/images/bola.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      StickerPercent(percent: userModel?.totalCompletePercent ?? 0),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${userModel?.totalStickers ?? 0} figurinhas',
                        style: context.textStyles.titleWhite,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      StatusTile(icon: Image.asset('assets/images/all_icon.png'), label: 'Todas', value: userModel?.totalAlbum ?? 0),
                      const SizedBox(
                        height: 20,
                      ),
                      StatusTile(icon: Image.asset('assets/images/missing_icon.png'), label: 'Faltando', value: userModel?.totalComplete ?? 0),
                      const SizedBox(
                        height: 20,
                      ),
                      StatusTile(icon: Image.asset('assets/images/repeated_icon.png'), label: 'Repetidas', value: userModel?.totalDuplicates ?? 0),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonCustom(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/mystickers');
                          },
                          width: MediaQuery.of(context).size.width * .9,
                          outLine: true,
                          style: context.buttonStyles.yellowOutLineButton,
                          labelStyle: context.textStyles.textSecondaryExtraBold.copyWith(
                            color: context.colors.yellow,
                          ),
                          label: 'Minhas Figurinhas')
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
