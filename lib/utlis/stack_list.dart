class StackModel {
  final String foodtype;
  final String type;
  final String distance;
  final String duration;

  StackModel(this.foodtype, this.type, this.distance, this.duration);
}

List<StackModel> stackList = [
    StackModel("Dessert", "normal", "1.7km", "32 mins"),
    StackModel("Coffee", "hot", "38 m", "60 secs"),
    StackModel("Chinese bun", "fluffy", "3.8 km", "50 mins"),
    StackModel("Hambuger", "1 piecer", "1.8 km", "29 mins"),
    StackModel("Indian steak", "spicy", "500 m", "10 mins"),
    StackModel("Pancakes", "fruity", "658 m", "15 mins"),
    StackModel("Pizza", "vegetable", "300 m", "12 mins"),
    StackModel("Chicken breast", "spicy", "1.4 km", "25 mins"),
    StackModel("Mishkaki", "veges", "1.6 km", "38 mins")
  ];