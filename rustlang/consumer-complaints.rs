// Example code that deserializes and serializes the model.
// extern crate serde;
// #[macro_use]
// extern crate serde_derive;
// extern crate serde_json;
//
// use generated_module::[object Object];
//
// fn main() {
//     let json = r#"{"answer": 42}"#;
//     let model: [object Object] = serde_json::from_str(&json).unwrap();
// }

extern crate serde_json;

pub type ConsumerComplaints = Vec<ConsumerComplaint>;

#[derive(Serialize, Deserialize)]
pub struct ConsumerComplaint {
    #[serde(rename = "id")]
    id: String,

    #[serde(rename = "name")]
    name: String,

    #[serde(rename = "averageRating")]
    average_rating: i64,

    #[serde(rename = "createdAt")]
    created_at: i64,

    #[serde(rename = "description")]
    description: String,

    #[serde(rename = "displayType")]
    display_type: DisplayType,

    #[serde(rename = "downloadCount")]
    download_count: i64,

    #[serde(rename = "hideFromCatalog")]
    hide_from_catalog: bool,

    #[serde(rename = "hideFromDataJson")]
    hide_from_data_json: bool,

    #[serde(rename = "indexUpdatedAt")]
    index_updated_at: Option<i64>,

    #[serde(rename = "newBackend")]
    new_backend: bool,

    #[serde(rename = "numberOfComments")]
    number_of_comments: i64,

    #[serde(rename = "oid")]
    oid: i64,

    #[serde(rename = "provenance")]
    provenance: Provenance,

    #[serde(rename = "publicationAppendEnabled")]
    publication_append_enabled: bool,

    #[serde(rename = "publicationDate")]
    publication_date: i64,

    #[serde(rename = "publicationGroup")]
    publication_group: i64,

    #[serde(rename = "publicationStage")]
    publication_stage: PublicationStage,

    #[serde(rename = "rowClass")]
    row_class: Option<String>,

    #[serde(rename = "rowsUpdatedAt")]
    rows_updated_at: i64,

    #[serde(rename = "rowsUpdatedBy")]
    rows_updated_by: RowsUpdatedBy,

    #[serde(rename = "tableId")]
    table_id: i64,

    #[serde(rename = "totalTimesRated")]
    total_times_rated: i64,

    #[serde(rename = "viewCount")]
    view_count: i64,

    #[serde(rename = "viewLastModified")]
    view_last_modified: i64,

    #[serde(rename = "viewType")]
    view_type: ViewType,

    #[serde(rename = "grants")]
    grants: Vec<Grant>,

    #[serde(rename = "metadata")]
    metadata: Metadata,

    #[serde(rename = "owner")]
    owner: Owner,

    #[serde(rename = "ratings")]
    ratings: Option<Ratings>,

    #[serde(rename = "rights")]
    rights: Vec<Right>,

    #[serde(rename = "tableAuthor")]
    table_author: TableAuthor,

    #[serde(rename = "flags")]
    flags: Option<Vec<ConsumerComplaintFlag>>,

    #[serde(rename = "moderationStatus")]
    moderation_status: Option<bool>,

    #[serde(rename = "category")]
    category: Option<String>,

    #[serde(rename = "tags")]
    tags: Option<Vec<String>>,

    #[serde(rename = "modifyingViewUid")]
    modifying_view_uid: Option<ModifyingViewUid>,
}

#[derive(Serialize, Deserialize)]
pub struct Grant {
    #[serde(rename = "inherited")]
    inherited: bool,

    #[serde(rename = "type")]
    grant_type: GrantType,

    #[serde(rename = "flags")]
    flags: Vec<GrantFlag>,
}

#[derive(Serialize, Deserialize)]
pub struct Metadata {
    #[serde(rename = "jsonQuery")]
    json_query: Option<JsonQuery>,

    #[serde(rename = "rdfSubject")]
    rdf_subject: Option<String>,

    #[serde(rename = "rdfClass")]
    rdf_class: Option<String>,

    #[serde(rename = "rowIdentifier")]
    row_identifier: Option<String>,

    #[serde(rename = "availableDisplayTypes")]
    available_display_types: Vec<AvailableDisplayType>,

    #[serde(rename = "rowLabel")]
    row_label: Option<String>,

    #[serde(rename = "renderTypeConfig")]
    render_type_config: RenderTypeConfig,

    #[serde(rename = "richRendererConfigs")]
    rich_renderer_configs: Option<RichRendererConfigs>,

    #[serde(rename = "custom_fields")]
    custom_fields: Option<CustomFields>,
}

#[derive(Serialize, Deserialize)]
pub struct CustomFields {
    #[serde(rename = "TEST")]
    test: Test,
}

#[derive(Serialize, Deserialize)]
pub struct Test {
    #[serde(rename = "CFPB1")]
    cfpb1: String,
}

#[derive(Serialize, Deserialize)]
pub struct JsonQuery {
    #[serde(rename = "order")]
    order: Vec<Order>,
}

#[derive(Serialize, Deserialize)]
pub struct Order {
    #[serde(rename = "ascending")]
    ascending: bool,

    #[serde(rename = "columnFieldName")]
    column_field_name: String,
}

#[derive(Serialize, Deserialize)]
pub struct RenderTypeConfig {
    #[serde(rename = "visible")]
    visible: Visible,
}

#[derive(Serialize, Deserialize)]
pub struct Visible {
    #[serde(rename = "table")]
    table: Option<bool>,

    #[serde(rename = "fatrow")]
    fatrow: Option<bool>,
}

