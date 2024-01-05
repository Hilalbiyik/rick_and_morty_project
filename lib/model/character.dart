class Character {
  String name;
  String status;
  String species;
  String image;
  String gender;

  Character(
      {required this.name,
      required this.status,
      required this.species,
      required this.image,
      required this.gender});

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
        name: map['name'] ?? "",
        status: map['status'] ?? "",
        species: map['species'] ?? "",
        image: map["image"] ?? "",
        gender: map["gender"]);
  }
}


/*
 {
   "info":{
      "count":826,
      "pages":42,
      "next":"https://rickandmortyapi.com/api/character?page=2",
      "prev":null
   },
   "results":[
      {
         "id":1,
         "name":"Rick Sanchez",
         "status":"Alive",
         "species":"Human",
         "type":"",
         "gender":"Male",
         "origin":{
            "name":"Earth (C-137)",
            "url":"https://rickandmortyapi.com/api/location/1"
         },
 */