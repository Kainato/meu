import 'dart:developer';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:myapp/core/theme_colors.dart';

class StandardDropdownButton<T> extends StatelessWidget {
  /// Valor selecionado no dropdown. O tipo do valor é alterado de acordo com o tipo do dropdown.
  final T? value;

  /// Função chamada ao clicar no botão de limpar. Ele só aparece quando um item é selecionado.
  final void Function() onPressedClear;

  /// Itens do dropdown. O tipo dos itens é alterado de acordo com o tipo do dropdown.
  final List<DropdownMenuItem<T>> items;

  /// Função chamada ao selecionar um item. O tipo do item é alterado de acordo com o tipo do dropdown.
  final void Function(T?) onChanged;

  /// Rótulo do dropdown. Exibido acima do dropdown.
  final String label;

  /// Texto exibido quando nenhum item está selecionado.
  final String hint;

  /// Ativa a exibição de logs ao selecionar um item.
  /// Atualmente, o log exibe o valor selecionado.
  ///
  /// ```dart
  /// onChanged: (newVal) {
  ///   onChanged(newVal);
  ///
  ///   if (activateLog) {
  ///     log(
  ///       'Novo valor selecionado | $value',
  ///       name: 'StandardDropdownButton',
  ///     );
  ///   }
  /// },
  /// ```
  final bool activateLog;

  /// Botão de dropdown padrão para formulários com a opção de limpar o valor selecionado
  /// e seguindo os padrões de design do aplicativo.
  ///
  /// ### Parâmetros
  /// - `value`: Valor selecionado no dropdown.
  /// - `onPressedClear`: Função chamada ao clicar no botão de limpar.
  /// - `items`: Itens do dropdown.
  /// - `onChanged`: Função chamada ao selecionar um item.
  /// - `label`: Rótulo do dropdown.
  /// - `hint`: Texto exibido quando nenhum item está selecionado.
  /// - `activateLog`: Ativa a exibição de logs ao selecionar um item.
  const StandardDropdownButton({
    super.key,
    required this.value,
    required this.onPressedClear,
    required this.items,
    required this.onChanged,
    required this.label,
    this.hint = 'Clique aqui para selecionar um item',
    this.activateLog = false,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,
      value: value,
      iconEnabledColor: ThemeColors.onSurface,
      hint: AutoSizeText(hint, maxLines: 1, overflow: TextOverflow.ellipsis),
      items: items,
      decoration: InputDecoration(
        labelText: 'Selecione um item',
        prefixIcon: const Icon(Icons.search),
        border: _decoration(context, color: ThemeColors.outline),
        focusedBorder: _decoration(context, color: ThemeColors.primary),
        enabledBorder: _decoration(context, color: ThemeColors.outline),
        errorBorder: _decoration(context, color: ThemeColors.error),
        suffixIcon: value != null || value.toString() != ''
            ? IconButton(
                icon: Icon(
                  Icons.clear,
                  color: ThemeColors.error,
                ),
                onPressed: onPressedClear,
              )
            : null,
      ),
      validator: (T? value) {
        if (value.runtimeType == String && value.toString() == '') {
          return 'O valor selecionado não pode ser vazio!';
        } else {
          return null;
        }
      },
      onChanged: (newVal) {
        onChanged(newVal);

        if (activateLog) {
          log(
            'Novo valor selecionado | $value',
            name: 'StandardDropdownButton',
          );
        }
      },
    );
  }
}

/// Decoração padrão para o dropdown button do formulário
OutlineInputBorder _decoration(
  BuildContext context, {
  required Color color,
}) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(
      color: color,
      width: 1.0,
    ),
  );
}
