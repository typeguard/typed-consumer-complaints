# To use this code, make sure you
#
#     import json
#
# and then, to convert JSON from a string, do
#
#     result = consumer_complaints_from_dict(json.loads(json_string))

from enum import Enum
from typing import List, Any, Optional, TypeVar, Callable, Type, cast


T = TypeVar("T")
EnumT = TypeVar("EnumT", bound=Enum)


def from_bool(x: Any) -> bool:
    assert isinstance(x, bool)
    return x


def from_list(f: Callable[[Any], T], x: Any) -> List[T]:
    assert isinstance(x, list)
    return [f(y) for y in x]


def to_enum(c: Type[EnumT], x: Any) -> EnumT:
    assert isinstance(x, c)
    return x.value


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


def from_none(x: Any) -> Any:
    assert x is None
    return x


def from_union(fs, x):
    for f in fs:
        try:
            return f(x)
        except:
            pass
    assert False


def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
    return x


def is_type(t: Type[T], x: Any) -> T:
    assert isinstance(x, t)
    return x


class DisplayType(Enum):
    FATROW = "fatrow"
    TABLE = "table"


class ConsumerComplaintFlag(Enum):
    DEFAULT = "default"
    RESTORABLE = "restorable"
    RESTORE_POSSIBLE_FOR_TYPE = "restorePossibleForType"


class GrantFlag(Enum):
    PUBLIC = "public"


class GrantType(Enum):
    VIEWER = "viewer"


class Grant:
    inherited: bool
    type: GrantType
    flags: List[GrantFlag]

    def __init__(self, inherited: bool, type: GrantType, flags: List[GrantFlag]) -> None:
        self.inherited = inherited
        self.type = type
        self.flags = flags

    @staticmethod
    def from_dict(obj: Any) -> 'Grant':
        assert isinstance(obj, dict)
        inherited = from_bool(obj.get("inherited"))
        type = GrantType(obj.get("type"))
        flags = from_list(GrantFlag, obj.get("flags"))
        return Grant(inherited, type, flags)

    def to_dict(self) -> dict:
        result: dict = {}
        result["inherited"] = from_bool(self.inherited)
        result["type"] = to_enum(GrantType, self.type)
        result["flags"] = from_list(lambda x: to_enum(GrantFlag, x), self.flags)
        return result


class AvailableDisplayType(Enum):
    FATROW = "fatrow"
    PAGE = "page"
    TABLE = "table"


class Test:
    cfpb1: str

    def __init__(self, cfpb1: str) -> None:
        self.cfpb1 = cfpb1

    @staticmethod
    def from_dict(obj: Any) -> 'Test':
        assert isinstance(obj, dict)
        cfpb1 = from_str(obj.get("CFPB1"))
        return Test(cfpb1)

    def to_dict(self) -> dict:
        result: dict = {}
        result["CFPB1"] = from_str(self.cfpb1)
        return result


class CustomFields:
    test: Test

    def __init__(self, test: Test) -> None:
        self.test = test

    @staticmethod
    def from_dict(obj: Any) -> 'CustomFields':
        assert isinstance(obj, dict)
        test = Test.from_dict(obj.get("TEST"))
        return CustomFields(test)

    def to_dict(self) -> dict:
        result: dict = {}
        result["TEST"] = to_class(Test, self.test)
        return result


class Order:
    ascending: bool
    column_field_name: str

    def __init__(self, ascending: bool, column_field_name: str) -> None:
        self.ascending = ascending
        self.column_field_name = column_field_name

    @staticmethod
    def from_dict(obj: Any) -> 'Order':
        assert isinstance(obj, dict)
        ascending = from_bool(obj.get("ascending"))
        column_field_name = from_str(obj.get("columnFieldName"))
        return Order(ascending, column_field_name)

    def to_dict(self) -> dict:
        result: dict = {}
        result["ascending"] = from_bool(self.ascending)
        result["columnFieldName"] = from_str(self.column_field_name)
        return result


class JSONQuery:
    order: List[Order]

    def __init__(self, order: List[Order]) -> None:
        self.order = order

    @staticmethod
    def from_dict(obj: Any) -> 'JSONQuery':
        assert isinstance(obj, dict)
        order = from_list(Order.from_dict, obj.get("order"))
        return JSONQuery(order)

    def to_dict(self) -> dict:
        result: dict = {}
        result["order"] = from_list(lambda x: to_class(Order, x), self.order)
        return result


