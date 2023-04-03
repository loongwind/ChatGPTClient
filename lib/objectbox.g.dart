// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'model/chat_model.dart';
import 'model/setting.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 6412060380571589125),
      name: 'ChatSession',
      lastPropertyId: const IdUid(3, 5291310750128814168),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7000643486693852116),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 6559707706064682949),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5291310750128814168),
            name: 'sessionId',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[
        ModelRelation(
            id: const IdUid(1, 986120422415421405),
            name: 'messages',
            targetId: const IdUid(2, 6823399755781780845))
      ],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 6823399755781780845),
      name: 'ChatMessage',
      lastPropertyId: const IdUid(6, 6960348245720094078),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 6568101848183323789),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 4152669219768404118),
            name: 'isChatGPT',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 8722626962968777729),
            name: 'message',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 9006858837085236105),
            name: 'token',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1829045320003711463),
            name: 'model',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 6960348245720094078),
            name: 'messageId',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 5679351917368176630),
      name: 'Setting',
      lastPropertyId: const IdUid(17, 4759505616122108853),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5180521186524149020),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 156640332369893998),
            name: 'apiKey',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 8327294744455413485),
            name: 'language',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 1659438581650627724),
            name: 'showWordsNum',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 2019398041130369989),
            name: 'model',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 8668270066324043578),
            name: 'maxContextTokens',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 5180510701887191288),
            name: 'maxResponseTokens',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 8168946802663992482),
            name: 'showModelName',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 5179136925031225345),
            name: 'enabledProxy',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 2849528444841763127),
            name: 'proxyType',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 5385657915147714141),
            name: 'proxyHost',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 1109420711351387203),
            name: 'proxyPort',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(13, 771975700334502457),
            name: 'isOpenAPI',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(14, 1846978209381596859),
            name: 'plusHost',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(15, 4846307900804060010),
            name: 'plusPort',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(16, 6317766323572490741),
            name: 'plusUsername',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(17, 4759505616122108853),
            name: 'plusPassword',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(3, 5679351917368176630),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(1, 986120422415421405),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    ChatSession: EntityDefinition<ChatSession>(
        model: _entities[0],
        toOneRelations: (ChatSession object) => [],
        toManyRelations: (ChatSession object) =>
            {RelInfo<ChatSession>.toMany(1, object.id): object.messages},
        getId: (ChatSession object) => object.id,
        setId: (ChatSession object, int id) {
          object.id = id;
        },
        objectToFB: (ChatSession object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final sessionIdOffset = object.sessionId == null
              ? null
              : fbb.writeString(object.sessionId!);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, sessionIdOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ChatSession()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..name = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 6, '')
            ..sessionId = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 8);
          InternalToManyAccess.setRelInfo(
              object.messages,
              store,
              RelInfo<ChatSession>.toMany(1, object.id),
              store.box<ChatSession>());
          return object;
        }),
    ChatMessage: EntityDefinition<ChatMessage>(
        model: _entities[1],
        toOneRelations: (ChatMessage object) => [],
        toManyRelations: (ChatMessage object) => {},
        getId: (ChatMessage object) => object.id,
        setId: (ChatMessage object, int id) {
          object.id = id;
        },
        objectToFB: (ChatMessage object, fb.Builder fbb) {
          final messageOffset = fbb.writeString(object.message);
          final modelOffset = fbb.writeString(object.model);
          final messageIdOffset = object.messageId == null
              ? null
              : fbb.writeString(object.messageId!);
          fbb.startTable(7);
          fbb.addInt64(0, object.id);
          fbb.addBool(1, object.isChatGPT);
          fbb.addOffset(2, messageOffset);
          fbb.addInt64(3, object.token);
          fbb.addOffset(4, modelOffset);
          fbb.addOffset(5, messageIdOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ChatMessage()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..isChatGPT =
                const fb.BoolReader().vTableGet(buffer, rootOffset, 6, false)
            ..message = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 8, '')
            ..token =
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0)
            ..model = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 12, '')
            ..messageId = const fb.StringReader(asciiOptimization: true)
                .vTableGetNullable(buffer, rootOffset, 14);

          return object;
        }),
    Setting: EntityDefinition<Setting>(
        model: _entities[2],
        toOneRelations: (Setting object) => [],
        toManyRelations: (Setting object) => {},
        getId: (Setting object) => object.id,
        setId: (Setting object, int id) {
          object.id = id;
        },
        objectToFB: (Setting object, fb.Builder fbb) {
          final apiKeyOffset = fbb.writeString(object.apiKey);
          final languageOffset = fbb.writeString(object.language);
          final modelOffset = fbb.writeString(object.model);
          final proxyTypeOffset = fbb.writeString(object.proxyType);
          final proxyHostOffset = fbb.writeString(object.proxyHost);
          final proxyPortOffset = fbb.writeString(object.proxyPort);
          final plusHostOffset = fbb.writeString(object.plusHost);
          final plusPortOffset = fbb.writeString(object.plusPort);
          final plusUsernameOffset = fbb.writeString(object.plusUsername);
          final plusPasswordOffset = fbb.writeString(object.plusPassword);
          fbb.startTable(18);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, apiKeyOffset);
          fbb.addOffset(2, languageOffset);
          fbb.addBool(3, object.showWordsNum);
          fbb.addOffset(4, modelOffset);
          fbb.addInt64(5, object.maxContextTokens);
          fbb.addInt64(6, object.maxResponseTokens);
          fbb.addBool(7, object.showModelName);
          fbb.addBool(8, object.enabledProxy);
          fbb.addOffset(9, proxyTypeOffset);
          fbb.addOffset(10, proxyHostOffset);
          fbb.addOffset(11, proxyPortOffset);
          fbb.addBool(12, object.isOpenAPI);
          fbb.addOffset(13, plusHostOffset);
          fbb.addOffset(14, plusPortOffset);
          fbb.addOffset(15, plusUsernameOffset);
          fbb.addOffset(16, plusPasswordOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Setting()
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..apiKey = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 6, '')
            ..language = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 8, '')
            ..showWordsNum =
                const fb.BoolReader().vTableGet(buffer, rootOffset, 10, false)
            ..model = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 12, '')
            ..maxContextTokens =
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0)
            ..maxResponseTokens =
                const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0)
            ..showModelName =
                const fb.BoolReader().vTableGet(buffer, rootOffset, 18, false)
            ..enabledProxy =
                const fb.BoolReader().vTableGet(buffer, rootOffset, 20, false)
            ..proxyType = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 22, '')
            ..proxyHost = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 24, '')
            ..proxyPort = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 26, '')
            ..isOpenAPI =
                const fb.BoolReader().vTableGet(buffer, rootOffset, 28, false)
            ..plusHost = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 30, '')
            ..plusPort = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 32, '')
            ..plusUsername = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 34, '')
            ..plusPassword = const fb.StringReader(asciiOptimization: true)
                .vTableGet(buffer, rootOffset, 36, '');

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [ChatSession] entity fields to define ObjectBox queries.
class ChatSession_ {
  /// see [ChatSession.id]
  static final id =
      QueryIntegerProperty<ChatSession>(_entities[0].properties[0]);

