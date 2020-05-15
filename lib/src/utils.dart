import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/color.dart';

T getEnum<T>(String val, {T fallback, List<T> values}) {
  if (val == null) return fallback;
  final _value = val.replaceAll('#', '');
  return values.firstWhere(
    (element) => element.toString() == _value,
  );
}

Key getKey(dynamic value, [Key fallback]) {
  if (value != null && value.toString().isNotEmpty) {
    try {
      return ValueKey(value);
    } catch (e) {}
  }
  return fallback;
}

Paint getPaint(Map<String, dynamic> data, [Paint fallback]) {
  if (data == null) return fallback;
  if (data['params'] == null) return fallback;
  final params = data['params'];
  // TODO: get values here
  return Paint();
}

Decoration getDecoration(Map<String, dynamic> data, [Decoration fallback]) {
  if (data == null) return fallback;
  if (data['params'] == null) return fallback;
  final params = data['params'];
  // TODO: get values here
  return BoxDecoration();
}

Duration getDuration(Map<String, dynamic> data, [Duration fallback]) {
  if (data == null) return fallback;
  if (data['params'] == null) return fallback;
  final params = data['params'];
  if (!params.toString().contains('zero')) {
    // {int days, int hours, int minutes, int seconds, int milliseconds, int microseconds}
    final days = getInt(params['days']);
    final hours = getInt(params['hours']);
    final minutes = getInt(params['minutes']);
    final seconds = getInt(params['seconds']);
    final milliseconds = getInt(params['milliseconds']);
    final microseconds = getInt(params['microseconds']);
    return Duration(
      days: days,
      hours: hours,
      minutes: minutes,
      seconds: seconds,
      milliseconds: milliseconds,
      microseconds: microseconds,
    );
  }
  return Duration.zero;
}

BorderRadiusGeometry getBorderRadiusGeometry(Map<String, dynamic> data,
    [BorderRadiusGeometry fallback]) {
  if (data == null) return fallback;
  if (data['params'] == null) return fallback;
  final params = data['params'];
  // TODO: get values here
  return BorderRadius.zero;
}

Matrix4 getMatrix4(Map<String, dynamic> data, [Matrix4 fallback]) {
  if (data == null) return fallback;
  if (data['params'] == null) return fallback;
  final params = data['params'];
  // TODO: get values here
  return Matrix4.identity();
}

BorderStyle getBorderStyle(Map<String, dynamic> data,
    [BorderStyle fallback = BorderStyle.none]) {
  if (data == null) return fallback;
  if (data['params'] == null) return fallback;
  final params = data['params'];
  // TODO: get values here
  return null;
}

FocusNode getFocusNode(Map<String, dynamic> data, [FocusNode fallback]) {
  if (data == null) return fallback;
  if (data['params'] == null) return fallback;
  final params = data['params'];
  final debugLabel = getString(params['debugLabel']);
  final skipTraversal = getBool(params['skipTraversal']);
  final canRequestFocus = getBool(params['canRequestFocus']);
  final descendantsAreFocusable = getBool(params['descendantsAreFocusable']);
  return FocusNode(
    debugLabel: debugLabel,
    skipTraversal: skipTraversal,
    canRequestFocus: canRequestFocus,
    descendantsAreFocusable: descendantsAreFocusable,
  );
}

BoxConstraints getBoxConstraints(Map<String, dynamic> data,
    [BoxConstraints fallback]) {
  if (data == null) return fallback;
  if (data['params'] == null) return fallback;
  final params = data['params'];
  final maxWidth = getDouble(params['maxWidth']);
  final minWidth = getDouble(params['minWidth']);
  final maxHeight = getDouble(params['maxHeight']);
  final minHeight = getDouble(params['minHeight']);
  return BoxConstraints(
    maxWidth: maxWidth,
    minWidth: minWidth,
    maxHeight: maxHeight,
    minHeight: minHeight,
  );
}

BorderSide getBorderSide(Map<String, dynamic> data,
    [BorderSide fallback = BorderSide.none]) {
  if (data == null) return fallback;
  if (data['params'] == null) return fallback;
  final params = data['params'];
  return null;
}

Alignment getAlignment(dynamic val, [Alignment fallback]) {
  return getEnum<Alignment>(
    val,
    values: [
      Alignment.bottomCenter,
      Alignment.bottomLeft,
      Alignment.bottomRight,
      Alignment.center,
      Alignment.centerLeft,
      Alignment.centerRight,
      Alignment.topCenter,
      Alignment.topLeft,
      Alignment.topRight,
    ],
    fallback: Alignment.center,
  );
}

ShapeBorder getShapeBorder(Map<String, dynamic> data, [ShapeBorder fallback]) {
  if (data == null) return fallback;
  if (data['params'] == null) return fallback;
  final params = data['params'];
  final top = getBorderSide(params['top']);
  final bottom = getBorderSide(params['bottom']);
  final left = getBorderSide(params['left']);
  final right = getBorderSide(params['right']);
  if (top != null || bottom != null || left != null || right != null) {
    return Border(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
    );
  }
  final vertical = getBorderSide(params['vertical']);
  final horizontal = getBorderSide(params['horizontal']);
  if (vertical != null || horizontal != null) {
    return Border.symmetric(
      vertical: vertical,
      horizontal: horizontal,
    );
  }
  final color = getColor(params['color']);
  final style = getBorderStyle(params['style']);
  final width = getDouble(params['width']);
  return Border.all(
    color: color,
    style: style,
    width: width,
  );
}