class Visible:
    table: Optional[bool]
    fatrow: Optional[bool]

    def __init__(self, table: Optional[bool], fatrow: Optional[bool]) -> None:
        self.table = table
        self.fatrow = fatrow

    @staticmethod
    def from_dict(obj: Any) -> 'Visible':
        assert isinstance(obj, dict)
        table = from_union([from_bool, from_none], obj.get("table"))
        fatrow = from_union([from_bool, from_none], obj.get("fatrow"))
        return Visible(table, fatrow)

    def to_dict(self) -> dict:
        result: dict = {}
        result["table"] = from_union([from_bool, from_none], self.table)
        result["fatrow"] = from_union([from_bool, from_none], self.fatrow)
        return result


class RenderTypeConfig:
    visible: Visible

    def __init__(self, visible: Visible) -> None:
        self.visible = visible

    @staticmethod
    def from_dict(obj: Any) -> 'RenderTypeConfig':
        assert isinstance(obj, dict)
        visible = Visible.from_dict(obj.get("visible"))
        return RenderTypeConfig(visible)

    def to_dict(self) -> dict:
        result: dict = {}
        result["visible"] = to_class(Visible, self.visible)
        return result


class FieldType(Enum):
    COLUMN_DATA = "columnData"
    COLUMN_LABEL = "columnLabel"


class Field:
    table_column_id: int
    type: FieldType

    def __init__(self, table_column_id: int, type: FieldType) -> None:
        self.table_column_id = table_column_id
        self.type = type

    @staticmethod
    def from_dict(obj: Any) -> 'Field':
        assert isinstance(obj, dict)
        table_column_id = from_int(obj.get("tableColumnId"))
        type = FieldType(obj.get("type"))
        return Field(table_column_id, type)

    def to_dict(self) -> dict:
        result: dict = {}
        result["tableColumnId"] = from_int(self.table_column_id)
        result["type"] = to_enum(FieldType, self.type)
        return result


class Row:
    fields: List[Field]

    def __init__(self, fields: List[Field]) -> None:
        self.fields = fields

    @staticmethod
    def from_dict(obj: Any) -> 'Row':
        assert isinstance(obj, dict)
        fields = from_list(Field.from_dict, obj.get("fields"))
        return Row(fields)

    def to_dict(self) -> dict:
        result: dict = {}
        result["fields"] = from_list(lambda x: to_class(Field, x), self.fields)
        return result


class Width(Enum):
    THE_27 = "27%"
    THE_30 = "30%"
    THE_31 = "31%"
    THE_33 = "33%"
    THE_40 = "40%"


class Styles:
    width: Width

    def __init__(self, width: Width) -> None:
        self.width = width

    @staticmethod
    def from_dict(obj: Any) -> 'Styles':
        assert isinstance(obj, dict)
        width = Width(obj.get("width"))
        return Styles(width)

    def to_dict(self) -> dict:
        result: dict = {}
        result["width"] = to_enum(Width, self.width)
        return result


class Column:
    styles: Styles
    rows: List[Row]

    def __init__(self, styles: Styles, rows: List[Row]) -> None:
        self.styles = styles
        self.rows = rows

    @staticmethod
    def from_dict(obj: Any) -> 'Column':
        assert isinstance(obj, dict)
        styles = Styles.from_dict(obj.get("styles"))
        rows = from_list(Row.from_dict, obj.get("rows"))
        return Column(styles, rows)

    def to_dict(self) -> dict:
        result: dict = {}
        result["styles"] = to_class(Styles, self.styles)
        result["rows"] = from_list(lambda x: to_class(Row, x), self.rows)
        return result


class FatRow:
    columns: List[Column]

    def __init__(self, columns: List[Column]) -> None:
        self.columns = columns

    @staticmethod
    def from_dict(obj: Any) -> 'FatRow':
        assert isinstance(obj, dict)
        columns = from_list(Column.from_dict, obj.get("columns"))
        return FatRow(columns)

    def to_dict(self) -> dict:
        result: dict = {}
        result["columns"] = from_list(lambda x: to_class(Column, x), self.columns)
        return result


class RichRendererConfigs:
    fat_row: FatRow

    def __init__(self, fat_row: FatRow) -> None:
        self.fat_row = fat_row

    @staticmethod
    def from_dict(obj: Any) -> 'RichRendererConfigs':
        assert isinstance(obj, dict)
        fat_row = FatRow.from_dict(obj.get("fatRow"))
        return RichRendererConfigs(fat_row)

    def to_dict(self) -> dict:
        result: dict = {}
        result["fatRow"] = to_class(FatRow, self.fat_row)
        return result


