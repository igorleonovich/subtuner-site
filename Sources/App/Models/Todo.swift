import Fluent
import Vapor

final class Todo: Model, Content {
    
    enum Status: String, Codable, CaseIterable {
        static var name: FieldKey { .status }
        
        case pending
        case completed
    }
    
    struct Labels: OptionSet, Codable {
        var rawValue: Int
        
        static let red = Labels(rawValue: 1 << 0)
        static let purple = Labels(rawValue: 1 << 1)
        static let orange = Labels(rawValue: 1 << 2)
        static let yellow = Labels(rawValue: 1 << 3)
        static let green = Labels(rawValue: 1 << 4)
        static let blue = Labels(rawValue: 1 << 5)
        static let gray = Labels(rawValue: 1 << 6)
        
        static let all: Labels = [.red, .purple, .orange, .yellow, .green, .blue, .gray]
    }
    
    static let schema = "todos"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: .title)
    var title: String
    
    @Enum(key: .status)
    var status: Status
    
    @Field(key: .labels)
    var labels: Labels

    init() { }

    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}
