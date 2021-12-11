import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var firstLetterDay = DateFormat.E().format(weekDay)[0];

      double totalSum = 0.0;

      for (var transaction in recentTransaction) {
        bool sameDay = transaction.date.day == weekDay.day;
        bool sameMonth = transaction.date.month == weekDay.month;
        bool sameYear = transaction.date.year == weekDay.year;

        if (sameYear && sameMonth && sameDay) {
          totalSum += transaction.value;
        }
      }

      return {
        'day': firstLetterDay,
        'value': totalSum,
      };
    }).reversed.toList();
  }

  const Chart(this.recentTransaction, {Key? key}) : super(key: key);

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0,
        (sum, transactionDay) => sum + (transactionDay['value'] as double));
  }

  @override
  Widget build(BuildContext context) {
    groupedTransactions;
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((transactionPorData) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                weekDay: transactionPorData['day'].toString(),
                totalValueDay:
                    double.parse(transactionPorData['value'].toString()),
                percentage:
                    (transactionPorData['value'] as double) / _weekTotalValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
