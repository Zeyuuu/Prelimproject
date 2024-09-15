class User {
  final String id;
  final String name;
  
  User(this.id, this.name);
  
  @override
  String toString() => 'User{id: $id, name: $name}';
}
