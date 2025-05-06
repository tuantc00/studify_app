import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/data/models/user_model.dart';
import 'package:demo2/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'dart:io';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  final User? user = FirebaseAuth.instance.currentUser;

  Future<void> fetchUser() async {
    if (user == null) {
      emit(state.copyWith(error: 'No authenticated user found'));
      return;
    }

    emit(state.copyWith(isLoading: true));
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('userData')
          .doc(user!.uid)
          .get();

      if (documentSnapshot.exists) {
        final userData =
        UserModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
        emit(state.copyWith(user: userData, isLoading: false));
      } else {
        emit(state.copyWith(error: 'User data not found', isLoading: false));
      }
    } catch (e) {
      MyApp.log.w(e.toString());
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      MyApp.log.w(FirebaseAuth.instance.currentUser.toString());
    } catch (e) {
      MyApp.log.w(e.toString());
      emit(state.copyWith(error: 'Sign out failed: ${e.toString()}'));
    }
  }

  // Future<void> pickImage() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //
  //   if (pickedFile != null) {
  //     emit(state.copyWith(isLoading: true));
  //     try {
  //       final file = File(pickedFile.path);
  //       final storageRef = FirebaseStorage.instance
  //           .ref()
  //           .child('avatars/${FirebaseAuth.instance.currentUser!.uid}.png');
  //       await storageRef.putFile(file);
  //       final imageUrl = await storageRef.getDownloadURL();
  //
  //       // Update Firestore with new avatar URL
  //       await FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(FirebaseAuth.instance.currentUser!.uid)
  //           .update({'img': imageUrl});
  //
  //       // Refresh user data
  //       await fetchUser();
  //     } catch (e) {
  //       MyApp.log.w(e.toString());
  //       emit(state.copyWith(
  //           error: 'Failed to upload image: ${e.toString()}',
  //           isLoading: false));
  //     }
  //   }
  // }
}