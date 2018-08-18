// To parse this JSON data, do
//
//     final consumerComplaints = consumerComplaintsFromJson(jsonString);

import 'dart:convert';

List<ConsumerComplaints> consumerComplaintsFromJson(String str) {
    final jsonData = json.decode(str);
    return new List<ConsumerComplaints>.from(jsonData.map((x) => ConsumerComplaints.fromJson(x)));
}

String consumerComplaintsToJson(List<ConsumerComplaints> data) {
    final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
    return json.encode(dyn);
}

class ConsumerComplaints {
    String id;
    String name;
    int averageRating;
    int createdAt;
    String description;
    DisplayType displayType;
    int downloadCount;
    bool hideFromCatalog;
    bool hideFromDataJson;
    int indexUpdatedAt;
    bool newBackend;
    int numberOfComments;
    int oid;
    Provenance provenance;
    bool publicationAppendEnabled;
    int publicationDate;
    int publicationGroup;
    PublicationStage publicationStage;
    String rowClass;
    int rowsUpdatedAt;
    RowsUpdatedBy rowsUpdatedBy;
    int tableId;
    int totalTimesRated;
    int viewCount;
    int viewLastModified;
    ViewType viewType;
    List<Grant> grants;
    Metadata metadata;
    Owner owner;
    Ratings ratings;
    List<Right> rights;
    TableAuthor tableAuthor;
    List<ConsumerComplaintFlag> flags;
    bool moderationStatus;
    String category;
    List<String> tags;
    ModifyingViewUid modifyingViewUid;

    ConsumerComplaints({
        this.id,
        this.name,
        this.averageRating,
        this.createdAt,
        this.description,
        this.displayType,
        this.downloadCount,
        this.hideFromCatalog,
        this.hideFromDataJson,
        this.indexUpdatedAt,
        this.newBackend,
        this.numberOfComments,
        this.oid,
        this.provenance,
        this.publicationAppendEnabled,
        this.publicationDate,
        this.publicationGroup,
        this.publicationStage,
        this.rowClass,
        this.rowsUpdatedAt,
        this.rowsUpdatedBy,
        this.tableId,
        this.totalTimesRated,
        this.viewCount,
        this.viewLastModified,
        this.viewType,
        this.grants,
        this.metadata,
        this.owner,
        this.ratings,
        this.rights,
        this.tableAuthor,
        this.flags,
        this.moderationStatus,
        this.category,
        this.tags,
        this.modifyingViewUid,
    });

