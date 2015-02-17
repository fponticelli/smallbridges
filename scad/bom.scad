module bom(code, desc, category) {
	echo(str(
    "BOM: { \"code\" : \"",
    code,
    "\", \"description\" : \"",
    desc,
    "\", \"categories\" : ",
    category,
    " }"
  ));
}