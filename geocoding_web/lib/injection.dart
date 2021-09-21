import 'package:geocoding_web/api/geocoding_api.dart';
import 'package:geocoding_web/api/nominatim_api.dart';
import 'package:geocoding_web/services/language_retriever.dart';
import 'package:geocoding_web/services/navigator_language_retriever.dart';

GeocodingNetworkProxy networkProxy = NominatimApi();
LanguageRetriever languageRetriever = NavigatorLanguageRetriever();
