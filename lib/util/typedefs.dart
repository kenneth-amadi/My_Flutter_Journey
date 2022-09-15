import 'package:flutter/material.dart';

import '../browser/model/browser_tab_model.dart';
import '../shopping/model/menu_item.dart' as menu;

typedef MenuCallback = Function(menu.MenuItem);
typedef TabCloseCallback = Function(BrowserTabModel);
typedef TabClickCallback = Function(BrowserTabModel);

typedef TabBuilder = Widget Function(BuildContext context, int index);
typedef DateTimeBuilder = Widget Function(String);
