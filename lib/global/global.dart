import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:learner/common/services/storage.dart';

class Global {
  static late StorageService storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyAfQNB9gpzzNu3Xi4LLcE0aXxHjqghH0ac',
        appId: "1:1038935307919:android:c658fa7127fe690c1be2fa",
        messagingSenderId: "1038935307919",
        projectId: "learningapp-6bf92",
      ),
    );

    storageService = await StorageService.init();
  }
}
