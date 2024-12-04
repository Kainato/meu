import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myapp/app_text_theme.dart';

class StandardListTile extends StatelessWidget {
  /// `title` é o título do `ListTile`. A estilização é feita com `AppTextTheme.titleMedium`
  /// e o overflow é `ellipsis` com `maxLines` igual ao padrão `1`.
  final String title;

  ///
  final TextStyle? titleStyle;

  /// `subtitle` é o subtítulo do `ListTile`. A estilização é feita com `AppTextTheme.labelMedium`
  /// e o overflow é `ellipsis` com `maxLines` igual ao padrão `2`.
  final String? subtitle;

  ///
  final TextStyle? subtitleStyle;

  /// `leading` é o widget que fica à esquerda do `ListTile`.
  /// ### Exemplos:
  /// - Para um `Icon`: `Icon(Icons.ac_unit, size: 24)`.
  /// - Para uma `CircleAvatar`: `CircleAvatar(backgroundImage: NetworkImage('https://example.com/image.jpg'), radius: 20)`.
  /// - Para um `Image` quadrado: `Image.network('https://example.com/image.jpg', width: 56, height: 56)`.
  final Widget? leading;

  /// `trailing` é o widget que fica à direita do `ListTile`.
  final Widget? trailing;

  /// `onTap` é a função que é chamada quando o `ListTile` é pressionado.
  final void Function()? onTap;

  /// `maxLinesTitle` é o número máximo de linhas do título. O padrão é `1`.
  final int? maxLinesTitle;

  /// `maxLinesSubtitle` é o número máximo de linhas do subtítulo. O padrão é `2`.
  final int? maxLinesSubtitle;

  /// `hasPadding` é um booleano que indica se o `ListTile` tem padding. O padrão é `true`.
  final bool hasPadding;

  /// `childrenSlidable` é uma lista de `SlidableAction` que são as ações do `Slidable`.
  /// Elas são exibidas quando o `ListTile` é deslizado para a esquerda.
  final List<SlidableAction> childrenSlidable;

  /// `StandardListTile` é um `ListTile` padrão do aplicativo.
  ///
  /// ### Parâmetros
  /// - `title` é o título do `ListTile`.
  /// - `subtitle` é o subtítulo do `ListTile`.
  /// - `leading` é o widget que fica à esquerda do `ListTile`.
  /// - `trailing` é o widget que fica à direita do `ListTile`.
  /// - `onTap` é a função que é chamada quando o `ListTile` é pressionado.
  /// - `maxLinesTitle` é o número máximo de linhas do título.
  /// - `maxLinesSubtitle` é o número máximo de linhas do subtítulo.
  /// - `hasPadding` é um booleano que indica se o `ListTile` tem padding.
  const StandardListTile({
    super.key,
    required this.title,
    this.titleStyle,
    this.subtitle,
    this.subtitleStyle,
    this.leading,
    this.trailing,
    this.onTap,
    this.maxLinesTitle = 1,
    this.maxLinesSubtitle = 2,
    this.hasPadding = true,
    this.childrenSlidable = const [],
  });

  /// `card` é um método estático que retorna um `Card` com um `StandardListTile` dentro.
  /// Ele é útil para criar um `Card` com um `ListTile` padrão do aplicativo.
  static Widget card({
    required String title,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    Color sideColor = Colors.transparent,
    Color? backgroundColor,
    String? subtitle,
    Widget? leading,
    Widget? trailing,
    void Function()? onTap,
    int maxLinesTitle = 1,
    int maxLinesSubtitle = 2,
    bool hasPadding = true,
    List<SlidableAction> childrenSlidable = const [],
  }) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: sideColor),
      ),
      child: StandardListTile(
        title: title,
        titleStyle: titleStyle,
        subtitle: subtitle,
        subtitleStyle: subtitleStyle,
        leading: leading,
        trailing: trailing,
        onTap: onTap,
        maxLinesTitle: maxLinesTitle,
        maxLinesSubtitle: maxLinesSubtitle,
        hasPadding: hasPadding,
        childrenSlidable: childrenSlidable,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle styleTitle = titleStyle ?? AppTextTheme.titleMedium.style;
    final TextStyle styleSubtitle =
        subtitleStyle ?? AppTextTheme.labelMedium.style;
    return Slidable(
      enabled: childrenSlidable.isNotEmpty,
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: childrenSlidable,
      ),
      child: ListTile(
        contentPadding: hasPadding
            ? const EdgeInsets.symmetric(horizontal: 16)
            : const EdgeInsets.all(0),
        title: Text(
          title,
          style: styleTitle,
          maxLines: maxLinesTitle,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle!,
                style: styleSubtitle,
                maxLines: maxLinesSubtitle,
                overflow: TextOverflow.ellipsis,
              )
            : null,
        leading: leading != null
            ? SizedBox(height: double.maxFinite, child: leading)
            : null,
        trailing: trailing != null
            ? SizedBox(height: double.maxFinite, child: trailing)
            : null,
        onTap: onTap,
      ),
    );
  }
}
