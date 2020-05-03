import Fluent

//struct CreateUserTokenModel: Migration {
//    // Prepares the database for storing UserModel models.
//    func prepare(on database: Database) -> EventLoopFuture<Void> {
//        database.schema("tokens")
//            .id()
//            .field("value", .string)
//            .field("user_id", .string)
//            .create()
//    }
//
//    // Optionally reverts the changes made in the prepare method.
//    func revert(on database: Database) -> EventLoopFuture<Void> {
//        database.schema("tokens").delete()
//    }
//}
