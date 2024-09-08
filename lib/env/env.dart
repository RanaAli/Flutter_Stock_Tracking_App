import 'package:envied/envied.dart';

part 'generated/env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'key', defaultValue: "")
  static const String key = _Env.key;
}