Offset getOffset(Map<String, dynamic> data, [Offset fallback]) {
  if (data == null) return fallback;
  if (data['params'] == null) return fallback;
  final params = data['params'];
  final dx = getDouble(params['dx']);
  final dy = getDouble(params['dy']);
  return Offset(dx, dy);
}

BoxShadow getBoxShadow(Map<String, dynamic> data, [BoxShadow fallback]) {
  if (data == null) return fallback;
  if (data['params'] == null) return fallback;
  final params = data['params'];
  final color = getColor(params['color']);
  final offset = getOffset(params['offset']);
  final blurRadius = getDouble(params['blurRadius']);
  final spreadRadius = getDouble(params['spreadRadius']);
  return BoxShadow(
    color: color,
    offset: offset,
    blurRadius: blurRadius,
    spreadRadius: spreadRadius,
  );
}

String getString(dynamic value, [String fallback]) {
  if (value != null && value.toString().isNotEmpty) {
    try {
      return value as String;
    } catch (e) {}
  }
  return fallback;
}

List<T> getList<T>(
  dynamic value, {
  List<T> fallback,
  @required T Function(Map<String, dynamic> data) parse,
}) {
  if (value != null) {
    try {
      return List.from(value).map((e) => parse(e)).toList();
    } catch (e) {}
  }
  return fallback;
}

double getDouble(dynamic value, [double fallback]) {
  if (value != null) {
    try {
      return double.tryParse(value.toString());
    } catch (e) {}
  }
  return fallback;
}

int getInt(dynamic value, [int fallback]) {
  if (value != null) {
    try {
      return int.tryParse(value.toString());
    } catch (e) {}
  }
  return fallback;
}

bool getBool(dynamic value, [bool fallback]) {
  if (value != null) {
    try {
      return value as bool;
    } catch (e) {
      print('Error getBool $e');
    }
  }
  return fallback;
}

Function getFunction(BuildContext context, dynamic data) {
  if (data is String) {
    if (data.isEmpty) return null;
    final _data = data.replaceAll('#', '');
    if (_data.startsWith('message')) {
      final _message = _data.replaceAll('message(', '').replaceAll(')', '');
      return () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(_message),
        ));
      };
    }
    if (_data.startsWith('navigate')) {
      final _route = _data.replaceAll('navigate(', '').replaceAll(')', '');
      return () {
        Navigator.of(context).pushNamed(_route);
      };
    }
    if (_data.startsWith('pop')) {
      final _route = _data.replaceAll('pop(', '').replaceAll(')', '');
      return () {
        if (_route.isNotEmpty) {
          Navigator.popUntil(context, ModalRoute.withName(_route));
        } else {
          Navigator.of(context).pop();
        }
      };
    }
    if (_data.startsWith('maybePop')) {
      return () {
        Navigator.of(context).maybePop();
      };
    }
    if (_data.startsWith('launch')) {
      final _url = _data
          .replaceAll("launch(", '')
          .replaceAll(")", '')
          .replaceAll("\"", '')
          .replaceAll("\'", '');
      return () {
        launch('${_url}');
      };
    }
    if (_data.startsWith('alert')) {
      final _message = _data.replaceAll('alert(', '').replaceAll(')', '');
      return () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Info'),
            content: Text(_message),
            actions: [
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.maybePop(context),
              ),
            ],
          ),
        );
      };
    }
  }
  return null;
}

EdgeInsets getEdgeInsets(dynamic data, [EdgeInsets fallback]) {
  if (data != null) {
    if (data is Map) {
      if (data['name'] != null) {
        final _params = data['params'];
        if (data['name'].toString() == 'EdgeInsets.all') {
          final all = getDouble(_params['0']);
          return EdgeInsets.all(all);
        }
        if (data['name'].toString() == 'EdgeInsets.only') {
          final top = getDouble(_params['top']);
          final left = getDouble(_params['left']);
          final bottom = getDouble(_params['bottom']);
          final right = getDouble(_params['right']);
          return EdgeInsets.only(
            top: top,
            left: left,
            bottom: bottom,
            right: right,
          );
        }
        if (data['name'].toString() == 'EdgeInsets.symmetric') {
          final vertical = getDouble(_params['vertical']);
          final horizontal = getDouble(_params['horizontal']);
          return EdgeInsets.symmetric(
            vertical: vertical,
            horizontal: horizontal,
          );
        }
        if (data['name'].toString() == 'EdgeInsets.fromLTRB') {
          final left = getDouble(_params['0']);
          final top = getDouble(_params['1']);
          final right = getDouble(_params['2']);
          final bottom = getDouble(_params['3']);
          return EdgeInsets.fromLTRB(
            left,
            top,
            right,
            bottom,
          );
        }
        return EdgeInsets.zero;
      }
    } else if (data is String && data.startsWith('#')) {
      final _nameValue = data
          .toString()
          .replaceAll('#', '')
          .replaceAll('EdgeInsets', '')
          .replaceAll('.all', '')
          .replaceAll('(', '')
          .replaceAll(')', '');
      final _value = double.tryParse(_nameValue.toString());
      if (_value != null) {
        return EdgeInsets.all(_value);
      }
      return EdgeInsets.zero;
    }
  }
  return fallback;
}
