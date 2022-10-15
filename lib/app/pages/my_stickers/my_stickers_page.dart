import 'package:flutter/material.dart';
import 'package:fwc_album/app/pages/my_stickers/presenter/my_stickers_presenter.dart';
import 'package:fwc_album/app/pages/my_stickers/view/my_stikers_view_impl.dart';
import 'package:fwc_album/app/pages/my_stickers/widgets/stickers_group.dart';
import 'package:fwc_album/app/pages/my_stickers/widgets/stickers_group_filter.dart';
import 'widgets/stikers_status_filter.dart';

class MyStickersPage extends StatefulWidget {
  //declara a interface (mesmo padrão do java)
  final MyStickersPresenter presenter;

  const MyStickersPage({super.key, required this.presenter});

  @override
  State<MyStickersPage> createState() => _MyStickersPageState();
}

class _MyStickersPageState extends MyStickersViewImpl {
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
              children: [
                StikersStatusFilter(
                  //a variavel abaixo "statusFilter" vem da classe superior MyStickersViewImpl
                  filterSeleted: statusFilter,
                ),
                StickersGroupFilter(countries: countries),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final group = album[index];
                return StickersGroup(
                  group: group,
                  statusfilter: statusFilter,
                );
              },
              childCount: album.length,
            ),
          ),
        ],
      ),
    );
  }
}
