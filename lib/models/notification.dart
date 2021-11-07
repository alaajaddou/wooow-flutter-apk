class Notification {
  final int id;
  final String title;
  final String body;
  final bool isShown;



  Notification({
      required this.id, required this.title, required this.body, required this.isShown
  });

  // Convert a Notification into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'isShown': isShown,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Notification{id: $id, title: $title, body: $body, isShown: $isShown}';
  }
}