DateTime? parseDateTime(String? dateTime) {
  return dateTime == null
      ? null
      : DateTime.parse(dateTime.replaceAll('T', ' '));
}
