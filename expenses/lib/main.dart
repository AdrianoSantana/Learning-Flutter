import 'dart:math';
import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.purple,
          colorScheme:
              ThemeData().colorScheme.copyWith(secondary: Colors.amber),
          fontFamily: 'Quicksand',
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 'abGjzq',
      title: "Conta Antiga",
      value: 500,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Transaction(
      id: 'pfvGaB',
      title: "Games",
      value: 100,
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Transaction(
      id: 'hb295s',
      title: "NBA T-Shirt",
      value: 500,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Transaction(
      id: 'hb123s',
      title: "Notebook",
      value: 2598,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Transaction(
      id: 'xb195s',
      title: "Garrafa",
      value: 50,
      date: DateTime.now().subtract(const Duration(days: 0)),
    ),
    Transaction(
      id: 'xx195s',
      title: "Ventilador",
      value: 35,
      date: DateTime.now().subtract(const Duration(days: 0)),
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions
        .where((transaction) => transaction.date
            .isAfter(DateTime.now().subtract(const Duration(days: 7))))
        .toList();
  }

  Transaction _createTransaction(String title, double value) {
    return (Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    ));
  }

  _addTransaction(String title, double value) {
    final newTransaction = _createTransaction(title, value);
    setState(() {
      _transactions.add(newTransaction);
    });
    _closeTransactionFormModal(context);
  }

  void _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  void _closeTransactionFormModal(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Despesas Pessoais",
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