    factory ConsumerComplaints.fromJson(Map<String, dynamic> json) => new ConsumerComplaints(
        id: json["id"],
        name: json["name"],
        averageRating: json["averageRating"],
        createdAt: json["createdAt"],
        description: json["description"],
        displayType: displayTypeValues.map[json["displayType"]],
        downloadCount: json["downloadCount"],
        hideFromCatalog: json["hideFromCatalog"],
        hideFromDataJson: json["hideFromDataJson"],
        indexUpdatedAt: json["indexUpdatedAt"] == null ? null : json["indexUpdatedAt"],
        newBackend: json["newBackend"],
        numberOfComments: json["numberOfComments"],
        oid: json["oid"],
        provenance: provenanceValues.map[json["provenance"]],
        publicationAppendEnabled: json["publicationAppendEnabled"],
        publicationDate: json["publicationDate"],
        publicationGroup: json["publicationGroup"],
        publicationStage: publicationStageValues.map[json["publicationStage"]],
        rowClass: json["rowClass"] == null ? null : json["rowClass"],
        rowsUpdatedAt: json["rowsUpdatedAt"],
        rowsUpdatedBy: rowsUpdatedByValues.map[json["rowsUpdatedBy"]],
        tableId: json["tableId"],
        totalTimesRated: json["totalTimesRated"],
        viewCount: json["viewCount"],
        viewLastModified: json["viewLastModified"],
        viewType: viewTypeValues.map[json["viewType"]],
        grants: new List<Grant>.from(json["grants"].map((x) => Grant.fromJson(x))),
        metadata: Metadata.fromJson(json["metadata"]),
        owner: Owner.fromJson(json["owner"]),
        ratings: json["ratings"] == null ? null : Ratings.fromJson(json["ratings"]),
        rights: new List<Right>.from(json["rights"].map((x) => rightValues.map[x])),
        tableAuthor: TableAuthor.fromJson(json["tableAuthor"]),
        flags: json["flags"] == null ? null : new List<ConsumerComplaintFlag>.from(json["flags"].map((x) => consumerComplaintFlagValues.map[x])),
        moderationStatus: json["moderationStatus"] == null ? null : json["moderationStatus"],
        category: json["category"] == null ? null : json["category"],
        tags: json["tags"] == null ? null : new List<String>.from(json["tags"].map((x) => x)),
        modifyingViewUid: json["modifyingViewUid"] == null ? null : modifyingViewUidValues.map[json["modifyingViewUid"]],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "averageRating": averageRating,
        "createdAt": createdAt,
        "description": description,
        "displayType": displayTypeValues.reverse[displayType],
        "downloadCount": downloadCount,
        "hideFromCatalog": hideFromCatalog,
        "hideFromDataJson": hideFromDataJson,
        "indexUpdatedAt": indexUpdatedAt == null ? null : indexUpdatedAt,
        "newBackend": newBackend,
        "numberOfComments": numberOfComments,
        "oid": oid,
        "provenance": provenanceValues.reverse[provenance],
        "publicationAppendEnabled": publicationAppendEnabled,
        "publicationDate": publicationDate,
        "publicationGroup": publicationGroup,
        "publicationStage": publicationStageValues.reverse[publicationStage],
        "rowClass": rowClass == null ? null : rowClass,
        "rowsUpdatedAt": rowsUpdatedAt,
        "rowsUpdatedBy": rowsUpdatedByValues.reverse[rowsUpdatedBy],
        "tableId": tableId,
        "totalTimesRated": totalTimesRated,
        "viewCount": viewCount,
        "viewLastModified": viewLastModified,
        "viewType": viewTypeValues.reverse[viewType],
        "grants": new List<dynamic>.from(grants.map((x) => x.toJson())),
        "metadata": metadata.toJson(),
        "owner": owner.toJson(),
        "ratings": ratings == null ? null : ratings.toJson(),
        "rights": new List<dynamic>.from(rights.map((x) => rightValues.reverse[x])),
        "tableAuthor": tableAuthor.toJson(),
        "flags": flags == null ? null : new List<dynamic>.from(flags.map((x) => consumerComplaintFlagValues.reverse[x])),
        "moderationStatus": moderationStatus == null ? null : moderationStatus,
        "category": category == null ? null : category,
        "tags": tags == null ? null : new List<dynamic>.from(tags.map((x) => x)),
        "modifyingViewUid": modifyingViewUid == null ? null : modifyingViewUidValues.reverse[modifyingViewUid],
    };
}

enum DisplayType { TABLE, FATROW }

final displayTypeValues = new EnumValues({
    "fatrow": DisplayType.FATROW,
    "table": DisplayType.TABLE
});

enum ConsumerComplaintFlag { DEFAULT, RESTORABLE, RESTORE_POSSIBLE_FOR_TYPE }

final consumerComplaintFlagValues = new EnumValues({
    "default": ConsumerComplaintFlag.DEFAULT,
    "restorable": ConsumerComplaintFlag.RESTORABLE,
    "restorePossibleForType": ConsumerComplaintFlag.RESTORE_POSSIBLE_FOR_TYPE
});

class Grant {
    bool inherited;
    GrantType type;
    List<GrantFlag> flags;

    Grant({
        this.inherited,
        this.type,
        this.flags,
    });

    factory Grant.fromJson(Map<String, dynamic> json) => new Grant(
        inherited: json["inherited"],
        type: grantTypeValues.map[json["type"]],
        flags: new List<GrantFlag>.from(json["flags"].map((x) => grantFlagValues.map[x])),
    );

    Map<String, dynamic> toJson() => {
        "inherited": inherited,
        "type": grantTypeValues.reverse[type],
        "flags": new List<dynamic>.from(flags.map((x) => grantFlagValues.reverse[x])),
    };
}

enum GrantFlag { PUBLIC }

