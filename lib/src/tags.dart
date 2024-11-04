import 'package:html/dom.dart';

import 'bs4_element.dart';
import 'bs_soup.dart';
import 'extensions.dart';
import 'interface/interface.dart';

/// The `Tags` class provides a streamlined API to access specific HTML tags
/// within a parsed HTML document. It offers properties that retrieve elements
/// such as `<html>`, `<body>`, `<head>`, and other common tags directly from
/// the `BeautifulSoup` parsing structure.
///
/// This class implements the `ITags` interface, ensuring consistency in
/// accessing tags across different instances.
///
/// The primary purpose of this class is to support quick and intuitive access
/// to HTML elements, enhancing code readability and efficiency in HTML DOM
/// manipulation.
class Tags implements ITags {
  /// Stores the primary HTML [Element] for quick reference.
  Element? element;

  /// Holds a reference to the parsed HTML [Document].
  Document? _doc;

  /// Holds a reference to the parsed HTML [DocumentFragment].
  DocumentFragment? _docFragment;

  /// Returns [Document] or [DocumentFragment], based on what parser was used
  /// with the [BeautifulSoup] constructor.
  ///
  /// This should not be used publicly along with setter.
  ///
  /// Can return null.
  dynamic get doc => _doc ?? _docFragment;

  /// Sets the document to either a [Document] or a [DocumentFragment].
  ///
  /// Only one of [_doc] or [_docFragment] will be set at any time. If a
  /// [Document] is provided, [_docFragment] is set to null, and vice versa.
  set doc(dynamic value) {
    if (value is Document) {
      _doc = value;
      _docFragment = null;
    } else {
      _docFragment = value;
      _doc = null;
    }
  }

  /// Finds the first occurrence of an HTML tag by its name.
  ///
  /// Returns a [Bs4Element] instance for the matching tag or null if not found.
  Bs4Element? _findFirst(String tagName) =>
      ((element ?? doc).querySelector(tagName) as Element?)?.bs4;

  /// Accesses the `<html>` tag as a [Bs4Element].
  @override
  Bs4Element? get html => _findFirst('html');

  /// Accesses the `<body>` tag as a [Bs4Element].
  @override
  Bs4Element? get body => _findFirst('body');

  /// Accesses the `<head>` tag as a [Bs4Element].
  @override
  Bs4Element? get head => _findFirst('head');

  /// Accesses the first `<a>` tag as a [Bs4Element].
  @override
  Bs4Element? get a => _findFirst('a');

  /// Accesses the first `<b>` tag as a [Bs4Element].
  @override
  Bs4Element? get b => _findFirst('b');

  /// Accesses the first `<i>` tag as a [Bs4Element].
  @override
  Bs4Element? get i => _findFirst('i');

  /// Accesses the first `<p>` tag as a [Bs4Element].
  @override
  Bs4Element? get p => _findFirst('p');

  /// Accesses the `<title>` tag as a [Bs4Element].
  @override
  Bs4Element? get title => _findFirst('title');

  /// Accesses the first `<h1>` tag as a [Bs4Element].
  @override
  Bs4Element? get h1 => _findFirst('h1');

  /// Accesses the first `<h2>` tag as a [Bs4Element].
  @override
  Bs4Element? get h2 => _findFirst('h2');

  /// Accesses the first `<h3>` tag as a [Bs4Element].
  @override
  Bs4Element? get h3 => _findFirst('h3');

  /// Accesses the first `<h4>` tag as a [Bs4Element].
  @override
  Bs4Element? get h4 => _findFirst('h4');

  /// Accesses the first `<h5>` tag as a [Bs4Element].
  @override
  Bs4Element? get h5 => _findFirst('h5');

  /// Accesses the first `<h6>` tag as a [Bs4Element].
  @override
  Bs4Element? get h6 => _findFirst('h6');

  /// Accesses the first `<img>` tag as a [Bs4Element].
  @override
  Bs4Element? get img => _findFirst('img');

  /// Accesses the first `<table>` tag as a [Bs4Element].
  @override
  Bs4Element? get table => _findFirst('table');

  /// Accesses the first `<dl>` tag as a [Bs4Element].
  @override
  Bs4Element? get dl => _findFirst('dl');

  /// Accesses the first `<ul>` tag as a [Bs4Element].
  @override
  Bs4Element? get ul => _findFirst('ul');

  /// Accesses the first `<ol>` tag as a [Bs4Element].
  @override
  Bs4Element? get ol => _findFirst('ol');
}
