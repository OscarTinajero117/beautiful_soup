import 'package:html/dom.dart';

import 'bs4_element.dart';

/// Extension for [Element].
extension ElementExt on Element {
  /// Returns [Bs4Element] from the [Element] ([which comes from
  /// `html` Dart package](https://pub.dev/packages/html)).
  Bs4Element get bs4 => Bs4Element(this);
}

/// Extensions for [Node].
extension NodeExt on Node {
  /// Retrieves a `String` representation of the `Node`'s data.
  ///
  /// Depending on the node type, this method returns different string representations:
  /// - Element nodes: Outputs the HTML structure.
  /// - Text nodes: Outputs the text content.
  /// - Comment nodes: Outputs the comment content, wrapped with `<!-- -->`.
  /// - Document and DocumentFragment nodes: Outputs the full outer HTML.
  ///
  /// ## Returns:
  /// - A `String` representing the `Node` data.
  String get data => _getDataFromNode(this);

  /// Internal helper method that determines the string representation for
  /// various node types.
  String _getDataFromNode(Node node) {
    switch (node.nodeType) {
      case Node.ELEMENT_NODE:
        return (node as Element).outerHtml;
      case Node.TEXT_NODE:
        return (node as Text).text;
      case Node.COMMENT_NODE:
        final data = (node as Comment).data;
        return '<!--$data-->';
      case Node.DOCUMENT_NODE:
        return (node as Document).outerHtml;
      case Node.DOCUMENT_TYPE_NODE:
        return (node as DocumentType).toString();
      case Node.DOCUMENT_FRAGMENT_NODE:
        return (node as DocumentFragment).outerHtml;
      // For nodes that are less commonly used, return the string conversion of the node.
      case Node.ATTRIBUTE_NODE:
      case Node.CDATA_SECTION_NODE:
      case Node.ENTITY_REFERENCE_NODE:
      case Node.ENTITY_NODE:
      case Node.PROCESSING_INSTRUCTION_NODE:
      case Node.NOTATION_NODE:
        return node.toString();
      default:
        return node.toString();
    }
  }
}

/// Extension for [List], adding additional utility methods.
extension ListExt<E> on List<E> {
  /// Returns the first element of the list, or `null` if the list is empty.
  ///
  /// This is useful for cases where an empty list is possible and avoiding
  /// `IndexOutOfRange` exceptions is desirable.
  E? get firstOrNull => isEmpty ? null : first;
}

/// Extension for [Pattern], adding the ability to retrieve it as a `RegExp`.
extension PatternExt on Pattern {
  /// Converts a [Pattern] to a `RegExp`.
  ///
  /// If the pattern is already a `RegExp`, it simply casts and returns it.
  /// Otherwise, it converts the pattern to a `RegExp` by calling `toString()`
  /// on it.
  ///
  /// ## Returns:
  /// - A `RegExp` representation of the pattern.
  RegExp get asRegExp => this is RegExp ? this as RegExp : RegExp(toString());
}
