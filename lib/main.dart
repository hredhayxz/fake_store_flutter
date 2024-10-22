import 'package:fake_store_flutter/application/app.dart';
import 'package:fake_store_flutter/data/local_db/local_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDB.initializeHive();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(const FakeStoreEComApp()),
  );
}
