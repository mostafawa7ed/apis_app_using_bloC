// class Character1 {
//   // "id": 0,
//   // "firstName": "Daenerys",
//   // "lastName": "Targaryen",
//   // "fullName": "Daenerys Targaryen",
//   // "title": "Mother of Dragons",
//   // "family": "House Targaryen",
//   // "image": "daenerys.jpg",
//   // "imageUrl": "https://thronesapi.com/assets/images/daenerys.jpg"
//   late int charId;
//   late String firstName;
//   late String lastName;
//   late String fullName;
//   late String title;
//   late String family;
//   late String imageUrl;

//   Character.fromJson(Map<String, dynamic> json) {
//     charId = json['id'];
//     firstName = json['firstName'];
//     lastName = json['lastName'];
//     fullName = json['fullName'];
//     title = json['title'];
//     family = json['family'];
//     imageUrl = json['imageUrl'];
//   }
// }
class Character {
  late int id;
  late String firstName;
  late String lastName;
  late String fullName;
  late String title;
  late String family;
  late String image;
  late String imageUrl;

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    title = json['title'];
    family = json['family'];
    image = json['image'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['fullName'] = this.fullName;
    data['title'] = this.title;
    data['family'] = this.family;
    data['image'] = this.image;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
