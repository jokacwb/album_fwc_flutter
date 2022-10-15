import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album/app/pages/my_stickers/presenter/my_stickers_presenter.dart';

class StickersGroupFilter extends StatefulWidget {
  final Map<String, String> countries;
  const StickersGroupFilter({super.key, required this.countries});

  @override
  State<StickersGroupFilter> createState() => _StickersGroupFilterState();
}

class _StickersGroupFilterState extends State<StickersGroupFilter> {
  List<String>? filterValues = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SmartSelect<String>.multiple(
        title: 'Filtro',
        tileBuilder: (context, state) {
          return InkWell(
            onTap: state.showModal,
            child: _StikersGroupTile(
              label: state.selected.title?.join(', ') ?? 'Filtro',
              clearCallBack: () {
                setState(() {
                  filterValues = null;
                  context.get<MyStickersPresenter>().countryFilter(filterValues);
                });
              },
            ),
          );
        },
        selectedValue: filterValues ?? [],
        onChange: (contriesSelected) {
          setState(() {
            filterValues = contriesSelected.value;
          });
          context.get<MyStickersPresenter>().countryFilter(filterValues);
        },
        choiceItems: S2Choice.listFrom(
          source: widget.countries.entries.map((e) => {'value': e.key, 'title': e.value}).toList(),
          value: (_, item) => item['value'] ?? '',
          title: (_, item) => item['title'] ?? '',
        ),
        choiceType: S2ChoiceType.switches,
        modalType: S2ModalType.bottomSheet,
        choiceGrouped: true,
        modalFilter: false,
        placeholder: '',
      ),
    );
  }
}

class _StikersGroupTile extends StatelessWidget {
  final String label;
  final VoidCallback clearCallBack;

  const _StikersGroupTile({
    required this.label,
    required this.clearCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: const Color(0XFFF0F0F0), borderRadius: BorderRadius.circular(20)),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Icon(Icons.filter_list),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                label,
                style: context.textStyles.textSecondaryFontRegular.copyWith(fontSize: 14),
              ),
            ),
            InkWell(
              onTap: clearCallBack,
              child: const Icon(Icons.clear),
            )
          ],
        ),
      ),
    );
  }
}
