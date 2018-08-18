//  To parse this JSON data, first install
//
//      Boost     http://www.boost.org
//      json.hpp  https://github.com/nlohmann/json
//
//  Then include this file, and then do
//
//     ConsumerComplaints data = nlohmann::json::parse(jsonString);

#pragma once

#include "json.hpp"

#include <boost/optional.hpp>
#include <stdexcept>
#include <regex>
namespace nlohmann {
    template <typename T>
    struct adl_serializer<std::shared_ptr<T>> {
        static void to_json(json& j, const std::shared_ptr<T>& opt) {
            if (!opt) j = nullptr; else j = *opt;
        }

        static std::shared_ptr<T> from_json(const json& j) {
            if (j.is_null()) return std::unique_ptr<T>(); else return std::unique_ptr<T>(new T(j.get<T>()));
        }
    };
}

namespace quicktype {
    using nlohmann::json;

    inline json get_untyped(const json &j, const char *property) {
        if (j.find(property) != j.end()) {
            return j.at(property).get<json>();
        }
        return json();
    }

    template <typename T>
    inline std::shared_ptr<T> get_optional(const json &j, const char *property) {
        if (j.find(property) != j.end()) {
            return j.at(property).get<std::shared_ptr<T>>();
        }
        return std::shared_ptr<T>();
    }

    enum class DisplayType : int { FATROW, TABLE };

    enum class ConsumerComplaintFlag : int { DEFAULT, RESTORABLE, RESTORE_POSSIBLE_FOR_TYPE };

    enum class GrantFlag : int { PUBLIC };

    enum class GrantType : int { VIEWER };

    class Grant {
        public:
        Grant() = default;
        virtual ~Grant() = default;

        private:
        bool inherited;
        GrantType type;
        std::vector<GrantFlag> flags;

        public:
        const bool & get_inherited() const { return inherited; }
        bool & get_mutable_inherited() { return inherited; }
        void set_inherited(const bool& value) { this->inherited = value; }

        const GrantType & get_type() const { return type; }
        GrantType & get_mutable_type() { return type; }
        void set_type(const GrantType& value) { this->type = value; }

        const std::vector<GrantFlag> & get_flags() const { return flags; }
        std::vector<GrantFlag> & get_mutable_flags() { return flags; }
        void set_flags(const std::vector<GrantFlag>& value) { this->flags = value; }
    };

    enum class AvailableDisplayType : int { FATROW, PAGE, TABLE };

    class Test {
        public:
        Test() = default;
        virtual ~Test() = default;

        private:
        std::string cfpb1;

        public:
        const std::string & get_cfpb1() const { return cfpb1; }
        std::string & get_mutable_cfpb1() { return cfpb1; }
        void set_cfpb1(const std::string& value) { this->cfpb1 = value; }
    };

    class CustomFields {
        public:
        CustomFields() = default;
        virtual ~CustomFields() = default;

        private:
        Test test;

        public:
        const Test & get_test() const { return test; }
        Test & get_mutable_test() { return test; }
        void set_test(const Test& value) { this->test = value; }
    };

    class Order {
        public:
        Order() = default;
        virtual ~Order() = default;

        private:
        bool ascending;
        std::string column_field_name;

        public:
        const bool & get_ascending() const { return ascending; }
        bool & get_mutable_ascending() { return ascending; }
        void set_ascending(const bool& value) { this->ascending = value; }

        const std::string & get_column_field_name() const { return column_field_name; }
        std::string & get_mutable_column_field_name() { return column_field_name; }
        void set_column_field_name(const std::string& value) { this->column_field_name = value; }
    };

    class JsonQuery {
        public:
        JsonQuery() = default;
        virtual ~JsonQuery() = default;

        private:
        std::vector<Order> order;

        public:
        const std::vector<Order> & get_order() const { return order; }
        std::vector<Order> & get_mutable_order() { return order; }
        void set_order(const std::vector<Order>& value) { this->order = value; }
    };

    class Visible {
        public:
        Visible() = default;
        virtual ~Visible() = default;

        private:
        std::shared_ptr<bool> table;
        std::shared_ptr<bool> fatrow;

        public:
        std::shared_ptr<bool> get_table() const { return table; }
        void set_table(std::shared_ptr<bool> value) { this->table = value; }

        std::shared_ptr<bool> get_fatrow() const { return fatrow; }
        void set_fatrow(std::shared_ptr<bool> value) { this->fatrow = value; }
    };

    class RenderTypeConfig {
        public:
        RenderTypeConfig() = default;
        virtual ~RenderTypeConfig() = default;

        private:
        Visible visible;

