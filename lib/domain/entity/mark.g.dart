// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMarkCollection on Isar {
  IsarCollection<Mark> get marks => this.collection();
}

const MarkSchema = CollectionSchema(
  name: r'Mark',
  id: 3533883685707149477,
  properties: {
    r'lastUserId': PropertySchema(
      id: 0,
      name: r'lastUserId',
      type: IsarType.long,
    )
  },
  estimateSize: _markEstimateSize,
  serialize: _markSerialize,
  deserialize: _markDeserialize,
  deserializeProp: _markDeserializeProp,
  idName: r'id',
  indexes: {
    r'lastUserId': IndexSchema(
      id: 844486483774468129,
      name: r'lastUserId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'lastUserId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _markGetId,
  getLinks: _markGetLinks,
  attach: _markAttach,
  version: '3.1.0+1',
);

int _markEstimateSize(
  Mark object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _markSerialize(
  Mark object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.lastUserId);
}

Mark _markDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Mark(
    lastUserId: reader.readLongOrNull(offsets[0]),
  );
  object.id = id;
  return object;
}

P _markDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _markGetId(Mark object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _markGetLinks(Mark object) {
  return [];
}

void _markAttach(IsarCollection<dynamic> col, Id id, Mark object) {
  object.id = id;
}

extension MarkByIndex on IsarCollection<Mark> {
  Future<Mark?> getByLastUserId(int? lastUserId) {
    return getByIndex(r'lastUserId', [lastUserId]);
  }

  Mark? getByLastUserIdSync(int? lastUserId) {
    return getByIndexSync(r'lastUserId', [lastUserId]);
  }

  Future<bool> deleteByLastUserId(int? lastUserId) {
    return deleteByIndex(r'lastUserId', [lastUserId]);
  }

  bool deleteByLastUserIdSync(int? lastUserId) {
    return deleteByIndexSync(r'lastUserId', [lastUserId]);
  }

  Future<List<Mark?>> getAllByLastUserId(List<int?> lastUserIdValues) {
    final values = lastUserIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'lastUserId', values);
  }

  List<Mark?> getAllByLastUserIdSync(List<int?> lastUserIdValues) {
    final values = lastUserIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'lastUserId', values);
  }

  Future<int> deleteAllByLastUserId(List<int?> lastUserIdValues) {
    final values = lastUserIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'lastUserId', values);
  }

  int deleteAllByLastUserIdSync(List<int?> lastUserIdValues) {
    final values = lastUserIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'lastUserId', values);
  }

  Future<Id> putByLastUserId(Mark object) {
    return putByIndex(r'lastUserId', object);
  }

  Id putByLastUserIdSync(Mark object, {bool saveLinks = true}) {
    return putByIndexSync(r'lastUserId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByLastUserId(List<Mark> objects) {
    return putAllByIndex(r'lastUserId', objects);
  }

  List<Id> putAllByLastUserIdSync(List<Mark> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'lastUserId', objects, saveLinks: saveLinks);
  }
}

extension MarkQueryWhereSort on QueryBuilder<Mark, Mark, QWhere> {
  QueryBuilder<Mark, Mark, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Mark, Mark, QAfterWhere> anyLastUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'lastUserId'),
      );
    });
  }
}

extension MarkQueryWhere on QueryBuilder<Mark, Mark, QWhereClause> {
  QueryBuilder<Mark, Mark, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Mark, Mark, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Mark, Mark, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Mark, Mark, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Mark, Mark, QAfterWhereClause> idBetween(
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

  QueryBuilder<Mark, Mark, QAfterWhereClause> lastUserIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastUserId',
        value: [null],
      ));
    });
  }

  QueryBuilder<Mark, Mark, QAfterWhereClause> lastUserIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastUserId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Mark, Mark, QAfterWhereClause> lastUserIdEqualTo(
      int? lastUserId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastUserId',
        value: [lastUserId],
      ));
    });
  }

  QueryBuilder<Mark, Mark, QAfterWhereClause> lastUserIdNotEqualTo(
      int? lastUserId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastUserId',
              lower: [],
              upper: [lastUserId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastUserId',
              lower: [lastUserId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastUserId',
              lower: [lastUserId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastUserId',
              lower: [],
              upper: [lastUserId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Mark, Mark, QAfterWhereClause> lastUserIdGreaterThan(
    int? lastUserId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastUserId',
        lower: [lastUserId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Mark, Mark, QAfterWhereClause> lastUserIdLessThan(
    int? lastUserId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastUserId',
        lower: [],
        upper: [lastUserId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Mark, Mark, QAfterWhereClause> lastUserIdBetween(
    int? lowerLastUserId,
    int? upperLastUserId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastUserId',
        lower: [lowerLastUserId],
        includeLower: includeLower,
        upper: [upperLastUserId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MarkQueryFilter on QueryBuilder<Mark, Mark, QFilterCondition> {
  QueryBuilder<Mark, Mark, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Mark, Mark, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Mark, Mark, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Mark, Mark, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Mark, Mark, QAfterFilterCondition> lastUserIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUserId',
      ));
    });
  }

  QueryBuilder<Mark, Mark, QAfterFilterCondition> lastUserIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUserId',
      ));
    });
  }

  QueryBuilder<Mark, Mark, QAfterFilterCondition> lastUserIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUserId',
        value: value,
      ));
    });
  }

  QueryBuilder<Mark, Mark, QAfterFilterCondition> lastUserIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUserId',
        value: value,
      ));
    });
  }

  QueryBuilder<Mark, Mark, QAfterFilterCondition> lastUserIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUserId',
        value: value,
      ));
    });
  }

  QueryBuilder<Mark, Mark, QAfterFilterCondition> lastUserIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUserId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MarkQueryObject on QueryBuilder<Mark, Mark, QFilterCondition> {}

extension MarkQueryLinks on QueryBuilder<Mark, Mark, QFilterCondition> {}

extension MarkQuerySortBy on QueryBuilder<Mark, Mark, QSortBy> {
  QueryBuilder<Mark, Mark, QAfterSortBy> sortByLastUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUserId', Sort.asc);
    });
  }

  QueryBuilder<Mark, Mark, QAfterSortBy> sortByLastUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUserId', Sort.desc);
    });
  }
}

extension MarkQuerySortThenBy on QueryBuilder<Mark, Mark, QSortThenBy> {
  QueryBuilder<Mark, Mark, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Mark, Mark, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Mark, Mark, QAfterSortBy> thenByLastUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUserId', Sort.asc);
    });
  }

  QueryBuilder<Mark, Mark, QAfterSortBy> thenByLastUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUserId', Sort.desc);
    });
  }
}

extension MarkQueryWhereDistinct on QueryBuilder<Mark, Mark, QDistinct> {
  QueryBuilder<Mark, Mark, QDistinct> distinctByLastUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUserId');
    });
  }
}

extension MarkQueryProperty on QueryBuilder<Mark, Mark, QQueryProperty> {
  QueryBuilder<Mark, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Mark, int?, QQueryOperations> lastUserIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUserId');
    });
  }
}
