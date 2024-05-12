// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_cache_info.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBookCacheInfoCollection on Isar {
  IsarCollection<BookCacheInfo> get bookCacheInfos => this.collection();
}

const BookCacheInfoSchema = CollectionSchema(
  name: r'BookCacheInfo',
  id: -454638842942912375,
  properties: {
    r'cover_l_path': PropertySchema(
      id: 0,
      name: r'cover_l_path',
      type: IsarType.string,
    ),
    r'cover_m_path': PropertySchema(
      id: 1,
      name: r'cover_m_path',
      type: IsarType.string,
    ),
    r'cover_s_path': PropertySchema(
      id: 2,
      name: r'cover_s_path',
      type: IsarType.string,
    ),
    r'ebook_path': PropertySchema(
      id: 3,
      name: r'ebook_path',
      type: IsarType.string,
    ),
    r'isbn': PropertySchema(
      id: 4,
      name: r'isbn',
      type: IsarType.string,
    )
  },
  estimateSize: _bookCacheInfoEstimateSize,
  serialize: _bookCacheInfoSerialize,
  deserialize: _bookCacheInfoDeserialize,
  deserializeProp: _bookCacheInfoDeserializeProp,
  idName: r'id',
  indexes: {
    r'isbn': IndexSchema(
      id: 6054191419597679524,
      name: r'isbn',
      unique: true,
      replace: false,
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
  getId: _bookCacheInfoGetId,
  getLinks: _bookCacheInfoGetLinks,
  attach: _bookCacheInfoAttach,
  version: '3.1.0+1',
);

int _bookCacheInfoEstimateSize(
  BookCacheInfo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.cover_l_path;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cover_m_path;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cover_s_path;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ebook_path;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.isbn.length * 3;
  return bytesCount;
}

void _bookCacheInfoSerialize(
  BookCacheInfo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cover_l_path);
  writer.writeString(offsets[1], object.cover_m_path);
  writer.writeString(offsets[2], object.cover_s_path);
  writer.writeString(offsets[3], object.ebook_path);
  writer.writeString(offsets[4], object.isbn);
}

BookCacheInfo _bookCacheInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BookCacheInfo(
    cover_l_path: reader.readStringOrNull(offsets[0]),
    cover_m_path: reader.readStringOrNull(offsets[1]),
    cover_s_path: reader.readStringOrNull(offsets[2]),
    ebook_path: reader.readStringOrNull(offsets[3]),
    isbn: reader.readString(offsets[4]),
  );
  object.id = id;
  return object;
}

