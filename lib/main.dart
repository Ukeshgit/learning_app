import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learner/app/welcome/view/screen/welcome_screen.dart';
import 'package:learner/common/routes/go_router.dart';
import 'package:learner/common/utils/app_styles.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Replace with your design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.themeData,

          routerConfig: goRouter,
        );
      },
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
