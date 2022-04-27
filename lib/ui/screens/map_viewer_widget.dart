import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffepedia/generated/assets.dart';
import 'package:coffepedia/ui/shared/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map/map.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';

class MapViewerWidget extends StatefulWidget {
  final String latitude;
  final String longitude;
  final String address;
  final MapController controller;
  const MapViewerWidget(
      {required this.latitude,
      required this.address,
      required this.longitude,
      required this.controller,
      Key? key})
      : super(key: key);

  @override
  _MapViewerWidgetState createState() => _MapViewerWidgetState();
}

class _MapViewerWidgetState extends State<MapViewerWidget> {
  // final controller = MapController(
  //   // location: LatLng(30.033333, 31.233334),
  //   location: LatLng(30.033333, 31.233334),
  // );

  void _onDoubleTap() {
    widget.controller.zoom += 0.5;
    setState(() {});
  }

  Offset? _dragStart;
  double _scaleStart = 1.0;
  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      widget.controller.zoom += 0.02;
      setState(() {});
    } else if (scaleDiff < 0) {
      widget.controller.zoom -= 0.02;
      setState(() {});
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart!;
      _dragStart = now;
      widget.controller.drag(diff.dx, diff.dy);
      setState(() {});
    }
  }

  Widget _buildMarkerWidget(Offset pos, Color color) {
    return Positioned(
      // left: pos.dx - 16,
      // top: pos.dy - 16,
      width: 24.w, top: 120.h, right: 159.w,
      height: 24.h,
      child: Icon(Icons.location_on, color: color),
    );
  }

  Future<void> openMap() async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=${widget.latitude},${widget.longitude}';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        height: 200.h,
        width: 343.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(71, 73, 73, 0),
              Color(0xff474949),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: MapLayoutBuilder(
          controller: widget.controller,
          builder: (context, transformer) {
            final centerLocation = Offset(
              transformer.constraints.biggest.width / 2,
              transformer.constraints.biggest.height / 2,
            );
            final centerMarkerWidget = _buildMarkerWidget(
              centerLocation,
              Color(0xffFFA183),
            );
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onDoubleTap: _onDoubleTap,
              onScaleStart: _onScaleStart,
              onScaleUpdate: _onScaleUpdate,
              onTapUp: (details) {
                final location =
                    transformer.fromXYCoordsToLatLng(details.localPosition);

                final clicked = transformer.fromLatLngToXYCoords(location);

                debugPrint('${location.longitude}, ${location.latitude}');
                debugPrint('${clicked.dx}, ${clicked.dy}');
                debugPrint(
                    '${details.localPosition.dx}, ${details.localPosition.dy}');
              },
              child: Listener(
                behavior: HitTestBehavior.opaque,
                onPointerSignal: (event) {
                  if (event is PointerScrollEvent) {
                    final delta = event.scrollDelta;

                    widget.controller.zoom -= delta.dy / 1000.0;
                    setState(() {});
                  }
                },
                child: Stack(
                  children: [
                    Map(
                      controller: widget.controller,
                      builder: (context, x, y, z) {
                        //Google Maps
                        final darkUrl =
                            'https://maps.googleapis.com/maps/vt?pb=!1m5!1m4!1i$z!2i$x!3i$y!4i256!2m3!1e0!2sm!3i556279080!3m17!2sen-US!3sUS!5e18!12m4!1e68!2m2!1sset!2sRoadmap!12m3!1e37!2m1!1ssmartmaps!12m4!1e26!2m2!1sstyles!2zcC52Om9uLHMuZTpsfHAudjpvZmZ8cC5zOi0xMDAscy5lOmwudC5mfHAuczozNnxwLmM6I2ZmMDAwMDAwfHAubDo0MHxwLnY6b2ZmLHMuZTpsLnQuc3xwLnY6b2ZmfHAuYzojZmYwMDAwMDB8cC5sOjE2LHMuZTpsLml8cC52Om9mZixzLnQ6MXxzLmU6Zy5mfHAuYzojZmYwMDAwMDB8cC5sOjIwLHMudDoxfHMuZTpnLnN8cC5jOiNmZjAwMDAwMHxwLmw6MTd8cC53OjEuMixzLnQ6NXxzLmU6Z3xwLmM6I2ZmMDAwMDAwfHAubDoyMCxzLnQ6NXxzLmU6Zy5mfHAuYzojZmY0ZDYwNTkscy50OjV8cy5lOmcuc3xwLmM6I2ZmNGQ2MDU5LHMudDo4MnxzLmU6Zy5mfHAuYzojZmY0ZDYwNTkscy50OjJ8cy5lOmd8cC5sOjIxLHMudDoyfHMuZTpnLmZ8cC5jOiNmZjRkNjA1OSxzLnQ6MnxzLmU6Zy5zfHAuYzojZmY0ZDYwNTkscy50OjN8cy5lOmd8cC52Om9ufHAuYzojZmY3ZjhkODkscy50OjN8cy5lOmcuZnxwLmM6I2ZmN2Y4ZDg5LHMudDo0OXxzLmU6Zy5mfHAuYzojZmY3ZjhkODl8cC5sOjE3LHMudDo0OXxzLmU6Zy5zfHAuYzojZmY3ZjhkODl8cC5sOjI5fHAudzowLjIscy50OjUwfHMuZTpnfHAuYzojZmYwMDAwMDB8cC5sOjE4LHMudDo1MHxzLmU6Zy5mfHAuYzojZmY3ZjhkODkscy50OjUwfHMuZTpnLnN8cC5jOiNmZjdmOGQ4OSxzLnQ6NTF8cy5lOmd8cC5jOiNmZjAwMDAwMHxwLmw6MTYscy50OjUxfHMuZTpnLmZ8cC5jOiNmZjdmOGQ4OSxzLnQ6NTF8cy5lOmcuc3xwLmM6I2ZmN2Y4ZDg5LHMudDo0fHMuZTpnfHAuYzojZmYwMDAwMDB8cC5sOjE5LHMudDo2fHAuYzojZmYyYjM2Mzh8cC52Om9uLHMudDo2fHMuZTpnfHAuYzojZmYyYjM2Mzh8cC5sOjE3LHMudDo2fHMuZTpnLmZ8cC5jOiNmZjI0MjgyYixzLnQ6NnxzLmU6Zy5zfHAuYzojZmYyNDI4MmIscy50OjZ8cy5lOmx8cC52Om9mZixzLnQ6NnxzLmU6bC50fHAudjpvZmYscy50OjZ8cy5lOmwudC5mfHAudjpvZmYscy50OjZ8cy5lOmwudC5zfHAudjpvZmYscy50OjZ8cy5lOmwuaXxwLnY6b2Zm!4e0&key=AIzaSyAOqYYyBbtXQEtcHG7hwAwyCPQSYidG8yU&token=31440';
                        return CachedNetworkImage(
                          imageUrl: darkUrl,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    Positioned(
                      top: 31.h,
                      left: 21.w,
                      right: 21.w,
                      child: Container(
                        height: 70.h,
                        width: 301.w,
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(Assets.locationPin),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Flexible(
                                  child: Text(
                                    widget.address,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 77.w,
                                child: CustomButton(
                                  onPress: () {
                                    openMap();
                                  },
                                  width: 77.w,
                                  height: 25.h,
                                  title:
                                      translator.translate("map_widget.show"),
                                  borderRadius: 12.5.r,
                                  // buttonColor: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 100.h,
                      right: 152.w,
                      left: 180.w,
                      child: ClipPath(
                        child: Container(
                          height: 20.h,
                          color: Colors.white,
                        ),
                        clipper: CustomClipPath(),
                      ),
                    ),
                    centerMarkerWidget,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 10, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
