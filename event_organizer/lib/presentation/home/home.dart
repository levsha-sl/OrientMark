import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {},
                child: const Text('Считать результат'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Результаты (Генерация протокола)'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Ипорт БД участников'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Ипорт трасс'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Экспорт БД с результатами'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Админки трасс'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Админки групп'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('Админки участников'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
