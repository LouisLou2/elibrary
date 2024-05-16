// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browsed_recently.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBrowsedRecentlyCollection on Isar {
  IsarCollection<BrowsedRecently> get browsedRecentlys => this.collection();
}

const BrowsedRecentlySchema = CollectionSchema(
  name: r'BrowsedRecently',
  id: 2223956963720113373,
  properties: {
    r'browseTime': PropertySchema(
      id: 0,
      name: r'browseTime',
      type: IsarType.dateTime,
    ),
    r'isbn': PropertySchema(
      id: 1,
      name: r'isbn',
      type: IsarType.string,
    )
  },
  estimateSize: _browsedRecentlyEstimateSize,
  serialize: _browsedRecentlySerialize,
  deserialize: _browsedRecentlyDeserialize,
  deserializeProp: _browsedRecentlyDeserializeProp,
  idName: r'id',
  indexes: {
    r'browseTime': IndexSchema(
      id: -9172530118405459750,
      name: r'browseTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'browseTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'isbn': IndexSchema(
      id: 6054191419597679524,
      name: r'isbn',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'isbn',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _browsedRecentlyGetId,
  getLinks: _browsedRecentlyGetLinks,
  attach: _browsedRecentlyAttach,
  version: '3.1.0+1',
);

int _browsedRecentlyEstimateSize(
  BrowsedRecently object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.isbn.length * 3;
  return bytesCount;
}

void _browsedRecentlySerialize(
  BrowsedRecently object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.browseTime);
  writer.writeString(offsets[1], object.isbn);
}

BrowsedRecently _browsedRecentlyDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BrowsedRecently(
    browseTime: reader.readDateTime(offsets[0]),
    isbn: reader.readString(offsets[1]),
  );
  object.id = id;
  return object;
}

P _browsedRecentlyDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _browsedRecentlyGetId(BrowsedRecently object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _browsedRecentlyGetLinks(BrowsedRecently object) {
  return [];
}

void _browsedRecentlyAttach(
    IsarCollection<dynamic> col, Id id, BrowsedRecently object) {
  object.id = id;
}

extension BrowsedRecentlyByIndex on IsarCollection<BrowsedRecently> {
  Future<BrowsedRecently?> getByIsbn(String isbn) {
    return getByIndex(r'isbn', [isbn]);
  }

  BrowsedRecently? getByIsbnSync(String isbn) {
    return getByIndexSync(r'isbn', [isbn]);
  }

  Future<bool> deleteByIsbn(String isbn) {
    return deleteByIndex(r'isbn', [isbn]);
  }

  bool deleteByIsbnSync(String isbn) {
    return deleteByIndexSync(r'isbn', [isbn]);
  }

  Future<List<BrowsedRecently?>> getAllByIsbn(List<String> isbnValues) {
    final values = isbnValues.map((e) => [e]).toList();
    return getAllByIndex(r'isbn', values);
  }

  List<BrowsedRecently?> getAllByIsbnSync(List<String> isbnValues) {
    final values = isbnValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'isbn', values);
  }

  Future<int> deleteAllByIsbn(List<String> isbnValues) {
    final values = isbnValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'isbn', values);
  }

  int deleteAllByIsbnSync(List<String> isbnValues) {
    final values = isbnValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'isbn', values);
  }

  Future<Id> putByIsbn(BrowsedRecently object) {
    return putByIndex(r'isbn', object);
  }

  Id putByIsbnSync(BrowsedRecently object, {bool saveLinks = true}) {
    return putByIndexSync(r'isbn', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIsbn(List<BrowsedRecently> objects) {
    return putAllByIndex(r'isbn', objects);
  }

  List<Id> putAllByIsbnSync(List<BrowsedRecently> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'isbn', objects, saveLinks: saveLinks);
  }
}

extension BrowsedRecentlyQueryWhereSort
    on QueryBuilder<BrowsedRecently, BrowsedRecently, QWhere> {
  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterWhere> anyBrowseTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'browseTime'),
      );
    });
  }
}