final grantFlagValues = new EnumValues({
    "public": GrantFlag.PUBLIC
});

enum GrantType { VIEWER }

final grantTypeValues = new EnumValues({
    "viewer": GrantType.VIEWER
});

class Metadata {
    JsonQuery jsonQuery;
    String rdfSubject;
    String rdfClass;
    String rowIdentifier;
    List<AvailableDisplayType> availableDisplayTypes;
    String rowLabel;
    RenderTypeConfig renderTypeConfig;
    RichRendererConfigs richRendererConfigs;
    CustomFields customFields;

    Metadata({
        this.jsonQuery,
        this.rdfSubject,
        this.rdfClass,
        this.rowIdentifier,
        this.availableDisplayTypes,
        this.rowLabel,
        this.renderTypeConfig,
        this.richRendererConfigs,
        this.customFields,
    });

    factory Metadata.fromJson(Map<String, dynamic> json) => new Metadata(
        jsonQuery: json["jsonQuery"] == null ? null : JsonQuery.fromJson(json["jsonQuery"]),
        rdfSubject: json["rdfSubject"] == null ? null : json["rdfSubject"],
        rdfClass: json["rdfClass"] == null ? null : json["rdfClass"],
        rowIdentifier: json["rowIdentifier"] == null ? null : json["rowIdentifier"],
        availableDisplayTypes: new List<AvailableDisplayType>.from(json["availableDisplayTypes"].map((x) => availableDisplayTypeValues.map[x])),
        rowLabel: json["rowLabel"] == null ? null : json["rowLabel"],
        renderTypeConfig: RenderTypeConfig.fromJson(json["renderTypeConfig"]),
        richRendererConfigs: json["richRendererConfigs"] == null ? null : RichRendererConfigs.fromJson(json["richRendererConfigs"]),
        customFields: json["custom_fields"] == null ? null : CustomFields.fromJson(json["custom_fields"]),
    );

    Map<String, dynamic> toJson() => {
        "jsonQuery": jsonQuery == null ? null : jsonQuery.toJson(),
        "rdfSubject": rdfSubject == null ? null : rdfSubject,
        "rdfClass": rdfClass == null ? null : rdfClass,
        "rowIdentifier": rowIdentifier == null ? null : rowIdentifier,
        "availableDisplayTypes": new List<dynamic>.from(availableDisplayTypes.map((x) => availableDisplayTypeValues.reverse[x])),
        "rowLabel": rowLabel == null ? null : rowLabel,
        "renderTypeConfig": renderTypeConfig.toJson(),
        "richRendererConfigs": richRendererConfigs == null ? null : richRendererConfigs.toJson(),
        "custom_fields": customFields == null ? null : customFields.toJson(),
    };
}

enum AvailableDisplayType { TABLE, FATROW, PAGE }

final availableDisplayTypeValues = new EnumValues({
    "fatrow": AvailableDisplayType.FATROW,
    "page": AvailableDisplayType.PAGE,
    "table": AvailableDisplayType.TABLE
});

class CustomFields {
    Test test;

    CustomFields({
        this.test,
    });

    factory CustomFields.fromJson(Map<String, dynamic> json) => new CustomFields(
        test: Test.fromJson(json["TEST"]),
    );

    Map<String, dynamic> toJson() => {
        "TEST": test.toJson(),
    };
}

class Test {
    String cfpb1;

    Test({
        this.cfpb1,
    });

    factory Test.fromJson(Map<String, dynamic> json) => new Test(
        cfpb1: json["CFPB1"],
    );

    Map<String, dynamic> toJson() => {
        "CFPB1": cfpb1,
    };
}

class JsonQuery {
    List<Order> order;

    JsonQuery({
        this.order,
    });

