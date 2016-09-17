import '../objects.dart';

/// A message.
class Message {
  /// The message's content.
  String content;

  /// The message's ID.
  String id;

  /// The message's nonce, null if not set.
  String nonce;

  /// The timestamp of when the message was created.
  String timestamp;

  /// The timestamp of when the message was last edited, null if not edited.
  String editedTimestamp;

  /// The ID for the message's channel.
  String channel;

  /// The message's author.
  User author;

  /// A list of the mentions in the message.
  List<User> mentions = [];

  /// A list of IDs for the role mentions in the message.
  List<String> roleMentions = [];

  /// A list of the embeds in the message.
  List<Embed> embeds = [];

  /// A list of attachments in the message.
  List<Attachment> attachments = [];

  /// When the message was created, redundant of `timestamp`.
  double createdAt;

  /// Whether or not the message is pinned.
  bool pinned;

  /// Whether or not the message was sent with TTS enabled.
  bool tts;

  /// Whether or @everyone was mentioned in the message.
  bool mentionEveryone;

  Message(Map data) {
    this.content = data['content'];
    this.id = data['id'];
    this.nonce = data['nonce'];
    this.timestamp = data['timestamp'];
    this.editedTimestamp = data['edited_timestamp'];
    this.author = new User(data['author']);
    this.channel = data['channel_id'];
    this.pinned = data['pinned'];
    this.tts = data['tts'];
    this.mentionEveryone = data['mention_everyone'];
    this.roleMentions = data['mention_roles'];
    this.createdAt = (int.parse(this.id) / 4194304) + 1420070400000;

    data['mentions'].forEach((user) {
      this.mentions.add(new User(user));
    });

    data['embeds'].forEach((embed) {
      this.embeds.add(new Embed(embed));
    });

    data['attachments'].forEach((attachment) {
      this.attachments.add(new Attachment(attachment));
    });
  }
}