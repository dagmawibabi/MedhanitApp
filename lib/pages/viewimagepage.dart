import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ViewImagesPage extends StatefulWidget {
  const ViewImagesPage({Key? key}) : super(key: key);

  @override
  _ViewImagesPageState createState() => _ViewImagesPageState();
}

class _ViewImagesPageState extends State<ViewImagesPage> {
  @override
  Widget build(BuildContext context) {
    dynamic receivedData = ModalRoute.of(context)?.settings.arguments;
    String networkImage = receivedData["networkImage"];
    String scaffoldBG = receivedData["scaffoldBG"];
    bool isAsset = receivedData["isAsset"];
    return Scaffold(
      backgroundColor: isAsset == false ? Colors.grey[300] : Colors.greenAccent,
      extendBody: true,
      //appBar: AppBar(),
      body: Container(
        decoration: isAsset == false
            ? BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(scaffoldBG.toString(), scale: 1.0),
                  fit: BoxFit.cover,
                ),
              )
            : BoxDecoration(),
        child: Container(
          //height: MediaQuery.of(context).size.height + 200,
          child: Column(
            children: [
              const SizedBox(height: 50.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                  color: Colors.black.withOpacity(0.7),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 200,
                child: isAsset == false
                    ? PhotoView(
                        imageProvider: NetworkImage(networkImage),
                        initialScale: 1.0,
                        backgroundDecoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                      )
                    : PhotoView(
                        imageProvider: AssetImage(networkImage),
                        initialScale: 0.5,
                        backgroundDecoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
