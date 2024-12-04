import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:myapp/enum/pages.dart';

class StandardBody extends StatelessWidget {
  /// `body` é o corpo da tela.
  final Widget body;

  /// `padding` é o espaçamento do corpo da tela. Ele é um `EdgeInsetsGeometry`
  /// que define o espaçamento do corpo da tela. Por padrão, ele é 24 pixels, entretanto
  /// se for uma tela que não precisa de espaçamento (como listagens), pode ser passado um `EdgeInsets.zero`.
  final EdgeInsetsGeometry padding;

  /// `page` é a página atual. Ele é usado para exibir o `DrawerWidget`.
  final Pages? page;

  /// `StandardBody` é o corpo padrão de uma tela. Ele é um `StatelessWidget`
  /// normalmente inserido no body de um `Scaffold`. Nele já contém algumas
  /// configurações padrões como:
  /// - `GestureDetector` para fechar o teclado ao clicar fora de um campo de texto.
  /// - `Padding` de 24 pixels em todas as direções.
  const StandardBody({
    super.key,
    required this.body,
    this.padding = const EdgeInsets.all(0.0),
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: padding,
        child: SizedBox(
          width: double.maxFinite,
          child: Builder(
            builder: (context) {
              if ((Device.get().isTablet &&
                      MediaQuery.of(context).orientation ==
                          Orientation.landscape) &&
                  page != null) {
                return Row(
                  children: [
                    const Drawer(),
                    Expanded(child: body),
                  ],
                );
              } else {
                return body;
              }
            },
          ),
        ),
      ),
    );
  }
}
