import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/app_text_theme.dart';
import 'package:myapp/core/theme_colors.dart';

class StandardTextFormField extends StatelessWidget {
  /// Se o campo é somente leitura ou se pode ser editado.
  final bool readOnly;

  /// O tipo de teclado a ser exibido, padrão é você pode consultar os
  /// tipos de teclado em [TextInputType](https://api.flutter.dev/flutter/services/TextInputType-class.html).
  final TextInputType keyboardType;

  /// Define se o campo é obrigatório.
  final bool isRequired;

  /// O texto do rótulo.
  final String label;

  /// O texto de dica.
  final String hint;

  /// Quantidade de caracteres mínimos.
  final int? minChar;

  /// Mensagem de erro.
  final String? errorText;

  /// Botão de ação extra que se localiza no final do campo.
  final Widget? suffixIcon;

  /// Botão de ação extra que se localiza no início do campo.
  final Widget? prefixIcon;

  /// Uma lista de formatação de entrada. Você pode consultar as formatações
  /// em [TextInputFormatter](https://api.flutter.dev/flutter/services/TextInputFormatter-class.html).
  final List<TextInputFormatter>? inputFormatters;

  /// O controlador do campo.
  final TextEditingController controller;

  /// Define se o texto inserido deve ser ocultado.
  final bool obscureText;

  /// O nó de foco do campo. Se não for passado, o campo não poderá ser focado
  /// manualmente.
  final FocusNode? focusNode;

  /// A função chamada quando o campo é tocado.
  final void Function()? onTap;

  /// A função chamada quando o campo é submetido.
  final void Function(String)? onFieldSubmitted;

  /// A função chamada quando o campo é alterado.
  final void Function(String)? onChanged;

  /// Define se o campo deve ser focado automaticamente.
  final bool autofocus;

  /// Um widget de formulário de texto que pode ser usado em qualquer lugar.
  ///
  /// ### Parâmetros
  /// - `isRequired`: Se o campo é obrigatório.
  /// - `readOnly`: Se o campo é somente leitura.
  /// - `obscureText`: Se o texto deve ser ocultado.
  /// - `keyboardType`: O tipo de teclado a ser exibido.
  /// - `inputFormatters`: Uma lista de formatação de entrada.
  /// - `label`: O texto do rótulo.
  /// - `hint`: O texto de dica.
  /// - `controller`: O controlador do campo.
  /// - `focusNode`: O nó de foco do campo.
  /// - `onTap`: A função chamada quando o campo é tocado.
  /// - `onFieldSubmitted`: A função chamada quando o campo é submetido.
  /// - `onChanged`: A função chamada quando o campo é alterado.
  /// - `minChar`: Quantidade de caracteres mínimos.
  /// - `suffixIcon`: Botão de ação extra que se localiza no final do campo.
  /// - `autoFocus`: Define se o campo deve ser focado automaticamente.
  const StandardTextFormField({
    super.key,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.isRequired = false,
    required this.label,
    required this.hint,
    this.inputFormatters,
    required this.controller,
    this.errorText,
    this.obscureText = false,
    this.focusNode,
    this.onTap,
    this.onFieldSubmitted,
    this.onChanged,
    this.minChar,
    this.suffixIcon,
    this.autofocus = false,
    this.prefixIcon,
  });

  /// Este é um campo de pesquisa que pode ser usado em qualquer lugar,
  /// possuindo um ícone de limpeza que é exibido quando o campo não está vazio.
  ///
  /// Foi criado em conjunto com o `ValueListenableBuilder` para identificar
  /// visualmente quando o campo está vazio ou não.
  static Widget search(
    BuildContext context, {
    required TextEditingController controller,
    required String label,
    required String hint,
    required void Function(String) onChanged,
    bool autofocus = false,
  }) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, text, child) {
        return StandardTextFormField(
          autofocus: autofocus,
          controller: controller,
          label: label,
          hint: hint,
          onChanged: onChanged,
          suffixIcon: text.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.backspace_outlined),
                  color: ThemeColors.error,
                  onPressed: () {
                    controller.clear();
                    onChanged('');
                  },
                )
              : null,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      controller: controller,
      minLines: keyboardType == TextInputType.multiline ? 3 : 1,
      maxLines: keyboardType == TextInputType.multiline ? 6 : 1,
      readOnly: readOnly,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      focusNode: focusNode,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        labelText: label,
        hintText: hint,
        hintStyle: AppTextTheme.hint.style,
        border: const OutlineInputBorder(),
      ),
      validator: (value) => _formValidator(
        isRequired: isRequired,
        value: value,
        controller: controller,
        keyboardType: keyboardType,
        errorText: errorText,
        minChar: minChar,
        label: label,
      ),
      onTap: () => onTapWidget(
        context,
        focusNode: focusNode,
        onTap: onTap,
      ),
      onChanged: onChanged,
      onFieldSubmitted: (value) => onFieldSubmittedWidget(
        value,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }
}

/// Função para validar o formulário.
String? _formValidator({
  required bool isRequired,
  required String? value,
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String? errorText,
  required int? minChar,
  required String label,
}) {
  if (isRequired && value!.isEmpty) {
    return 'Este campo de ${label.toLowerCase()} é obrigatório!';
  }
  if (minChar != null && controller.text.trim().length < minChar) {
    return 'O campo de ${label.toLowerCase()} precisa ter no mínimo $minChar caracteres!';
  }
  if (keyboardType == TextInputType.emailAddress &&
      !(controller.text.contains('.') && controller.text.contains('@'))) {
    return errorText ?? 'Você precisa inserir um e-mail válido!';
  }

  return null;
}

/// Função para focar o campo e chamar a função de toque.
void onTapWidget(
  BuildContext context, {
  required FocusNode? focusNode,
  required void Function()? onTap,
}) {
  if (focusNode != null) {
    FocusScope.of(context).requestFocus(focusNode);
  }
  if (onTap != null) {
    onTap();
  }
}

/// Função para chamar a função de submissão do campo.
void onFieldSubmittedWidget(
  String value, {
  required void Function(String)? onFieldSubmitted,
}) {
  if (onFieldSubmitted != null) {
    onFieldSubmitted(value);
  }
}
