import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';
/*
오준석: Flutter 중급 - Http,상태관리
- Provider 패턴
- Provider: 정보를 제공
- Consumer: 데이터를 소비

특징:
상태가 변경되는 데도 불구하고 StatelessWidget 에서도 가능


swift의 NotificationCenter.default 와 비슷한 것 같음


 */


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: Consumer<Counter>(builder: (context, counter, _){
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(),
        );
      }),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(

        title: Text('Provider 예제'),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counter.count}',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
