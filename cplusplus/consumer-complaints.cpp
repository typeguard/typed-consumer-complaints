//  To parse this JSON data, first install
//
//      Boost     http://www.boost.org
//      json.hpp  https://github.com/nlohmann/json
//
//  Then include this file, and then do
//
//     ConsumerComplaints data = nlohmann::json::parse(jsonString);

#include "json.hpp"

namespace quicktype {
    using nlohmann::json;

    enum class DisplayType { FATROW, TABLE };

    enum class ConsumerComplaintFlag { DEFAULT, RESTORABLE, RESTORE_POSSIBLE_FOR_TYPE };

    enum class GrantFlag { PUBLIC };

    enum class GrantType { VIEWER };

    struct Grant {
        bool inherited;
        GrantType type;
        std::vector<GrantFlag> flags;
    };

    enum class AvailableDisplayType { FATROW, PAGE, TABLE };

    struct Test {
        std::string cfpb1;
    };

    struct CustomFields {
        struct Test test;
    };

    struct Group {
        std::string column_field_name;
    };

    struct Order {
        bool ascending;
        std::string column_field_name;
    };

    struct Select {
        std::string column_field_name;
        std::unique_ptr<std::string> aggregate;
    };

    struct JsonQuery {
        std::unique_ptr<std::vector<struct Order>> order;
        std::unique_ptr<std::vector<struct Select>> select;
        std::unique_ptr<std::vector<struct Group>> group;
    };

    enum class RdfSubject { THE_0 };

    struct Visible {
        std::unique_ptr<bool> table;
        std::unique_ptr<bool> fatrow;
    };

    struct RenderTypeConfig {
        struct Visible visible;
    };

    enum class FieldType { COLUMN_DATA, COLUMN_LABEL };

    struct Field {
        int64_t table_column_id;
        FieldType type;
    };

    struct Row {
        std::vector<struct Field> fields;
    };

    enum class Width { THE_27, THE_30, THE_31, THE_33, THE_40 };

    struct Styles {
        Width width;
    };

    struct Column {
        struct Styles styles;
        std::vector<struct Row> rows;
    };

    struct FatRow {
        std::vector<struct Column> columns;
    };

    struct RichRendererConfigs {
        struct FatRow fat_row;
    };

    struct Metadata {
        std::unique_ptr<struct JsonQuery> json_query;
        std::unique_ptr<RdfSubject> rdf_subject;
        std::unique_ptr<std::string> rdf_class;
        std::unique_ptr<std::string> row_identifier;
        std::vector<AvailableDisplayType> available_display_types;
        std::unique_ptr<std::string> row_label;
        struct RenderTypeConfig render_type_config;
        std::unique_ptr<struct RichRendererConfigs> rich_renderer_configs;
        std::unique_ptr<struct CustomFields> custom_fields;
    };

    enum class ModifyingViewUid { S6_EW_H6_MP };

    enum class OwnerFlag { ORGANIZATION_MEMBER };

    enum class OwnerType { INTERACTIVE };

    struct Owner {
        std::string id;
        std::string display_name;
        std::string screen_name;
        OwnerType type;
        std::unique_ptr<std::vector<OwnerFlag>> flags;
        std::unique_ptr<std::string> profile_image_url_large;
        std::unique_ptr<std::string> profile_image_url_medium;
        std::unique_ptr<std::string> profile_image_url_small;
    };

    enum class Provenance { OFFICIAL };

    enum class PublicationStage { PUBLISHED };

    struct Ratings {
        int64_t rating;
    };

    enum class Right { READ };

    enum class RowsUpdatedBy { PJXG_VE4_M, THE_54_A3_QYUN, THE_9_E3_M_2843, VVCA_FR6_G };

    enum class Name { DAN_MUNZ, DOUG_TAYLOR, MING, SHANNON_FILES };

    enum class Id { PJXG_VE4_M, THE_54_A3_QYUN, THE_9_E3_M_2843, THE_9_EKI_H2_HN };

    struct TableAuthor {
        Id id;
        Name display_name;
        Name screen_name;
        OwnerType type;
        std::unique_ptr<std::vector<OwnerFlag>> flags;
    };

    enum class ViewType { TABULAR };

