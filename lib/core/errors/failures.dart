abstract class Failure {
  final String errMessege;
  Failure({required this.errMessege});
}

class ServerFailures extends Failure {
  ServerFailures({required super.errMessege});
}
