import 'package:book_library/common/services/Validator.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  test('Empty Field Test', () {
    var result = FieldValidator.checkButtonIsActive('','');
    expect(result, false);
  });

  test('Empty Field Test', () {
    var result = FieldValidator.checkButtonIsActive('Swift Programming','Jordan Parker');
    expect(result, true);
  });
}