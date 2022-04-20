import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:photoview/home_page.dart';
List<ImageDetails> _images = [
  ImageDetails(
    imagePath: 'assets/image1.png',
  ),
  ImageDetails(
    imagePath: 'assets/image2.png',
  ),
  ImageDetails(
    imagePath: 'assets/image3.png',
  ),
  ImageDetails(
    imagePath: 'assets/image4.png',
  ),
  ImageDetails(
    imagePath: 'assets/image5.png',
  ),
  ImageDetails(
    imagePath: 'assets/image6.png',
  ),
  ImageDetails(
    imagePath: 'assets/image7.png',
  ),
  ImageDetails(
    imagePath: 'assets/image8.png',
  ),
];
class DetailsPage extends StatelessWidget {
  String imagePath;

  final int index;
  DetailsPage(
      {@required this.imagePath,
        @required this.index});

  @override
  Widget build(BuildContext context) {
    var imgBrowser = _ImageBrowser(GlobalKey<_ImageBrowserState>(), imagePath,_images);
    // 建立App的操作畫面
    final previousBtn = FlatButton(
      child: Image.asset('assets/previous.png'),
      onPressed: () {
        imgBrowser.previousImage();
      },
    );

    final nextBtn = FlatButton(
      child: Image.asset('assets/next.png'),
      onPressed: () {
        imgBrowser.nextImage();
      },
    );
    final widget = Center(
      child: Stack(
          children: <Widget>[
            Container(
              child: imgBrowser,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                ),
              ),
              margin: EdgeInsets.symmetric(vertical: 10),
            ),
            Container(
              child: Row(
                children: <Widget>[previousBtn, nextBtn],//previousBtn, nextBtn
                mainAxisAlignment: MainAxisAlignment.center,

              ),
              margin: EdgeInsets.symmetric(vertical: 10),
            ),
          ],
          alignment:Alignment.topCenter
      ),
    );
    final appHomePage = Scaffold(
      body: widget,
    );
    return appHomePage;
  }
}

class _ImageBrowser extends StatefulWidget {
  final GlobalKey<_ImageBrowserState> _key;
  String imagePath;
  //final List<String> _images;
  final List<ImageDetails>images;
  int _imageIndex;

  _ImageBrowser(this._key, this.imagePath,this.images) : super(key: _key) {
    for(var i=0;i<images.length;i++)
      {
        if(images[i].imagePath==imagePath)
          {
            _imageIndex = i;
          }
      }

  }

  @override
  State<StatefulWidget> createState() => _ImageBrowserState();

  previousImage() => _key.currentState.previousImage();
  nextImage() => _key.currentState.nextImage();
}
class _ImageBrowserState extends State<_ImageBrowser> {
  @override

  Widget build(BuildContext context) {
    return Container(
        child: PhotoViewGallery.builder(
          enableRotation: false,
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: AssetImage(widget.images[widget._imageIndex].imagePath),
              initialScale: PhotoViewComputedScale.contained * 0.8,
            );
          },

          itemCount: widget.images.length,
          loadingBuilder: (context, event) => Center(
            child: Container(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / event.expectedTotalBytes,
              ),
            ),
          ),
          backgroundDecoration: BoxDecoration(color:Colors.green),
        )


    );
  }

  previousImage() {
    widget._imageIndex = widget._imageIndex == 0
        ? widget.images.length - 1
        : widget._imageIndex - 1;
    setState(() {});
  }

  nextImage() {
    widget._imageIndex = ++widget._imageIndex % widget.images.length;
    setState(() {});
  }
}