P _bookCacheInfoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bookCacheInfoGetId(BookCacheInfo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bookCacheInfoGetLinks(BookCacheInfo object) {
  return [];
}

void _bookCacheInfoAttach(
    IsarCollection<dynamic> col, Id id, BookCacheInfo object) {
  object.id = id;
}

extension BookCacheInfoByIndex on IsarCollection<BookCacheInfo> {
  Future<BookCacheInfo?> getByIsbn(String isbn) {
    return getByIndex(r'isbn', [isbn]);
  }

  BookCacheInfo? getByIsbnSync(String isbn) {
    return getByIndexSync(r'isbn', [isbn]);
  }

  Future<bool> deleteByIsbn(String isbn) {
    return deleteByIndex(r'isbn', [isbn]);
  }

  bool deleteByIsbnSync(String isbn) {
    return deleteByIndexSync(r'isbn', [isbn]);
  }

  Future<List<BookCacheInfo?>> getAllByIsbn(List<String> isbnValues) {
    final values = isbnValues.map((e) => [e]).toList();
    return getAllByIndex(r'isbn', values);
  }

  List<BookCacheInfo?> getAllByIsbnSync(List<String> isbnValues) {
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

  Future<Id> putByIsbn(BookCacheInfo object) {
    return putByIndex(r'isbn', object);
  }

  Id putByIsbnSync(BookCacheInfo object, {bool saveLinks = true}) {
    return putByIndexSync(r'isbn', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIsbn(List<BookCacheInfo> objects) {
    return putAllByIndex(r'isbn', objects);
  }

  List<Id> putAllByIsbnSync(List<BookCacheInfo> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'isbn', objects, saveLinks: saveLinks);
  }
}

extension BookCacheInfoQueryWhereSort
    on QueryBuilder<BookCacheInfo, BookCacheInfo, QWhere> {
  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BookCacheInfoQueryWhere
    on QueryBuilder<BookCacheInfo, BookCacheInfo, QWhereClause> {
  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterWhereClause> idBetween(
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

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterWhereClause> isbnEqualTo(
      String isbn) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isbn',
        value: [isbn],
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterWhereClause> isbnNotEqualTo(
      String isbn) {
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

extension BookCacheInfoQueryFilter
    on QueryBuilder<BookCacheInfo, BookCacheInfo, QFilterCondition> {
  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_l_pathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cover_l_path',
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_l_pathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cover_l_path',
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_l_pathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cover_l_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_l_pathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cover_l_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_l_pathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cover_l_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_l_pathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cover_l_path',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_l_pathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cover_l_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_l_pathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cover_l_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_l_pathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cover_l_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_l_pathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cover_l_path',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_l_pathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cover_l_path',
        value: '',
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_l_pathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cover_l_path',
        value: '',
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_m_pathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cover_m_path',
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_m_pathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cover_m_path',
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_m_pathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cover_m_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_m_pathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cover_m_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_m_pathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cover_m_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_m_pathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cover_m_path',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_m_pathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cover_m_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_m_pathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cover_m_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_m_pathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cover_m_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_m_pathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cover_m_path',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_m_pathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cover_m_path',
        value: '',
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_m_pathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cover_m_path',
        value: '',
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_s_pathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cover_s_path',
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_s_pathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cover_s_path',
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_s_pathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cover_s_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_s_pathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cover_s_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_s_pathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cover_s_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_s_pathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cover_s_path',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_s_pathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cover_s_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_s_pathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cover_s_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_s_pathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cover_s_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_s_pathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cover_s_path',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_s_pathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cover_s_path',
        value: '',
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      cover_s_pathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cover_s_path',
        value: '',
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      ebook_pathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ebook_path',
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      ebook_pathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ebook_path',
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      ebook_pathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ebook_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      ebook_pathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ebook_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      ebook_pathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ebook_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      ebook_pathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ebook_path',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      ebook_pathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ebook_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      ebook_pathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ebook_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      ebook_pathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ebook_path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      ebook_pathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ebook_path',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      ebook_pathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ebook_path',
        value: '',
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      ebook_pathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ebook_path',
        value: '',
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
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

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition> isbnEqualTo(
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

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
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

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
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

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition> isbnBetween(
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

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
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

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
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

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      isbnContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'isbn',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition> isbnMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'isbn',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      isbnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isbn',
        value: '',
      ));
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterFilterCondition>
      isbnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isbn',
        value: '',
      ));
    });
  }
}

extension BookCacheInfoQueryObject
    on QueryBuilder<BookCacheInfo, BookCacheInfo, QFilterCondition> {}

extension BookCacheInfoQueryLinks
    on QueryBuilder<BookCacheInfo, BookCacheInfo, QFilterCondition> {}

extension BookCacheInfoQuerySortBy
    on QueryBuilder<BookCacheInfo, BookCacheInfo, QSortBy> {
  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterSortBy>
      sortByCover_l_path() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_l_path', Sort.asc);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterSortBy>
      sortByCover_l_pathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_l_path', Sort.desc);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterSortBy>
      sortByCover_m_path() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_m_path', Sort.asc);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterSortBy>
      sortByCover_m_pathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_m_path', Sort.desc);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterSortBy>
      sortByCover_s_path() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_s_path', Sort.asc);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterSortBy>
      sortByCover_s_pathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_s_path', Sort.desc);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterSortBy> sortByEbook_path() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ebook_path', Sort.asc);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterSortBy>
      sortByEbook_pathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ebook_path', Sort.desc);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterSortBy> sortByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterSortBy> sortByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }
}

extension BookCacheInfoQuerySortThenBy
    on QueryBuilder<BookCacheInfo, BookCacheInfo, QSortThenBy> {
  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterSortBy>
      thenByCover_l_path() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_l_path', Sort.asc);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterSortBy>
      thenByCover_l_pathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_l_path', Sort.desc);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterSortBy>
      thenByCover_m_path() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_m_path', Sort.asc);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterSortBy>
      thenByCover_m_pathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_m_path', Sort.desc);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterSortBy>
      thenByCover_s_path() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_s_path', Sort.asc);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterSortBy>
      thenByCover_s_pathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover_s_path', Sort.desc);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterSortBy> thenByEbook_path() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ebook_path', Sort.asc);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterSortBy>
      thenByEbook_pathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ebook_path', Sort.desc);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterSortBy> thenByIsbn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.asc);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QAfterSortBy> thenByIsbnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isbn', Sort.desc);
    });
  }
}

extension BookCacheInfoQueryWhereDistinct
    on QueryBuilder<BookCacheInfo, BookCacheInfo, QDistinct> {
  QueryBuilder<BookCacheInfo, BookCacheInfo, QDistinct> distinctByCover_l_path(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cover_l_path', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QDistinct> distinctByCover_m_path(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cover_m_path', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QDistinct> distinctByCover_s_path(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cover_s_path', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QDistinct> distinctByEbook_path(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ebook_path', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BookCacheInfo, BookCacheInfo, QDistinct> distinctByIsbn(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isbn', caseSensitive: caseSensitive);
    });
  }
}

extension BookCacheInfoQueryProperty
    on QueryBuilder<BookCacheInfo, BookCacheInfo, QQueryProperty> {
  QueryBuilder<BookCacheInfo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BookCacheInfo, String?, QQueryOperations>
      cover_l_pathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cover_l_path');
    });
  }

  QueryBuilder<BookCacheInfo, String?, QQueryOperations>
      cover_m_pathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cover_m_path');
    });
  }

  QueryBuilder<BookCacheInfo, String?, QQueryOperations>
      cover_s_pathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cover_s_path');
    });
  }

  QueryBuilder<BookCacheInfo, String?, QQueryOperations> ebook_pathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ebook_path');
    });
  }

  QueryBuilder<BookCacheInfo, String, QQueryOperations> isbnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isbn');
    });
  }
}