  /// see [ChatSession.name]
  static final name =
      QueryStringProperty<ChatSession>(_entities[0].properties[1]);

  /// see [ChatSession.sessionId]
  static final sessionId =
      QueryStringProperty<ChatSession>(_entities[0].properties[2]);

  /// see [ChatSession.messages]
  static final messages =
      QueryRelationToMany<ChatSession, ChatMessage>(_entities[0].relations[0]);
}

/// [ChatMessage] entity fields to define ObjectBox queries.
class ChatMessage_ {
  /// see [ChatMessage.id]
  static final id =
      QueryIntegerProperty<ChatMessage>(_entities[1].properties[0]);

  /// see [ChatMessage.isChatGPT]
  static final isChatGPT =
      QueryBooleanProperty<ChatMessage>(_entities[1].properties[1]);

  /// see [ChatMessage.message]
  static final message =
      QueryStringProperty<ChatMessage>(_entities[1].properties[2]);

  /// see [ChatMessage.token]
  static final token =
      QueryIntegerProperty<ChatMessage>(_entities[1].properties[3]);

  /// see [ChatMessage.model]
  static final model =
      QueryStringProperty<ChatMessage>(_entities[1].properties[4]);

  /// see [ChatMessage.messageId]
  static final messageId =
      QueryStringProperty<ChatMessage>(_entities[1].properties[5]);
}

/// [Setting] entity fields to define ObjectBox queries.
class Setting_ {
  /// see [Setting.id]
  static final id = QueryIntegerProperty<Setting>(_entities[2].properties[0]);

  /// see [Setting.apiKey]
  static final apiKey =
      QueryStringProperty<Setting>(_entities[2].properties[1]);

  /// see [Setting.language]
  static final language =
      QueryStringProperty<Setting>(_entities[2].properties[2]);

  /// see [Setting.showWordsNum]
  static final showWordsNum =
      QueryBooleanProperty<Setting>(_entities[2].properties[3]);

  /// see [Setting.model]
  static final model = QueryStringProperty<Setting>(_entities[2].properties[4]);

  /// see [Setting.maxContextTokens]
  static final maxContextTokens =
      QueryIntegerProperty<Setting>(_entities[2].properties[5]);

  /// see [Setting.maxResponseTokens]
  static final maxResponseTokens =
      QueryIntegerProperty<Setting>(_entities[2].properties[6]);

  /// see [Setting.showModelName]
  static final showModelName =
      QueryBooleanProperty<Setting>(_entities[2].properties[7]);

  /// see [Setting.enabledProxy]
  static final enabledProxy =
      QueryBooleanProperty<Setting>(_entities[2].properties[8]);

  /// see [Setting.proxyType]
  static final proxyType =
      QueryStringProperty<Setting>(_entities[2].properties[9]);

  /// see [Setting.proxyHost]
  static final proxyHost =
      QueryStringProperty<Setting>(_entities[2].properties[10]);

  /// see [Setting.proxyPort]
  static final proxyPort =
      QueryStringProperty<Setting>(_entities[2].properties[11]);

  /// see [Setting.isOpenAPI]
  static final isOpenAPI =
      QueryBooleanProperty<Setting>(_entities[2].properties[12]);

  /// see [Setting.plusHost]
  static final plusHost =
      QueryStringProperty<Setting>(_entities[2].properties[13]);

  /// see [Setting.plusPort]
  static final plusPort =
      QueryStringProperty<Setting>(_entities[2].properties[14]);

  /// see [Setting.plusUsername]
  static final plusUsername =
      QueryStringProperty<Setting>(_entities[2].properties[15]);

  /// see [Setting.plusPassword]
  static final plusPassword =
      QueryStringProperty<Setting>(_entities[2].properties[16]);
}