extension BrowsedRecentlyQueryWhere
    on QueryBuilder<BrowsedRecently, BrowsedRecently, QWhereClause> {
  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterWhereClause>
      browseTimeEqualTo(DateTime browseTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'browseTime',
        value: [browseTime],
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterWhereClause>
      browseTimeNotEqualTo(DateTime browseTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'browseTime',
              lower: [],
              upper: [browseTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'browseTime',
              lower: [browseTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'browseTime',
              lower: [browseTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'browseTime',
              lower: [],
              upper: [browseTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterWhereClause>
      browseTimeGreaterThan(
    DateTime browseTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'browseTime',
        lower: [browseTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterWhereClause>
      browseTimeLessThan(
    DateTime browseTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'browseTime',
        lower: [],
        upper: [browseTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterWhereClause>
      browseTimeBetween(
    DateTime lowerBrowseTime,
    DateTime upperBrowseTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'browseTime',
        lower: [lowerBrowseTime],
        includeLower: includeLower,
        upper: [upperBrowseTime],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterWhereClause> isbnEqualTo(
      String isbn) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isbn',
        value: [isbn],
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterWhereClause>
      isbnNotEqualTo(String isbn) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isbn',
              lower: [],
              upper: [isbn],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isbn',
              lower: [isbn],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isbn',
              lower: [isbn],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isbn',
              lower: [],
              upper: [isbn],
              includeUpper: false,
            ));
      }
    });
  }
}

extension BrowsedRecentlyQueryFilter
    on QueryBuilder<BrowsedRecently, BrowsedRecently, QFilterCondition> {
  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterFilterCondition>
      browseTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'browseTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterFilterCondition>
      browseTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'browseTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterFilterCondition>
      browseTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'browseTime',
        value: value,
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterFilterCondition>
      browseTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'browseTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterFilterCondition>
      isbnEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterFilterCondition>
      isbnGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterFilterCondition>
      isbnLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterFilterCondition>
      isbnBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isbn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterFilterCondition>
      isbnStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterFilterCondition>
      isbnEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterFilterCondition>
      isbnContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterFilterCondition>
      isbnMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'isbn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterFilterCondition>
      isbnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterFilterCondition>
      isbnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isbn',
        value: '',
      ));
    });
  }
}

extension BrowsedRecentlyQueryObject
    on QueryBuilder<BrowsedRecently, BrowsedRecently, QFilterCondition> {}

extension BrowsedRecentlyQueryLinks
    on QueryBuilder<BrowsedRecently, BrowsedRecently, QFilterCondition> {}

extension BrowsedRecentlyQuerySortBy
    on QueryBuilder<BrowsedRecently, BrowsedRecently, QSortBy> {
  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterSortBy>
      sortByBrowseTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'browseTime', Sort.asc);
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterSortBy>
      sortByBrowseTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'browseTime', Sort.desc);
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterSortBy> sortByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterSortBy>
      sortByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }
}

extension BrowsedRecentlyQuerySortThenBy
    on QueryBuilder<BrowsedRecently, BrowsedRecently, QSortThenBy> {
  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterSortBy>
      thenByBrowseTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'browseTime', Sort.asc);
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterSortBy>
      thenByBrowseTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'browseTime', Sort.desc);
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterSortBy> thenByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QAfterSortBy>
      thenByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }
}

extension BrowsedRecentlyQueryWhereDistinct
    on QueryBuilder<BrowsedRecently, BrowsedRecently, QDistinct> {
  QueryBuilder<BrowsedRecently, BrowsedRecently, QDistinct>
      distinctByBrowseTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'browseTime');
    });
  }

  QueryBuilder<BrowsedRecently, BrowsedRecently, QDistinct> distinctByIsbn(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isbn', caseSensitive: caseSensitive);
    });
  }
}

extension BrowsedRecentlyQueryProperty
    on QueryBuilder<BrowsedRecently, BrowsedRecently, QQueryProperty> {
  QueryBuilder<BrowsedRecently, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BrowsedRecently, DateTime, QQueryOperations>
      browseTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'browseTime');
    });
  }

  QueryBuilder<BrowsedRecently, String, QQueryOperations> isbnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isbn');
    });
  }
}
