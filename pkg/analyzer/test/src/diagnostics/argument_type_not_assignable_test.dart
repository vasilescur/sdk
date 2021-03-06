// Copyright (c) 2019, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/src/error/codes.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

import '../../generated/resolver_test_case.dart';

main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(ArgumentTypeNotAssignableTest);
    defineReflectiveTests(ArgumentTypeNotAssignableTest_Driver);
  });
}

@reflectiveTest
class ArgumentTypeNotAssignableTest extends ResolverTestCase {
  test_functionType() async {
    assertErrorsInCode(r'''
m() {
  var a = new A();
  a.n(() => 0);
}
class A {
  n(void f(int i)) {}
}
''', [StaticWarningCode.ARGUMENT_TYPE_NOT_ASSIGNABLE]);
  }

  test_interfaceType() async {
    assertErrorsInCode(r'''
m() {
  var i = '';
  n(i);
}
n(int i) {}
''', [StaticWarningCode.ARGUMENT_TYPE_NOT_ASSIGNABLE]);
  }
}

@reflectiveTest
class ArgumentTypeNotAssignableTest_Driver
    extends ArgumentTypeNotAssignableTest {
  @override
  bool get enableNewAnalysisDriver => true;
}
