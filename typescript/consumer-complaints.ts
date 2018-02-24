// To parse this data:
//
//   import { Convert } from "./file";
//
//   const consumerComplaints = Convert.toConsumerComplaints(json);
//
// These functions will throw an error if the JSON doesn't
// match the expected interface, even if the JSON is valid.

export interface ConsumerComplaints {
    id:                       string;
    name:                     string;
    averageRating:            number;
    createdAt:                number;
    description:              string;
    displayType:              DisplayType;
    downloadCount:            number;
    hideFromCatalog:          boolean;
    hideFromDataJson:         boolean;
    indexUpdatedAt?:          number;
    newBackend:               boolean;
    numberOfComments:         number;
    oid:                      number;
    provenance:               Provenance;
    publicationAppendEnabled: boolean;
    publicationDate:          number;
    publicationGroup:         number;
    publicationStage:         PublicationStage;
    rowClass?:                string;
    rowsUpdatedAt:            number;
    rowsUpdatedBy:            RowsUpdatedBy;
    tableId:                  number;
    totalTimesRated:          number;
    viewCount:                number;
    viewLastModified:         number;
    viewType:                 ViewType;
    grants:                   Grant[];
    metadata:                 Metadata;
    owner:                    Owner;
    ratings?:                 Ratings;
    rights:                   Right[];
    tableAuthor:              TableAuthor;
    flags?:                   ConsumerComplaintFlag[];
    moderationStatus?:        boolean;
    category?:                string;
    tags?:                    string[];
    modifyingViewUid?:        ModifyingViewUid;
}

export enum DisplayType {
    Fatrow = "fatrow",
    Table = "table",
}

export enum ConsumerComplaintFlag {
    Default = "default",
    Restorable = "restorable",
    RestorePossibleForType = "restorePossibleForType",
}

export interface Grant {
    inherited: boolean;
    type:      GrantType;
    flags:     GrantFlag[];
}

export enum GrantFlag {
    Public = "public",
}

export enum GrantType {
    Viewer = "viewer",
}

export interface Metadata {
    jsonQuery?:            JSONQuery;
    rdfSubject?:           RDFSubject;
    rdfClass?:             string;
    rowIdentifier?:        string;
    availableDisplayTypes: AvailableDisplayType[];
    rowLabel?:             string;
    renderTypeConfig:      RenderTypeConfig;
    richRendererConfigs?:  RichRendererConfigs;
    custom_fields?:        CustomFields;
}

export enum AvailableDisplayType {
    Fatrow = "fatrow",
    Page = "page",
    Table = "table",
}

export interface CustomFields {
    TEST: Test;
}

export interface Test {
    CFPB1: string;
}

export interface JSONQuery {
    order?:  Order[];
    select?: Select[];
    group?:  Group[];
}

export interface Group {
    columnFieldName: string;
}

export interface Order {
    ascending:       boolean;
    columnFieldName: string;
}

export interface Select {
    columnFieldName: string;
    aggregate?:      string;
}

export enum RDFSubject {
    The0 = "0",
}

export interface RenderTypeConfig {
    visible: Visible;
}

export interface Visible {
    table?:  boolean;
    fatrow?: boolean;
}

export interface RichRendererConfigs {
    fatRow: FatRow;
}

export interface FatRow {
    columns: Column[];
}

export interface Column {
    styles: Styles;
    rows:   Row[];
}

export interface Row {
    fields: Field[];
}

export interface Field {
    tableColumnId: number;
    type:          FieldType;
}

export enum FieldType {
    ColumnData = "columnData",
    ColumnLabel = "columnLabel",
}

export interface Styles {
    width: Width;
}

export enum Width {
    The27 = "27%",
    The30 = "30%",
    The31 = "31%",
    The33 = "33%",
    The40 = "40%",
}

export enum ModifyingViewUid {
    S6EwH6Mp = "s6ew-h6mp",
}

export interface Owner {
    id:                     string;
    displayName:            string;
    screenName:             string;
    type:                   OwnerType;
    flags?:                 OwnerFlag[];
    profileImageUrlLarge?:  string;
    profileImageUrlMedium?: string;
    profileImageUrlSmall?:  string;
}

