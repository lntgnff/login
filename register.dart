import 'dart:io';

class User {
  String username;
  String password;

  User(this.username, this.password);
}

List<User> registeredUsers = [];

void main() {
 
    }

void register() {
  print("== Register ==");

  print("Masukkan username:");
  String? username = stdin.readLineSync();

  print("Masukkan password:");
  String? password = stdin.readLineSync();

  if (username == null || password == null || username.isEmpty || password.isEmpty) {
    print("Username dan password tidak boleh kosong");
    return;
  }

  // Cek apakah username sudah terdaftar
  bool isUserExist = registeredUsers.any((user) => user.username == username);
  if (isUserExist) {
    print("Username anda sudah terdaftar");
    return;
  }

  // Simpan data pengguna baru
  registeredUsers.add(User(username, password));
  print("Registrasi telah berhasil");
}

void login() {
  print("== Login ==");

  print("Masukkan username:");
  String? username = stdin.readLineSync();

  print("Masukkan password:");
  String? password = stdin.readLineSync();

  if (username == null || password == null || username.isEmpty || password.isEmpty) {
    print("Username dan password tidak boleh kosong");
    return;
  }

  // Verifikasi username dan password
  bool isValidUser = registeredUsers.any((user) => user.username == username && user.password == password);

  if (isValidUser) {
    print("Login berhasi");
  } else {
    print("Username atau password anda salah");
  }
}