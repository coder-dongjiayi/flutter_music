import 'package:flutter/material.dart';
import 'package:flutter_music/public_widget/future_builder_widget.dart';
import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_music/pages/login_widget/secret_members_only_page.dart';
class AppLoginWidget extends StatefulWidget {
  @override
  _AppLoginWidgetState createState() => _AppLoginWidgetState();
}

class _AppLoginWidgetState extends State<AppLoginWidget> {
  final Future<bool> _isAvailableFuture = AppleSignIn.isAvailable();

  String errorMessage;
  @override
  void initState() {
    super.initState();


    AppleSignIn.onCredentialRevoked.listen((_) {
      print("Credentials revoked");
    });
  }
  @override
  Widget build(BuildContext context) {
    return  FutureBuilderWidget<bool>(
      future: _isAvailableFuture,

    );
  }

  void logIn() async {
    final AuthorizationResult result = await AppleSignIn.performRequests([
      AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);

    switch (result.status) {
      case AuthorizationStatus.authorized:

      // Store user ID
        await FlutterSecureStorage()
            .write(key: "userId", value: result.credential.user);

        // Navigate to secret page (shhh!)
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (_) =>
                SecretMembersOnlyPage(credential: result.credential)));
        break;

      case AuthorizationStatus.error:
        print("Sign in failed: ${result.error.localizedDescription}");
        setState(() {
          errorMessage = "Sign in failed 😿";
        });
        break;

      case AuthorizationStatus.cancelled:
        print('User cancelled');
        break;
    }
  }
}

