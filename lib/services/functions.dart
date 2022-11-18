class Functions {
  //Kaio ajudou
  calcularData({required String data}) {
    if (data.contains('/')) {
      DateTime dataAtual = DateTime.now();
      List<String> dateList = data.split('/');
      DateTime dataDeExpiracao = DateTime(int.parse(dateList[2]),
          int.parse(dateList[1]), int.parse(dateList[0]));
      int qtdFaltam = dataDeExpiracao.difference(dataAtual).inDays;
      return qtdFaltam;
    } else {
      return 666;
    }
  }
}
