# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   consumer_complaints = ConsumerComplaints.from_json! "[…]"
#   puts consumer_complaints.first.tags&.first
#
# If from_json! succeeds, the value returned matches the schema.

require 'json'
require 'dry-types'
require 'dry-struct'

module Types
  include Dry::Types.module

  Int                   = Strict::Int
  Bool                  = Strict::Bool
  Hash                  = Strict::Hash
  String                = Strict::String
  DisplayType           = Strict::String.enum("fatrow", "table")
  ConsumerComplaintFlag = Strict::String.enum("default", "restorable", "restorePossibleForType")
  GrantFlag             = Strict::String.enum("public")
  GrantType             = Strict::String.enum("viewer")
  AvailableDisplayType  = Strict::String.enum("fatrow", "page", "table")
  FieldType             = Strict::String.enum("columnData", "columnLabel")
  Width                 = Strict::String.enum("27%", "30%", "31%", "33%", "40%")
  ModifyingViewUid      = Strict::String.enum("s6ew-h6mp")
  OwnerType             = Strict::String.enum("interactive")
  Provenance            = Strict::String.enum("official")
  PublicationStage      = Strict::String.enum("published")
  Right                 = Strict::String.enum("read")
  RowsUpdatedBy         = Strict::String.enum("pjxg-ve4m", "54a3-qyun", "9e3m-2843", "vvca-fr6g")
  Name                  = Strict::String.enum("Dan Munz", "Doug Taylor", "ming", "Shannon Files")
  ID                    = Strict::String.enum("pjxg-ve4m", "54a3-qyun", "9e3m-2843", "9eki-h2hn")
  ViewType              = Strict::String.enum("tabular")
end

module DisplayType
  Fatrow = "fatrow"
  Table  = "table"
end

module ConsumerComplaintFlag
  Default                = "default"
  Restorable             = "restorable"
  RestorePossibleForType = "restorePossibleForType"
end

module GrantFlag
  Public = "public"
end

module GrantType
  Viewer = "viewer"
end

