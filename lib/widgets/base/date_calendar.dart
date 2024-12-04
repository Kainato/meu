// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:myapp/core/extension/date_time_extension.dart';
import 'package:myapp/widgets/form/standard_text_form_field.dart';

class DateCalendar extends StatelessWidget {
  /// É a data que será inicialmente selecionada quando o calendário for aberto.
  /// Ela não pode ser posterior à `lastDate` ou anterior à `firstDate`.
  final DateTime? initialDate;

  /// `firstDate` é a data inicial do calendário. Ela não pode ser
  /// posterior à `lastDate` ou anterior à `initialDate`.
  final DateTime? firstDate;

  /// `lastDate` é a data final do calendário. Ela não pode ser
  /// anterior à `firstDate` ou posterior à `initialDate`.
  final DateTime? lastDate;

  /// Representa a data atual no contexto do calendário.
  /// Pode ser usada para destacar a data atual no calendário, geralmente com um estilo diferente.
  /// Ela não pode ser anterior à `firstDate` ou posterior à `lastDate`.
  final DateTime? currentDate;

  /// `initialEntryMode` é o modo de entrada inicial do calendário.
  /// Pode ser `DatePickerEntryMode.calendar` ou `DatePickerEntryMode.input`.
  final DatePickerEntryMode initialEntryMode;

  /// `initialCalendarMode` é o modo de calendário inicial.
  /// Pode ser `DatePickerMode.day`, `DatePickerMode.year` ou `DatePickerMode.month`.
  final DatePickerMode initialCalendarMode;

  /// Cria um calendário de data. O calendário de data é um widget que permite
  /// ao usuário selecionar uma data de um calendário.
  ///
  /// ### Parâmetros
  /// - `initialDate`: data inicial do calendário.
  /// - `firstDate`: data inicial do calendário.
  /// - `lastDate`: data final do calendário.
  /// - `currentDate`: data atual do calendário.
  /// - `initialEntryMode`: modo de entrada inicial do calendário.
  /// - `initialDatePickerMode`: modo de calendário inicial.
  /// - `onDatePickerModeChange`: função que é chamada quando o modo de calendário é alterado.
  ///
  /// ### Extras
  /// - `dialog`: método que exibe um diálogo de calendário.
  const DateCalendar({
    super.key,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.currentDate,
    this.initialEntryMode = DatePickerEntryMode.calendarOnly,
    this.initialCalendarMode = DatePickerMode.day,
  });

  /// Exibe um diálogo de calendário. O diálogo de calendário é um diálogo que
  /// permite ao usuário selecionar uma data de um calendário.
  ///
  /// Retorna a data selecionada pelo usuário, recomendamos que a variável que
  /// receberá o retorno seja a `initialDate` do tipo `DateTime?`.
  ///
  /// ### Parâmetros
  /// - `context`: contexto da aplicação.
  /// - `barrierDismissible`: se o diálogo pode ser fechado ao clicar fora dele.
  /// - `initialDate`: data inicialmente selecionada quando o calendário for aberto.
  /// - `firstDate`: data inicial do calendário.
  /// - `lastDate`: data final do calendário.
  /// - `currentDate`: data atual do calendário.
  /// - `initialEntryMode`: modo de entrada inicial do calendário.
  /// - `initialCalendarMode`: modo de calendário inicial.
  /// - `onDatePickerModeChange`: função que é chamada quando o modo de calendário é alterado.
  static Future<DateTime?> dialog(
    BuildContext context, {
    bool barrierDismissible = false,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? currentDate,
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendarOnly,
    DatePickerMode initialCalendarMode = DatePickerMode.day,
  }) async {
    final DateTime? picked = await showDatePicker(
      locale: const Locale('pt', 'BR'),
      context: context,
      barrierDismissible: barrierDismissible,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(2100),
      currentDate: currentDate ?? DateTime.now(),
      initialEntryMode: initialEntryMode,
      helpText: 'Selecione uma data',
      cancelText: 'Cancelar',
      confirmText: 'Selecionar',
      errorFormatText: 'Formato de data inválido',
      errorInvalidText: 'Data inválida',
      fieldHintText: 'dd/mm/aaaa',
      fieldLabelText: 'Data',
      keyboardType: TextInputType.datetime,
    );
    return picked;
  }

  static StandardTextFormField input(
    BuildContext context, {
    bool barrierDismissible = false,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? currentDate,
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendarOnly,
    DatePickerMode initialCalendarMode = DatePickerMode.day,
    required TextEditingController controller,
  }) {
    return StandardTextFormField(
      label: 'Data',
      hint: 'Escolha uma data',
      controller: controller,
      readOnly: true,
      suffixIcon: const Icon(Icons.calendar_today),
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          locale: const Locale('pt', 'BR'),
          context: context,
          barrierDismissible: barrierDismissible,
          initialDate: initialDate ?? DateTime.now(),
          firstDate: firstDate ?? DateTime(1900),
          lastDate: lastDate ?? DateTime(2100),
          currentDate: currentDate ?? DateTime.now(),
          initialEntryMode: initialEntryMode,
          helpText: 'Selecione uma data',
          cancelText: 'Cancelar',
          confirmText: 'Selecionar',
          errorFormatText: 'Formato de data inválido',
          errorInvalidText: 'Data inválida',
          fieldHintText: 'dd/mm/aaaa',
          fieldLabelText: 'Data',
          keyboardType: TextInputType.datetime,
        );
        if (picked != null) {
          controller.text = picked.formatToBr();
        }
        if (context.mounted) FocusScope.of(context).unfocus();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DatePickerDialog(
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(2100),
      initialDate: initialDate,
      currentDate: currentDate,
      initialEntryMode: initialEntryMode,
      initialCalendarMode: initialCalendarMode,
      helpText: 'Selecione uma data',
      cancelText: 'Cancelar',
      confirmText: 'Selecionar',
      errorFormatText: 'Formato de data inválido',
      errorInvalidText: 'Data inválida',
      fieldHintText: 'dd/mm/aaaa',
      fieldLabelText: 'Data',
      keyboardType: TextInputType.datetime,
    );
  }
}
