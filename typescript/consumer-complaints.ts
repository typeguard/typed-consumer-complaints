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
        return cast(JSON.parse(json), A(O("ConsumerComplaints")));
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
        return Array.isArray(val) && val.every((element, i) => {
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

    function A(typ: any) {
        return { typ, isArray: true };
    }

    function E(name: string) {
        return { name, isEnum: true };
    }

    function U(...typs: any[]) {
        return { typs, isUnion: true };
    }

    function M(typ: any) {
        return { typ, isMap: true };
    }

    function O(className: string) {
        return { cls: className, isObject: true };
    }

    const typeMap: any = {
        "ConsumerComplaints": {
            id: "",
            name: "",
            averageRating: 0,
            createdAt: 0,
            description: "",
            displayType: E("DisplayType"),
            downloadCount: 0,
            hideFromCatalog: false,
            hideFromDataJson: false,
            indexUpdatedAt: U(null, 0),
            newBackend: false,
            numberOfComments: 0,
            oid: 0,
            provenance: E("Provenance"),
            publicationAppendEnabled: false,
            publicationDate: 0,
            publicationGroup: 0,
            publicationStage: E("PublicationStage"),
            rowClass: U(null, ""),
            rowsUpdatedAt: 0,
            rowsUpdatedBy: E("RowsUpdatedBy"),
            tableId: 0,
            totalTimesRated: 0,
            viewCount: 0,
            viewLastModified: 0,
            viewType: E("ViewType"),
            grants: A(O("Grant")),
            metadata: O("Metadata"),
            owner: O("Owner"),
            ratings: U(null, O("Ratings")),
            rights: A(E("Right")),
            tableAuthor: O("TableAuthor"),
            flags: U(null, A(E("ConsumerComplaintFlag"))),
            moderationStatus: U(null, false),
            category: U(null, ""),
            tags: U(null, A("")),
            modifyingViewUid: U(null, E("ModifyingViewUid")),
        },
        "Grant": {
            inherited: false,
            type: E("GrantType"),
            flags: A(E("GrantFlag")),
        },
        "Metadata": {
            jsonQuery: U(null, O("JSONQuery")),
            rdfSubject: U(null, E("RDFSubject")),
            rdfClass: U(null, ""),
            rowIdentifier: U(null, ""),
            availableDisplayTypes: A(E("AvailableDisplayType")),
            rowLabel: U(null, ""),
            renderTypeConfig: O("RenderTypeConfig"),
            richRendererConfigs: U(null, O("RichRendererConfigs")),
            custom_fields: U(null, O("CustomFields")),
        },
        "CustomFields": {
            TEST: O("Test"),
        },
        "Test": {
            CFPB1: "",
        },
        "JSONQuery": {
            order: U(null, A(O("Order"))),
            select: U(null, A(O("Select"))),
            group: U(null, A(O("Group"))),
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
            aggregate: U(null, ""),
        },
        "RenderTypeConfig": {
            visible: O("Visible"),
        },
        "Visible": {
            table: U(null, false),
            fatrow: U(null, false),
        },
        "RichRendererConfigs": {
            fatRow: O("FatRow"),
        },
        "FatRow": {
            columns: A(O("Column")),
        },
        "Column": {
            styles: O("Styles"),
            rows: A(O("Row")),
        },
        "Row": {
            fields: A(O("Field")),
        },
        "Field": {
            tableColumnId: 0,
            type: E("FieldType"),
        },
        "Styles": {
            width: E("Width"),
        },
        "Owner": {
            id: "",
            displayName: "",
            screenName: "",
            type: E("OwnerType"),
            flags: U(null, A(E("OwnerFlag"))),
            profileImageUrlLarge: U(null, ""),
            profileImageUrlMedium: U(null, ""),
            profileImageUrlSmall: U(null, ""),
        },
        "Ratings": {
            rating: 0,
        },
        "TableAuthor": {
            id: E("ID"),
            displayName: E("Name"),
            screenName: E("Name"),
            type: E("OwnerType"),
            flags: U(null, A(E("OwnerFlag"))),
        },
        "DisplayType": [
            DisplayType.Fatrow,
            DisplayType.Table,
        ],
        "ConsumerComplaintFlag": [
            ConsumerComplaintFlag.Default,
            ConsumerComplaintFlag.Restorable,
            ConsumerComplaintFlag.RestorePossibleForType,
        ],
        "GrantFlag": [
            GrantFlag.Public,
        ],
        "GrantType": [
            GrantType.Viewer,
        ],
        "AvailableDisplayType": [
            AvailableDisplayType.Fatrow,
            AvailableDisplayType.Page,
            AvailableDisplayType.Table,
        ],
        "RDFSubject": [
            RDFSubject.The0,
        ],
        "FieldType": [
            FieldType.ColumnData,
            FieldType.ColumnLabel,
        ],
        "Width": [
            Width.The27,
            Width.The30,
            Width.The31,
            Width.The33,
            Width.The40,
        ],
        "ModifyingViewUid": [
            ModifyingViewUid.S6EwH6Mp,
        ],
        "OwnerFlag": [
            OwnerFlag.OrganizationMember,
        ],
        "OwnerType": [
            OwnerType.Interactive,
        ],
        "Provenance": [
            Provenance.Official,
        ],
        "PublicationStage": [
            PublicationStage.Published,
        ],
        "Right": [
            Right.Read,
        ],
        "RowsUpdatedBy": [
            RowsUpdatedBy.PjxgVe4M,
            RowsUpdatedBy.The54A3Qyun,
            RowsUpdatedBy.The9E3M2843,
            RowsUpdatedBy.VvcaFr6G,
        ],
        "Name": [
            Name.DanMunz,
            Name.DougTaylor,
            Name.Ming,
            Name.ShannonFiles,
        ],
        "ID": [
            ID.PjxgVe4M,
            ID.The54A3Qyun,
            ID.The9E3M2843,
            ID.The9EkiH2Hn,
        ],
        "ViewType": [
            ViewType.Tabular,
        ],
    };
}
