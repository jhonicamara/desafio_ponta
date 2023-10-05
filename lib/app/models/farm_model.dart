class FarmModel {
  final int farm_id;
  final String name;

  FarmModel({required this.farm_id, required this.name});

  factory FarmModel.loadFromDB(Map<String, dynamic> farm) {
    return FarmModel(farm_id: farm['farm_id'], name: farm['name']);
  }
}
