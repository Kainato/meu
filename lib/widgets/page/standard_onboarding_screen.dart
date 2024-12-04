import 'package:flutter/material.dart';
import 'package:myapp/core/navigation.dart';
import 'package:myapp/widgets/page/standard_body.dart';

class StandardOnboardingScreen extends StatelessWidget {
  /// Corpo da tela de onboarding. Ele é o conteúdo principal da tela e pode
  /// conter textos, imagens, botões, entre outros.
  final Widget body;

  /// Botões fixos no rodapé da tela. Eles são úteis para exibir botões de ação ou
  /// para situar informações importantes para o usuário.
  final List<Widget> persistentFooterButtons;

  /// Página de navegação. Ela vem como nula por padrão pois é a primeira tela
  /// que o usuário vê ao abrir o aplicativo, quando adicionada a uma rota, a
  /// página de navegação deve ser definida para que o botão de voltar funcione
  /// corretamente.
  final Page? page;

  /// O `OnboardingWidget` é um widget que exibe uma tela de onboarding com um
  /// corpo e botões fixos no rodapé. Ele é útil para exibir telas de introdução
  /// ao aplicativo.
  ///
  /// ### Parâmetros:
  /// - `body`: Corpo da tela de onboarding.
  /// - `persistentFooterButtons`: Botões fixos no rodapé da tela.
  /// - `page`: Página de navegação.
  const StandardOnboardingScreen({
    super.key,
    required this.body,
    required this.persistentFooterButtons,
    this.page,

    /// Ele é um item de lista personalizado que possui um ícone e um rótulo.
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: page == null
          ? null
          : AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () => Navigation.pop(context),
              ),
            ),
      body: StandardBody(
        body: body,
        padding: const EdgeInsets.all(24.0),
      ),
      persistentFooterButtons: persistentFooterButtons,
    );
  }
}