        public:
        const Visible & get_visible() const { return visible; }
        Visible & get_mutable_visible() { return visible; }
        void set_visible(const Visible& value) { this->visible = value; }
    };

    enum class FieldType : int { COLUMN_DATA, COLUMN_LABEL };

    class Field {
        public:
        Field() = default;
        virtual ~Field() = default;

        private:
        int64_t table_column_id;
        FieldType type;

        public:
        const int64_t & get_table_column_id() const { return table_column_id; }
        int64_t & get_mutable_table_column_id() { return table_column_id; }
        void set_table_column_id(const int64_t& value) { this->table_column_id = value; }

        const FieldType & get_type() const { return type; }
        FieldType & get_mutable_type() { return type; }
        void set_type(const FieldType& value) { this->type = value; }
    };

    class Row {
        public:
        Row() = default;
        virtual ~Row() = default;

        private:
        std::vector<Field> fields;

        public:
        const std::vector<Field> & get_fields() const { return fields; }
        std::vector<Field> & get_mutable_fields() { return fields; }
        void set_fields(const std::vector<Field>& value) { this->fields = value; }
    };

    enum class Width : int { THE_27, THE_30, THE_31, THE_33, THE_40 };

    class Styles {
        public:
        Styles() = default;
        virtual ~Styles() = default;

        private:
        Width width;

        public:
        const Width & get_width() const { return width; }
        Width & get_mutable_width() { return width; }
        void set_width(const Width& value) { this->width = value; }
    };

    class Column {
        public:
        Column() = default;
        virtual ~Column() = default;

        private:
        Styles styles;
        std::vector<Row> rows;

        public:
        const Styles & get_styles() const { return styles; }
        Styles & get_mutable_styles() { return styles; }
        void set_styles(const Styles& value) { this->styles = value; }

        const std::vector<Row> & get_rows() const { return rows; }
        std::vector<Row> & get_mutable_rows() { return rows; }
        void set_rows(const std::vector<Row>& value) { this->rows = value; }
    };

    class FatRow {
        public:
        FatRow() = default;
        virtual ~FatRow() = default;

        private:
        std::vector<Column> columns;

        public:
        const std::vector<Column> & get_columns() const { return columns; }
        std::vector<Column> & get_mutable_columns() { return columns; }
        void set_columns(const std::vector<Column>& value) { this->columns = value; }
    };

    class RichRendererConfigs {
        public:
        RichRendererConfigs() = default;
        virtual ~RichRendererConfigs() = default;

        private:
        FatRow fat_row;

        public:
        const FatRow & get_fat_row() const { return fat_row; }
        FatRow & get_mutable_fat_row() { return fat_row; }
        void set_fat_row(const FatRow& value) { this->fat_row = value; }
    };

    class Metadata {
        public:
        Metadata() = default;
        virtual ~Metadata() = default;

        private:
        std::shared_ptr<JsonQuery> json_query;
        std::shared_ptr<std::string> rdf_subject;
        std::shared_ptr<std::string> rdf_class;
        std::shared_ptr<std::string> row_identifier;
        std::vector<AvailableDisplayType> available_display_types;
        std::shared_ptr<std::string> row_label;
        RenderTypeConfig render_type_config;
        std::shared_ptr<RichRendererConfigs> rich_renderer_configs;
        std::shared_ptr<CustomFields> custom_fields;

        public:
        std::shared_ptr<JsonQuery> get_json_query() const { return json_query; }
        void set_json_query(std::shared_ptr<JsonQuery> value) { this->json_query = value; }

        std::shared_ptr<std::string> get_rdf_subject() const { return rdf_subject; }
        void set_rdf_subject(std::shared_ptr<std::string> value) { this->rdf_subject = value; }

        std::shared_ptr<std::string> get_rdf_class() const { return rdf_class; }
        void set_rdf_class(std::shared_ptr<std::string> value) { this->rdf_class = value; }

        std::shared_ptr<std::string> get_row_identifier() const { return row_identifier; }
        void set_row_identifier(std::shared_ptr<std::string> value) { this->row_identifier = value; }

        const std::vector<AvailableDisplayType> & get_available_display_types() const { return available_display_types; }
        std::vector<AvailableDisplayType> & get_mutable_available_display_types() { return available_display_types; }
        void set_available_display_types(const std::vector<AvailableDisplayType>& value) { this->available_display_types = value; }

        std::shared_ptr<std::string> get_row_label() const { return row_label; }
        void set_row_label(std::shared_ptr<std::string> value) { this->row_label = value; }

