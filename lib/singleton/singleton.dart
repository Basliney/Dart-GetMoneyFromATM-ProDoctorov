import '../pair.dart';
/*
  Реализация глобальной переменной через синглтон
*/
class Singleton{
  static final Singleton _singleton = Singleton._internal();

  List<Pair> allMoney = {
    Pair(5000, 2),
    Pair(1000, 3),
    Pair(500, 4),
    Pair(100, 10)
  }.toList();

  factory Singleton(){
    return _singleton;
  }

  Singleton._internal();
}