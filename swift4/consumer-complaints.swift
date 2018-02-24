// To parse the JSON, add this file to your project and do:
//
//   let consumerComplaints = try ConsumerComplaints(json)

import Foundation

typealias ConsumerComplaints = [ConsumerComplaintElement]

struct ConsumerComplaintElement: Codable {
    let id, name: String
    let averageRating, createdAt: Int
    let description: String
    let displayType: DisplayType
    let downloadCount: Int
    let hideFromCatalog, hideFromDataJSON: Bool
    let indexUpdatedAt: Int?
    let newBackend: Bool
    let numberOfComments, oid: Int
    let provenance: Provenance
    let publicationAppendEnabled: Bool
    let publicationDate, publicationGroup: Int
    let publicationStage: PublicationStage
    let rowClass: String?
    let rowsUpdatedAt: Int
    let rowsUpdatedBy: RowsUpdatedBy
    let tableID, totalTimesRated, viewCount, viewLastModified: Int
    let viewType: ViewType
    let grants: [Grant]
    let metadata: Metadata
    let owner: Owner
    let ratings: Ratings?
    let rights: [Right]
    let tableAuthor: TableAuthor
    let flags: [ConsumerComplaintFlag]?
    let moderationStatus: Bool?
    let category: String?
    let tags: [String]?
    let modifyingViewUid: ModifyingViewUid?

    enum CodingKeys: String, CodingKey {
        case id, name, averageRating, createdAt, description, displayType, downloadCount, hideFromCatalog
        case hideFromDataJSON = "hideFromDataJson"
        case indexUpdatedAt, newBackend, numberOfComments, oid, provenance, publicationAppendEnabled, publicationDate, publicationGroup, publicationStage, rowClass, rowsUpdatedAt, rowsUpdatedBy
        case tableID = "tableId"
        case totalTimesRated, viewCount, viewLastModified, viewType, grants, metadata, owner, ratings, rights, tableAuthor, flags, moderationStatus, category, tags, modifyingViewUid
    }
}

enum DisplayType: String, Codable {
    case fatrow = "fatrow"
    case table = "table"
}

enum ConsumerComplaintFlag: String, Codable {
    case flagDefault = "default"
    case restorable = "restorable"
    case restorePossibleForType = "restorePossibleForType"
}

struct Grant: Codable {
    let inherited: Bool
    let type: GrantType
    let flags: [GrantFlag]
}

enum GrantFlag: String, Codable {
    case flagPublic = "public"
}

enum GrantType: String, Codable {
    case viewer = "viewer"
}

struct Metadata: Codable {
    let jsonQuery: JSONQuery?
    let rdfSubject: RDFSubject?
    let rdfClass, rowIdentifier: String?
    let availableDisplayTypes: [AvailableDisplayType]
    let rowLabel: String?
    let renderTypeConfig: RenderTypeConfig
    let richRendererConfigs: RichRendererConfigs?
    let customFields: CustomFields?

    enum CodingKeys: String, CodingKey {
        case jsonQuery, rdfSubject, rdfClass, rowIdentifier, availableDisplayTypes, rowLabel, renderTypeConfig, richRendererConfigs
        case customFields = "custom_fields"
    }
}

enum AvailableDisplayType: String, Codable {
    case fatrow = "fatrow"
    case page = "page"
    case table = "table"
}

struct CustomFields: Codable {
    let test: Test

    enum CodingKeys: String, CodingKey {
        case test = "TEST"
    }
}

struct Test: Codable {
    let cfpb1: String

    enum CodingKeys: String, CodingKey {
        case cfpb1 = "CFPB1"
    }
}

struct JSONQuery: Codable {
    let order: [Order]?
    let select: [Select]?
    let group: [Group]?
}

struct Group: Codable {
    let columnFieldName: String
}

struct Order: Codable {
    let ascending: Bool
    let columnFieldName: String
}

struct Select: Codable {
    let columnFieldName: String
    let aggregate: String?
}

enum RDFSubject: String, Codable {
    case the0 = "0"
}

struct RenderTypeConfig: Codable {
    let visible: Visible
}

struct Visible: Codable {
    let table, fatrow: Bool?
}

