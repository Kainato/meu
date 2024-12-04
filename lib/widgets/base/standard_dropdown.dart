import 'package:flutter/material.dart';
import 'package:myapp/widgets/form/standard_text_form_field.dart';
import 'package:myapp/widgets/layout/standard_list_view.dart';
import 'package:myapp/widgets/page/standard_alert_dialog.dart';

class StandardDropdown extends StatelessWidget {
  final TextEditingController controller;

  const StandardDropdown({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return StandardTextFormField(
      label: '',
      hint: '',
      readOnly: true,
      suffixIcon: const Icon(Icons.arrow_drop_down_circle_outlined),
      controller: controller,
      onTap: () async {
        await showDialog(
          context: context,
          builder: (dialogcontext) {
            return StandardAlertDialog(
              title: 'Selecione',
              subtitle: 'Visualize os itens abaixo',
              content: const [
                Divider(),
                StandardListView(primary: true, children: []),
                Divider(),
              ],
              closeAction: TextButton(
                onPressed: () {},
                child: const Text('Ok'),
              ),
            );
          },
        );
      },
    );
  }
}
