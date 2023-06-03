import 'package:google_sign_in/google_sign_in.dart';
import 'package:supermedia/layers/data/data_sources/abstractions/remote_user_data_source.dart';
import 'package:supermedia/layers/data/models/user_model.dart';

import '../../../../di/app_module.dart';

class RemoteUserDataSourceImpl implements RemoteUserDataSource {
  final GoogleSignIn _googleSignIn = locator<GoogleSignIn>();

  @override
  Future<UserModel> signInWithGoogle() async {
    final account = await _googleSignIn.signIn();
    final auth = await account!.authentication;
    final userModel = UserModel(
        token: auth.accessToken!,
        email: account.email,
        name: account.displayName!,
        photoUrl: account.photoUrl!
    );
    return userModel;
  }
}