        const RenderTypeConfig & get_render_type_config() const { return render_type_config; }
        RenderTypeConfig & get_mutable_render_type_config() { return render_type_config; }
        void set_render_type_config(const RenderTypeConfig& value) { this->render_type_config = value; }

        std::shared_ptr<RichRendererConfigs> get_rich_renderer_configs() const { return rich_renderer_configs; }
        void set_rich_renderer_configs(std::shared_ptr<RichRendererConfigs> value) { this->rich_renderer_configs = value; }

        std::shared_ptr<CustomFields> get_custom_fields() const { return custom_fields; }
        void set_custom_fields(std::shared_ptr<CustomFields> value) { this->custom_fields = value; }
    };

    enum class ModifyingViewUid : int { S6_EW_H6_MP };

    enum class OwnerType : int { INTERACTIVE };

    class Owner {
        public:
        Owner() = default;
        virtual ~Owner() = default;

        private:
        std::string id;
        std::string display_name;
        std::string screen_name;
        OwnerType type;
        std::shared_ptr<std::string> profile_image_url_large;
        std::shared_ptr<std::string> profile_image_url_medium;
        std::shared_ptr<std::string> profile_image_url_small;

        public:
        const std::string & get_id() const { return id; }
        std::string & get_mutable_id() { return id; }
        void set_id(const std::string& value) { this->id = value; }

        const std::string & get_display_name() const { return display_name; }
        std::string & get_mutable_display_name() { return display_name; }
        void set_display_name(const std::string& value) { this->display_name = value; }

        const std::string & get_screen_name() const { return screen_name; }
        std::string & get_mutable_screen_name() { return screen_name; }
        void set_screen_name(const std::string& value) { this->screen_name = value; }

        const OwnerType & get_type() const { return type; }
        OwnerType & get_mutable_type() { return type; }
        void set_type(const OwnerType& value) { this->type = value; }

        std::shared_ptr<std::string> get_profile_image_url_large() const { return profile_image_url_large; }
        void set_profile_image_url_large(std::shared_ptr<std::string> value) { this->profile_image_url_large = value; }

        std::shared_ptr<std::string> get_profile_image_url_medium() const { return profile_image_url_medium; }
        void set_profile_image_url_medium(std::shared_ptr<std::string> value) { this->profile_image_url_medium = value; }

        std::shared_ptr<std::string> get_profile_image_url_small() const { return profile_image_url_small; }
        void set_profile_image_url_small(std::shared_ptr<std::string> value) { this->profile_image_url_small = value; }
    };

    enum class Provenance : int { OFFICIAL };

    enum class PublicationStage : int { PUBLISHED };

    class Ratings {
        public:
        Ratings() = default;
        virtual ~Ratings() = default;

        private:
        int64_t rating;

        public:
        const int64_t & get_rating() const { return rating; }
        int64_t & get_mutable_rating() { return rating; }
        void set_rating(const int64_t& value) { this->rating = value; }
    };

    enum class Right : int { READ };

    enum class RowsUpdatedBy : int { PJXG_VE4_M, THE_54_A3_QYUN, THE_9_E3_M_2843, VVCA_FR6_G };

    enum class Name : int { DAN_MUNZ, DOUG_TAYLOR, MING, SHANNON_FILES };

    enum class Id : int { PJXG_VE4_M, THE_54_A3_QYUN, THE_9_E3_M_2843, THE_9_EKI_H2_HN };

    class TableAuthor {
        public:
        TableAuthor() = default;
        virtual ~TableAuthor() = default;

        private:
        Id id;
        Name display_name;
        Name screen_name;
        OwnerType type;

        public:
        const Id & get_id() const { return id; }
        Id & get_mutable_id() { return id; }
        void set_id(const Id& value) { this->id = value; }

        const Name & get_display_name() const { return display_name; }
        Name & get_mutable_display_name() { return display_name; }
        void set_display_name(const Name& value) { this->display_name = value; }

        const Name & get_screen_name() const { return screen_name; }
        Name & get_mutable_screen_name() { return screen_name; }
        void set_screen_name(const Name& value) { this->screen_name = value; }

        const OwnerType & get_type() const { return type; }
        OwnerType & get_mutable_type() { return type; }
        void set_type(const OwnerType& value) { this->type = value; }
    };

    enum class ViewType : int { TABULAR };

    class ConsumerComplaint {
        public:
        ConsumerComplaint() = default;
        virtual ~ConsumerComplaint() = default;

