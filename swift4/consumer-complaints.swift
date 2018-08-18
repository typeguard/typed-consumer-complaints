// To parse the JSON, add this file to your project and do:
//
//   let consumerComplaints = try ConsumerComplaints(json)

import Foundation

typealias ConsumerComplaints = [ConsumerComplaint]

struct ConsumerComplaint: Codable {
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
    let rdfSubject, rdfClass, rowIdentifier: String?
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
    let order: [Order]
}

struct Order: Codable {
    let ascending: Bool
    let columnFieldName: String
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
    let profileImageURLLarge, profileImageURLMedium, profileImageURLSmall: String?

    enum CodingKeys: String, CodingKey {
        case id, displayName, screenName, type
        case profileImageURLLarge = "profileImageUrlLarge"
        case profileImageURLMedium = "profileImageUrlMedium"
        case profileImageURLSmall = "profileImageUrlSmall"
    }
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

// MARK: Convenience initializers and mutators

extension ConsumerComplaint {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ConsumerComplaint.self, from: data)
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

    func with(
        id: String? = nil,
        name: String? = nil,
        averageRating: Int? = nil,
        createdAt: Int? = nil,
        description: String? = nil,
        displayType: DisplayType? = nil,
        downloadCount: Int? = nil,
        hideFromCatalog: Bool? = nil,
        hideFromDataJSON: Bool? = nil,
        indexUpdatedAt: Int?? = nil,
        newBackend: Bool? = nil,
        numberOfComments: Int? = nil,
        oid: Int? = nil,
        provenance: Provenance? = nil,
        publicationAppendEnabled: Bool? = nil,
        publicationDate: Int? = nil,
        publicationGroup: Int? = nil,
        publicationStage: PublicationStage? = nil,
        rowClass: String?? = nil,
        rowsUpdatedAt: Int? = nil,
        rowsUpdatedBy: RowsUpdatedBy? = nil,
        tableID: Int? = nil,
        totalTimesRated: Int? = nil,
        viewCount: Int? = nil,
        viewLastModified: Int? = nil,
        viewType: ViewType? = nil,
        grants: [Grant]? = nil,
        metadata: Metadata? = nil,
        owner: Owner? = nil,
        ratings: Ratings?? = nil,
        rights: [Right]? = nil,
        tableAuthor: TableAuthor? = nil,
        flags: [ConsumerComplaintFlag]?? = nil,
        moderationStatus: Bool?? = nil,
        category: String?? = nil,
        tags: [String]?? = nil,
        modifyingViewUid: ModifyingViewUid?? = nil
    ) -> ConsumerComplaint {
        return ConsumerComplaint(
            id: id ?? self.id,
            name: name ?? self.name,
            averageRating: averageRating ?? self.averageRating,
            createdAt: createdAt ?? self.createdAt,
            description: description ?? self.description,
            displayType: displayType ?? self.displayType,
            downloadCount: downloadCount ?? self.downloadCount,
            hideFromCatalog: hideFromCatalog ?? self.hideFromCatalog,
            hideFromDataJSON: hideFromDataJSON ?? self.hideFromDataJSON,
            indexUpdatedAt: indexUpdatedAt ?? self.indexUpdatedAt,
            newBackend: newBackend ?? self.newBackend,
            numberOfComments: numberOfComments ?? self.numberOfComments,
            oid: oid ?? self.oid,
            provenance: provenance ?? self.provenance,
            publicationAppendEnabled: publicationAppendEnabled ?? self.publicationAppendEnabled,
            publicationDate: publicationDate ?? self.publicationDate,
            publicationGroup: publicationGroup ?? self.publicationGroup,
            publicationStage: publicationStage ?? self.publicationStage,
            rowClass: rowClass ?? self.rowClass,
            rowsUpdatedAt: rowsUpdatedAt ?? self.rowsUpdatedAt,
            rowsUpdatedBy: rowsUpdatedBy ?? self.rowsUpdatedBy,
            tableID: tableID ?? self.tableID,
            totalTimesRated: totalTimesRated ?? self.totalTimesRated,
            viewCount: viewCount ?? self.viewCount,
            viewLastModified: viewLastModified ?? self.viewLastModified,
            viewType: viewType ?? self.viewType,
            grants: grants ?? self.grants,
            metadata: metadata ?? self.metadata,
            owner: owner ?? self.owner,
            ratings: ratings ?? self.ratings,
            rights: rights ?? self.rights,
            tableAuthor: tableAuthor ?? self.tableAuthor,
            flags: flags ?? self.flags,
            moderationStatus: moderationStatus ?? self.moderationStatus,
            category: category ?? self.category,
            tags: tags ?? self.tags,
            modifyingViewUid: modifyingViewUid ?? self.modifyingViewUid
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Grant {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Grant.self, from: data)
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

    func with(
        inherited: Bool? = nil,
        type: GrantType? = nil,
        flags: [GrantFlag]? = nil
    ) -> Grant {
        return Grant(
            inherited: inherited ?? self.inherited,
            type: type ?? self.type,
            flags: flags ?? self.flags
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Metadata {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Metadata.self, from: data)
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

    func with(
        jsonQuery: JSONQuery?? = nil,
        rdfSubject: String?? = nil,
        rdfClass: String?? = nil,
        rowIdentifier: String?? = nil,
        availableDisplayTypes: [AvailableDisplayType]? = nil,
        rowLabel: String?? = nil,
        renderTypeConfig: RenderTypeConfig? = nil,
        richRendererConfigs: RichRendererConfigs?? = nil,
        customFields: CustomFields?? = nil
    ) -> Metadata {
        return Metadata(
            jsonQuery: jsonQuery ?? self.jsonQuery,
            rdfSubject: rdfSubject ?? self.rdfSubject,
            rdfClass: rdfClass ?? self.rdfClass,
            rowIdentifier: rowIdentifier ?? self.rowIdentifier,
            availableDisplayTypes: availableDisplayTypes ?? self.availableDisplayTypes,
            rowLabel: rowLabel ?? self.rowLabel,
            renderTypeConfig: renderTypeConfig ?? self.renderTypeConfig,
            richRendererConfigs: richRendererConfigs ?? self.richRendererConfigs,
            customFields: customFields ?? self.customFields
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension CustomFields {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CustomFields.self, from: data)
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

    func with(
        test: Test? = nil
    ) -> CustomFields {
        return CustomFields(
            test: test ?? self.test
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Test {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Test.self, from: data)
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

    func with(
        cfpb1: String? = nil
    ) -> Test {
        return Test(
            cfpb1: cfpb1 ?? self.cfpb1
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension JSONQuery {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(JSONQuery.self, from: data)
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

    func with(
        order: [Order]? = nil
    ) -> JSONQuery {
        return JSONQuery(
            order: order ?? self.order
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Order {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Order.self, from: data)
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

    func with(
        ascending: Bool? = nil,
        columnFieldName: String? = nil
    ) -> Order {
        return Order(
            ascending: ascending ?? self.ascending,
            columnFieldName: columnFieldName ?? self.columnFieldName
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension RenderTypeConfig {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RenderTypeConfig.self, from: data)
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

    func with(
        visible: Visible? = nil
    ) -> RenderTypeConfig {
        return RenderTypeConfig(
            visible: visible ?? self.visible
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Visible {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Visible.self, from: data)
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

    func with(
        table: Bool?? = nil,
        fatrow: Bool?? = nil
    ) -> Visible {
        return Visible(
            table: table ?? self.table,
            fatrow: fatrow ?? self.fatrow
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension RichRendererConfigs {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RichRendererConfigs.self, from: data)
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

    func with(
        fatRow: FatRow? = nil
    ) -> RichRendererConfigs {
        return RichRendererConfigs(
            fatRow: fatRow ?? self.fatRow
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension FatRow {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(FatRow.self, from: data)
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

    func with(
        columns: [Column]? = nil
    ) -> FatRow {
        return FatRow(
            columns: columns ?? self.columns
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Column {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Column.self, from: data)
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

    func with(
        styles: Styles? = nil,
        rows: [Row]? = nil
    ) -> Column {
        return Column(
            styles: styles ?? self.styles,
            rows: rows ?? self.rows
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Row {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Row.self, from: data)
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

    func with(
        fields: [Field]? = nil
    ) -> Row {
        return Row(
            fields: fields ?? self.fields
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Field {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Field.self, from: data)
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

    func with(
        tableColumnID: Int? = nil,
        type: FieldType? = nil
    ) -> Field {
        return Field(
            tableColumnID: tableColumnID ?? self.tableColumnID,
            type: type ?? self.type
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Styles {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Styles.self, from: data)
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

    func with(
        width: Width? = nil
    ) -> Styles {
        return Styles(
            width: width ?? self.width
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Owner {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Owner.self, from: data)
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

    func with(
        id: String? = nil,
        displayName: String? = nil,
        screenName: String? = nil,
        type: OwnerType? = nil,
        profileImageURLLarge: String?? = nil,
        profileImageURLMedium: String?? = nil,
        profileImageURLSmall: String?? = nil
    ) -> Owner {
        return Owner(
            id: id ?? self.id,
            displayName: displayName ?? self.displayName,
            screenName: screenName ?? self.screenName,
            type: type ?? self.type,
            profileImageURLLarge: profileImageURLLarge ?? self.profileImageURLLarge,
            profileImageURLMedium: profileImageURLMedium ?? self.profileImageURLMedium,
            profileImageURLSmall: profileImageURLSmall ?? self.profileImageURLSmall
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Ratings {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Ratings.self, from: data)
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

    func with(
        rating: Int? = nil
    ) -> Ratings {
        return Ratings(
            rating: rating ?? self.rating
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension TableAuthor {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(TableAuthor.self, from: data)
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

    func with(
        id: ID? = nil,
        displayName: Name? = nil,
        screenName: Name? = nil,
        type: OwnerType? = nil
    ) -> TableAuthor {
        return TableAuthor(
            id: id ?? self.id,
            displayName: displayName ?? self.displayName,
            screenName: screenName ?? self.screenName,
            type: type ?? self.type
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Array where Element == ConsumerComplaints.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ConsumerComplaints.self, from: data)
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
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
