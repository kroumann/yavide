class TypeDeduction():
    def __init__(self, parser, callback = None):
        self.parser = parser
        self.callback = callback

    def __call__(self, args):
        project_root_directory = str(args[0])
        contents_filename = str(args[1])
        original_filename = str(args[2])
        compiler_args = str(args[3])
        line = int(args[4])
        column = int(args[5])

        tunit = self.parser.parse(
            contents_filename,
            original_filename,
            compiler_args,
            project_root_directory
        )

        if self.callback:
            cursor = self.parser.get_cursor(tunit, line, column)
            if cursor and cursor.type:
                self.callback(cursor.type.spelling, args)
            else:
                self.callback('', args)

