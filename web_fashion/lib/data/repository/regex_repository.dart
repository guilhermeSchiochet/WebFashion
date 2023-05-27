import 'package:web_fashion/domain/model/regex_pattern.dart';

abstract class RegexRepository {
  Future<RegexPattern> getRegexPattern(String key);
}

class RegexRepositoryImpl implements RegexRepository {

  final Map<String, String> _patterns = {
    'email': r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  };

  @override
  Future<RegexPattern> getRegexPattern(String key) async {
    final pattern = _patterns[key];
    return RegexPattern(key, pattern);
  }
}