        private:
        std::string id;
        std::string name;
        int64_t average_rating;
        int64_t created_at;
        std::string description;
        DisplayType display_type;
        int64_t download_count;
        bool hide_from_catalog;
        bool hide_from_data_json;
        std::shared_ptr<int64_t> index_updated_at;
        bool new_backend;
        int64_t number_of_comments;
        int64_t oid;
        Provenance provenance;
        bool publication_append_enabled;
        int64_t publication_date;
        int64_t publication_group;
        PublicationStage publication_stage;
        std::shared_ptr<std::string> row_class;
        int64_t rows_updated_at;
        RowsUpdatedBy rows_updated_by;
        int64_t table_id;
        int64_t total_times_rated;
        int64_t view_count;
        int64_t view_last_modified;
        ViewType view_type;
        std::vector<Grant> grants;
        Metadata metadata;
        Owner owner;
        std::shared_ptr<Ratings> ratings;
        std::vector<Right> rights;
        TableAuthor table_author;
        std::shared_ptr<std::vector<ConsumerComplaintFlag>> flags;
        std::shared_ptr<bool> moderation_status;
        std::shared_ptr<std::string> category;
        std::shared_ptr<std::vector<std::string>> tags;
        std::shared_ptr<ModifyingViewUid> modifying_view_uid;

        public:
        const std::string & get_id() const { return id; }
        std::string & get_mutable_id() { return id; }
        void set_id(const std::string& value) { this->id = value; }

        const std::string & get_name() const { return name; }
        std::string & get_mutable_name() { return name; }
        void set_name(const std::string& value) { this->name = value; }

        const int64_t & get_average_rating() const { return average_rating; }
        int64_t & get_mutable_average_rating() { return average_rating; }
        void set_average_rating(const int64_t& value) { this->average_rating = value; }

        const int64_t & get_created_at() const { return created_at; }
        int64_t & get_mutable_created_at() { return created_at; }
        void set_created_at(const int64_t& value) { this->created_at = value; }

        const std::string & get_description() const { return description; }
        std::string & get_mutable_description() { return description; }
        void set_description(const std::string& value) { this->description = value; }

        const DisplayType & get_display_type() const { return display_type; }
        DisplayType & get_mutable_display_type() { return display_type; }
        void set_display_type(const DisplayType& value) { this->display_type = value; }

        const int64_t & get_download_count() const { return download_count; }
        int64_t & get_mutable_download_count() { return download_count; }
        void set_download_count(const int64_t& value) { this->download_count = value; }

        const bool & get_hide_from_catalog() const { return hide_from_catalog; }
        bool & get_mutable_hide_from_catalog() { return hide_from_catalog; }
        void set_hide_from_catalog(const bool& value) { this->hide_from_catalog = value; }

        const bool & get_hide_from_data_json() const { return hide_from_data_json; }
        bool & get_mutable_hide_from_data_json() { return hide_from_data_json; }
        void set_hide_from_data_json(const bool& value) { this->hide_from_data_json = value; }

        std::shared_ptr<int64_t> get_index_updated_at() const { return index_updated_at; }
        void set_index_updated_at(std::shared_ptr<int64_t> value) { this->index_updated_at = value; }

        const bool & get_new_backend() const { return new_backend; }
        bool & get_mutable_new_backend() { return new_backend; }
        void set_new_backend(const bool& value) { this->new_backend = value; }

        const int64_t & get_number_of_comments() const { return number_of_comments; }
        int64_t & get_mutable_number_of_comments() { return number_of_comments; }
        void set_number_of_comments(const int64_t& value) { this->number_of_comments = value; }

        const int64_t & get_oid() const { return oid; }
        int64_t & get_mutable_oid() { return oid; }
        void set_oid(const int64_t& value) { this->oid = value; }

        const Provenance & get_provenance() const { return provenance; }
        Provenance & get_mutable_provenance() { return provenance; }
        void set_provenance(const Provenance& value) { this->provenance = value; }

        const bool & get_publication_append_enabled() const { return publication_append_enabled; }
        bool & get_mutable_publication_append_enabled() { return publication_append_enabled; }
        void set_publication_append_enabled(const bool& value) { this->publication_append_enabled = value; }

        const int64_t & get_publication_date() const { return publication_date; }
        int64_t & get_mutable_publication_date() { return publication_date; }
        void set_publication_date(const int64_t& value) { this->publication_date = value; }

        const int64_t & get_publication_group() const { return publication_group; }
        int64_t & get_mutable_publication_group() { return publication_group; }
        void set_publication_group(const int64_t& value) { this->publication_group = value; }

        const PublicationStage & get_publication_stage() const { return publication_stage; }
        PublicationStage & get_mutable_publication_stage() { return publication_stage; }
        void set_publication_stage(const PublicationStage& value) { this->publication_stage = value; }