    factory JsonQuery.fromJson(Map<String, dynamic> json) => new JsonQuery(
        order: new List<Order>.from(json["order"].map((x) => Order.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "order": new List<dynamic>.from(order.map((x) => x.toJson())),
    };
}

class Order {
    bool ascending;
    String columnFieldName;

    Order({
        this.ascending,
        this.columnFieldName,
    });

    factory Order.fromJson(Map<String, dynamic> json) => new Order(
        ascending: json["ascending"],
        columnFieldName: json["columnFieldName"],
    );

    Map<String, dynamic> toJson() => {
        "ascending": ascending,
        "columnFieldName": columnFieldName,
    };
}

class RenderTypeConfig {
    Visible visible;

    RenderTypeConfig({
        this.visible,
    });

    factory RenderTypeConfig.fromJson(Map<String, dynamic> json) => new RenderTypeConfig(
        visible: Visible.fromJson(json["visible"]),
    );

    Map<String, dynamic> toJson() => {
        "visible": visible.toJson(),
    };
}

class Visible {
    bool table;
    bool fatrow;

    Visible({
        this.table,
        this.fatrow,
    });

    factory Visible.fromJson(Map<String, dynamic> json) => new Visible(
        table: json["table"] == null ? null : json["table"],
        fatrow: json["fatrow"] == null ? null : json["fatrow"],
    );

    Map<String, dynamic> toJson() => {
        "table": table == null ? null : table,
        "fatrow": fatrow == null ? null : fatrow,
    };
}

class RichRendererConfigs {
    FatRow fatRow;

    RichRendererConfigs({
        this.fatRow,
    });

    factory RichRendererConfigs.fromJson(Map<String, dynamic> json) => new RichRendererConfigs(
        fatRow: FatRow.fromJson(json["fatRow"]),
    );

    Map<String, dynamic> toJson() => {
        "fatRow": fatRow.toJson(),
    };
}

class FatRow {
    List<Column> columns;

    FatRow({
        this.columns,
    });

    factory FatRow.fromJson(Map<String, dynamic> json) => new FatRow(
        columns: new List<Column>.from(json["columns"].map((x) => Column.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "columns": new List<dynamic>.from(columns.map((x) => x.toJson())),
    };
}

class Column {
    Styles styles;
    List<Row> rows;

    Column({
        this.styles,
        this.rows,
    });

    factory Column.fromJson(Map<String, dynamic> json) => new Column(
        styles: Styles.fromJson(json["styles"]),
        rows: new List<Row>.from(json["rows"].map((x) => Row.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "styles": styles.toJson(),
        "rows": new List<dynamic>.from(rows.map((x) => x.toJson())),
    };
}

class Row {
    List<Field> fields;

    Row({
        this.fields,
    });

    factory Row.fromJson(Map<String, dynamic> json) => new Row(
        fields: new List<Field>.from(json["fields"].map((x) => Field.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "fields": new List<dynamic>.from(fields.map((x) => x.toJson())),
    };
}

class Field {
    int tableColumnId;
    FieldType type;

    Field({
        this.tableColumnId,
        this.type,
    });

    factory Field.fromJson(Map<String, dynamic> json) => new Field(
        tableColumnId: json["tableColumnId"],
        type: fieldTypeValues.map[json["type"]],
    );

    Map<String, dynamic> toJson() => {
        "tableColumnId": tableColumnId,
        "type": fieldTypeValues.reverse[type],
    };
}

enum FieldType { COLUMN_LABEL, COLUMN_DATA }

final fieldTypeValues = new EnumValues({
    "columnData": FieldType.COLUMN_DATA,
    "columnLabel": FieldType.COLUMN_LABEL
});

class Styles {
    Width width;

    Styles({
        this.width,
    });

    factory Styles.fromJson(Map<String, dynamic> json) => new Styles(
        width: widthValues.map[json["width"]],
    );

    Map<String, dynamic> toJson() => {
        "width": widthValues.reverse[width],
    };
}

enum Width { THE_27, THE_40, THE_30, THE_31, THE_33 }

final widthValues = new EnumValues({
    "27%": Width.THE_27,
    "30%": Width.THE_30,
    "31%": Width.THE_31,
    "33%": Width.THE_33,
    "40%": Width.THE_40
});

enum ModifyingViewUid { S6_EW_H6_MP }

final modifyingViewUidValues = new EnumValues({
    "s6ew-h6mp": ModifyingViewUid.S6_EW_H6_MP
});

class Owner {
    String id;
    String displayName;
    String screenName;
    OwnerType type;
    String profileImageUrlLarge;
    String profileImageUrlMedium;
    String profileImageUrlSmall;

    Owner({
        this.id,
        this.displayName,
        this.screenName,
        this.type,
        this.profileImageUrlLarge,
        this.profileImageUrlMedium,
        this.profileImageUrlSmall,
    });

    factory Owner.fromJson(Map<String, dynamic> json) => new Owner(
        id: json["id"],
        displayName: json["displayName"],
        screenName: json["screenName"],
        type: ownerTypeValues.map[json["type"]],
        profileImageUrlLarge: json["profileImageUrlLarge"] == null ? null : json["profileImageUrlLarge"],
        profileImageUrlMedium: json["profileImageUrlMedium"] == null ? null : json["profileImageUrlMedium"],
        profileImageUrlSmall: json["profileImageUrlSmall"] == null ? null : json["profileImageUrlSmall"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "displayName": displayName,
        "screenName": screenName,
        "type": ownerTypeValues.reverse[type],
        "profileImageUrlLarge": profileImageUrlLarge == null ? null : profileImageUrlLarge,
        "profileImageUrlMedium": profileImageUrlMedium == null ? null : profileImageUrlMedium,
        "profileImageUrlSmall": profileImageUrlSmall == null ? null : profileImageUrlSmall,
    };
}

enum OwnerType { INTERACTIVE }

final ownerTypeValues = new EnumValues({
    "interactive": OwnerType.INTERACTIVE
});

enum Provenance { OFFICIAL }

final provenanceValues = new EnumValues({
    "official": Provenance.OFFICIAL
});

enum PublicationStage { PUBLISHED }

final publicationStageValues = new EnumValues({
    "published": PublicationStage.PUBLISHED
});

class Ratings {
    int rating;

    Ratings({
        this.rating,
    });

    factory Ratings.fromJson(Map<String, dynamic> json) => new Ratings(
        rating: json["rating"],
    );

    Map<String, dynamic> toJson() => {
        "rating": rating,
    };
}

enum Right { READ }

final rightValues = new EnumValues({
    "read": Right.READ
});

enum RowsUpdatedBy { PJXG_VE4_M, THE_54_A3_QYUN, THE_9_E3_M_2843, VVCA_FR6_G }

final rowsUpdatedByValues = new EnumValues({
    "pjxg-ve4m": RowsUpdatedBy.PJXG_VE4_M,
    "54a3-qyun": RowsUpdatedBy.THE_54_A3_QYUN,
    "9e3m-2843": RowsUpdatedBy.THE_9_E3_M_2843,
    "vvca-fr6g": RowsUpdatedBy.VVCA_FR6_G
});

class TableAuthor {
    Id id;
    Name displayName;
    Name screenName;
    OwnerType type;

    TableAuthor({
        this.id,
        this.displayName,
        this.screenName,
        this.type,
    });

    factory TableAuthor.fromJson(Map<String, dynamic> json) => new TableAuthor(
        id: idValues.map[json["id"]],
        displayName: nameValues.map[json["displayName"]],
        screenName: nameValues.map[json["screenName"]],
        type: ownerTypeValues.map[json["type"]],
    );

    Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "displayName": nameValues.reverse[displayName],
        "screenName": nameValues.reverse[screenName],
        "type": ownerTypeValues.reverse[type],
    };
}

enum Name { SHANNON_FILES, MING, DAN_MUNZ, DOUG_TAYLOR }

final nameValues = new EnumValues({
    "Dan Munz": Name.DAN_MUNZ,
    "Doug Taylor": Name.DOUG_TAYLOR,
    "ming": Name.MING,
    "Shannon Files": Name.SHANNON_FILES
});

enum Id { PJXG_VE4_M, THE_54_A3_QYUN, THE_9_E3_M_2843, THE_9_EKI_H2_HN }

final idValues = new EnumValues({
    "pjxg-ve4m": Id.PJXG_VE4_M,
    "54a3-qyun": Id.THE_54_A3_QYUN,
    "9e3m-2843": Id.THE_9_E3_M_2843,
    "9eki-h2hn": Id.THE_9_EKI_H2_HN
});

enum ViewType { TABULAR }

final viewTypeValues = new EnumValues({
    "tabular": ViewType.TABULAR
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
