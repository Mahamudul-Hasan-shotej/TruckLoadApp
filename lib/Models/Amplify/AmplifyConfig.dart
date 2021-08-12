import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:truck_load_demo/Models/Amplify/amplifyconfiguration.dart';
import 'package:truck_load_demo/Views/Order/Global.dart' as globals;

void configureAmplify() async {
  // Once Plugins are added, configure Amplify
  // Note: Amplify can only be configured once.
  try {
    if (globals.aplifyConfig == false) {
      Amplify.addPlugins([AmplifyAuthCognito(), AmplifyStorageS3()]);
      await Amplify.configure(amplifyconfig);
      globals.aplifyConfig = true;
    } else {
      print('Amplify configured!');
    }
  } catch (e) {
    print(
        "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
  }
}
