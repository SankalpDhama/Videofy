class Auth{
  final FirebaseAuth _auth=Firebase.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  Future<bool> signInWithGoogle(BuildContext context) async {
    bool res=false;
    try{
      final GoogleSignInAccount? googleUser=await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth=await googleUser?.authentication;
      final credential=GoogleAuthProvider.credential(
        accessToken:googleAuth?.accessToken,
        idToken:googleAuth?.idToken,
      );
      UserCredential? userCredential=await _auth.signInWithCredential(credential);
      User? user=userCredential.user;
      if(user!=null){
        if(userCredential.additionalUserInfo!.isNewUser){
         await _firestore.collection('users').doc(user.id).set({
            'username':user.displayName;
            'uid':user.uid;
            'profilePhoto':user.photoUrl;
          });
        }
        res=true;
      }
    } on FirebaseAuthException catch(e){
      showSnackBar(context, e.message!);
      res=false;
    }
    return res;
  }
}