    struct ConsumerComplaint {
        std::string id;
        std::string name;
        int64_t average_rating;
        int64_t created_at;
        std::string description;
        DisplayType display_type;
        int64_t download_count;
        bool hide_from_catalog;
        bool hide_from_data_json;
        std::unique_ptr<int64_t> index_updated_at;
        bool new_backend;
        int64_t number_of_comments;
        int64_t oid;
        Provenance provenance;
        bool publication_append_enabled;
        int64_t publication_date;
        int64_t publication_group;
        PublicationStage publication_stage;
        std::unique_ptr<std::string> row_class;
        int64_t rows_updated_at;
        RowsUpdatedBy rows_updated_by;
        int64_t table_id;
        int64_t total_times_rated;
        int64_t view_count;
        int64_t view_last_modified;
        ViewType view_type;
        std::vector<struct Grant> grants;
        struct Metadata metadata;
        struct Owner owner;
        std::unique_ptr<struct Ratings> ratings;
        std::vector<Right> rights;
        struct TableAuthor table_author;
        std::unique_ptr<std::vector<ConsumerComplaintFlag>> flags;
        std::unique_ptr<bool> moderation_status;
        std::unique_ptr<std::string> category;
        std::unique_ptr<std::vector<std::string>> tags;
        std::unique_ptr<ModifyingViewUid> modifying_view_uid;
    };

    typedef std::vector<struct ConsumerComplaint> ConsumerComplaints;
    
    inline json get_untyped(const json &j, const char *property) {
        if (j.find(property) != j.end()) {
            return j.at(property).get<json>();
        }
        return json();
    }
    
    template <typename T>
    inline std::unique_ptr<T> get_optional(const json &j, const char *property) {
        if (j.find(property) != j.end())
            return j.at(property).get<std::unique_ptr<T>>();
        return std::unique_ptr<T>();
    }
}

namespace nlohmann {
    template <typename T>
    struct adl_serializer<std::unique_ptr<T>> {
        static void to_json(json& j, const std::unique_ptr<T>& opt) {
            if (!opt)
                j = nullptr;
            else
                j = *opt;
        }

        static std::unique_ptr<T> from_json(const json& j) {
            if (j.is_null())
                return std::unique_ptr<T>();
            else
                return std::unique_ptr<T>(new T(j.get<T>()));
        }
    };

    inline void from_json(const json& _j, struct quicktype::Grant& _x) {
        _x.inherited = _j.at("inherited").get<bool>();
        _x.type = _j.at("type").get<quicktype::GrantType>();
        _x.flags = _j.at("flags").get<std::vector<quicktype::GrantFlag>>();
    }

    inline void to_json(json& _j, const struct quicktype::Grant& _x) {
        _j = json::object();
        _j["inherited"] = _x.inherited;
        _j["type"] = _x.type;
        _j["flags"] = _x.flags;
    }

    inline void from_json(const json& _j, struct quicktype::Test& _x) {
        _x.cfpb1 = _j.at("CFPB1").get<std::string>();
    }

    inline void to_json(json& _j, const struct quicktype::Test& _x) {
        _j = json::object();
        _j["CFPB1"] = _x.cfpb1;
    }

    inline void from_json(const json& _j, struct quicktype::CustomFields& _x) {
        _x.test = _j.at("TEST").get<struct quicktype::Test>();
    }

    inline void to_json(json& _j, const struct quicktype::CustomFields& _x) {
        _j = json::object();
        _j["TEST"] = _x.test;
    }

    inline void from_json(const json& _j, struct quicktype::Group& _x) {
        _x.column_field_name = _j.at("columnFieldName").get<std::string>();
    }

    inline void to_json(json& _j, const struct quicktype::Group& _x) {
        _j = json::object();
        _j["columnFieldName"] = _x.column_field_name;
    }

    inline void from_json(const json& _j, struct quicktype::Order& _x) {
        _x.ascending = _j.at("ascending").get<bool>();
        _x.column_field_name = _j.at("columnFieldName").get<std::string>();
    }

    inline void to_json(json& _j, const struct quicktype::Order& _x) {
        _j = json::object();
        _j["ascending"] = _x.ascending;
        _j["columnFieldName"] = _x.column_field_name;
    }

    inline void from_json(const json& _j, struct quicktype::Select& _x) {
        _x.column_field_name = _j.at("columnFieldName").get<std::string>();
        _x.aggregate = quicktype::get_optional<std::string>(_j, "aggregate");
    }

