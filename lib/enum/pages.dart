/// `Pages` é um enum que contém as páginas do aplicativo.
/// Você pode acessar o caminho da página em String com a propriedade `route`.
enum Pages { home, at, selectClinica, onboarding, configuracoes }

extension PagesExtension on Pages {
  String get route {
    switch (this) {
      case Pages.home:
        return '/home';
      case Pages.at:
        return '/at';
      case Pages.selectClinica:
        return '/selectClinica';
      case Pages.onboarding:
        return '/onboarding';
      case Pages.configuracoes:
        return '/configuracoes';
    }
  }
}
