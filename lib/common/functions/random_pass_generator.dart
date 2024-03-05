import 'dart:math';

String generatePassword({int length = 12}) {
  final Random random = Random();
  const characters =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()_+';
  String password = '';
  for (int i = 0; i < length; i++) {
    password += characters[
        random.nextInt(characters.length)]; // Generate a random password
  }
  return password;
}
