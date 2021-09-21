@JS()
library navigator;

import 'package:geocoding_web/services/language_retriever.dart';
import 'package:js/js.dart';

@JS("navigator.language")
external String get navigatorLanguage;

class NavigatorLanguageRetriever implements LanguageRetriever {
  @override
  String get language => navigatorLanguage;
}
