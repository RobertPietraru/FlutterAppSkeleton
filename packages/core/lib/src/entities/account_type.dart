enum AccountType {
  teacher,
  principal,
  student,
  admin,
  parent,
}

extension NameCreation on AccountType {
  String get accountName {
    Map<AccountType, String> converter = {
      AccountType.teacher: "Profesor",
      AccountType.principal: "Director",
      AccountType.student: "Elev",
      AccountType.admin: "Administrator",
      AccountType.parent: "Parinte",
    };
    return converter[this] ?? "Necunoscut";
  }

  AccountType? fromName(String name) {
    try {
      return AccountType.values
          .where((element) => element.name == name)
          .toList()
          .first;
    } catch (e) {
      return null;
    }
  }
}
