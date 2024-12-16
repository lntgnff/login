import 'dart:io';

// Menyimpan data pengguna dalam Map (username sebagai key, password sebagai value)
Map<String, String> users = {};

// Fungsi untuk memvalidasi input (minimal 8 karakter dan maksimal 30 karakter)
bool isValidInput(String input) {
  if (input.length >= 8 && input.length <= 30) {
    return true;
  } else {
    return false;
  }
}

// Fungsi registrasi
void register() {
  print("=== Register ===");
  
  // Meminta input username
  stdout.write("Masukkan username: ");
  String username = stdin.readLineSync() ?? '';

  // Validasi username
  if (isValidInput(username)) {
    // Meminta input password
    stdout.write("Masukkan password: ");
    String password = stdin.readLineSync() ?? '';

    // Validasi password
    if (isValidInput(password)) {
      // Cek apakah username sudah ada
      if (users.containsKey(username)) {
        print("Username sudah terdaftar. Silakan gunakan username lain.");
      } else {
        // Menyimpan username dan password ke dalam Map
        users[username] = password;
        print("Registrasi berhasil!");
      }
    } else {
      print("Password hanya 8 hingga 30 karakter.");
    }
  } else {
    print("Username hanya 8 hingga 30 karakter.");
  }
}

// Fungsi login
void login() {
  print("=== Login ===");
  
  // Meminta input username
  stdout.write("Masukkan username: ");
  String username = stdin.readLineSync() ?? '';

  // Meminta input password
  stdout.write("Masukkan password: ");
  String password = stdin.readLineSync() ?? '';

  // Cek apakah username ada dan password cocok
  if (users.containsKey(username)) {
    if (users[username] == password) {
      print("Login berhasil! Selamat datang, $username.");
    } else {
      print("Password salah.");
    }
  } else {
    print("Username tidak ditemukan.");
  }
}

// Fungsi utama (main)
void main() {
  bool exit = false;

  while (exit) {
    // Tampilkan menu
    print("\nPilih opsi:");
    print("1. Register");
    print("2. Login");
    print("3. Keluar");
    stdout.write("Pilihan Anda: ");
    String? choice = stdin.readLineSync();

    // Penggunaan dasar if-else untuk mengarahkan pengguna berdasarkan pilihan
    if (choice == '1') {
      register();
    } else if (choice == '2') {
      login();
    } else if (choice == '3') {
      print("Terima kasih telah menggunakan aplikasi ini.");
      exit = true; // Keluar dari loop
    } else {
      print("Pilihan tidak valid. Coba lagi.");
    }
  }
}