#[derive(Serialize, Deserialize)]
pub struct RichRendererConfigs {
    #[serde(rename = "fatRow")]
    fat_row: FatRow,
}

#[derive(Serialize, Deserialize)]
pub struct FatRow {
    #[serde(rename = "columns")]
    columns: Vec<Column>,
}

#[derive(Serialize, Deserialize)]
pub struct Column {
    #[serde(rename = "styles")]
    styles: Styles,

    #[serde(rename = "rows")]
    rows: Vec<Row>,
}

#[derive(Serialize, Deserialize)]
pub struct Row {
    #[serde(rename = "fields")]
    fields: Vec<Field>,
}

#[derive(Serialize, Deserialize)]
pub struct Field {
    #[serde(rename = "tableColumnId")]
    table_column_id: i64,

    #[serde(rename = "type")]
    field_type: FieldType,
}

#[derive(Serialize, Deserialize)]
pub struct Styles {
    #[serde(rename = "width")]
    width: Width,
}

#[derive(Serialize, Deserialize)]
pub struct Owner {
    #[serde(rename = "id")]
    id: String,

    #[serde(rename = "displayName")]
    display_name: String,

    #[serde(rename = "screenName")]
    screen_name: String,

    #[serde(rename = "type")]
    owner_type: OwnerType,

    #[serde(rename = "profileImageUrlLarge")]
    profile_image_url_large: Option<String>,

    #[serde(rename = "profileImageUrlMedium")]
    profile_image_url_medium: Option<String>,

    #[serde(rename = "profileImageUrlSmall")]
    profile_image_url_small: Option<String>,
}

#[derive(Serialize, Deserialize)]
pub struct Ratings {
    #[serde(rename = "rating")]
    rating: i64,
}

#[derive(Serialize, Deserialize)]
pub struct TableAuthor {
    #[serde(rename = "id")]
    id: Id,

    #[serde(rename = "displayName")]
    display_name: Name,

    #[serde(rename = "screenName")]
    screen_name: Name,

    #[serde(rename = "type")]
    table_author_type: OwnerType,
}

#[derive(Serialize, Deserialize)]
pub enum DisplayType {
    #[serde(rename = "fatrow")]
    Fatrow,

    #[serde(rename = "table")]
    Table,
}

#[derive(Serialize, Deserialize)]
pub enum ConsumerComplaintFlag {
    #[serde(rename = "default")]
    Default,

    #[serde(rename = "restorable")]
    Restorable,

    #[serde(rename = "restorePossibleForType")]
    RestorePossibleForType,
}

#[derive(Serialize, Deserialize)]
pub enum GrantFlag {
    #[serde(rename = "public")]
    Public,
}

#[derive(Serialize, Deserialize)]
pub enum GrantType {
    #[serde(rename = "viewer")]
    Viewer,
}

#[derive(Serialize, Deserialize)]
pub enum AvailableDisplayType {
    #[serde(rename = "fatrow")]
    Fatrow,

    #[serde(rename = "page")]
    Page,

    #[serde(rename = "table")]
    Table,
}

#[derive(Serialize, Deserialize)]
pub enum FieldType {
    #[serde(rename = "columnData")]
    ColumnData,

    #[serde(rename = "columnLabel")]
    ColumnLabel,
}

#[derive(Serialize, Deserialize)]
pub enum Width {
    #[serde(rename = "27%")]
    The27,

    #[serde(rename = "30%")]
    The30,

    #[serde(rename = "31%")]
    The31,

    #[serde(rename = "33%")]
    The33,

    #[serde(rename = "40%")]
    The40,
}

#[derive(Serialize, Deserialize)]
pub enum ModifyingViewUid {
    #[serde(rename = "s6ew-h6mp")]
    S6EwH6Mp,
}

#[derive(Serialize, Deserialize)]
pub enum OwnerType {
    #[serde(rename = "interactive")]
    Interactive,
}

#[derive(Serialize, Deserialize)]
pub enum Provenance {
    #[serde(rename = "official")]
    Official,
}

#[derive(Serialize, Deserialize)]
pub enum PublicationStage {
    #[serde(rename = "published")]
    Published,
}

#[derive(Serialize, Deserialize)]
pub enum Right {
    #[serde(rename = "read")]
    Read,
}

#[derive(Serialize, Deserialize)]
pub enum RowsUpdatedBy {
    #[serde(rename = "pjxg-ve4m")]
    PjxgVe4M,

    #[serde(rename = "54a3-qyun")]
    The54A3Qyun,

    #[serde(rename = "9e3m-2843")]
    The9E3M2843,

    #[serde(rename = "vvca-fr6g")]
    VvcaFr6G,
}

#[derive(Serialize, Deserialize)]
pub enum Name {
    #[serde(rename = "Dan Munz")]
    DanMunz,

    #[serde(rename = "Doug Taylor")]
    DougTaylor,

    #[serde(rename = "ming")]
    Ming,

    #[serde(rename = "Shannon Files")]
    ShannonFiles,
}

#[derive(Serialize, Deserialize)]
pub enum Id {
    #[serde(rename = "pjxg-ve4m")]
    PjxgVe4M,

    #[serde(rename = "54a3-qyun")]
    The54A3Qyun,

    #[serde(rename = "9e3m-2843")]
    The9E3M2843,

    #[serde(rename = "9eki-h2hn")]
    The9EkiH2Hn,
}

#[derive(Serialize, Deserialize)]
pub enum ViewType {
    #[serde(rename = "tabular")]
    Tabular,
}
