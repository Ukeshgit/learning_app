import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learner/app/welcome/view/welcome_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: WelcomeScreen(),
    );
  }
}

final appCount = StateProvider<int>((ref) {
  return 0;
});

class MyHomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var count = ref.watch(appCount);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Center(child: Text("Riverpod app")),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "one",
            onPressed: () {
              ref.read(appCount.notifier).state++; //notifier notify the ui
              // count = count + 1; screen ma chai dekhinaan
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "two",
            onPressed: () {
              // ref.read(appCount.notifier).state++;
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => secondClass()));
            },
            tooltip: "he",
            child: Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(count.toString()),
          ],
        ),
      ),
    );
  }
}

class secondClass extends ConsumerWidget {
  const secondClass({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(appCount);

    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(count.toString())),
    );
  }
}