    inline void to_json(json& _j, const struct quicktype::Select& _x) {
        _j = json::object();
        _j["columnFieldName"] = _x.column_field_name;
        _j["aggregate"] = _x.aggregate;
    }

    inline void from_json(const json& _j, struct quicktype::JsonQuery& _x) {
        _x.order = quicktype::get_optional<std::vector<struct quicktype::Order>>(_j, "order");
        _x.select = quicktype::get_optional<std::vector<struct quicktype::Select>>(_j, "select");
        _x.group = quicktype::get_optional<std::vector<struct quicktype::Group>>(_j, "group");
    }

    inline void to_json(json& _j, const struct quicktype::JsonQuery& _x) {
        _j = json::object();
        _j["order"] = _x.order;
        _j["select"] = _x.select;
        _j["group"] = _x.group;
    }

    inline void from_json(const json& _j, struct quicktype::Visible& _x) {
        _x.table = quicktype::get_optional<bool>(_j, "table");
        _x.fatrow = quicktype::get_optional<bool>(_j, "fatrow");
    }

    inline void to_json(json& _j, const struct quicktype::Visible& _x) {
        _j = json::object();
        _j["table"] = _x.table;
        _j["fatrow"] = _x.fatrow;
    }

    inline void from_json(const json& _j, struct quicktype::RenderTypeConfig& _x) {
        _x.visible = _j.at("visible").get<struct quicktype::Visible>();
    }

    inline void to_json(json& _j, const struct quicktype::RenderTypeConfig& _x) {
        _j = json::object();
        _j["visible"] = _x.visible;
    }

    inline void from_json(const json& _j, struct quicktype::Field& _x) {
        _x.table_column_id = _j.at("tableColumnId").get<int64_t>();
        _x.type = _j.at("type").get<quicktype::FieldType>();
    }

    inline void to_json(json& _j, const struct quicktype::Field& _x) {
        _j = json::object();
        _j["tableColumnId"] = _x.table_column_id;
        _j["type"] = _x.type;
    }

    inline void from_json(const json& _j, struct quicktype::Row& _x) {
        _x.fields = _j.at("fields").get<std::vector<struct quicktype::Field>>();
    }

    inline void to_json(json& _j, const struct quicktype::Row& _x) {
        _j = json::object();
        _j["fields"] = _x.fields;
    }

    inline void from_json(const json& _j, struct quicktype::Styles& _x) {
        _x.width = _j.at("width").get<quicktype::Width>();
    }

    inline void to_json(json& _j, const struct quicktype::Styles& _x) {
        _j = json::object();
        _j["width"] = _x.width;
    }

    inline void from_json(const json& _j, struct quicktype::Column& _x) {
        _x.styles = _j.at("styles").get<struct quicktype::Styles>();
        _x.rows = _j.at("rows").get<std::vector<struct quicktype::Row>>();
    }

    inline void to_json(json& _j, const struct quicktype::Column& _x) {
        _j = json::object();
        _j["styles"] = _x.styles;
        _j["rows"] = _x.rows;
    }

    inline void from_json(const json& _j, struct quicktype::FatRow& _x) {
        _x.columns = _j.at("columns").get<std::vector<struct quicktype::Column>>();
    }

    inline void to_json(json& _j, const struct quicktype::FatRow& _x) {
        _j = json::object();
        _j["columns"] = _x.columns;
    }

    inline void from_json(const json& _j, struct quicktype::RichRendererConfigs& _x) {
        _x.fat_row = _j.at("fatRow").get<struct quicktype::FatRow>();
    }

    inline void to_json(json& _j, const struct quicktype::RichRendererConfigs& _x) {
        _j = json::object();
        _j["fatRow"] = _x.fat_row;
    }

