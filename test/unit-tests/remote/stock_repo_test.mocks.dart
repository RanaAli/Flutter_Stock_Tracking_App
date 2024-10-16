// Mocks generated by Mockito 5.4.4 from annotations
// in stock_tracking_app/test/unit-tests/remote/stock_repo_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:stock_tracking_app/data/api/api_service.dart' as _i3;
import 'package:stock_tracking_app/data/models/forex_stocks/forex_stock_response.dart'
    as _i5;
import 'package:stock_tracking_app/data/models/quotes/quotes_response.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeQuotesResponse_0 extends _i1.SmartFake
    implements _i2.QuotesResponse {
  _FakeQuotesResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i3.ApiService {
  @override
  _i4.Future<List<_i5.ForexStockResponse>> getForexStocks() =>
      (super.noSuchMethod(
        Invocation.method(
          #getForexStocks,
          [],
        ),
        returnValue: _i4.Future<List<_i5.ForexStockResponse>>.value(
            <_i5.ForexStockResponse>[]),
        returnValueForMissingStub:
            _i4.Future<List<_i5.ForexStockResponse>>.value(
                <_i5.ForexStockResponse>[]),
      ) as _i4.Future<List<_i5.ForexStockResponse>>);

  @override
  _i4.Future<_i2.QuotesResponse> getQuotes(String? symbol) =>
      (super.noSuchMethod(
        Invocation.method(
          #getQuotes,
          [symbol],
        ),
        returnValue: _i4.Future<_i2.QuotesResponse>.value(_FakeQuotesResponse_0(
          this,
          Invocation.method(
            #getQuotes,
            [symbol],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.QuotesResponse>.value(_FakeQuotesResponse_0(
          this,
          Invocation.method(
            #getQuotes,
            [symbol],
          ),
        )),
      ) as _i4.Future<_i2.QuotesResponse>);
}
