import 'package:masterclass/models/user.model.dart';
import 'package:masterclass/view-models/signup.viewmodel.dart';

class AccountRepository {
  Future<UserModel> createAccount(SignupViewModel model) async {
    await Future.delayed(Duration(milliseconds: 1500));
    return new UserModel(
      id: "1",
      name: "Anderson Ribeiro",
      email: "Anderson_ribeiro.a@hotmail.com",
      picture: "https://picsum.photos/id/1/200/300",
      role: "Sttudent",
      token: "xpto",
    );
  }
}
