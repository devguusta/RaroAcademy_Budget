import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:raro_academy_budget/shared/models/user_model.dart';

class LoginRepository {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<UserModel> login(
      {required String email, required String password}) async {
    try {
      User? user;
      final response = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = response.user;
      if (user != null) {
        UserModel userModel =
            await _db.collection('users').doc(user.uid).get().then((value) {
          return UserModel.fromMap(value.data()!);
        });

        return userModel;
      } else {
        throw Exception();
      }
      // AuthController.instance.loginUser(user!);
    } catch (e) {
      throw e;
    }
  }

  Future<bool> containsEmail(String email) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("/users")
          .where("email", isEqualTo: email)
          .get();
      return response.docs.length > 0;
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel>? createAccount(
      {required String email,
      required String password,
      required name,
      required phone,
      required cpf}) async {
    try {
      User? user;
      final response = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = response.user;
      if (user != null) {
        UserModel userModel =
            UserModel(email: email, name: name, phone: phone, cpf: cpf);
        await _db.collection('users').doc(user.uid).set(userModel.toMap());

        return userModel;
      } else {
        throw Exception();
      }
      // AuthController.instance.loginUser(user!);
    } catch (e) {
      throw e;
    }
  }
}
