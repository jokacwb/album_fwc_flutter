import 'package:flutter/material.dart';
import 'package:fwc_album/app/pages/my_stickers/widgets/sticker_group.dart';
import 'package:fwc_album/app/pages/my_stickers/widgets/stickers_group_filter.dart';
import 'widgets/stikers_status_filter.dart';

class MyStickersPage extends StatelessWidget {
  const MyStickersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Figurinhas'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: const [
                StikersStatusFilter(
                  filterSeleted: '',
                ),
                StickersGroupFilter(),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const StickerGroup();
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
