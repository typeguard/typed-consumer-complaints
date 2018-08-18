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
    rdfSubject?:           string;
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
    order: Order[];
}

export interface Order {
    ascending:       boolean;
    columnFieldName: string;
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
    profileImageUrlLarge?:  string;
    profileImageUrlMedium?: string;
    profileImageUrlSmall?:  string;
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
export namespace Convert {
    export function toConsumerComplaints(json: string): ConsumerComplaints[] {
        return cast(JSON.parse(json), a(r("ConsumerComplaints")));
    }

    export function consumerComplaintsToJson(value: ConsumerComplaints[]): string {
        return JSON.stringify(uncast(value, a(r("ConsumerComplaints"))), null, 2);
    }

    function invalidValue(typ: any, val: any): never {
        throw Error(`Invalid value ${JSON.stringify(val)} for type ${JSON.stringify(typ)}`);
    }

    function jsonToJSProps(typ: any): any {
        if (typ.jsonToJS === undefined) {
            var map: any = {};
            typ.props.forEach((p: any) => map[p.json] = { key: p.js, typ: p.typ });
            typ.jsonToJS = map;
        }
        return typ.jsonToJS;
    }

    function jsToJSONProps(typ: any): any {
        if (typ.jsToJSON === undefined) {
            var map: any = {};
            typ.props.forEach((p: any) => map[p.js] = { key: p.json, typ: p.typ });
            typ.jsToJSON = map;
        }
        return typ.jsToJSON;
    }

    function transform(val: any, typ: any, getProps: any): any {
        function transformPrimitive(typ: string, val: any): any {
            if (typeof typ === typeof val) return val;
            return invalidValue(typ, val);
        }

        function transformUnion(typs: any[], val: any): any {
            // val must validate against one typ in typs
            var l = typs.length;
            for (var i = 0; i < l; i++) {
                var typ = typs[i];
                try {
                    return transform(val, typ, getProps);
                } catch (_) {}
            }
            return invalidValue(typs, val);
        }

        function transformEnum(cases: string[], val: any): any {
            if (cases.indexOf(val) !== -1) return val;
            return invalidValue(cases, val);
        }

        function transformArray(typ: any, val: any): any {
            // val must be an array with no invalid elements
            if (!Array.isArray(val)) return invalidValue("array", val);
            return val.map(el => transform(el, typ, getProps));
        }

        function transformObject(props: { [k: string]: any }, additional: any, val: any): any {
            if (val === null || typeof val !== "object" || Array.isArray(val)) {
                return invalidValue("object", val);
            }
            var result: any = {};
            Object.getOwnPropertyNames(props).forEach(key => {
                const prop = props[key];
                const v = Object.prototype.hasOwnProperty.call(val, key) ? val[key] : undefined;
                result[prop.key] = transform(v, prop.typ, getProps);
            });
            Object.getOwnPropertyNames(val).forEach(key => {
                if (!Object.prototype.hasOwnProperty.call(props, key)) {
                    result[key] = transform(val[key], additional, getProps);
                }
            });
            return result;
        }

        if (typ === "any") return val;
        if (typ === null) {
            if (val === null) return val;
            return invalidValue(typ, val);
        }
        if (typ === false) return invalidValue(typ, val);
        while (typeof typ === "object" && typ.ref !== undefined) {
            typ = typeMap[typ.ref];
        }
        if (Array.isArray(typ)) return transformEnum(typ, val);
        if (typeof typ === "object") {
            return typ.hasOwnProperty("unionMembers") ? transformUnion(typ.unionMembers, val)
                : typ.hasOwnProperty("arrayItems")    ? transformArray(typ.arrayItems, val)
                : typ.hasOwnProperty("props")         ? transformObject(getProps(typ), typ.additional, val)
                : invalidValue(typ, val);
        }
        return transformPrimitive(typ, val);
    }

    function cast<T>(val: any, typ: any): T {
        return transform(val, typ, jsonToJSProps);
    }

    function uncast<T>(val: T, typ: any): any {
        return transform(val, typ, jsToJSONProps);
    }

    function a(typ: any) {
        return { arrayItems: typ };
    }

    function u(...typs: any[]) {
        return { unionMembers: typs };
    }

    function o(props: any[], additional: any) {
        return { props, additional };
    }

    function m(additional: any) {
        return { props: [], additional };
    }

    function r(name: string) {
        return { ref: name };
    }

