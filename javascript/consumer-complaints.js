// To parse this data:
//
//   const Convert = require("./file");
//
//   const consumerComplaints = Convert.toConsumerComplaints(json);
//
// These functions will throw an error if the JSON doesn't
// match the expected interface, even if the JSON is valid.

// Converts JSON strings to/from your types
// and asserts the results of JSON.parse at runtime
function toConsumerComplaints(json) {
    return cast(JSON.parse(json), a(o("ConsumerComplaints")));
}

function consumerComplaintsToJson(value) {
    return JSON.stringify(value, null, 2);
}

function cast(obj, typ) {
    if (!isValid(typ, obj)) {
        throw `Invalid value`;
    }
    return obj;
}

function isValid(typ, val) {
    if (typ === undefined) return true;
    if (typ === null) return val === null || val === undefined;
    return typ.isUnion  ? isValidUnion(typ.typs, val)
            : typ.isArray  ? isValidArray(typ.typ, val)
            : typ.isMap    ? isValidMap(typ.typ, val)
            : typ.isEnum   ? isValidEnum(typ.name, val)
            : typ.isObject ? isValidObject(typ.cls, val)
            :                isValidPrimitive(typ, val);
}

function isValidPrimitive(typ, val) {
    return typeof typ === typeof val;
}

function isValidUnion(typs, val) {
    // val must validate against one typ in typs
    return typs.find(typ => isValid(typ, val)) !== undefined;
}

function isValidEnum(enumName, val) {
    const cases = typeMap[enumName];
    return cases.indexOf(val) !== -1;
}

function isValidArray(typ, val) {
    // val must be an array with no invalid elements
    return Array.isArray(val) && val.every(element => {
        return isValid(typ, element);
    });
}

function isValidMap(typ, val) {
    if (val === null || typeof val !== "object" || Array.isArray(val)) return false;
    // all values in the map must be typ
    return Object.keys(val).every(prop => {
        if (!Object.prototype.hasOwnProperty.call(val, prop)) return true;
        return isValid(typ, val[prop]);
    });
}

function isValidObject(className, val) {
    if (val === null || typeof val !== "object" || Array.isArray(val)) return false;
    let typeRep = typeMap[className];
    return Object.keys(typeRep).every(prop => {
        if (!Object.prototype.hasOwnProperty.call(typeRep, prop)) return true;
        return isValid(typeRep[prop], val[prop]);
    });
}

function a(typ) {
    return { typ, isArray: true };
}

function e(name) {
    return { name, isEnum: true };
}

function u(...typs) {
    return { typs, isUnion: true };
}

function m(typ) {
    return { typ, isMap: true };
}

function o(className) {
    return { cls: className, isObject: true };
}

