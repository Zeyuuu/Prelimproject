import 'dart:io';
import 'package:riverpod/riverpod.dart';
import 'providers/user_provider.dart';

void main() {
  // Create a provider container
  final container = ProviderContainer();
  final userService = container.read(userServiceProvider);

  print('Welcome to the User Management App');
  print('Fetching users...');

  // Fetch users from the UserService
  final users = userService.getUsers();
  
  // Display users
  if (users.isEmpty) {
    print('No users found.');
  } else {
    for (var user in users) {
      print(user);
    }
  }

  // Command-line interface
  print('\nEnter a command (type "exit" to quit, "list" to list users, "help" for commands):');
  String? command;

  while (command != 'exit') {
    command = stdin.readLineSync(); // Read user input

    if (command == 'exit') {
      print('Exiting the application...');
    } else if (command == 'list') {
      if (users.isEmpty) {
        print('No users available.');
      } else {
        print('Listing users:');
        for (var user in users) {
          print(user);
        }
      }
    } else if (command == 'help') {
      print('Available commands:');
      print('  exit - Quit the application');
      print('  list - List all users');
      print('  help - Show this help message');
    } else if (command != null && command.isNotEmpty) {
      print('Unknown command: $command');
    } else {
      print('No command entered.');
    }
  }

  // Dispose of the container when done
  container.dispose();
}