class Metadata:
    json_query: Optional[JSONQuery]
    rdf_subject: Optional[int]
    rdf_class: Optional[str]
    row_identifier: Optional[int]
    available_display_types: List[AvailableDisplayType]
    row_label: Optional[str]
    render_type_config: RenderTypeConfig
    rich_renderer_configs: Optional[RichRendererConfigs]
    custom_fields: Optional[CustomFields]

    def __init__(self, json_query: Optional[JSONQuery], rdf_subject: Optional[int], rdf_class: Optional[str], row_identifier: Optional[int], available_display_types: List[AvailableDisplayType], row_label: Optional[str], render_type_config: RenderTypeConfig, rich_renderer_configs: Optional[RichRendererConfigs], custom_fields: Optional[CustomFields]) -> None:
        self.json_query = json_query
        self.rdf_subject = rdf_subject
        self.rdf_class = rdf_class
        self.row_identifier = row_identifier
        self.available_display_types = available_display_types
        self.row_label = row_label
        self.render_type_config = render_type_config
        self.rich_renderer_configs = rich_renderer_configs
        self.custom_fields = custom_fields

    @staticmethod
    def from_dict(obj: Any) -> 'Metadata':
        assert isinstance(obj, dict)
        json_query = from_union([JSONQuery.from_dict, from_none], obj.get("jsonQuery"))
        rdf_subject = from_union([from_none, lambda x: int(from_str(x))], obj.get("rdfSubject"))
        rdf_class = from_union([from_str, from_none], obj.get("rdfClass"))
        row_identifier = from_union([from_none, lambda x: int(from_str(x))], obj.get("rowIdentifier"))
        available_display_types = from_list(AvailableDisplayType, obj.get("availableDisplayTypes"))
        row_label = from_union([from_str, from_none], obj.get("rowLabel"))
        render_type_config = RenderTypeConfig.from_dict(obj.get("renderTypeConfig"))
        rich_renderer_configs = from_union([RichRendererConfigs.from_dict, from_none], obj.get("richRendererConfigs"))
        custom_fields = from_union([CustomFields.from_dict, from_none], obj.get("custom_fields"))
        return Metadata(json_query, rdf_subject, rdf_class, row_identifier, available_display_types, row_label, render_type_config, rich_renderer_configs, custom_fields)

    def to_dict(self) -> dict:
        result: dict = {}
        result["jsonQuery"] = from_union([lambda x: to_class(JSONQuery, x), from_none], self.json_query)
        result["rdfSubject"] = from_union([lambda x: from_none((lambda x: is_type(type(None), x))(x)), lambda x: from_str((lambda x: str((lambda x: is_type(int, x))(x)))(x))], self.rdf_subject)
        result["rdfClass"] = from_union([from_str, from_none], self.rdf_class)
        result["rowIdentifier"] = from_union([lambda x: from_none((lambda x: is_type(type(None), x))(x)), lambda x: from_str((lambda x: str((lambda x: is_type(int, x))(x)))(x))], self.row_identifier)
        result["availableDisplayTypes"] = from_list(lambda x: to_enum(AvailableDisplayType, x), self.available_display_types)
        result["rowLabel"] = from_union([from_str, from_none], self.row_label)
        result["renderTypeConfig"] = to_class(RenderTypeConfig, self.render_type_config)
        result["richRendererConfigs"] = from_union([lambda x: to_class(RichRendererConfigs, x), from_none], self.rich_renderer_configs)
        result["custom_fields"] = from_union([lambda x: to_class(CustomFields, x), from_none], self.custom_fields)
        return result


class ModifyingViewUid(Enum):
    S6_EW_H6_MP = "s6ew-h6mp"


class OwnerType(Enum):
    INTERACTIVE = "interactive"


