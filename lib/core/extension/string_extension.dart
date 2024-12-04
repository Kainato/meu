extension StringExtension on String {
  /// Transforma a string no formato de data do banco de dados para o formato brasileiro.
  ///
  /// ### Exemplos
  /// - `2021-09-30` -> `30/09/2021`
  /// - `1500-10-25` -> `25/10/1500`
  /// - `1912-12-12` -> `12/12/1912`
  /// - `2001-04-05` -> `25/01/2001`
  String formatBdToBr() {
    if (isEmpty) return '';
    final List<String> date = split('-');
    return '${date[2]}/${date[1]}/${date[0]}';
  }

  /// Transforma a string no formato de data brasileiro para o formato do banco de dados.
  ///
  /// ### Exemplos
  /// - `30/09/2021` -> `2021-09-30`
  /// - `25/10/1500` -> `1500-10-25`
  /// - `12/12/1912` -> `1912-12-12`
  /// - `25/01/2001` -> `2001-01-25`
  String formatBrToBd() {
    if (isEmpty) return '';
    final List<String> date = split('/');
    return '${date[2]}-${date[1]}-${date[0]}';
  }

  /// Transforma a string no formato de data e hora brasileiro para o formato do banco de dados com hora.
  ///
  /// ### Exemplos
  /// - `30/09/2021 12:00` -> `2021-09-30 12:00:00`
  /// - `25/10/1500 15:30` -> `1500-10-25 15:30:00`
  /// - `12/12/1912 18:45` -> `1912-12-12 18:45:00`
  /// - `25/01/2001 09:00` -> `2001-01-25 09:00:00`
  /// - `25/01/2001 09:00:30` -> `2001-01-25 09:00:30`
  /// - `25/01/2001 09:00:30.123` -> `2001-01-25 09:00:30.123`
  /// - `25/01/2001 09:00:30.123456` -> `2001-01-25 09:00:30.123456`
  String formatBrToBdWithTime() {
    if (isEmpty) return '';
    final List<String> dateTime = split(' ');
    final List<String> date = dateTime[0].split('/');
    final List<String> time = dateTime[1].split(':');
    final List<String> seconds = time[2].split('.');
    final String sec = seconds.length > 1 ? '.${seconds[1]}' : '';
    return '${date[2]}-${date[1]}-${date[0]} ${time[0]}:${time[1]}:${seconds[0]}$sec';
  }

  /// Transforma a string no formato de data e hora do banco de dados para o formato brasileiro com hora.
  ///
  /// ### Exemplos
  /// - `2021-09-30 12:00:00` -> `30/09/2021 12:00`
  /// - `1500-10-25 15:30:00` -> `25/10/1500 15:30`
  /// - `1912-12-12 18:45:00` -> `12/12/1912 18:45`
  /// - `2001-01-25 09:00:00` -> `25/01/2001 09:00`
  /// - `2001-01-25 09:00:30` -> `25/01/2001 09:00:30`
  /// - `2001-01-25 09:00:30.123` -> `25/01/2001 09:00:30.123`
  /// - `2001-01-25 09:00:30.123456` -> `25/01/2001 09:00:30.123456`
  String formatBdToBrWithTime() {
    if (isEmpty) return '';
    final List<String> dateTime = split(' ');
    final List<String> date = dateTime[0].split('-');
    final List<String> time = dateTime[1].split(':');
    final List<String> seconds = time[2].split('.');
    final String sec = seconds.length > 1 ? '.${seconds[1]}' : '';
    return '${date[2]}/${date[1]}/${date[0]} ${time[0]}:${time[1]}:${seconds[0]}$sec';
  }

  DateTime toDateTime() {
    DateTime? dateTime = DateTime.tryParse(this);
    if (dateTime == null) {
      return DateTime(1900);
    } else {
      return dateTime;
    }
  }

  /// Função que capitaliza a primeira letra de cada palavra.
  ///
  /// ### Exemplos
  /// - `joão da silva` -> `João Da Silva`
  /// - `MARIA DA SILVA` -> `Maria Da Silva`
  /// - `jOãO dA sIlVa` -> `João Da Silva`
  String capitalize() {
    if (isEmpty) return '';
    return split(' ').map((word) {
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

  /// Função que capitaliza a primeira letra de cada palavra e remove os espaços em branco no início e no final.
  ///
  /// ### Exemplos
  /// - ` joão da silva ` -> `João Da Silva`
  /// - `  MARIA DA SILVA  ` -> `Maria Da Silva`
  /// - `  jOãO dA sIlVa  ` -> `João Da Silva`
  String capitalizeAndTrim() {
    return trim().capitalize();
  }
}
