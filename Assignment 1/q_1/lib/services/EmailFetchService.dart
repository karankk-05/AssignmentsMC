import 'package:enough_mail/enough_mail.dart';

class EmailFetchService {
  Future<List<MimeMessage>> fetchEmails({
    required String imapServerHost,
    required int imapServerPort,
    required bool isImapServerSecure,
    required String userName,
    required String password,
  }) async {
    final client = ImapClient(isLogEnabled: false);
    List<MimeMessage> fetchedMessages = [];
    try {
      await client.connectToServer(imapServerHost, imapServerPort,
          isSecure: isImapServerSecure);
      await client.login(userName, password);
      await client.selectInbox();
      final fetchResult = await client.fetchRecentMessages(
        messageCount: 30,
        criteria: 'BODY.PEEK[]',
      );
      fetchedMessages = fetchResult.messages;
      await client.logout();
    } on ImapException catch (e) {
      print('IMAP failed with $e');
    }
    return fetchedMessages;
  }
}
