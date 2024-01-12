String? emptyValidator(String? text) {
  if (text == null || text.isEmpty) {
    return 'Required';
  }
  return null;
}
