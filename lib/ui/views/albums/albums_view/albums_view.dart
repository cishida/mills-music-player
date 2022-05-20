import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mills_music_player/_constants/_colors.dart';
import 'package:mills_music_player/_utils/plurals_util.dart';
import 'package:mills_music_player/models/album/album.dart';
import 'package:mills_music_player/ui/_dumb_widgets/nav/sliver_nav_bar.dart';
import 'package:mills_music_player/ui/views/albums/albums_view/albums_view_model.dart';
import 'package:stacked/stacked.dart';

class AlbumsView extends StatelessWidget {
  const AlbumsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AlbumsViewModel>.reactive(
      viewModelBuilder: () => AlbumsViewModel(),
      builder: (context, model, child) {
        model.createFakerAlbums();

        return NestedScrollView(
          headerSliverBuilder: (
            BuildContext context,
            bool innerBoxIsScrolled,
          ) {
            return <Widget>[
              const SliverNavBar(
                title: 'Albums',
              ),
            ];
          },
          body: ListView.builder(
            shrinkWrap: true,
            itemCount: model.albums.length,
            itemBuilder: (context, index) {
              final Album album = model.albums[index];

              return Container(
                color: Colors.white,
                child: Column(
                  children: [
                    ListTile(
                      // selectedColor: ConstColors.offWhite,
                      onTap: () => model.onAlbumTap(
                        context,
                        album,
                      ),
                      title: Text(
                        album.title,
                      ),
                      subtitle: Text(
                        album.artists.join(', '),
                      ),
                      trailing: Text(
                        PluralsUtil.songs(album.songs.length),
                      ),
                    ),
                    const Divider(
                      color: ConstColors.lightDivider,
                      height: 1.0,
                    ),
                  ],
                ),
              );
            },
          ),
        );

        // return CustomScrollView(
        //   slivers: [
        //     SliverAppBar(
        //       title: Text(
        //         'Albums',
        //         style: TextStyle(
        //           color: Colors.black,
        //         ),
        //       ),
        //       backgroundColor: Colors.white,
        //       floating: true,
        //       flexibleSpace: Container(),
        //       expandedHeight: 200,
        //     ),
        //     // Next, create a SliverList
        //     SliverList(
        //       // Use a delegate to build items as they're scrolled on screen.
        //       delegate: SliverChildBuilderDelegate(
        //         // The builder function returns a ListTile with a title that
        //         // displays the index of the current item.
        //         (context, index) {
        //           final Album album = model.albums[index];

        //           return Container(
        //             color: Colors.white,
        //             child: Column(
        //               children: [
        //                 ListTile(
        //                   selectedColor: ConstColors.offWhite,
        //                   onTap: () => model.onAlbumTap(
        //                     context,
        //                     album,
        //                   ),
        //                   title: Text(
        //                     album.title,
        //                   ),
        //                   subtitle: Text(
        //                     album.artists.join(', '),
        //                   ),
        //                   trailing: Text(
        //                     PluralsUtil.songs(album.songs.length),
        //                   ),
        //                 ),
        //                 const Divider(
        //                   color: ConstColors.lightDivider,
        //                   height: 1.0,
        //                 ),
        //               ],
        //             ),
        //           );
        //         },
        //         // Builds 1000 ListTiles
        //         childCount: model.albums.length,
        //       ),
        //     ),
        //   ],
        // );

        // ListView.builder(
        //   shrinkWrap: true,
        //   itemCount: model.albums.length,
        //   itemBuilder: (context, index) {
        //     final Album album = model.albums[index];

        //     return Container(
        //       color: Colors.white,
        //       child: Column(
        //         children: [
        //           ListTile(
        //             selectedColor: ConstColors.offWhite,
        //             onTap: () => model.onAlbumTap(
        //               context,
        //               album,
        //             ),
        //             title: Text(
        //               album.title,
        //             ),
        //             subtitle: Text(
        //               album.artists.join(', '),
        //             ),
        //             trailing: Text(
        //               PluralsUtil.songs(album.songs.length),
        //             ),
        //           ),
        //           const Divider(
        //             color: ConstColors.lightDivider,
        //             height: 1.0,
        //           ),
        //         ],
        //       ),
        //     );
        //   },
        // );
      },
    );
  }
}