export enum OwnerFlag {
    OrganizationMember = "organizationMember",
}

export enum OwnerType {
    Interactive = "interactive",
}

export enum Provenance {
    Official = "official",
}

export enum PublicationStage {
    Published = "published",
}

export interface Ratings {
    rating: number;
}

export enum Right {
    Read = "read",
}

export enum RowsUpdatedBy {
    PjxgVe4M = "pjxg-ve4m",
    The54A3Qyun = "54a3-qyun",
    The9E3M2843 = "9e3m-2843",
    VvcaFr6G = "vvca-fr6g",
}

export interface TableAuthor {
    id:          ID;
    displayName: Name;
    screenName:  Name;
    type:        OwnerType;
    flags?:      OwnerFlag[];
}

export enum Name {
    DanMunz = "Dan Munz",
    DougTaylor = "Doug Taylor",
    Ming = "ming",
    ShannonFiles = "Shannon Files",
}

export enum ID {
    PjxgVe4M = "pjxg-ve4m",
    The54A3Qyun = "54a3-qyun",
    The9E3M2843 = "9e3m-2843",
    The9EkiH2Hn = "9eki-h2hn",
}

export enum ViewType {
    Tabular = "tabular",
}

// Converts JSON strings to/from your types
// and asserts the results of JSON.parse at runtime
export module Convert {
    export function toConsumerComplaints(json: string): ConsumerComplaints[] {
        return cast(JSON.parse(json), a(o("ConsumerComplaints")));
    }

    export function consumerComplaintsToJson(value: ConsumerComplaints[]): string {
        return JSON.stringify(value, null, 2);
    }
    
    function cast<T>(obj: any, typ: any): T {
        if (!isValid(typ, obj)) {
            throw `Invalid value`;
        }
        return obj;
    }

    function isValid(typ: any, val: any): boolean {
        if (typ === undefined) return true;
        if (typ === null) return val === null || val === undefined;
        return typ.isUnion  ? isValidUnion(typ.typs, val)
                : typ.isArray  ? isValidArray(typ.typ, val)
                : typ.isMap    ? isValidMap(typ.typ, val)
                : typ.isEnum   ? isValidEnum(typ.name, val)
                : typ.isObject ? isValidObject(typ.cls, val)
                :                isValidPrimitive(typ, val);
    }

    function isValidPrimitive(typ: string, val: any) {
        return typeof typ === typeof val;
    }

    function isValidUnion(typs: any[], val: any): boolean {
        // val must validate against one typ in typs
        return typs.find(typ => isValid(typ, val)) !== undefined;
    }

    function isValidEnum(enumName: string, val: any): boolean {
        const cases = typeMap[enumName];
        return cases.indexOf(val) !== -1;
    }

    function isValidArray(typ: any, val: any): boolean {
        // val must be an array with no invalid elements
        return Array.isArray(val) && val.every(element => {
            return isValid(typ, element);
        });
    }

    function isValidMap(typ: any, val: any): boolean {
        if (val === null || typeof val !== "object" || Array.isArray(val)) return false;
        // all values in the map must be typ
        return Object.keys(val).every(prop => {
            if (!Object.prototype.hasOwnProperty.call(val, prop)) return true;
            return isValid(typ, val[prop]);
        });
    }

    function isValidObject(className: string, val: any): boolean {
        if (val === null || typeof val !== "object" || Array.isArray(val)) return false;
        let typeRep = typeMap[className];
        return Object.keys(typeRep).every(prop => {
            if (!Object.prototype.hasOwnProperty.call(typeRep, prop)) return true;
            return isValid(typeRep[prop], val[prop]);
        });
    }

    function a(typ: any) {
        return { typ, isArray: true };
    }

    function e(name: string) {
        return { name, isEnum: true };
    }

    function u(...typs: any[]) {
        return { typs, isUnion: true };
    }

    function m(typ: any) {
        return { typ, isMap: true };
    }

    function o(className: string) {
        return { cls: className, isObject: true };
    }

    const typeMap: any = {
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
}
