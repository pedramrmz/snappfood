

String validateTel(String tel, bool checkDuplicate) {
  if (tel.isEmpty || tel == null) {
    return 'لطفا تلفن را به درستی وارد کنید';
  }

  RegExp exp = RegExp(r"09\d{9}");
  if (!exp.hasMatch(tel)) {
    return 'شماره تلفن صحیح نیست';
  }

  //if (checkDuplicate && restaurants.getByTel(tel) != null) {
  //  return 'شماره تلفن تکراری است';

  return null;
}

String validatePassword(String password) {
  RegExp exp1 = RegExp(r"\D+");
  RegExp exp2 = RegExp(r"\d+");

  if (password == null || password.isEmpty || password.length < 6) {
    return 'کلمه عبور باید حداقل 6 کارکتر باشد';
  }
  if (!exp1.hasMatch(password) || !exp2.hasMatch(password)) {
    return 'کلمه عبور باید شامل عدد و حروف باشد';
  }

  return null;
}

DateTime getStartOfDate(DateTime dateTime) {
  return DateTime(dateTime.month, dateTime.day, 0, 0, 0);
}