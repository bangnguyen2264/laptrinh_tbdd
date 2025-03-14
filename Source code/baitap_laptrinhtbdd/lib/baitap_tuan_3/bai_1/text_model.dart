class TextModel {
  final String text;
  final String description;
  const TextModel({
    required this.text,
    required this.description,
  });
}

const List<TextModel> display = [
  TextModel(
    text: "Text",
    description: "Display Text",
  ),
  TextModel(
    text: "Image",
    description: "Display Image",
  ),
];
const List<TextModel> input = [
  TextModel(
    text: "TextField",
    description: "Input field for text",
  ),
  TextModel(
    text: "PasswordField",
    description: "Input field for passwords",
  )
];
const List<TextModel> layout = [
  TextModel(
    text: "Column",
    description: "Arranges elements vertically",
  ),
  TextModel(
    text: "Row",
    description: "Arranges elements horizontally",
  ),
];
