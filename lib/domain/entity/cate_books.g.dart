// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cate_books.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCateBooksCollection on Isar {
  IsarCollection<CateBooks> get cateBooks => this.collection();
}

const CateBooksSchema = CollectionSchema(
  name: r'CateBooks',
  id: 6335980777275367494,
  properties: {
    r'category1': PropertySchema(
      id: 0,
      name: r'category1',
      type: IsarType.long,
    ),
    r'category2': PropertySchema(
      id: 1,
      name: r'category2',
      type: IsarType.long,
    ),
    r'isbns': PropertySchema(
      id: 2,
      name: r'isbns',
      type: IsarType.stringList,
    )
  },
  estimateSize: _cateBooksEstimateSize,
  serialize: _cateBooksSerialize,
  deserialize: _cateBooksDeserialize,
  deserializeProp: _cateBooksDeserializeProp,
  idName: r'id',
  indexes: {
    r'category1_category2': IndexSchema(
      id: -389939779087909285,
      name: r'category1_category2',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'category1',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'category2',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _cateBooksGetId,
  getLinks: _cateBooksGetLinks,
  attach: _cateBooksAttach,
  version: '3.1.0+1',
);

int _cateBooksEstimateSize(
  CateBooks object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.isbns.length * 3;
  {
    for (var i = 0; i < object.isbns.length; i++) {
      final value = object.isbns[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _cateBooksSerialize(
  CateBooks object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.category1);
  writer.writeLong(offsets[1], object.category2);
  writer.writeStringList(offsets[2], object.isbns);
}

CateBooks _cateBooksDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CateBooks(
    category1: reader.readLong(offsets[0]),
    category2: reader.readLong(offsets[1]),
    isbns: reader.readStringList(offsets[2]) ?? [],
  );
  object.id = id;
  return object;
}

P _cateBooksDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cateBooksGetId(CateBooks object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cateBooksGetLinks(CateBooks object) {
  return [];
}

void _cateBooksAttach(IsarCollection<dynamic> col, Id id, CateBooks object) {
  object.id = id;
}

extension CateBooksByIndex on IsarCollection<CateBooks> {
  Future<CateBooks?> getByCategory1Category2(int category1, int category2) {
    return getByIndex(r'category1_category2', [category1, category2]);
  }

  CateBooks? getByCategory1Category2Sync(int category1, int category2) {
    return getByIndexSync(r'category1_category2', [category1, category2]);
  }

  Future<bool> deleteByCategory1Category2(int category1, int category2) {
    return deleteByIndex(r'category1_category2', [category1, category2]);
  }

  bool deleteByCategory1Category2Sync(int category1, int category2) {
    return deleteByIndexSync(r'category1_category2', [category1, category2]);
  }

  Future<List<CateBooks?>> getAllByCategory1Category2(
      List<int> category1Values, List<int> category2Values) {
    final len = category1Values.length;
    assert(category2Values.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([category1Values[i], category2Values[i]]);
    }

    return getAllByIndex(r'category1_category2', values);
  }

  List<CateBooks?> getAllByCategory1Category2Sync(
      List<int> category1Values, List<int> category2Values) {
    final len = category1Values.length;
    assert(category2Values.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([category1Values[i], category2Values[i]]);
    }

    return getAllByIndexSync(r'category1_category2', values);
  }

  Future<int> deleteAllByCategory1Category2(
      List<int> category1Values, List<int> category2Values) {
    final len = category1Values.length;
    assert(category2Values.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([category1Values[i], category2Values[i]]);
    }

    return deleteAllByIndex(r'category1_category2', values);
  }

  int deleteAllByCategory1Category2Sync(
      List<int> category1Values, List<int> category2Values) {
    final len = category1Values.length;
    assert(category2Values.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([category1Values[i], category2Values[i]]);
    }

    return deleteAllByIndexSync(r'category1_category2', values);
  }

  Future<Id> putByCategory1Category2(CateBooks object) {
    return putByIndex(r'category1_category2', object);
  }

  Id putByCategory1Category2Sync(CateBooks object, {bool saveLinks = true}) {
    return putByIndexSync(r'category1_category2', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCategory1Category2(List<CateBooks> objects) {
    return putAllByIndex(r'category1_category2', objects);
  }

  List<Id> putAllByCategory1Category2Sync(List<CateBooks> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'category1_category2', objects,
        saveLinks: saveLinks);
  }
}

extension CateBooksQueryWhereSort
    on QueryBuilder<CateBooks, CateBooks, QWhere> {
  QueryBuilder<CateBooks, CateBooks, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterWhere> anyCategory1Category2() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'category1_category2'),
      );
    });
  }
}

extension CateBooksQueryWhere
    on QueryBuilder<CateBooks, CateBooks, QWhereClause> {
  QueryBuilder<CateBooks, CateBooks, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<CateBooks, CateBooks, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterWhereClause> idBetween(
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

  QueryBuilder<CateBooks, CateBooks, QAfterWhereClause>
      category1EqualToAnyCategory2(int category1) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'category1_category2',
        value: [category1],
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterWhereClause>
      category1NotEqualToAnyCategory2(int category1) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category1_category2',
              lower: [],
              upper: [category1],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category1_category2',
              lower: [category1],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category1_category2',
              lower: [category1],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category1_category2',
              lower: [],
              upper: [category1],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterWhereClause>
      category1GreaterThanAnyCategory2(
    int category1, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'category1_category2',
        lower: [category1],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterWhereClause>
      category1LessThanAnyCategory2(
    int category1, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'category1_category2',
        lower: [],
        upper: [category1],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterWhereClause>
      category1BetweenAnyCategory2(
    int lowerCategory1,
    int upperCategory1, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'category1_category2',
        lower: [lowerCategory1],
        includeLower: includeLower,
        upper: [upperCategory1],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterWhereClause>
      category1Category2EqualTo(int category1, int category2) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'category1_category2',
        value: [category1, category2],
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterWhereClause>
      category1EqualToCategory2NotEqualTo(int category1, int category2) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category1_category2',
              lower: [category1],
              upper: [category1, category2],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category1_category2',
              lower: [category1, category2],
              includeLower: false,
              upper: [category1],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category1_category2',
              lower: [category1, category2],
              includeLower: false,
              upper: [category1],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'category1_category2',
              lower: [category1],
              upper: [category1, category2],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterWhereClause>
      category1EqualToCategory2GreaterThan(
    int category1,
    int category2, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'category1_category2',
        lower: [category1, category2],
        includeLower: include,
        upper: [category1],
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterWhereClause>
      category1EqualToCategory2LessThan(
    int category1,
    int category2, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'category1_category2',
        lower: [category1],
        upper: [category1, category2],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterWhereClause>
      category1EqualToCategory2Between(
    int category1,
    int lowerCategory2,
    int upperCategory2, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'category1_category2',
        lower: [category1, lowerCategory2],
        includeLower: includeLower,
        upper: [category1, upperCategory2],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CateBooksQueryFilter
    on QueryBuilder<CateBooks, CateBooks, QFilterCondition> {
  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition> category1EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category1',
        value: value,
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition>
      category1GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category1',
        value: value,
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition> category1LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category1',
        value: value,
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition> category1Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition> category2EqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category2',
        value: value,
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition>
      category2GreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category2',
        value: value,
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition> category2LessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category2',
        value: value,
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition> category2Between(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition> isbnsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isbns',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition>
      isbnsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isbns',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition>
      isbnsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isbns',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition> isbnsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isbns',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition>
      isbnsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'isbns',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition>
      isbnsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'isbns',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition>
      isbnsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'isbns',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition> isbnsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'isbns',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition>
      isbnsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isbns',
        value: '',
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition>
      isbnsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isbns',
        value: '',
      ));
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition> isbnsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isbns',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition> isbnsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isbns',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition> isbnsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isbns',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition> isbnsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isbns',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition>
      isbnsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isbns',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterFilterCondition> isbnsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'isbns',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension CateBooksQueryObject
    on QueryBuilder<CateBooks, CateBooks, QFilterCondition> {}

extension CateBooksQueryLinks
    on QueryBuilder<CateBooks, CateBooks, QFilterCondition> {}

extension CateBooksQuerySortBy on QueryBuilder<CateBooks, CateBooks, QSortBy> {
  QueryBuilder<CateBooks, CateBooks, QAfterSortBy> sortByCategory1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1', Sort.asc);
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterSortBy> sortByCategory1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1', Sort.desc);
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterSortBy> sortByCategory2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category2', Sort.asc);
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterSortBy> sortByCategory2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category2', Sort.desc);
    });
  }
}

extension CateBooksQuerySortThenBy
    on QueryBuilder<CateBooks, CateBooks, QSortThenBy> {
  QueryBuilder<CateBooks, CateBooks, QAfterSortBy> thenByCategory1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1', Sort.asc);
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterSortBy> thenByCategory1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category1', Sort.desc);
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterSortBy> thenByCategory2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category2', Sort.asc);
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterSortBy> thenByCategory2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category2', Sort.desc);
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CateBooks, CateBooks, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension CateBooksQueryWhereDistinct
    on QueryBuilder<CateBooks, CateBooks, QDistinct> {
  QueryBuilder<CateBooks, CateBooks, QDistinct> distinctByCategory1() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category1');
    });
  }

  QueryBuilder<CateBooks, CateBooks, QDistinct> distinctByCategory2() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category2');
    });
  }

  QueryBuilder<CateBooks, CateBooks, QDistinct> distinctByIsbns() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isbns');
    });
  }
}

extension CateBooksQueryProperty
    on QueryBuilder<CateBooks, CateBooks, QQueryProperty> {
  QueryBuilder<CateBooks, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CateBooks, int, QQueryOperations> category1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category1');
    });
  }

  QueryBuilder<CateBooks, int, QQueryOperations> category2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category2');
    });
  }

  QueryBuilder<CateBooks, List<String>, QQueryOperations> isbnsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isbns');
    });
  }
}
