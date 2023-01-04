postedAt(String date) {
  DateTime now = DateTime.now();
  DateTime posted = DateTime.parse(date);
  var diff = now.difference(posted).inSeconds;
  var diffDays = (diff / (1000 * 60 * 60 * 24)).round();
  var diffHours = (diff / (1000 * 60 * 60)).round();
  var diffMinutes = (diff / (1000 * 60)).round();
  var diffSeconds = (diff / 1000).round();

  if (diffDays > 0) return '${diffDays} hari yang lalu';
  if (diffHours > 0) return '${diffHours} jam yang lalu';
  if (diffMinutes > 0) '${diffMinutes} menit yang lalu';
  if (diffSeconds > 0) '${diffSeconds} detik yang lalu';

  return 'baru saja';
}
