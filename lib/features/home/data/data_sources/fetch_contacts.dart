import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchContact {
  List<Contact> contactList = [];
  Future<List<Contact>> getAllContacts() async {
    if (await FlutterContacts.requestPermission()) {
      contactList = await FlutterContacts.getContacts(withProperties: true);
    }
    return contactList;
  }
}
