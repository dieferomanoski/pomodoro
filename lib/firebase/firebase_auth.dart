import 'package:flutter/material.dart';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pomodoro/models/user_model.dart';
import 'package:pomodoro/services/api_response.dart';

String firebaseUserUid;

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  dynamic get firebaseauth => _firebaseAuth;

  Future<ApiResponse> login(String email, String senha) async {
    try {
      // Login no Firebase
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: senha);
      final User fUser = result.user;
      print(fUser);
      print("Firebase Nome: ${fUser.displayName}");
      print("Firebase Email: ${fUser.email}");
      print("Firebase Foto: ${fUser.photoURL}");

      // Cria um usuario do app
      /* final user = AppUser(
        name: fUser.displayName,
        login: fUser.email,
        email: fUser.email,
        urlPicture: fUser.photoURL,
      );
*/

      // Salva no Firestore
      saveUser(fUser);

      // Resposta genérica
      return ApiResponse.ok();
    } catch (error) {
      print("Firebase error $error");
      return ApiResponse.error(msg: "Não foi possível fazer o login");
    }
  }

  Future<ApiResponse> loginGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      print("Google User : ${googleUser.email}");

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      UserCredential result =
          await _firebaseAuth.signInWithCredential(credential);
      final User fuser = result.user;
      print("Firebase nome : ${fuser.displayName}");
      print("Firebase Email : ${fuser.email}");
      print("Firebase Foto : ${fuser.photoURL}");

      //cria um usuario no app

      //final user = AppUser(name:fuser.displayName,email:fuser.email,urlPicture:fuser.photoURL);

      saveUser(fuser);

      return ApiResponse.ok();
    } catch (e) {
      print("Erro firebase $e");
      return ApiResponse.error(msg: "não foi possivel fazer o login");
    }
  }

  void saveUser(User fUser) async {
    if (fUser != null) {
      firebaseUserUid = fUser.uid;
      DocumentReference refUser =
          FirebaseFirestore.instance.collection("users").doc(firebaseUserUid);
      refUser.set({
        'nome': fUser.displayName,
        'email': fUser.email,
        'login': fUser.email,
        'urlFoto': fUser.photoURL,
      });
    }
  }

  Future<ApiResponse> signUp(String nome, String email, String senha) async {
    try {
      // Usuario do Firebase
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: senha);
      final User fUser = result.user;
      print("Firebase Nome: ${fUser.displayName}");
      print("Firebase Email: ${fUser.email}");
      print("Firebase Foto: ${fUser.photoURL}");

      // Dados para atualizar o usuário
      final userUpdate = _firebaseAuth.currentUser;
      userUpdate.updateProfile(
          displayName: nome,
          photoURL:
              "https://s3-sa-east-1.amazonaws.com/livetouch-temp/livrows/foto.png");

      // Resposta genérica
      return ApiResponse.ok(msg: "Usuário criado com sucesso");
    } catch (error) {
      print(error);

      if (error is PlatformException) {
        print("Error Code ${error.code}");

        return ApiResponse.error(
            msg: "Erro ao criar um usuário.\n\n${error.message}");
      }

      return ApiResponse.error(msg: "Não foi possível criar um usuário.");
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }
}