        std::shared_ptr<std::string> get_row_class() const { return row_class; }
        void set_row_class(std::shared_ptr<std::string> value) { this->row_class = value; }

        const int64_t & get_rows_updated_at() const { return rows_updated_at; }
        int64_t & get_mutable_rows_updated_at() { return rows_updated_at; }
        void set_rows_updated_at(const int64_t& value) { this->rows_updated_at = value; }

        const RowsUpdatedBy & get_rows_updated_by() const { return rows_updated_by; }
        RowsUpdatedBy & get_mutable_rows_updated_by() { return rows_updated_by; }
        void set_rows_updated_by(const RowsUpdatedBy& value) { this->rows_updated_by = value; }

        const int64_t & get_table_id() const { return table_id; }
        int64_t & get_mutable_table_id() { return table_id; }
        void set_table_id(const int64_t& value) { this->table_id = value; }

        const int64_t & get_total_times_rated() const { return total_times_rated; }
        int64_t & get_mutable_total_times_rated() { return total_times_rated; }
        void set_total_times_rated(const int64_t& value) { this->total_times_rated = value; }

        const int64_t & get_view_count() const { return view_count; }
        int64_t & get_mutable_view_count() { return view_count; }
        void set_view_count(const int64_t& value) { this->view_count = value; }

        const int64_t & get_view_last_modified() const { return view_last_modified; }
        int64_t & get_mutable_view_last_modified() { return view_last_modified; }
        void set_view_last_modified(const int64_t& value) { this->view_last_modified = value; }

        const ViewType & get_view_type() const { return view_type; }
        ViewType & get_mutable_view_type() { return view_type; }
        void set_view_type(const ViewType& value) { this->view_type = value; }

        const std::vector<Grant> & get_grants() const { return grants; }
        std::vector<Grant> & get_mutable_grants() { return grants; }
        void set_grants(const std::vector<Grant>& value) { this->grants = value; }

        const Metadata & get_metadata() const { return metadata; }
        Metadata & get_mutable_metadata() { return metadata; }
        void set_metadata(const Metadata& value) { this->metadata = value; }

        const Owner & get_owner() const { return owner; }
        Owner & get_mutable_owner() { return owner; }
        void set_owner(const Owner& value) { this->owner = value; }

        std::shared_ptr<Ratings> get_ratings() const { return ratings; }
        void set_ratings(std::shared_ptr<Ratings> value) { this->ratings = value; }

        const std::vector<Right> & get_rights() const { return rights; }
        std::vector<Right> & get_mutable_rights() { return rights; }
        void set_rights(const std::vector<Right>& value) { this->rights = value; }

        const TableAuthor & get_table_author() const { return table_author; }
        TableAuthor & get_mutable_table_author() { return table_author; }
        void set_table_author(const TableAuthor& value) { this->table_author = value; }

        std::shared_ptr<std::vector<ConsumerComplaintFlag>> get_flags() const { return flags; }
        void set_flags(std::shared_ptr<std::vector<ConsumerComplaintFlag>> value) { this->flags = value; }

        std::shared_ptr<bool> get_moderation_status() const { return moderation_status; }
        void set_moderation_status(std::shared_ptr<bool> value) { this->moderation_status = value; }

        std::shared_ptr<std::string> get_category() const { return category; }
        void set_category(std::shared_ptr<std::string> value) { this->category = value; }

        std::shared_ptr<std::vector<std::string>> get_tags() const { return tags; }
        void set_tags(std::shared_ptr<std::vector<std::string>> value) { this->tags = value; }

        std::shared_ptr<ModifyingViewUid> get_modifying_view_uid() const { return modifying_view_uid; }
        void set_modifying_view_uid(std::shared_ptr<ModifyingViewUid> value) { this->modifying_view_uid = value; }
    };

    typedef std::vector<ConsumerComplaint> ConsumerComplaints;
}

namespace quicktype {
    typedef std::vector<ConsumerComplaint> ConsumerComplaints;
}

namespace nlohmann {
    inline void from_json(const json& _j, quicktype::Grant& _x) {
        _x.set_inherited( _j.at("inherited").get<bool>() );
        _x.set_type( _j.at("type").get<quicktype::GrantType>() );
        _x.set_flags( _j.at("flags").get<std::vector<quicktype::GrantFlag>>() );
    }

    inline void to_json(json& _j, const quicktype::Grant& _x) {
        _j = json::object();
        _j["inherited"] = _x.get_inherited();
        _j["type"] = _x.get_type();
        _j["flags"] = _x.get_flags();
    }

    inline void from_json(const json& _j, quicktype::Test& _x) {
        _x.set_cfpb1( _j.at("CFPB1").get<std::string>() );
    }

