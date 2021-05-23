import 'package:flutter/material.dart';
import 'package:spotify_clone/models/models.dart';
import 'package:spotify_clone/provider/current_song_provider.dart';
import 'package:provider/provider.dart';

class TracksList extends StatelessWidget {
  final List<Song> tracks;

  const TracksList({Key? key, required this.tracks}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return DataTable(
      headingTextStyle: Theme.of(context).textTheme.overline!.copyWith(
        fontSize: 12.0
      ),
      showCheckboxColumn: false,
      dataRowHeight: 54.0,
      columns: [
          DataColumn(label: Text('TITLE')),
          DataColumn(label: Text('ARTIST')),
          DataColumn(label: Text('ALBUM')),
          DataColumn(label: Icon(Icons.access_time)),
        ],
        rows: tracks.map((e) {
          final selected =
              context.watch<CurrentSongModel>().selected?.id == e.id;
          final textStyle = TextStyle(
              color: selected
                  ? Theme.of(context).accentColor
                  : Theme.of(context).iconTheme.color);
          return DataRow(cells: [
            DataCell(
              Text(e.title, style: textStyle),
            ),
            DataCell(
              Text(
                e.artist,
                style: textStyle,
              ),
            ),
            DataCell(
              Text(e.album, style: textStyle),
            ),
            DataCell(
              Text(
                e.duration,
                style: textStyle,
              ),
            ),
          ],
          selected: selected, 
          onSelectChanged: (_) => context.read<CurrentSongModel>().selectSong(e),
        );
      }).toList());
  }
}
