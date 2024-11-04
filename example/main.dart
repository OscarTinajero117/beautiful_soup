// ignore_for_file: constant_identifier_names

import 'package:beautiful_soup_dart/beautiful_soup.dart';

const html_doc = """
<html>
   <head>
      <title>The Dormouse's story</title>
   </head>
   <body>
      <p class="title"><b>The Dormouse's story</b></p>
      <p class="story">Once upon a time there were three little sisters; and their names were
         <a href="http://example.com/elsie" class="sister" id="link1">Elsie</a>,
         <a href="http://example.com/lacie" class="sister" id="link2">Lacie</a> and
         <a class="sister" id="link3">Tillie</a>;
         and they lived at the bottom of a well.
         <a href="unknown">Some name</a>
      </p>
      <p class="story">...</p>
   </body>
</html>
""";

void main() {
  // 1. parse a document
  // use BeautifulSoup.fragment(html_doc_string) if you parse a part of html
  final bs = BeautifulSoup(html_doc);

  // 2. navigate quickly to any element
  // get String representation of this element, same as outerHtml, finds: "<a href="http://example.com/elsie" class="sister" id="link1">Elsie</a>"
  print(bs.body!.a!.toString());
  // finds first element with html tag "p" and which has "class" attribute with value "story"
  bs.find('p', class_: 'story');
  // finds all elements with html tag "a" and which have defined "class" attribute with whatever value
  bs.findAll('a', attrs: {'class': true});
  // find by id
  bs.find('*', id: 'link1');
  // find any element which tag starts with "b", for example: body, b, ...
  bs.find('*', regex: r'^b');
  // find "p" element which text starts with "Article #[number]"
  bs.find('p', string: r'^Article #\d*');
  // finds by "href" attribute
  bs.find('a', attrs: {'href': 'http://example.com/elsie'});

  // 3. perform any other actions for the navigated element
  // quickly with tags, finds and navigates to: "<p class="title"><b>The Dormouse's story</b></p>"
  final bs4 = bs.body!.p!;
  // get tag name, finds: "p"
  bs4.name;
  // get text, finds: "The Dormouse's story";
  bs4.string;
  // get html elements inside the element, finds: "<b>The Dormouse's story</b>"
  bs4.innerHtml;
  // get class attribute value, finds: "title"
  bs4.className;
  // get class attribute value, finds: null
  bs4['id'];
  // change class attribute value from 'title' to 'board'
  bs4['class'] = 'board';

  // with query func you can specify attributes
  final bs4Alt = bs.find('p', attrs: {'class': 'story'})!;
  // replace with other element
  bs4.replaceWith(bs4Alt);
  // get all element's children elements, finds: list with four "a" elements
  bs4Alt.children;
}
