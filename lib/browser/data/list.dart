import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/browser_tab_model.dart';

List<BrowserTabModel> tabs = [
  BrowserTabModel(title: "Tab 1", image: Image.asset("assets/images/image_maps.jpg", fit: BoxFit.fill), favicon: Image.asset("assets/icons/icon.png")),
  BrowserTabModel(title: "Tab 2", image: Image.asset("assets/images/image_15.jpg.jpg", centerSlice: Rect.largest), favicon: Image.asset("assets/icons/icon.png")),
  BrowserTabModel(title: "Tab 3", image: Image.asset("assets/icons/icon.png", repeat: ImageRepeat.repeat), favicon: Image.asset("assets/icons/icon.png")),
  BrowserTabModel(title: "Tab 1", image: Image.asset("assets/images/image_maps.jpg", fit: BoxFit.fill), favicon: Image.asset("assets/icons/icon.png")),
  BrowserTabModel(title: "Tab 2", image: Image.asset("assets/images/image_15.jpg.jpg", centerSlice: Rect.largest), favicon: Image.asset("assets/icons/icon.png")),
  BrowserTabModel(title: "Tab 3", image: Image.asset("assets/icons/icon.png", repeat: ImageRepeat.repeat), favicon: Image.asset("assets/icons/icon.png")),
];
