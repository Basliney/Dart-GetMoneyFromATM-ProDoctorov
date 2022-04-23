import 'package:atm_from/singleton/singleton.dart';

class Atm{
  // Возможность выдачи
  bool _canIssue = false;

  // Свойство
  int get allMoney {
    int moneyInAtm = 0;
    for (var item in Singleton().allMoney) {
      moneyInAtm += item.key * item.value;
    }
    return moneyInAtm;
  }

  bool getMoneyFromATM(var giveOut){
    _canIssue = false;
    if (giveOut > allMoney){
      printMoney();
      return false;
    }
    List<int> issuedDenomination = _issue(giveOut);
    if (_canIssue == true){
      for(int i = 0; i < issuedDenomination.length; i++){
        Singleton().allMoney[i].value -= issuedDenomination[i];
      }
      printMoney();
      return true;
    }
    printMoney();
    return false;
  }

  List<int> _issue(int giveOut){
    List<int> issuedDenomination = List.filled(Singleton().allMoney.length,0);
    int i = 0;
    for(i = 0; i < Singleton().allMoney.length; i++){
      while(Singleton().allMoney[i].key <= giveOut && Singleton().allMoney[i].value != issuedDenomination[i] && giveOut > 0){
        giveOut-=Singleton().allMoney[i].key;
        issuedDenomination[i]++;
      }
      if (giveOut == 0){
        break;
      }
    }
    if(giveOut == 0 && i != 0){
      _canIssue = true;
      return issuedDenomination;
    }
    return List.filled(Singleton().allMoney.length, 0);
  }

  void printMoney(){
    if (_canIssue == true){
      print('--------------------\nСумма выдана.\n\nКоличество оставшихся номиналов купюр:');
      for(var item in Singleton().allMoney){
        print('${item.value} шт номинала ${item.key}');
      }
      print('--------------------');
    }
    else{
      print('Невозможно выдать данную сумму');
    }
  }
}