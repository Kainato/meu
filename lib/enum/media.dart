/// `Media` é um enum que representa os tipos de mídia disponíveis no aplicativo.
/// Você pode acessar o caminho da mídia com a propriedade `path`.
enum Media {
  logo,
  welcome,
  dashboard,
  ecosystem,
}

extension MediaExtension on Media {
  String get path {
    switch (this) {
      case Media.welcome:
        return 'assets/lottie/welcome.json';
      case Media.dashboard:
        return 'assets/lottie/idea.json';
      case Media.ecosystem:
        return 'assets/lottie/ecosystem.json';
      case Media.logo:
        return 'assets/images/mundos_logo.png';
    }
  }
}
