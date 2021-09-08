abstract class Service<Input, Output> {
  Future<Output> post({required Input input});
}