    inline void from_json(const json& _j, struct quicktype::Metadata& _x) {
        _x.json_query = quicktype::get_optional<struct quicktype::JsonQuery>(_j, "jsonQuery");
        _x.rdf_subject = quicktype::get_optional<quicktype::RdfSubject>(_j, "rdfSubject");
        _x.rdf_class = quicktype::get_optional<std::string>(_j, "rdfClass");
        _x.row_identifier = quicktype::get_optional<std::string>(_j, "rowIdentifier");
        _x.available_display_types = _j.at("availableDisplayTypes").get<std::vector<quicktype::AvailableDisplayType>>();
        _x.row_label = quicktype::get_optional<std::string>(_j, "rowLabel");
        _x.render_type_config = _j.at("renderTypeConfig").get<struct quicktype::RenderTypeConfig>();
        _x.rich_renderer_configs = quicktype::get_optional<struct quicktype::RichRendererConfigs>(_j, "richRendererConfigs");
        _x.custom_fields = quicktype::get_optional<struct quicktype::CustomFields>(_j, "custom_fields");
    }

    inline void to_json(json& _j, const struct quicktype::Metadata& _x) {
        _j = json::object();
        _j["jsonQuery"] = _x.json_query;
        _j["rdfSubject"] = _x.rdf_subject;
        _j["rdfClass"] = _x.rdf_class;
        _j["rowIdentifier"] = _x.row_identifier;
        _j["availableDisplayTypes"] = _x.available_display_types;
        _j["rowLabel"] = _x.row_label;
        _j["renderTypeConfig"] = _x.render_type_config;
        _j["richRendererConfigs"] = _x.rich_renderer_configs;
        _j["custom_fields"] = _x.custom_fields;
    }

    inline void from_json(const json& _j, struct quicktype::Owner& _x) {
        _x.id = _j.at("id").get<std::string>();
        _x.display_name = _j.at("displayName").get<std::string>();
        _x.screen_name = _j.at("screenName").get<std::string>();
        _x.type = _j.at("type").get<quicktype::OwnerType>();
        _x.flags = quicktype::get_optional<std::vector<quicktype::OwnerFlag>>(_j, "flags");
        _x.profile_image_url_large = quicktype::get_optional<std::string>(_j, "profileImageUrlLarge");
        _x.profile_image_url_medium = quicktype::get_optional<std::string>(_j, "profileImageUrlMedium");
        _x.profile_image_url_small = quicktype::get_optional<std::string>(_j, "profileImageUrlSmall");
    }

    inline void to_json(json& _j, const struct quicktype::Owner& _x) {
        _j = json::object();
        _j["id"] = _x.id;
        _j["displayName"] = _x.display_name;
        _j["screenName"] = _x.screen_name;
        _j["type"] = _x.type;
        _j["flags"] = _x.flags;
        _j["profileImageUrlLarge"] = _x.profile_image_url_large;
        _j["profileImageUrlMedium"] = _x.profile_image_url_medium;
        _j["profileImageUrlSmall"] = _x.profile_image_url_small;
    }

    inline void from_json(const json& _j, struct quicktype::Ratings& _x) {
        _x.rating = _j.at("rating").get<int64_t>();
    }

    inline void to_json(json& _j, const struct quicktype::Ratings& _x) {
        _j = json::object();
        _j["rating"] = _x.rating;
    }

    inline void from_json(const json& _j, struct quicktype::TableAuthor& _x) {
        _x.id = _j.at("id").get<quicktype::Id>();
        _x.display_name = _j.at("displayName").get<quicktype::Name>();
        _x.screen_name = _j.at("screenName").get<quicktype::Name>();
        _x.type = _j.at("type").get<quicktype::OwnerType>();
        _x.flags = quicktype::get_optional<std::vector<quicktype::OwnerFlag>>(_j, "flags");
    }

    inline void to_json(json& _j, const struct quicktype::TableAuthor& _x) {
        _j = json::object();
        _j["id"] = _x.id;
        _j["displayName"] = _x.display_name;
        _j["screenName"] = _x.screen_name;
        _j["type"] = _x.type;
        _j["flags"] = _x.flags;
    }