    inline void to_json(json& _j, const quicktype::Test& _x) {
        _j = json::object();
        _j["CFPB1"] = _x.get_cfpb1();
    }

    inline void from_json(const json& _j, quicktype::CustomFields& _x) {
        _x.set_test( _j.at("TEST").get<quicktype::Test>() );
    }

    inline void to_json(json& _j, const quicktype::CustomFields& _x) {
        _j = json::object();
        _j["TEST"] = _x.get_test();
    }

    inline void from_json(const json& _j, quicktype::Order& _x) {
        _x.set_ascending( _j.at("ascending").get<bool>() );
        _x.set_column_field_name( _j.at("columnFieldName").get<std::string>() );
    }

    inline void to_json(json& _j, const quicktype::Order& _x) {
        _j = json::object();
        _j["ascending"] = _x.get_ascending();
        _j["columnFieldName"] = _x.get_column_field_name();
    }

    inline void from_json(const json& _j, quicktype::JsonQuery& _x) {
        _x.set_order( _j.at("order").get<std::vector<quicktype::Order>>() );
    }

    inline void to_json(json& _j, const quicktype::JsonQuery& _x) {
        _j = json::object();
        _j["order"] = _x.get_order();
    }

    inline void from_json(const json& _j, quicktype::Visible& _x) {
        _x.set_table( quicktype::get_optional<bool>(_j, "table") );
        _x.set_fatrow( quicktype::get_optional<bool>(_j, "fatrow") );
    }

    inline void to_json(json& _j, const quicktype::Visible& _x) {
        _j = json::object();
        _j["table"] = _x.get_table();
        _j["fatrow"] = _x.get_fatrow();
    }

    inline void from_json(const json& _j, quicktype::RenderTypeConfig& _x) {
        _x.set_visible( _j.at("visible").get<quicktype::Visible>() );
    }

    inline void to_json(json& _j, const quicktype::RenderTypeConfig& _x) {
        _j = json::object();
        _j["visible"] = _x.get_visible();
    }

    inline void from_json(const json& _j, quicktype::Field& _x) {
        _x.set_table_column_id( _j.at("tableColumnId").get<int64_t>() );
        _x.set_type( _j.at("type").get<quicktype::FieldType>() );
    }

    inline void to_json(json& _j, const quicktype::Field& _x) {
        _j = json::object();
        _j["tableColumnId"] = _x.get_table_column_id();
        _j["type"] = _x.get_type();
    }

    inline void from_json(const json& _j, quicktype::Row& _x) {
        _x.set_fields( _j.at("fields").get<std::vector<quicktype::Field>>() );
    }

    inline void to_json(json& _j, const quicktype::Row& _x) {
        _j = json::object();
        _j["fields"] = _x.get_fields();
    }

    inline void from_json(const json& _j, quicktype::Styles& _x) {
        _x.set_width( _j.at("width").get<quicktype::Width>() );
    }

    inline void to_json(json& _j, const quicktype::Styles& _x) {
        _j = json::object();
        _j["width"] = _x.get_width();
    }

    inline void from_json(const json& _j, quicktype::Column& _x) {
        _x.set_styles( _j.at("styles").get<quicktype::Styles>() );
        _x.set_rows( _j.at("rows").get<std::vector<quicktype::Row>>() );
    }

    inline void to_json(json& _j, const quicktype::Column& _x) {
        _j = json::object();
        _j["styles"] = _x.get_styles();
        _j["rows"] = _x.get_rows();
    }

    inline void from_json(const json& _j, quicktype::FatRow& _x) {
        _x.set_columns( _j.at("columns").get<std::vector<quicktype::Column>>() );
    }

    inline void to_json(json& _j, const quicktype::FatRow& _x) {
        _j = json::object();
        _j["columns"] = _x.get_columns();
    }

    inline void from_json(const json& _j, quicktype::RichRendererConfigs& _x) {
        _x.set_fat_row( _j.at("fatRow").get<quicktype::FatRow>() );
    }

    inline void to_json(json& _j, const quicktype::RichRendererConfigs& _x) {
        _j = json::object();
        _j["fatRow"] = _x.get_fat_row();
    }

