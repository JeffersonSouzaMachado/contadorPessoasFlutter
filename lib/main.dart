import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
    });
    print(count);
  }

  void increment() {
    setState(() {
      count++;
    });
    print(count);
  }

  void clear() {
    setState(() {
      count = 0;
    });
    print(count);
  }

  bool get isEmpty => count == 0;
  bool get isHalf => count >= 10;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/sorvete.jpg'),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isFull ? 'Lotado' : 'Pode Entrar',
                  style: const TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                Padding(
                    padding: EdgeInsets.all(32),
                    child: Text(
                      count.toString(),
                      style: TextStyle(
                          fontSize: 100,
                          color: isFull ? Colors.red : Colors.black),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: isEmpty ? null : decrement,
                      style: TextButton.styleFrom(
                          backgroundColor: isEmpty
                              ? Colors.white.withOpacity(0.6)
                              : Colors.white,
                          fixedSize: const Size(100, 100),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(23))),
                      child: Text(
                        isEmpty ? 'Vazio' : 'Saiu',
                        style: TextStyle(
                          color: isEmpty ? Colors.red : Colors.black,
                          fontSize: isEmpty ? 25 : 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    TextButton(
                      onPressed: isFull ? null : increment,
                      style: TextButton.styleFrom(
                          backgroundColor: isFull
                              ? Colors.white.withOpacity(0.5)
                              : Colors.white,
                          fixedSize: const Size(100, 100),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(23))),
                      child: Text(
                        isFull ? 'Lotado' : 'Entrou',
                        style: TextStyle(
                          color: isFull ? Colors.red : Colors.black,
                          fontSize: isFull ? 25 : 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                TextButton(
                    onPressed: isHalf ? clear : null,
                    style: TextButton.styleFrom(
                        backgroundColor: isHalf
                            ? Colors.white
                            : Colors.white.withOpacity(0.1),
                        fixedSize: const Size(100, 100),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(23))),
                    child: Text(isHalf ? 'Limpar' : ''))
              ],
            )));
  }
}
