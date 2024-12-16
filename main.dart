import 'dart:io';

class User {
  String username;
  String password;

  User(this.username, this.password);
}

User? registeredUser;

void main() {
  print("== Pendaftaran ==");

  // Proses registrasi
  while (true) {
    print("Masukkan username untuk registrasi:");
    String? registerUsername = stdin.readLineSync();

    print("Masukkan password untuk registrasi:");
    String? registerPassword = stdin.readLineSync();

    if (registerUsername != null && registerPassword != null && registerUsername.isNotEmpty && registerPassword.isNotEmpty) {
      registeredUser = User(registerUsername, registerPassword);
      print("Registrasi berhasil!");
      break;
    } else {
      print("Username dan password tidak boleh kosong, silakan coba lagi.");
    }
  }

  // Proses login
  print("\n== Login ==");

  while (true) {
    print("Masukkan username untuk login:");
    String? loginUsername = stdin.readLineSync();

    print("Masukkan password untuk login:");
    String? loginPassword = stdin.readLineSync();

    if (loginUsername != null && loginPassword != null && loginUsername.isNotEmpty && loginPassword.isNotEmpty) {
      if (registeredUser != null && loginUsername == registeredUser!.username && loginPassword == registeredUser!.password) {
        print("Login berhasil!");
        break;
      } else {
        print("Username atau password salah, silakan coba lagi.");
      }
    } else {
      print("Username dan password tidak boleh kosong, silakan coba lagi.");
    }
  }
}