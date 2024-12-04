import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:myapp/app_text_theme.dart';
import 'package:myapp/core/cache/cache_prefs_service.dart';
import 'package:myapp/enum/snack_bars.dart';
import 'package:myapp/widgets/base/standard_elevated_button.dart';
import 'package:myapp/widgets/page/standard_alert_dialog.dart';
import 'package:myapp/core/theme_colors.dart';

class StandardFunctions {
  static String lipsum =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
      'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
      'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
      'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  /// Função que exibe um `SnackBar` de alerta caso o usuário tente realizar uma ação
  /// antes do carregamento da lista.
  static void waitList(
    BuildContext context, {
    required bool condiction,
    required Function() function,
  }) {
    if (condiction) {
      function();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBars.alert.getSnackBar(
          context,
          'Aguarde o carregamento das informações antes de realizar esta ação!',
        ),
      );
    }
  }

  /// Função que exibe um `SnackBar` de alerta caso o usuário esteja realizando
  /// uma ação na API.
  static void awaitRequest(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBars.info.getSnackBar(context, message),
    );
  }

  /// Função que exibe um Diálogo de alerta caso o usuário tente realizar uma ação
  /// e a requisição retorne um erro.
  static Future<T?> errorRequest<T>(BuildContext context, Response response) {
    return showDialog(
      context: context,
      builder: (dialogcontext) => StandardAlertDialog(
        title: 'Ops! Algo deu errado!',
        subtitle: "${response.data.toString()}\n\n${response.statusMessage}",
        confirmAction: StandardElevatedButton(
          label: 'Ok',
          onPressed: () => Navigator.of(dialogcontext).pop(),
        ),
        closeAction: TextButton(
          child: Text(
            'Reiniciar app',
            style: AppTextTheme.labelMedium.style.copyWith(
              color: ThemeColors.error,
            ),
          ),
          onPressed: () async {
            await CachePrefsService.clearPrefs().whenComplete(() {
              if (dialogcontext.mounted) Navigator.of(dialogcontext).pop();
              if (context.mounted) Phoenix.rebirth(context);
            });
          },
        ),
      ),
    );
  }

  /// Função que exibe um Diálogo de alerta caso o usuário tente realizar uma ação
  /// e antes mesmo da requisição, retornar um erro.
  ///
  /// ### Utilização
  /// ```dart
  /// StandardFunctions.errorDialog(
  /// context,
  ///   title: 'Ops! Algo deu errado!',
  ///   list: [
  ///     SimpleTextRich.doubleRich(
  ///       initial: 'Você não tem',
  ///       middle: ' permissão ',
  ///       middleStyle: AppTextTheme.titleSmall,
  ///       end: 'para realizar esta ação.',
  ///     ),
  ///   ]
  /// );
  /// ```
  static Future<T?> invalidDialog<T>(
    BuildContext context, {
    required String title,
    required List<Widget> list,
  }) {
    return showDialog(
      context: context,
      builder: (dialogcontext) => StandardAlertDialog(
        title: title,
        subtitle: 'Você precisa corrigir os seguintes erros:',
        content: list,
        closeAction: TextButton(
          child: const Text('Ok'),
          onPressed: () => Navigator.of(dialogcontext).pop(),
        ),
      ),
    );
  }

  /// Função que capitaliza a primeira letra de cada palavra.
  static String capitalizeWords(String str) {
    return str.split(' ').map((word) {
      if (word.isEmpty) return word;
      if (word.toLowerCase() == 'de' ||
          word.toLowerCase() == 'da' ||
          word.toLowerCase() == 'do' ||
          word.toLowerCase() == 'dos' ||
          word.toLowerCase() == 'das' ||
          word.toLowerCase() == 'e' ||
          word.toLowerCase() == 'ou' ||
          word.toLowerCase() == 'para') {
        return word.toLowerCase();
      } else {
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      }
    }).join(' ');
  }
}