    inline void from_json(const json& _j, quicktype::Metadata& _x) {
        _x.set_json_query( quicktype::get_optional<quicktype::JsonQuery>(_j, "jsonQuery") );
        _x.set_rdf_subject( quicktype::get_optional<std::string>(_j, "rdfSubject") );
        _x.set_rdf_class( quicktype::get_optional<std::string>(_j, "rdfClass") );
        _x.set_row_identifier( quicktype::get_optional<std::string>(_j, "rowIdentifier") );
        _x.set_available_display_types( _j.at("availableDisplayTypes").get<std::vector<quicktype::AvailableDisplayType>>() );
        _x.set_row_label( quicktype::get_optional<std::string>(_j, "rowLabel") );
        _x.set_render_type_config( _j.at("renderTypeConfig").get<quicktype::RenderTypeConfig>() );
        _x.set_rich_renderer_configs( quicktype::get_optional<quicktype::RichRendererConfigs>(_j, "richRendererConfigs") );
        _x.set_custom_fields( quicktype::get_optional<quicktype::CustomFields>(_j, "custom_fields") );
    }

    inline void to_json(json& _j, const quicktype::Metadata& _x) {
        _j = json::object();
        _j["jsonQuery"] = _x.get_json_query();
        _j["rdfSubject"] = _x.get_rdf_subject();
        _j["rdfClass"] = _x.get_rdf_class();
        _j["rowIdentifier"] = _x.get_row_identifier();
        _j["availableDisplayTypes"] = _x.get_available_display_types();
        _j["rowLabel"] = _x.get_row_label();
        _j["renderTypeConfig"] = _x.get_render_type_config();
        _j["richRendererConfigs"] = _x.get_rich_renderer_configs();
        _j["custom_fields"] = _x.get_custom_fields();
    }

    inline void from_json(const json& _j, quicktype::Owner& _x) {
        _x.set_id( _j.at("id").get<std::string>() );
        _x.set_display_name( _j.at("displayName").get<std::string>() );
        _x.set_screen_name( _j.at("screenName").get<std::string>() );
        _x.set_type( _j.at("type").get<quicktype::OwnerType>() );
        _x.set_profile_image_url_large( quicktype::get_optional<std::string>(_j, "profileImageUrlLarge") );
        _x.set_profile_image_url_medium( quicktype::get_optional<std::string>(_j, "profileImageUrlMedium") );
        _x.set_profile_image_url_small( quicktype::get_optional<std::string>(_j, "profileImageUrlSmall") );
    }

    inline void to_json(json& _j, const quicktype::Owner& _x) {
        _j = json::object();
        _j["id"] = _x.get_id();
        _j["displayName"] = _x.get_display_name();
        _j["screenName"] = _x.get_screen_name();
        _j["type"] = _x.get_type();
        _j["profileImageUrlLarge"] = _x.get_profile_image_url_large();
        _j["profileImageUrlMedium"] = _x.get_profile_image_url_medium();
        _j["profileImageUrlSmall"] = _x.get_profile_image_url_small();
    }

    inline void from_json(const json& _j, quicktype::Ratings& _x) {
        _x.set_rating( _j.at("rating").get<int64_t>() );
    }

    inline void to_json(json& _j, const quicktype::Ratings& _x) {
        _j = json::object();
        _j["rating"] = _x.get_rating();
    }

    inline void from_json(const json& _j, quicktype::TableAuthor& _x) {
        _x.set_id( _j.at("id").get<quicktype::Id>() );
        _x.set_display_name( _j.at("displayName").get<quicktype::Name>() );
        _x.set_screen_name( _j.at("screenName").get<quicktype::Name>() );
        _x.set_type( _j.at("type").get<quicktype::OwnerType>() );
    }

    inline void to_json(json& _j, const quicktype::TableAuthor& _x) {
        _j = json::object();
        _j["id"] = _x.get_id();
        _j["displayName"] = _x.get_display_name();
        _j["screenName"] = _x.get_screen_name();
        _j["type"] = _x.get_type();
    }

