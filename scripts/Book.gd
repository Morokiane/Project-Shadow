class_name Book

export (String, FILE, "*.json") var bookFile : String

func Interact() -> void:
    var bookText : Dictionary = LoadBook(bookFile)

func LoadBook(filePath) -> Dictionary:
    var file = File.new()
    assert (file.file_exists(filePath))

    file.open(filePath, file.READ)
    var bookText = parse_json(file.get_as_text())
    assert (bookText.size() > 0)
    return bookText