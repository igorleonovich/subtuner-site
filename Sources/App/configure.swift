import Fluent
import FluentPostgresDriver
import Vapor
import Leaf
import NIOSSL

// configures your application
public func configure(_ app: Application) throws {
    
    // MARK: - Middleware
    
    // Serves files from `Public/` directory
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.middleware.use(ExtendPathMiddleware())
    
    
    // MARK: - Security
    
    // let certPath = Environment.get("CERT_PATH")!
    // let keyPath = Environment.get("KEY_PATH")!
    let homePath = app.directory.workingDirectory
    let certPath = homePath + "/cert.pem"
    let keyPath = homePath + "/key.pem"
    
    let certs = try! NIOSSLCertificate.fromPEMFile(certPath)
        .map { NIOSSLCertificateSource.certificate($0) }
    let tls = TLSConfiguration.forServer(certificateChain: certs, privateKey: .file(keyPath))

    app.http.server.configuration = .init(hostname: "127.0.0.1",
                                          port: 8080,
                                          backlog: 256,
                                          reuseAddress: true,
                                          tcpNoDelay: true,
                                          responseCompression: .disabled,
                                          requestDecompression: .disabled,
                                          supportPipelining: false,
                                          supportVersions: Set<HTTPVersionMajor>([.two]),
                                          tlsConfiguration: tls,
                                          serverName: nil,
                                          logger: nil)
    
    
    // MARK: - Leaf
    
    app.views.use(.leaf)
    app.leaf.cache.isEnabled = app.environment.isRelease

    app.databases.use(.postgres(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
        password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
        database: Environment.get("DATABASE_NAME") ?? "vapor_database"
    ), as: .psql)

    app.migrations.add(CreateTodo())

    // register routes
    try routes(app)
}