    inline void from_json(const json& _j, quicktype::ConsumerComplaint& _x) {
        _x.set_id( _j.at("id").get<std::string>() );
        _x.set_name( _j.at("name").get<std::string>() );
        _x.set_average_rating( _j.at("averageRating").get<int64_t>() );
        _x.set_created_at( _j.at("createdAt").get<int64_t>() );
        _x.set_description( _j.at("description").get<std::string>() );
        _x.set_display_type( _j.at("displayType").get<quicktype::DisplayType>() );
        _x.set_download_count( _j.at("downloadCount").get<int64_t>() );
        _x.set_hide_from_catalog( _j.at("hideFromCatalog").get<bool>() );
        _x.set_hide_from_data_json( _j.at("hideFromDataJson").get<bool>() );
        _x.set_index_updated_at( quicktype::get_optional<int64_t>(_j, "indexUpdatedAt") );
        _x.set_new_backend( _j.at("newBackend").get<bool>() );
        _x.set_number_of_comments( _j.at("numberOfComments").get<int64_t>() );
        _x.set_oid( _j.at("oid").get<int64_t>() );
        _x.set_provenance( _j.at("provenance").get<quicktype::Provenance>() );
        _x.set_publication_append_enabled( _j.at("publicationAppendEnabled").get<bool>() );
        _x.set_publication_date( _j.at("publicationDate").get<int64_t>() );
        _x.set_publication_group( _j.at("publicationGroup").get<int64_t>() );
        _x.set_publication_stage( _j.at("publicationStage").get<quicktype::PublicationStage>() );
        _x.set_row_class( quicktype::get_optional<std::string>(_j, "rowClass") );
        _x.set_rows_updated_at( _j.at("rowsUpdatedAt").get<int64_t>() );
        _x.set_rows_updated_by( _j.at("rowsUpdatedBy").get<quicktype::RowsUpdatedBy>() );
        _x.set_table_id( _j.at("tableId").get<int64_t>() );
        _x.set_total_times_rated( _j.at("totalTimesRated").get<int64_t>() );
        _x.set_view_count( _j.at("viewCount").get<int64_t>() );
        _x.set_view_last_modified( _j.at("viewLastModified").get<int64_t>() );
        _x.set_view_type( _j.at("viewType").get<quicktype::ViewType>() );
        _x.set_grants( _j.at("grants").get<std::vector<quicktype::Grant>>() );
        _x.set_metadata( _j.at("metadata").get<quicktype::Metadata>() );
        _x.set_owner( _j.at("owner").get<quicktype::Owner>() );
        _x.set_ratings( quicktype::get_optional<quicktype::Ratings>(_j, "ratings") );
        _x.set_rights( _j.at("rights").get<std::vector<quicktype::Right>>() );
        _x.set_table_author( _j.at("tableAuthor").get<quicktype::TableAuthor>() );
        _x.set_flags( quicktype::get_optional<std::vector<quicktype::ConsumerComplaintFlag>>(_j, "flags") );
        _x.set_moderation_status( quicktype::get_optional<bool>(_j, "moderationStatus") );
        _x.set_category( quicktype::get_optional<std::string>(_j, "category") );
        _x.set_tags( quicktype::get_optional<std::vector<std::string>>(_j, "tags") );
        _x.set_modifying_view_uid( quicktype::get_optional<quicktype::ModifyingViewUid>(_j, "modifyingViewUid") );
    }

    inline void to_json(json& _j, const quicktype::ConsumerComplaint& _x) {
        _j = json::object();
        _j["id"] = _x.get_id();
        _j["name"] = _x.get_name();
        _j["averageRating"] = _x.get_average_rating();
        _j["createdAt"] = _x.get_created_at();
        _j["description"] = _x.get_description();
        _j["displayType"] = _x.get_display_type();
        _j["downloadCount"] = _x.get_download_count();
        _j["hideFromCatalog"] = _x.get_hide_from_catalog();
        _j["hideFromDataJson"] = _x.get_hide_from_data_json();
        _j["indexUpdatedAt"] = _x.get_index_updated_at();
        _j["newBackend"] = _x.get_new_backend();
        _j["numberOfComments"] = _x.get_number_of_comments();
        _j["oid"] = _x.get_oid();
        _j["provenance"] = _x.get_provenance();
        _j["publicationAppendEnabled"] = _x.get_publication_append_enabled();
        _j["publicationDate"] = _x.get_publication_date();
        _j["publicationGroup"] = _x.get_publication_group();
        _j["publicationStage"] = _x.get_publication_stage();
        _j["rowClass"] = _x.get_row_class();
        _j["rowsUpdatedAt"] = _x.get_rows_updated_at();
        _j["rowsUpdatedBy"] = _x.get_rows_updated_by();
        _j["tableId"] = _x.get_table_id();
        _j["totalTimesRated"] = _x.get_total_times_rated();
        _j["viewCount"] = _x.get_view_count();
        _j["viewLastModified"] = _x.get_view_last_modified();
        _j["viewType"] = _x.get_view_type();
        _j["grants"] = _x.get_grants();
        _j["metadata"] = _x.get_metadata();
        _j["owner"] = _x.get_owner();
        _j["ratings"] = _x.get_ratings();
        _j["rights"] = _x.get_rights();
        _j["tableAuthor"] = _x.get_table_author();
        _j["flags"] = _x.get_flags();
        _j["moderationStatus"] = _x.get_moderation_status();
        _j["category"] = _x.get_category();
        _j["tags"] = _x.get_tags();
        _j["modifyingViewUid"] = _x.get_modifying_view_uid();
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