class Owner:
    id: str
    display_name: str
    screen_name: str
    type: OwnerType
    profile_image_url_large: Optional[str]
    profile_image_url_medium: Optional[str]
    profile_image_url_small: Optional[str]

    def __init__(self, id: str, display_name: str, screen_name: str, type: OwnerType, profile_image_url_large: Optional[str], profile_image_url_medium: Optional[str], profile_image_url_small: Optional[str]) -> None:
        self.id = id
        self.display_name = display_name
        self.screen_name = screen_name
        self.type = type
        self.profile_image_url_large = profile_image_url_large
        self.profile_image_url_medium = profile_image_url_medium
        self.profile_image_url_small = profile_image_url_small

    @staticmethod
    def from_dict(obj: Any) -> 'Owner':
        assert isinstance(obj, dict)
        id = from_str(obj.get("id"))
        display_name = from_str(obj.get("displayName"))
        screen_name = from_str(obj.get("screenName"))
        type = OwnerType(obj.get("type"))
        profile_image_url_large = from_union([from_str, from_none], obj.get("profileImageUrlLarge"))
        profile_image_url_medium = from_union([from_str, from_none], obj.get("profileImageUrlMedium"))
        profile_image_url_small = from_union([from_str, from_none], obj.get("profileImageUrlSmall"))
        return Owner(id, display_name, screen_name, type, profile_image_url_large, profile_image_url_medium, profile_image_url_small)

    def to_dict(self) -> dict:
        result: dict = {}
        result["id"] = from_str(self.id)
        result["displayName"] = from_str(self.display_name)
        result["screenName"] = from_str(self.screen_name)
        result["type"] = to_enum(OwnerType, self.type)
        result["profileImageUrlLarge"] = from_union([from_str, from_none], self.profile_image_url_large)
        result["profileImageUrlMedium"] = from_union([from_str, from_none], self.profile_image_url_medium)
        result["profileImageUrlSmall"] = from_union([from_str, from_none], self.profile_image_url_small)
        return result


class Provenance(Enum):
    OFFICIAL = "official"


class PublicationStage(Enum):
    PUBLISHED = "published"


class Ratings:
    rating: int

    def __init__(self, rating: int) -> None:
        self.rating = rating

    @staticmethod
    def from_dict(obj: Any) -> 'Ratings':
        assert isinstance(obj, dict)
        rating = from_int(obj.get("rating"))
        return Ratings(rating)

    def to_dict(self) -> dict:
        result: dict = {}
        result["rating"] = from_int(self.rating)
        return result


class Right(Enum):
    READ = "read"


class RowsUpdatedBy(Enum):
    PJXG_VE4_M = "pjxg-ve4m"
    THE_54_A3_QYUN = "54a3-qyun"
    THE_9_E3_M_2843 = "9e3m-2843"
    VVCA_FR6_G = "vvca-fr6g"


class Name(Enum):
    DAN_MUNZ = "Dan Munz"
    DOUG_TAYLOR = "Doug Taylor"
    MING = "ming"
    SHANNON_FILES = "Shannon Files"


class ID(Enum):
    PJXG_VE4_M = "pjxg-ve4m"
    THE_54_A3_QYUN = "54a3-qyun"
    THE_9_E3_M_2843 = "9e3m-2843"
    THE_9_EKI_H2_HN = "9eki-h2hn"


class TableAuthor:
    id: ID
    display_name: Name
    screen_name: Name
    type: OwnerType

    def __init__(self, id: ID, display_name: Name, screen_name: Name, type: OwnerType) -> None:
        self.id = id
        self.display_name = display_name
        self.screen_name = screen_name
        self.type = type

    @staticmethod
    def from_dict(obj: Any) -> 'TableAuthor':
        assert isinstance(obj, dict)
        id = ID(obj.get("id"))
        display_name = Name(obj.get("displayName"))
        screen_name = Name(obj.get("screenName"))
        type = OwnerType(obj.get("type"))
        return TableAuthor(id, display_name, screen_name, type)

    def to_dict(self) -> dict:
        result: dict = {}
        result["id"] = to_enum(ID, self.id)
        result["displayName"] = to_enum(Name, self.display_name)
        result["screenName"] = to_enum(Name, self.screen_name)
        result["type"] = to_enum(OwnerType, self.type)
        return result


class ViewType(Enum):
    TABULAR = "tabular"


