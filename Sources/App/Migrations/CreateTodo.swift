import Fluent

struct CreateTodo: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        var enumBuilder = database.enum(Todo.Status.name.description)
        for option in Todo.Status.allCases {
            enumBuilder = enumBuilder.case(option.rawValue)
        }
        return enumBuilder.create()
        .flatMap { enumType in
            database.schema(Todo.schema)
            .id()
            .field(.title, .string, .required)
            .field(.status, .string, .required)
            .field(.labels, .int, .required)
            .create()
        }
    }

    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema(Todo.schema).delete().flatMap {
            database.enum(Todo.Status.name.description).delete()
        }
    }
}
