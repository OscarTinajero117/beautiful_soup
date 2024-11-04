import 'package:html/dom.dart';

import 'bs4_element.dart';

/// Recursively searches through all descendants of a given `Bs4Element`,
/// yielding each element found in the traversal. This function is designed to
/// be used in scenarios where all elements in a subtree need to be processed
/// or analyzed.
///
/// ## Parameters:
/// - `bs4`: The root `Bs4Element` to start the search from.
///
/// ## Returns:
/// - An `Iterable<Bs4Element>` yielding each `Bs4Element` in a depth-first order.
///
/// ## Usage:
/// This generator can be used to iterate over all elements in an HTML subtree.
/// Each element and its descendants are returned in a depth-first traversal order,
/// allowing for processing of each element in sequence.
Iterable<Bs4Element> recursiveSearch(Bs4Element bs4) sync* {
  yield bs4;
  for (final e in bs4.children) {
    yield* recursiveSearch(e);
  }
}

/// Recursively searches through all descendants of a given `Node`, yielding each
/// node found in the traversal. This function is useful when working with both
/// element nodes and text nodes within an HTML or XML document.
///
/// ## Parameters:
/// - `node`: The root `Node` to start the search from.
///
/// ## Returns:
/// - An `Iterable<Node>` yielding each `Node` in a depth-first order.
///
/// ## Usage:
/// This generator provides a depth-first traversal of all nodes within a document
/// subtree, including both element and non-element nodes. It is especially useful
/// in cases where the document structure, including text or comment nodes, needs
/// to be processed.
Iterable<Node> recursiveNodeSearch(Node node) sync* {
  yield node;
  for (final e in node.nodes) {
    yield* recursiveNodeSearch(e);
  }
}