class ConsumerComplaint:
    id: str
    name: str
    average_rating: int
    created_at: int
    description: str
    display_type: DisplayType
    download_count: int
    hide_from_catalog: bool
    hide_from_data_json: bool
    index_updated_at: Optional[int]
    new_backend: bool
    number_of_comments: int
    oid: int
    provenance: Provenance
    publication_append_enabled: bool
    publication_date: int
    publication_group: int
    publication_stage: PublicationStage
    row_class: Optional[str]
    rows_updated_at: int
    rows_updated_by: RowsUpdatedBy
    table_id: int
    total_times_rated: int
    view_count: int
    view_last_modified: int
    view_type: ViewType
    grants: List[Grant]
    metadata: Metadata
    owner: Owner
    ratings: Optional[Ratings]
    rights: List[Right]
    table_author: TableAuthor
    flags: Optional[List[ConsumerComplaintFlag]]
    moderation_status: Optional[bool]
    category: Optional[str]
    tags: Optional[List[str]]
    modifying_view_uid: Optional[ModifyingViewUid]

    def __init__(self, id: str, name: str, average_rating: int, created_at: int, description: str, display_type: DisplayType, download_count: int, hide_from_catalog: bool, hide_from_data_json: bool, index_updated_at: Optional[int], new_backend: bool, number_of_comments: int, oid: int, provenance: Provenance, publication_append_enabled: bool, publication_date: int, publication_group: int, publication_stage: PublicationStage, row_class: Optional[str], rows_updated_at: int, rows_updated_by: RowsUpdatedBy, table_id: int, total_times_rated: int, view_count: int, view_last_modified: int, view_type: ViewType, grants: List[Grant], metadata: Metadata, owner: Owner, ratings: Optional[Ratings], rights: List[Right], table_author: TableAuthor, flags: Optional[List[ConsumerComplaintFlag]], moderation_status: Optional[bool], category: Optional[str], tags: Optional[List[str]], modifying_view_uid: Optional[ModifyingViewUid]) -> None:
        self.id = id
        self.name = name
        self.average_rating = average_rating
        self.created_at = created_at
        self.description = description
        self.display_type = display_type
        self.download_count = download_count
        self.hide_from_catalog = hide_from_catalog
        self.hide_from_data_json = hide_from_data_json
        self.index_updated_at = index_updated_at
        self.new_backend = new_backend
        self.number_of_comments = number_of_comments
        self.oid = oid
        self.provenance = provenance
        self.publication_append_enabled = publication_append_enabled
        self.publication_date = publication_date
        self.publication_group = publication_group
        self.publication_stage = publication_stage
        self.row_class = row_class
        self.rows_updated_at = rows_updated_at
        self.rows_updated_by = rows_updated_by
        self.table_id = table_id
        self.total_times_rated = total_times_rated
        self.view_count = view_count
        self.view_last_modified = view_last_modified
        self.view_type = view_type
        self.grants = grants
        self.metadata = metadata
        self.owner = owner
        self.ratings = ratings
        self.rights = rights
        self.table_author = table_author
        self.flags = flags
        self.moderation_status = moderation_status
        self.category = category
        self.tags = tags
        self.modifying_view_uid = modifying_view_uid

    @staticmethod
    def from_dict(obj: Any) -> 'ConsumerComplaint':
        assert isinstance(obj, dict)
        id = from_str(obj.get("id"))
        name = from_str(obj.get("name"))
        average_rating = from_int(obj.get("averageRating"))
        created_at = from_int(obj.get("createdAt"))
        description = from_str(obj.get("description"))
        display_type = DisplayType(obj.get("displayType"))
        download_count = from_int(obj.get("downloadCount"))
        hide_from_catalog = from_bool(obj.get("hideFromCatalog"))
        hide_from_data_json = from_bool(obj.get("hideFromDataJson"))
        index_updated_at = from_union([from_int, from_none], obj.get("indexUpdatedAt"))
        new_backend = from_bool(obj.get("newBackend"))
        number_of_comments = from_int(obj.get("numberOfComments"))
        oid = from_int(obj.get("oid"))
        provenance = Provenance(obj.get("provenance"))
        publication_append_enabled = from_bool(obj.get("publicationAppendEnabled"))
        publication_date = from_int(obj.get("publicationDate"))
        publication_group = from_int(obj.get("publicationGroup"))
        publication_stage = PublicationStage(obj.get("publicationStage"))
        row_class = from_union([from_str, from_none], obj.get("rowClass"))
        rows_updated_at = from_int(obj.get("rowsUpdatedAt"))
        rows_updated_by = RowsUpdatedBy(obj.get("rowsUpdatedBy"))
        table_id = from_int(obj.get("tableId"))
        total_times_rated = from_int(obj.get("totalTimesRated"))
        view_count = from_int(obj.get("viewCount"))
        view_last_modified = from_int(obj.get("viewLastModified"))
        view_type = ViewType(obj.get("viewType"))
        grants = from_list(Grant.from_dict, obj.get("grants"))
        metadata = Metadata.from_dict(obj.get("metadata"))
        owner = Owner.from_dict(obj.get("owner"))
        ratings = from_union([Ratings.from_dict, from_none], obj.get("ratings"))
        rights = from_list(Right, obj.get("rights"))
        table_author = TableAuthor.from_dict(obj.get("tableAuthor"))
        flags = from_union([lambda x: from_list(ConsumerComplaintFlag, x), from_none], obj.get("flags"))
        moderation_status = from_union([from_bool, from_none], obj.get("moderationStatus"))
        category = from_union([from_str, from_none], obj.get("category"))
        tags = from_union([lambda x: from_list(from_str, x), from_none], obj.get("tags"))
        modifying_view_uid = from_union([ModifyingViewUid, from_none], obj.get("modifyingViewUid"))
        return ConsumerComplaint(id, name, average_rating, created_at, description, display_type, download_count, hide_from_catalog, hide_from_data_json, index_updated_at, new_backend, number_of_comments, oid, provenance, publication_append_enabled, publication_date, publication_group, publication_stage, row_class, rows_updated_at, rows_updated_by, table_id, total_times_rated, view_count, view_last_modified, view_type, grants, metadata, owner, ratings, rights, table_author, flags, moderation_status, category, tags, modifying_view_uid)

    def to_dict(self) -> dict:
        result: dict = {}
        result["id"] = from_str(self.id)
        result["name"] = from_str(self.name)
        result["averageRating"] = from_int(self.average_rating)
        result["createdAt"] = from_int(self.created_at)
        result["description"] = from_str(self.description)
        result["displayType"] = to_enum(DisplayType, self.display_type)
        result["downloadCount"] = from_int(self.download_count)
        result["hideFromCatalog"] = from_bool(self.hide_from_catalog)
        result["hideFromDataJson"] = from_bool(self.hide_from_data_json)
        result["indexUpdatedAt"] = from_union([from_int, from_none], self.index_updated_at)
        result["newBackend"] = from_bool(self.new_backend)
        result["numberOfComments"] = from_int(self.number_of_comments)
        result["oid"] = from_int(self.oid)
        result["provenance"] = to_enum(Provenance, self.provenance)
        result["publicationAppendEnabled"] = from_bool(self.publication_append_enabled)
        result["publicationDate"] = from_int(self.publication_date)
        result["publicationGroup"] = from_int(self.publication_group)
        result["publicationStage"] = to_enum(PublicationStage, self.publication_stage)
        result["rowClass"] = from_union([from_str, from_none], self.row_class)
        result["rowsUpdatedAt"] = from_int(self.rows_updated_at)
        result["rowsUpdatedBy"] = to_enum(RowsUpdatedBy, self.rows_updated_by)
        result["tableId"] = from_int(self.table_id)
        result["totalTimesRated"] = from_int(self.total_times_rated)
        result["viewCount"] = from_int(self.view_count)
        result["viewLastModified"] = from_int(self.view_last_modified)
        result["viewType"] = to_enum(ViewType, self.view_type)
        result["grants"] = from_list(lambda x: to_class(Grant, x), self.grants)
        result["metadata"] = to_class(Metadata, self.metadata)
        result["owner"] = to_class(Owner, self.owner)
        result["ratings"] = from_union([lambda x: to_class(Ratings, x), from_none], self.ratings)
        result["rights"] = from_list(lambda x: to_enum(Right, x), self.rights)
        result["tableAuthor"] = to_class(TableAuthor, self.table_author)
        result["flags"] = from_union([lambda x: from_list(lambda x: to_enum(ConsumerComplaintFlag, x), x), from_none], self.flags)
        result["moderationStatus"] = from_union([from_bool, from_none], self.moderation_status)
        result["category"] = from_union([from_str, from_none], self.category)
        result["tags"] = from_union([lambda x: from_list(from_str, x), from_none], self.tags)
        result["modifyingViewUid"] = from_union([lambda x: to_enum(ModifyingViewUid, x), from_none], self.modifying_view_uid)
        return result


def consumer_complaints_from_dict(s: Any) -> List[ConsumerComplaint]:
    return from_list(ConsumerComplaint.from_dict, s)


def consumer_complaints_to_dict(x: List[ConsumerComplaint]) -> Any:
    return from_list(lambda x: to_class(ConsumerComplaint, x), x)