    const typeMap: any = {
        "ConsumerComplaints": o([
            { json: "id", js: "id", typ: "" },
            { json: "name", js: "name", typ: "" },
            { json: "averageRating", js: "averageRating", typ: 0 },
            { json: "createdAt", js: "createdAt", typ: 0 },
            { json: "description", js: "description", typ: "" },
            { json: "displayType", js: "displayType", typ: r("DisplayType") },
            { json: "downloadCount", js: "downloadCount", typ: 0 },
            { json: "hideFromCatalog", js: "hideFromCatalog", typ: true },
            { json: "hideFromDataJson", js: "hideFromDataJson", typ: true },
            { json: "indexUpdatedAt", js: "indexUpdatedAt", typ: u(undefined, 0) },
            { json: "newBackend", js: "newBackend", typ: true },
            { json: "numberOfComments", js: "numberOfComments", typ: 0 },
            { json: "oid", js: "oid", typ: 0 },
            { json: "provenance", js: "provenance", typ: r("Provenance") },
            { json: "publicationAppendEnabled", js: "publicationAppendEnabled", typ: true },
            { json: "publicationDate", js: "publicationDate", typ: 0 },
            { json: "publicationGroup", js: "publicationGroup", typ: 0 },
            { json: "publicationStage", js: "publicationStage", typ: r("PublicationStage") },
            { json: "rowClass", js: "rowClass", typ: u(undefined, "") },
            { json: "rowsUpdatedAt", js: "rowsUpdatedAt", typ: 0 },
            { json: "rowsUpdatedBy", js: "rowsUpdatedBy", typ: r("RowsUpdatedBy") },
            { json: "tableId", js: "tableId", typ: 0 },
            { json: "totalTimesRated", js: "totalTimesRated", typ: 0 },
            { json: "viewCount", js: "viewCount", typ: 0 },
            { json: "viewLastModified", js: "viewLastModified", typ: 0 },
            { json: "viewType", js: "viewType", typ: r("ViewType") },
            { json: "grants", js: "grants", typ: a(r("Grant")) },
            { json: "metadata", js: "metadata", typ: r("Metadata") },
            { json: "owner", js: "owner", typ: r("Owner") },
            { json: "ratings", js: "ratings", typ: u(undefined, r("Ratings")) },
            { json: "rights", js: "rights", typ: a(r("Right")) },
            { json: "tableAuthor", js: "tableAuthor", typ: r("TableAuthor") },
            { json: "flags", js: "flags", typ: u(undefined, a(r("ConsumerComplaintFlag"))) },
            { json: "moderationStatus", js: "moderationStatus", typ: u(undefined, true) },
            { json: "category", js: "category", typ: u(undefined, "") },
            { json: "tags", js: "tags", typ: u(undefined, a("")) },
            { json: "modifyingViewUid", js: "modifyingViewUid", typ: u(undefined, r("ModifyingViewUid")) },
        ], false),
        "Grant": o([
            { json: "inherited", js: "inherited", typ: true },
            { json: "type", js: "type", typ: r("GrantType") },
            { json: "flags", js: "flags", typ: a(r("GrantFlag")) },
        ], false),
        "Metadata": o([
            { json: "jsonQuery", js: "jsonQuery", typ: u(undefined, r("JSONQuery")) },
            { json: "rdfSubject", js: "rdfSubject", typ: u(undefined, "") },
            { json: "rdfClass", js: "rdfClass", typ: u(undefined, "") },
            { json: "rowIdentifier", js: "rowIdentifier", typ: u(undefined, "") },
            { json: "availableDisplayTypes", js: "availableDisplayTypes", typ: a(r("AvailableDisplayType")) },
            { json: "rowLabel", js: "rowLabel", typ: u(undefined, "") },
            { json: "renderTypeConfig", js: "renderTypeConfig", typ: r("RenderTypeConfig") },
            { json: "richRendererConfigs", js: "richRendererConfigs", typ: u(undefined, r("RichRendererConfigs")) },
            { json: "custom_fields", js: "custom_fields", typ: u(undefined, r("CustomFields")) },
        ], false),
        "CustomFields": o([
            { json: "TEST", js: "TEST", typ: r("Test") },
        ], false),
        "Test": o([
            { json: "CFPB1", js: "CFPB1", typ: "" },
        ], false),
        "JSONQuery": o([
            { json: "order", js: "order", typ: a(r("Order")) },
        ], false),
        "Order": o([
            { json: "ascending", js: "ascending", typ: true },
            { json: "columnFieldName", js: "columnFieldName", typ: "" },
        ], false),
        "RenderTypeConfig": o([
            { json: "visible", js: "visible", typ: r("Visible") },
        ], false),
        "Visible": o([
            { json: "table", js: "table", typ: u(undefined, true) },
            { json: "fatrow", js: "fatrow", typ: u(undefined, true) },
        ], false),
        "RichRendererConfigs": o([
            { json: "fatRow", js: "fatRow", typ: r("FatRow") },
        ], false),
        "FatRow": o([
            { json: "columns", js: "columns", typ: a(r("Column")) },
        ], false),
        "Column": o([
            { json: "styles", js: "styles", typ: r("Styles") },
            { json: "rows", js: "rows", typ: a(r("Row")) },
        ], false),
        "Row": o([
            { json: "fields", js: "fields", typ: a(r("Field")) },
        ], false),
        "Field": o([
            { json: "tableColumnId", js: "tableColumnId", typ: 0 },
            { json: "type", js: "type", typ: r("FieldType") },
        ], false),
        "Styles": o([
            { json: "width", js: "width", typ: r("Width") },
        ], false),
        "Owner": o([
            { json: "id", js: "id", typ: "" },
            { json: "displayName", js: "displayName", typ: "" },
            { json: "screenName", js: "screenName", typ: "" },
            { json: "type", js: "type", typ: r("OwnerType") },
            { json: "profileImageUrlLarge", js: "profileImageUrlLarge", typ: u(undefined, "") },
            { json: "profileImageUrlMedium", js: "profileImageUrlMedium", typ: u(undefined, "") },
            { json: "profileImageUrlSmall", js: "profileImageUrlSmall", typ: u(undefined, "") },
        ], false),
        "Ratings": o([
            { json: "rating", js: "rating", typ: 0 },
        ], false),
        "TableAuthor": o([
            { json: "id", js: "id", typ: r("ID") },
            { json: "displayName", js: "displayName", typ: r("Name") },
            { json: "screenName", js: "screenName", typ: r("Name") },
            { json: "type", js: "type", typ: r("OwnerType") },
        ], false),
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
