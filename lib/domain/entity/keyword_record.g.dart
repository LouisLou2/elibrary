// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyword_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetKeywordRecordCollection on Isar {
  IsarCollection<KeywordRecord> get keywordRecords => this.collection();
}

const KeywordRecordSchema = CollectionSchema(
  name: r'KeywordRecord',
  id: 3834852867641703798,
  properties: {
    r'keyword': PropertySchema(
      id: 0,
      name: r'keyword',
      type: IsarType.string,
    ),
    r'lastSearchTime': PropertySchema(
      id: 1,
      name: r'lastSearchTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _keywordRecordEstimateSize,
  serialize: _keywordRecordSerialize,
  deserialize: _keywordRecordDeserialize,
  deserializeProp: _keywordRecordDeserializeProp,
  idName: r'id',
  indexes: {
    r'keyword': IndexSchema(
      id: 5840366397742622134,
      name: r'keyword',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'keyword',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'lastSearchTime': IndexSchema(
      id: 1279236970641032273,
      name: r'lastSearchTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'lastSearchTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _keywordRecordGetId,
  getLinks: _keywordRecordGetLinks,
  attach: _keywordRecordAttach,
  version: '3.1.0+1',
);

int _keywordRecordEstimateSize(
  KeywordRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.keyword.length * 3;
  return bytesCount;
}

void _keywordRecordSerialize(
  KeywordRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.keyword);
  writer.writeDateTime(offsets[1], object.lastSearchTime);
}

KeywordRecord _keywordRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = KeywordRecord(
    keyword: reader.readString(offsets[0]),
    lastSearchTime: reader.readDateTime(offsets[1]),
  );
  object.id = id;
  return object;
}

P _keywordRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _keywordRecordGetId(KeywordRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _keywordRecordGetLinks(KeywordRecord object) {
  return [];
}

void _keywordRecordAttach(
    IsarCollection<dynamic> col, Id id, KeywordRecord object) {
  object.id = id;
}

extension KeywordRecordByIndex on IsarCollection<KeywordRecord> {
  Future<KeywordRecord?> getByKeyword(String keyword) {
    return getByIndex(r'keyword', [keyword]);
  }

  KeywordRecord? getByKeywordSync(String keyword) {
    return getByIndexSync(r'keyword', [keyword]);
  }

  Future<bool> deleteByKeyword(String keyword) {
    return deleteByIndex(r'keyword', [keyword]);
  }

  bool deleteByKeywordSync(String keyword) {
    return deleteByIndexSync(r'keyword', [keyword]);
  }

  Future<List<KeywordRecord?>> getAllByKeyword(List<String> keywordValues) {
    final values = keywordValues.map((e) => [e]).toList();
    return getAllByIndex(r'keyword', values);
  }

  List<KeywordRecord?> getAllByKeywordSync(List<String> keywordValues) {
    final values = keywordValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'keyword', values);
  }

  Future<int> deleteAllByKeyword(List<String> keywordValues) {
    final values = keywordValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'keyword', values);
  }

  int deleteAllByKeywordSync(List<String> keywordValues) {
    final values = keywordValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'keyword', values);
  }

  Future<Id> putByKeyword(KeywordRecord object) {
    return putByIndex(r'keyword', object);
  }

  Id putByKeywordSync(KeywordRecord object, {bool saveLinks = true}) {
    return putByIndexSync(r'keyword', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByKeyword(List<KeywordRecord> objects) {
    return putAllByIndex(r'keyword', objects);
  }

  List<Id> putAllByKeywordSync(List<KeywordRecord> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'keyword', objects, saveLinks: saveLinks);
  }
}

extension KeywordRecordQueryWhereSort
    on QueryBuilder<KeywordRecord, KeywordRecord, QWhere> {
  QueryBuilder<KeywordRecord, KeywordRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterWhere> anyLastSearchTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'lastSearchTime'),
      );
    });
  }
}

