import Fluent
import Vapor

final class Todo: Model, Content {
    
    enum Status: String, Codable, CaseIterable {
        static var name: FieldKey { .status }
        
        case pending
        case completed
    }
    
    static let schema = "todos"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: .title)
    var title: String
    
    @Enum(key: .status)
    var status: Status

    init() { }

    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}