struct RichRendererConfigs: Codable {
    let fatRow: FatRow
}

struct FatRow: Codable {
    let columns: [Column]
}

struct Column: Codable {
    let styles: Styles
    let rows: [Row]
}

struct Row: Codable {
    let fields: [Field]
}

struct Field: Codable {
    let tableColumnID: Int
    let type: FieldType

    enum CodingKeys: String, CodingKey {
        case tableColumnID = "tableColumnId"
        case type
    }
}

enum FieldType: String, Codable {
    case columnData = "columnData"
    case columnLabel = "columnLabel"
}

struct Styles: Codable {
    let width: Width
}

enum Width: String, Codable {
    case the27 = "27%"
    case the30 = "30%"
    case the31 = "31%"
    case the33 = "33%"
    case the40 = "40%"
}

enum ModifyingViewUid: String, Codable {
    case s6EwH6Mp = "s6ew-h6mp"
}

struct Owner: Codable {
    let id, displayName, screenName: String
    let type: OwnerType
    let flags: [OwnerFlag]?
    let profileImageURLLarge, profileImageURLMedium, profileImageURLSmall: String?

    enum CodingKeys: String, CodingKey {
        case id, displayName, screenName, type, flags
        case profileImageURLLarge = "profileImageUrlLarge"
        case profileImageURLMedium = "profileImageUrlMedium"
        case profileImageURLSmall = "profileImageUrlSmall"
    }
}

enum OwnerFlag: String, Codable {
    case organizationMember = "organizationMember"
}

enum OwnerType: String, Codable {
    case interactive = "interactive"
}

enum Provenance: String, Codable {
    case official = "official"
}

enum PublicationStage: String, Codable {
    case published = "published"
}

struct Ratings: Codable {
    let rating: Int
}

enum Right: String, Codable {
    case read = "read"
}

enum RowsUpdatedBy: String, Codable {
    case pjxgVe4M = "pjxg-ve4m"
    case the54A3Qyun = "54a3-qyun"
    case the9E3M2843 = "9e3m-2843"
    case vvcaFr6G = "vvca-fr6g"
}

struct TableAuthor: Codable {
    let id: ID
    let displayName, screenName: Name
    let type: OwnerType
    let flags: [OwnerFlag]?
}

enum Name: String, Codable {
    case danMunz = "Dan Munz"
    case dougTaylor = "Doug Taylor"
    case ming = "ming"
    case shannonFiles = "Shannon Files"
}

enum ID: String, Codable {
    case pjxgVe4M = "pjxg-ve4m"
    case the54A3Qyun = "54a3-qyun"
    case the9E3M2843 = "9e3m-2843"
    case the9EkiH2Hn = "9eki-h2hn"
}

enum ViewType: String, Codable {
    case tabular = "tabular"
}

// MARK: Convenience initializers

extension ConsumerComplaintElement {
    init(data: Data) throws {
        self = try JSONDecoder().decode(ConsumerComplaintElement.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Grant {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Grant.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Metadata {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Metadata.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension CustomFields {
    init(data: Data) throws {
        self = try JSONDecoder().decode(CustomFields.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Test {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Test.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension JSONQuery {
    init(data: Data) throws {
        self = try JSONDecoder().decode(JSONQuery.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Group {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Group.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Order {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Order.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Select {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Select.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension RenderTypeConfig {
    init(data: Data) throws {
        self = try JSONDecoder().decode(RenderTypeConfig.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Visible {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Visible.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension RichRendererConfigs {
    init(data: Data) throws {
        self = try JSONDecoder().decode(RichRendererConfigs.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension FatRow {
    init(data: Data) throws {
        self = try JSONDecoder().decode(FatRow.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Column {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Column.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Row {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Row.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Field {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Field.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Styles {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Styles.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Owner {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Owner.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Ratings {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Ratings.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension TableAuthor {
    init(data: Data) throws {
        self = try JSONDecoder().decode(TableAuthor.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Array where Element == ConsumerComplaints.Element {
    init(data: Data) throws {
        self = try JSONDecoder().decode(ConsumerComplaints.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