extension KeywordRecordQueryWhere
    on QueryBuilder<KeywordRecord, KeywordRecord, QWhereClause> {
  QueryBuilder<KeywordRecord, KeywordRecord, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterWhereClause> idBetween(
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

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterWhereClause> keywordEqualTo(
      String keyword) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'keyword',
        value: [keyword],
      ));
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterWhereClause>
      keywordNotEqualTo(String keyword) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'keyword',
              lower: [],
              upper: [keyword],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'keyword',
              lower: [keyword],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'keyword',
              lower: [keyword],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'keyword',
              lower: [],
              upper: [keyword],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterWhereClause>
      lastSearchTimeEqualTo(DateTime lastSearchTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastSearchTime',
        value: [lastSearchTime],
      ));
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterWhereClause>
      lastSearchTimeNotEqualTo(DateTime lastSearchTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastSearchTime',
              lower: [],
              upper: [lastSearchTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastSearchTime',
              lower: [lastSearchTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastSearchTime',
              lower: [lastSearchTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastSearchTime',
              lower: [],
              upper: [lastSearchTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterWhereClause>
      lastSearchTimeGreaterThan(
    DateTime lastSearchTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastSearchTime',
        lower: [lastSearchTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterWhereClause>
      lastSearchTimeLessThan(
    DateTime lastSearchTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastSearchTime',
        lower: [],
        upper: [lastSearchTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterWhereClause>
      lastSearchTimeBetween(
    DateTime lowerLastSearchTime,
    DateTime upperLastSearchTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastSearchTime',
        lower: [lowerLastSearchTime],
        includeLower: includeLower,
        upper: [upperLastSearchTime],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension KeywordRecordQueryFilter
    on QueryBuilder<KeywordRecord, KeywordRecord, QFilterCondition> {
  QueryBuilder<KeywordRecord, KeywordRecord, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterFilterCondition>
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

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterFilterCondition> idBetween(
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

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterFilterCondition>
      keywordEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterFilterCondition>
      keywordGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterFilterCondition>
      keywordLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterFilterCondition>
      keywordBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'keyword',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterFilterCondition>
      keywordStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterFilterCondition>
      keywordEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterFilterCondition>
      keywordContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterFilterCondition>
      keywordMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'keyword',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterFilterCondition>
      keywordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'keyword',
        value: '',
      ));
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterFilterCondition>
      keywordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'keyword',
        value: '',
      ));
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterFilterCondition>
      lastSearchTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSearchTime',
        value: value,
      ));
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterFilterCondition>
      lastSearchTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSearchTime',
        value: value,
      ));
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterFilterCondition>
      lastSearchTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSearchTime',
        value: value,
      ));
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterFilterCondition>
      lastSearchTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSearchTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension KeywordRecordQueryObject
    on QueryBuilder<KeywordRecord, KeywordRecord, QFilterCondition> {}

extension KeywordRecordQueryLinks
    on QueryBuilder<KeywordRecord, KeywordRecord, QFilterCondition> {}

extension KeywordRecordQuerySortBy
    on QueryBuilder<KeywordRecord, KeywordRecord, QSortBy> {
  QueryBuilder<KeywordRecord, KeywordRecord, QAfterSortBy> sortByKeyword() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyword', Sort.asc);
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterSortBy> sortByKeywordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyword', Sort.desc);
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterSortBy>
      sortByLastSearchTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSearchTime', Sort.asc);
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterSortBy>
      sortByLastSearchTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSearchTime', Sort.desc);
    });
  }
}

extension KeywordRecordQuerySortThenBy
    on QueryBuilder<KeywordRecord, KeywordRecord, QSortThenBy> {
  QueryBuilder<KeywordRecord, KeywordRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterSortBy> thenByKeyword() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyword', Sort.asc);
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterSortBy> thenByKeywordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyword', Sort.desc);
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterSortBy>
      thenByLastSearchTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSearchTime', Sort.asc);
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QAfterSortBy>
      thenByLastSearchTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSearchTime', Sort.desc);
    });
  }
}

extension KeywordRecordQueryWhereDistinct
    on QueryBuilder<KeywordRecord, KeywordRecord, QDistinct> {
  QueryBuilder<KeywordRecord, KeywordRecord, QDistinct> distinctByKeyword(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'keyword', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<KeywordRecord, KeywordRecord, QDistinct>
      distinctByLastSearchTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSearchTime');
    });
  }
}

extension KeywordRecordQueryProperty
    on QueryBuilder<KeywordRecord, KeywordRecord, QQueryProperty> {
  QueryBuilder<KeywordRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<KeywordRecord, String, QQueryOperations> keywordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'keyword');
    });
  }

  QueryBuilder<KeywordRecord, DateTime, QQueryOperations>
      lastSearchTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSearchTime');
    });
  }
}
