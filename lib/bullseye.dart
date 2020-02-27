////This is a demo of dart
////About billy the bully and his sucky personality
//class Bully{
//  String name;
//  String personality;
//  Bully(this.name, this.personality);
//  String get bully => "$name has a $personality personality";
//}
//void main(){
//  var billy = new Bully("Billy", "sucky");
//  print(billy.bully);
//  print(billy.name);
//
//}

greet(String name) {
  print("Hello, $name");
}

class MyClass {
  greetAgain({ Function f, String n = "human" }) {
    f(n);
  }
}
main() {
  MyClass mc = new MyClass();
  greet("Frank");
  mc.greetAgain( f : greet, n : "Traci" );
  mc.greetAgain( f : greet);
}