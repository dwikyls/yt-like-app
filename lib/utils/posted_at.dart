postedAt(dynamic date) {
  DateTime now = DateTime.now();
  var posted;

  if (date.runtimeType == String) {
    posted = DateTime.parse(date);
  }

  if (date.runtimeType == DateTime) {
    posted = date;
  }

  if (posted != null) {
    var diff = now.difference(posted).inSeconds;
    var diffDays = (diff / (1000 * 60 * 60 * 24)).round();
    var diffHours = (diff / (1000 * 60 * 60)).round();
    var diffMinutes = (diff / (1000 * 60)).round();
    var diffSeconds = (diff / 1000).round();

    if (diffDays > 0) return '$diffDays hari yang lalu';
    if (diffHours > 0) return '$diffHours jam yang lalu';
    if (diffMinutes > 0) '$diffMinutes menit yang lalu';
    if (diffSeconds > 0) '$diffSeconds detik yang lalu';

    return 'baru saja';
  }

  return '';
}