class Grant < Dry::Struct
  attribute :inherited,  Types::Bool
  attribute :grant_type, Types::GrantType
  attribute :flags,      Types.Array(Types::GrantFlag)

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      inherited:  d.fetch("inherited"),
      grant_type: d.fetch("type"),
      flags:      d.fetch("flags"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "inherited" => @inherited,
      "type"      => @grant_type,
      "flags"     => @flags,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

module AvailableDisplayType
  Fatrow = "fatrow"
  Page   = "page"
  Table  = "table"
end

class Test < Dry::Struct
  attribute :cfpb1, Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      cfpb1: d.fetch("CFPB1"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "CFPB1" => @cfpb1,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class CustomFields < Dry::Struct
  attribute :custom_fields_test, Test

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      custom_fields_test: Test.from_dynamic!(d.fetch("TEST")),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "TEST" => @custom_fields_test.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Order < Dry::Struct
  attribute :ascending,         Types::Bool
  attribute :column_field_name, Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      ascending:         d.fetch("ascending"),
      column_field_name: d.fetch("columnFieldName"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "ascending"       => @ascending,
      "columnFieldName" => @column_field_name,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class JSONQuery < Dry::Struct
  attribute :order, Types.Array(Order)

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      order: d.fetch("order").map { |x| Order.from_dynamic!(x) },
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "order" => @order.map { |x| x.to_dynamic },
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Visible < Dry::Struct
  attribute :table,  Types::Bool.optional
  attribute :fatrow, Types::Bool.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      table:  d["table"],
      fatrow: d["fatrow"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "table"  => @table,
      "fatrow" => @fatrow,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class RenderTypeConfig < Dry::Struct
  attribute :visible, Visible

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      visible: Visible.from_dynamic!(d.fetch("visible")),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "visible" => @visible.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

module FieldType
  ColumnData  = "columnData"
  ColumnLabel = "columnLabel"
end

class Field < Dry::Struct
  attribute :table_column_id, Types::Int
  attribute :field_type,      Types::FieldType

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      table_column_id: d.fetch("tableColumnId"),
      field_type:      d.fetch("type"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "tableColumnId" => @table_column_id,
      "type"          => @field_type,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Row < Dry::Struct
  attribute :fields, Types.Array(Field)

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      fields: d.fetch("fields").map { |x| Field.from_dynamic!(x) },
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "fields" => @fields.map { |x| x.to_dynamic },
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

module Width
  The27 = "27%"
  The30 = "30%"
  The31 = "31%"
  The33 = "33%"
  The40 = "40%"
end

class Styles < Dry::Struct
  attribute :width, Types::Width

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      width: d.fetch("width"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "width" => @width,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Column < Dry::Struct
  attribute :styles, Styles
  attribute :rows,   Types.Array(Row)

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      styles: Styles.from_dynamic!(d.fetch("styles")),
      rows:   d.fetch("rows").map { |x| Row.from_dynamic!(x) },
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "styles" => @styles.to_dynamic,
      "rows"   => @rows.map { |x| x.to_dynamic },
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class FatRow < Dry::Struct
  attribute :columns, Types.Array(Column)

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      columns: d.fetch("columns").map { |x| Column.from_dynamic!(x) },
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "columns" => @columns.map { |x| x.to_dynamic },
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class RichRendererConfigs < Dry::Struct
  attribute :fat_row, FatRow

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      fat_row: FatRow.from_dynamic!(d.fetch("fatRow")),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "fatRow" => @fat_row.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Metadata < Dry::Struct
  attribute :json_query,              JSONQuery.optional
  attribute :rdf_subject,             Types::String.optional
  attribute :rdf_class,               Types::String.optional
  attribute :row_identifier,          Types::String.optional
  attribute :available_display_types, Types.Array(Types::AvailableDisplayType)
  attribute :row_label,               Types::String.optional
  attribute :render_type_config,      RenderTypeConfig
  attribute :rich_renderer_configs,   RichRendererConfigs.optional
  attribute :custom_fields,           CustomFields.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      json_query:              d["jsonQuery"] ? JSONQuery.from_dynamic!(d["jsonQuery"]) : nil,
      rdf_subject:             d["rdfSubject"],
      rdf_class:               d["rdfClass"],
      row_identifier:          d["rowIdentifier"],
      available_display_types: d.fetch("availableDisplayTypes"),
      row_label:               d["rowLabel"],
      render_type_config:      RenderTypeConfig.from_dynamic!(d.fetch("renderTypeConfig")),
      rich_renderer_configs:   d["richRendererConfigs"] ? RichRendererConfigs.from_dynamic!(d["richRendererConfigs"]) : nil,
      custom_fields:           d["custom_fields"] ? CustomFields.from_dynamic!(d["custom_fields"]) : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "jsonQuery"             => @json_query&.to_dynamic,
      "rdfSubject"            => @rdf_subject,
      "rdfClass"              => @rdf_class,
      "rowIdentifier"         => @row_identifier,
      "availableDisplayTypes" => @available_display_types,
      "rowLabel"              => @row_label,
      "renderTypeConfig"      => @render_type_config.to_dynamic,
      "richRendererConfigs"   => @rich_renderer_configs&.to_dynamic,
      "custom_fields"         => @custom_fields&.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

module ModifyingViewUid
  S6EwH6Mp = "s6ew-h6mp"
end

module OwnerType
  Interactive = "interactive"
end

class Owner < Dry::Struct
  attribute :id,                       Types::String
  attribute :display_name,             Types::String
  attribute :screen_name,              Types::String
  attribute :owner_type,               Types::OwnerType
  attribute :profile_image_url_large,  Types::String.optional
  attribute :profile_image_url_medium, Types::String.optional
  attribute :profile_image_url_small,  Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      id:                       d.fetch("id"),
      display_name:             d.fetch("displayName"),
      screen_name:              d.fetch("screenName"),
      owner_type:               d.fetch("type"),
      profile_image_url_large:  d["profileImageUrlLarge"],
      profile_image_url_medium: d["profileImageUrlMedium"],
      profile_image_url_small:  d["profileImageUrlSmall"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "id"                    => @id,
      "displayName"           => @display_name,
      "screenName"            => @screen_name,
      "type"                  => @owner_type,
      "profileImageUrlLarge"  => @profile_image_url_large,
      "profileImageUrlMedium" => @profile_image_url_medium,
      "profileImageUrlSmall"  => @profile_image_url_small,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

module Provenance
  Official = "official"
end

module PublicationStage
  Published = "published"
end

class Ratings < Dry::Struct
  attribute :rating, Types::Int

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      rating: d.fetch("rating"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "rating" => @rating,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

module Right
  Read = "read"
end

module RowsUpdatedBy
  PjxgVe4M    = "pjxg-ve4m"
  The54A3Qyun = "54a3-qyun"
  The9E3M2843 = "9e3m-2843"
  VvcaFr6G    = "vvca-fr6g"
end

module Name
  DanMunz      = "Dan Munz"
  DougTaylor   = "Doug Taylor"
  Ming         = "ming"
  ShannonFiles = "Shannon Files"
end

module ID
  PjxgVe4M    = "pjxg-ve4m"
  The54A3Qyun = "54a3-qyun"
  The9E3M2843 = "9e3m-2843"
  The9EkiH2Hn = "9eki-h2hn"
end

class TableAuthor < Dry::Struct
  attribute :id,                Types::ID
  attribute :display_name,      Types::Name
  attribute :screen_name,       Types::Name
  attribute :table_author_type, Types::OwnerType

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      id:                d.fetch("id"),
      display_name:      d.fetch("displayName"),
      screen_name:       d.fetch("screenName"),
      table_author_type: d.fetch("type"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "id"          => @id,
      "displayName" => @display_name,
      "screenName"  => @screen_name,
      "type"        => @table_author_type,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

module ViewType
  Tabular = "tabular"
end

class ConsumerComplaint < Dry::Struct
  attribute :id,                         Types::String
  attribute :consumer_complaint_name,    Types::String
  attribute :average_rating,             Types::Int
  attribute :created_at,                 Types::Int
  attribute :description,                Types::String
  attribute :display_type,               Types::DisplayType
  attribute :download_count,             Types::Int
  attribute :hide_from_catalog,          Types::Bool
  attribute :hide_from_data_json,        Types::Bool
  attribute :index_updated_at,           Types::Int.optional
  attribute :new_backend,                Types::Bool
  attribute :number_of_comments,         Types::Int
  attribute :oid,                        Types::Int
  attribute :provenance,                 Types::Provenance
  attribute :publication_append_enabled, Types::Bool
  attribute :publication_date,           Types::Int
  attribute :publication_group,          Types::Int
  attribute :publication_stage,          Types::PublicationStage
  attribute :row_class,                  Types::String.optional
  attribute :rows_updated_at,            Types::Int
  attribute :rows_updated_by,            Types::RowsUpdatedBy
  attribute :table_id,                   Types::Int
  attribute :total_times_rated,          Types::Int
  attribute :view_count,                 Types::Int
  attribute :view_last_modified,         Types::Int
  attribute :view_type,                  Types::ViewType
  attribute :grants,                     Types.Array(Grant)
  attribute :metadata,                   Metadata
  attribute :owner,                      Owner
  attribute :ratings,                    Ratings.optional
  attribute :rights,                     Types.Array(Types::Right)
  attribute :table_author,               TableAuthor
  attribute :flags,                      Types.Array(Types::ConsumerComplaintFlag).optional
  attribute :moderation_status,          Types::Bool.optional
  attribute :category,                   Types::String.optional
  attribute :tags,                       Types.Array(Types::String).optional
  attribute :modifying_view_uid,         Types::ModifyingViewUid.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      id:                         d.fetch("id"),
      consumer_complaint_name:    d.fetch("name"),
      average_rating:             d.fetch("averageRating"),
      created_at:                 d.fetch("createdAt"),
      description:                d.fetch("description"),
      display_type:               d.fetch("displayType"),
      download_count:             d.fetch("downloadCount"),
      hide_from_catalog:          d.fetch("hideFromCatalog"),
      hide_from_data_json:        d.fetch("hideFromDataJson"),
      index_updated_at:           d["indexUpdatedAt"],
      new_backend:                d.fetch("newBackend"),
      number_of_comments:         d.fetch("numberOfComments"),
      oid:                        d.fetch("oid"),
      provenance:                 d.fetch("provenance"),
      publication_append_enabled: d.fetch("publicationAppendEnabled"),
      publication_date:           d.fetch("publicationDate"),
      publication_group:          d.fetch("publicationGroup"),
      publication_stage:          d.fetch("publicationStage"),
      row_class:                  d["rowClass"],
      rows_updated_at:            d.fetch("rowsUpdatedAt"),
      rows_updated_by:            d.fetch("rowsUpdatedBy"),
      table_id:                   d.fetch("tableId"),
      total_times_rated:          d.fetch("totalTimesRated"),
      view_count:                 d.fetch("viewCount"),
      view_last_modified:         d.fetch("viewLastModified"),
      view_type:                  d.fetch("viewType"),
      grants:                     d.fetch("grants").map { |x| Grant.from_dynamic!(x) },
      metadata:                   Metadata.from_dynamic!(d.fetch("metadata")),
      owner:                      Owner.from_dynamic!(d.fetch("owner")),
      ratings:                    d["ratings"] ? Ratings.from_dynamic!(d["ratings"]) : nil,
      rights:                     d.fetch("rights"),
      table_author:               TableAuthor.from_dynamic!(d.fetch("tableAuthor")),
      flags:                      d["flags"],
      moderation_status:          d["moderationStatus"],
      category:                   d["category"],
      tags:                       d["tags"],
      modifying_view_uid:         d["modifyingViewUid"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "id"                       => @id,
      "name"                     => @consumer_complaint_name,
      "averageRating"            => @average_rating,
      "createdAt"                => @created_at,
      "description"              => @description,
      "displayType"              => @display_type,
      "downloadCount"            => @download_count,
      "hideFromCatalog"          => @hide_from_catalog,
      "hideFromDataJson"         => @hide_from_data_json,
      "indexUpdatedAt"           => @index_updated_at,
      "newBackend"               => @new_backend,
      "numberOfComments"         => @number_of_comments,
      "oid"                      => @oid,
      "provenance"               => @provenance,
      "publicationAppendEnabled" => @publication_append_enabled,
      "publicationDate"          => @publication_date,
      "publicationGroup"         => @publication_group,
      "publicationStage"         => @publication_stage,
      "rowClass"                 => @row_class,
      "rowsUpdatedAt"            => @rows_updated_at,
      "rowsUpdatedBy"            => @rows_updated_by,
      "tableId"                  => @table_id,
      "totalTimesRated"          => @total_times_rated,
      "viewCount"                => @view_count,
      "viewLastModified"         => @view_last_modified,
      "viewType"                 => @view_type,
      "grants"                   => @grants.map { |x| x.to_dynamic },
      "metadata"                 => @metadata.to_dynamic,
      "owner"                    => @owner.to_dynamic,
      "ratings"                  => @ratings&.to_dynamic,
      "rights"                   => @rights,
      "tableAuthor"              => @table_author.to_dynamic,
      "flags"                    => @flags,
      "moderationStatus"         => @moderation_status,
      "category"                 => @category,
      "tags"                     => @tags,
      "modifyingViewUid"         => @modifying_view_uid,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class ConsumerComplaints
  def self.from_json!(json)
    consumer_complaints = JSON.parse(json, quirks_mode: true).map { |x| ConsumerComplaint.from_dynamic!(x) }
    consumer_complaints.define_singleton_method(:to_json) do
      JSON.generate(self.map { |x| x.to_dynamic })
    end
    consumer_complaints
  end
end
