import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:fwc_album/app/core/ui/styles/text_styles.dart';

class StickersGroupFilter extends StatefulWidget {
  const StickersGroupFilter({super.key});

  @override
  State<StickersGroupFilter> createState() => _StickersGroupFilterState();
}

class _StickersGroupFilterState extends State<StickersGroupFilter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SmartSelect.multiple(
        title: 'Filtro',
        tileBuilder: (context, state) {
          return InkWell(
            onTap: state.showModal,
            child: _StikersGroupTile(
              label: state.selected.title?.join(', ') ?? 'Filtro',
            ),
          );
        },
        onChange: (value) {},
        choiceItems: S2Choice.listFrom(
          source: [
            {'value': 'BRA', 'title': 'Brasil'},
            {'value': 'ARG', 'title': 'Argentina'},
            {'value': 'FWC', 'title': 'Fifa World Cup'},
          ],
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

  const _StikersGroupTile({
    Key? key,
    required this.label,
  }) : super(key: key);

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
            Text(
              label,
              style: context.textStyles.textSecondaryFontRegular.copyWith(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