const typeMap = {
    "ConsumerComplaints": {
        id: "",
        name: "",
        averageRating: 0,
        createdAt: 0,
        description: "",
        displayType: e("DisplayType"),
        downloadCount: 0,
        hideFromCatalog: false,
        hideFromDataJson: false,
        indexUpdatedAt: u(null, 0),
        newBackend: false,
        numberOfComments: 0,
        oid: 0,
        provenance: e("Provenance"),
        publicationAppendEnabled: false,
        publicationDate: 0,
        publicationGroup: 0,
        publicationStage: e("PublicationStage"),
        rowClass: u(null, ""),
        rowsUpdatedAt: 0,
        rowsUpdatedBy: e("RowsUpdatedBy"),
        tableId: 0,
        totalTimesRated: 0,
        viewCount: 0,
        viewLastModified: 0,
        viewType: e("ViewType"),
        grants: a(o("Grant")),
        metadata: o("Metadata"),
        owner: o("Owner"),
        ratings: u(null, o("Ratings")),
        rights: a(e("Right")),
        tableAuthor: o("TableAuthor"),
        flags: u(null, a(e("ConsumerComplaintFlag"))),
        moderationStatus: u(null, false),
        category: u(null, ""),
        tags: u(null, a("")),
        modifyingViewUid: u(null, e("ModifyingViewUid")),
    },
    "Grant": {
        inherited: false,
        type: e("GrantType"),
        flags: a(e("GrantFlag")),
    },
    "Metadata": {
        jsonQuery: u(null, o("JSONQuery")),
        rdfSubject: u(null, e("RDFSubject")),
        rdfClass: u(null, ""),
        rowIdentifier: u(null, ""),
        availableDisplayTypes: a(e("AvailableDisplayType")),
        rowLabel: u(null, ""),
        renderTypeConfig: o("RenderTypeConfig"),
        richRendererConfigs: u(null, o("RichRendererConfigs")),
        custom_fields: u(null, o("CustomFields")),
    },
    "CustomFields": {
        TEST: o("Test"),
    },
    "Test": {
        CFPB1: "",
    },
    "JSONQuery": {
        order: u(null, a(o("Order"))),
        select: u(null, a(o("Select"))),
        group: u(null, a(o("Group"))),
    },
    "Group": {
        columnFieldName: "",
    },
    "Order": {
        ascending: false,
        columnFieldName: "",
    },
    "Select": {
        columnFieldName: "",
        aggregate: u(null, ""),
    },
    "RenderTypeConfig": {
        visible: o("Visible"),
    },
    "Visible": {
        table: u(null, false),
        fatrow: u(null, false),
    },
    "RichRendererConfigs": {
        fatRow: o("FatRow"),
    },
    "FatRow": {
        columns: a(o("Column")),
    },
    "Column": {
        styles: o("Styles"),
        rows: a(o("Row")),
    },
    "Row": {
        fields: a(o("Field")),
    },
    "Field": {
        tableColumnId: 0,
        type: e("FieldType"),
    },
    "Styles": {
        width: e("Width"),
    },
    "Owner": {
        id: "",
        displayName: "",
        screenName: "",
        type: e("OwnerType"),
        flags: u(null, a(e("OwnerFlag"))),
        profileImageUrlLarge: u(null, ""),
        profileImageUrlMedium: u(null, ""),
        profileImageUrlSmall: u(null, ""),
    },
    "Ratings": {
        rating: 0,
    },
    "TableAuthor": {
        id: e("ID"),
        displayName: e("Name"),
        screenName: e("Name"),
        type: e("OwnerType"),
        flags: u(null, a(e("OwnerFlag"))),
    },
    "DisplayType": [
        "fatrow",
        "table",
    ],
    "ConsumerComplaintFlag": [
        "default",
        "restorable",
        "restorePossibleForType",
    ],
    "GrantFlag": [
        "public",
    ],
    "GrantType": [
        "viewer",
    ],
    "AvailableDisplayType": [
        "fatrow",
        "page",
        "table",
    ],
    "RDFSubject": [
        "0",
    ],
    "FieldType": [
        "columnData",
        "columnLabel",
    ],
    "Width": [
        "27%",
        "30%",
        "31%",
        "33%",
        "40%",
    ],
    "ModifyingViewUid": [
        "s6ew-h6mp",
    ],
    "OwnerFlag": [
        "organizationMember",
    ],
    "OwnerType": [
        "interactive",
    ],
    "Provenance": [
        "official",
    ],
    "PublicationStage": [
        "published",
    ],
    "Right": [
        "read",
    ],
    "RowsUpdatedBy": [
        "pjxg-ve4m",
        "54a3-qyun",
        "9e3m-2843",
        "vvca-fr6g",
    ],
    "Name": [
        "Dan Munz",
        "Doug Taylor",
        "ming",
        "Shannon Files",
    ],
    "ID": [
        "pjxg-ve4m",
        "54a3-qyun",
        "9e3m-2843",
        "9eki-h2hn",
    ],
    "ViewType": [
        "tabular",
    ],
};

module.exports = {
    "consumerComplaintsToJson": consumerComplaintsToJson,
    "toConsumerComplaints": toConsumerComplaints,
};