    inline void from_json(const json& _j, struct quicktype::ConsumerComplaint& _x) {
        _x.id = _j.at("id").get<std::string>();
        _x.name = _j.at("name").get<std::string>();
        _x.average_rating = _j.at("averageRating").get<int64_t>();
        _x.created_at = _j.at("createdAt").get<int64_t>();
        _x.description = _j.at("description").get<std::string>();
        _x.display_type = _j.at("displayType").get<quicktype::DisplayType>();
        _x.download_count = _j.at("downloadCount").get<int64_t>();
        _x.hide_from_catalog = _j.at("hideFromCatalog").get<bool>();
        _x.hide_from_data_json = _j.at("hideFromDataJson").get<bool>();
        _x.index_updated_at = quicktype::get_optional<int64_t>(_j, "indexUpdatedAt");
        _x.new_backend = _j.at("newBackend").get<bool>();
        _x.number_of_comments = _j.at("numberOfComments").get<int64_t>();
        _x.oid = _j.at("oid").get<int64_t>();
        _x.provenance = _j.at("provenance").get<quicktype::Provenance>();
        _x.publication_append_enabled = _j.at("publicationAppendEnabled").get<bool>();
        _x.publication_date = _j.at("publicationDate").get<int64_t>();
        _x.publication_group = _j.at("publicationGroup").get<int64_t>();
        _x.publication_stage = _j.at("publicationStage").get<quicktype::PublicationStage>();
        _x.row_class = quicktype::get_optional<std::string>(_j, "rowClass");
        _x.rows_updated_at = _j.at("rowsUpdatedAt").get<int64_t>();
        _x.rows_updated_by = _j.at("rowsUpdatedBy").get<quicktype::RowsUpdatedBy>();
        _x.table_id = _j.at("tableId").get<int64_t>();
        _x.total_times_rated = _j.at("totalTimesRated").get<int64_t>();
        _x.view_count = _j.at("viewCount").get<int64_t>();
        _x.view_last_modified = _j.at("viewLastModified").get<int64_t>();
        _x.view_type = _j.at("viewType").get<quicktype::ViewType>();
        _x.grants = _j.at("grants").get<std::vector<struct quicktype::Grant>>();
        _x.metadata = _j.at("metadata").get<struct quicktype::Metadata>();
        _x.owner = _j.at("owner").get<struct quicktype::Owner>();
        _x.ratings = quicktype::get_optional<struct quicktype::Ratings>(_j, "ratings");
        _x.rights = _j.at("rights").get<std::vector<quicktype::Right>>();
        _x.table_author = _j.at("tableAuthor").get<struct quicktype::TableAuthor>();
        _x.flags = quicktype::get_optional<std::vector<quicktype::ConsumerComplaintFlag>>(_j, "flags");
        _x.moderation_status = quicktype::get_optional<bool>(_j, "moderationStatus");
        _x.category = quicktype::get_optional<std::string>(_j, "category");
        _x.tags = quicktype::get_optional<std::vector<std::string>>(_j, "tags");
        _x.modifying_view_uid = quicktype::get_optional<quicktype::ModifyingViewUid>(_j, "modifyingViewUid");
    }

    inline void to_json(json& _j, const struct quicktype::ConsumerComplaint& _x) {
        _j = json::object();
        _j["id"] = _x.id;
        _j["name"] = _x.name;
        _j["averageRating"] = _x.average_rating;
        _j["createdAt"] = _x.created_at;
        _j["description"] = _x.description;
        _j["displayType"] = _x.display_type;
        _j["downloadCount"] = _x.download_count;
        _j["hideFromCatalog"] = _x.hide_from_catalog;
        _j["hideFromDataJson"] = _x.hide_from_data_json;
        _j["indexUpdatedAt"] = _x.index_updated_at;
        _j["newBackend"] = _x.new_backend;
        _j["numberOfComments"] = _x.number_of_comments;
        _j["oid"] = _x.oid;
        _j["provenance"] = _x.provenance;
        _j["publicationAppendEnabled"] = _x.publication_append_enabled;
        _j["publicationDate"] = _x.publication_date;
        _j["publicationGroup"] = _x.publication_group;
        _j["publicationStage"] = _x.publication_stage;
        _j["rowClass"] = _x.row_class;
        _j["rowsUpdatedAt"] = _x.rows_updated_at;
        _j["rowsUpdatedBy"] = _x.rows_updated_by;
        _j["tableId"] = _x.table_id;
        _j["totalTimesRated"] = _x.total_times_rated;
        _j["viewCount"] = _x.view_count;
        _j["viewLastModified"] = _x.view_last_modified;
        _j["viewType"] = _x.view_type;
        _j["grants"] = _x.grants;
        _j["metadata"] = _x.metadata;
        _j["owner"] = _x.owner;
        _j["ratings"] = _x.ratings;
        _j["rights"] = _x.rights;
        _j["tableAuthor"] = _x.table_author;
        _j["flags"] = _x.flags;
        _j["moderationStatus"] = _x.moderation_status;
        _j["category"] = _x.category;
        _j["tags"] = _x.tags;
        _j["modifyingViewUid"] = _x.modifying_view_uid;
    }

