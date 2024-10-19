class User{
  final int id;
  final String titile;
  final bool completed;
  User({
    required this.id,
    required this.titile,
    required this.completed
  });
  factory User.fromJson(Map<String, dynamic> json){
    return User(id: json['id'], titile: json['title'], completed: json['completed']);
  }
}