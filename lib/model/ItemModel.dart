class ItemModel{
    int id;
    String name, description;

    ItemModel({this.id, this.name, this.description});

    factory ItemModel.fromJson(Map<String, dynamic> json){
        return ItemModel(
            id: json['id'] as int,
            name: json['name'] as String,
            description: json['image'] as String
        );
    }
}