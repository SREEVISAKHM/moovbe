import 'package:flutter/cupertino.dart';

abstract class BaseProvider extends ChangeNotifier {
  final String _providerName;

  BaseProvider({String? name})
      : _providerName = name!,
        super();
  String get providerName => _providerName;
}