    inline void from_json(const json& _j, quicktype::DisplayType& _x) {
        if (_j == "fatrow") _x = quicktype::DisplayType::FATROW;
        else if (_j == "table") _x = quicktype::DisplayType::TABLE;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::DisplayType& _x) {
        switch (_x) {
            case quicktype::DisplayType::FATROW: _j = "fatrow"; break;
            case quicktype::DisplayType::TABLE: _j = "table"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::ConsumerComplaintFlag& _x) {
        if (_j == "default") _x = quicktype::ConsumerComplaintFlag::DEFAULT;
        else if (_j == "restorable") _x = quicktype::ConsumerComplaintFlag::RESTORABLE;
        else if (_j == "restorePossibleForType") _x = quicktype::ConsumerComplaintFlag::RESTORE_POSSIBLE_FOR_TYPE;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::ConsumerComplaintFlag& _x) {
        switch (_x) {
            case quicktype::ConsumerComplaintFlag::DEFAULT: _j = "default"; break;
            case quicktype::ConsumerComplaintFlag::RESTORABLE: _j = "restorable"; break;
            case quicktype::ConsumerComplaintFlag::RESTORE_POSSIBLE_FOR_TYPE: _j = "restorePossibleForType"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::GrantFlag& _x) {
        if (_j == "public") _x = quicktype::GrantFlag::PUBLIC;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::GrantFlag& _x) {
        switch (_x) {
            case quicktype::GrantFlag::PUBLIC: _j = "public"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::GrantType& _x) {
        if (_j == "viewer") _x = quicktype::GrantType::VIEWER;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::GrantType& _x) {
        switch (_x) {
            case quicktype::GrantType::VIEWER: _j = "viewer"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::AvailableDisplayType& _x) {
        if (_j == "fatrow") _x = quicktype::AvailableDisplayType::FATROW;
        else if (_j == "page") _x = quicktype::AvailableDisplayType::PAGE;
        else if (_j == "table") _x = quicktype::AvailableDisplayType::TABLE;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::AvailableDisplayType& _x) {
        switch (_x) {
            case quicktype::AvailableDisplayType::FATROW: _j = "fatrow"; break;
            case quicktype::AvailableDisplayType::PAGE: _j = "page"; break;
            case quicktype::AvailableDisplayType::TABLE: _j = "table"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::RdfSubject& _x) {
        if (_j == "0") _x = quicktype::RdfSubject::THE_0;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::RdfSubject& _x) {
        switch (_x) {
            case quicktype::RdfSubject::THE_0: _j = "0"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::FieldType& _x) {
        if (_j == "columnData") _x = quicktype::FieldType::COLUMN_DATA;
        else if (_j == "columnLabel") _x = quicktype::FieldType::COLUMN_LABEL;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::FieldType& _x) {
        switch (_x) {
            case quicktype::FieldType::COLUMN_DATA: _j = "columnData"; break;
            case quicktype::FieldType::COLUMN_LABEL: _j = "columnLabel"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::Width& _x) {
        if (_j == "27%") _x = quicktype::Width::THE_27;
        else if (_j == "30%") _x = quicktype::Width::THE_30;
        else if (_j == "31%") _x = quicktype::Width::THE_31;
        else if (_j == "33%") _x = quicktype::Width::THE_33;
        else if (_j == "40%") _x = quicktype::Width::THE_40;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::Width& _x) {
        switch (_x) {
            case quicktype::Width::THE_27: _j = "27%"; break;
            case quicktype::Width::THE_30: _j = "30%"; break;
            case quicktype::Width::THE_31: _j = "31%"; break;
            case quicktype::Width::THE_33: _j = "33%"; break;
            case quicktype::Width::THE_40: _j = "40%"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::ModifyingViewUid& _x) {
        if (_j == "s6ew-h6mp") _x = quicktype::ModifyingViewUid::S6_EW_H6_MP;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::ModifyingViewUid& _x) {
        switch (_x) {
            case quicktype::ModifyingViewUid::S6_EW_H6_MP: _j = "s6ew-h6mp"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::OwnerFlag& _x) {
        if (_j == "organizationMember") _x = quicktype::OwnerFlag::ORGANIZATION_MEMBER;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::OwnerFlag& _x) {
        switch (_x) {
            case quicktype::OwnerFlag::ORGANIZATION_MEMBER: _j = "organizationMember"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::OwnerType& _x) {
        if (_j == "interactive") _x = quicktype::OwnerType::INTERACTIVE;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::OwnerType& _x) {
        switch (_x) {
            case quicktype::OwnerType::INTERACTIVE: _j = "interactive"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::Provenance& _x) {
        if (_j == "official") _x = quicktype::Provenance::OFFICIAL;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::Provenance& _x) {
        switch (_x) {
            case quicktype::Provenance::OFFICIAL: _j = "official"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::PublicationStage& _x) {
        if (_j == "published") _x = quicktype::PublicationStage::PUBLISHED;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::PublicationStage& _x) {
        switch (_x) {
            case quicktype::PublicationStage::PUBLISHED: _j = "published"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::Right& _x) {
        if (_j == "read") _x = quicktype::Right::READ;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::Right& _x) {
        switch (_x) {
            case quicktype::Right::READ: _j = "read"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::RowsUpdatedBy& _x) {
        if (_j == "pjxg-ve4m") _x = quicktype::RowsUpdatedBy::PJXG_VE4_M;
        else if (_j == "54a3-qyun") _x = quicktype::RowsUpdatedBy::THE_54_A3_QYUN;
        else if (_j == "9e3m-2843") _x = quicktype::RowsUpdatedBy::THE_9_E3_M_2843;
        else if (_j == "vvca-fr6g") _x = quicktype::RowsUpdatedBy::VVCA_FR6_G;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::RowsUpdatedBy& _x) {
        switch (_x) {
            case quicktype::RowsUpdatedBy::PJXG_VE4_M: _j = "pjxg-ve4m"; break;
            case quicktype::RowsUpdatedBy::THE_54_A3_QYUN: _j = "54a3-qyun"; break;
            case quicktype::RowsUpdatedBy::THE_9_E3_M_2843: _j = "9e3m-2843"; break;
            case quicktype::RowsUpdatedBy::VVCA_FR6_G: _j = "vvca-fr6g"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::Name& _x) {
        if (_j == "Dan Munz") _x = quicktype::Name::DAN_MUNZ;
        else if (_j == "Doug Taylor") _x = quicktype::Name::DOUG_TAYLOR;
        else if (_j == "ming") _x = quicktype::Name::MING;
        else if (_j == "Shannon Files") _x = quicktype::Name::SHANNON_FILES;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::Name& _x) {
        switch (_x) {
            case quicktype::Name::DAN_MUNZ: _j = "Dan Munz"; break;
            case quicktype::Name::DOUG_TAYLOR: _j = "Doug Taylor"; break;
            case quicktype::Name::MING: _j = "ming"; break;
            case quicktype::Name::SHANNON_FILES: _j = "Shannon Files"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::Id& _x) {
        if (_j == "pjxg-ve4m") _x = quicktype::Id::PJXG_VE4_M;
        else if (_j == "54a3-qyun") _x = quicktype::Id::THE_54_A3_QYUN;
        else if (_j == "9e3m-2843") _x = quicktype::Id::THE_9_E3_M_2843;
        else if (_j == "9eki-h2hn") _x = quicktype::Id::THE_9_EKI_H2_HN;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::Id& _x) {
        switch (_x) {
            case quicktype::Id::PJXG_VE4_M: _j = "pjxg-ve4m"; break;
            case quicktype::Id::THE_54_A3_QYUN: _j = "54a3-qyun"; break;
            case quicktype::Id::THE_9_E3_M_2843: _j = "9e3m-2843"; break;
            case quicktype::Id::THE_9_EKI_H2_HN: _j = "9eki-h2hn"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::ViewType& _x) {
        if (_j == "tabular") _x = quicktype::ViewType::TABULAR;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::ViewType& _x) {
        switch (_x) {
            case quicktype::ViewType::TABULAR: _j = "tabular"; break;
            default: throw "This should not happen";
        }
    }

}
