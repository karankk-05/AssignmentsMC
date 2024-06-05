import 'package:enough_mail/enough_mail.dart';

class EmailSearchService {
  List<MimeMessage> searchEmails(String query, List<MimeMessage> emails) {
    query = query.toLowerCase();
    if (query.isEmpty) {
      return List.from(emails);
    } else {
      return emails.where((email) {
        final from = email.from?.first.personalName?.toLowerCase() ?? '';
        final subject = email.decodeSubject() ?? '';

        return from.contains(query) || subject.toLowerCase().contains(query);
      }).toList();
    }
  }
}
