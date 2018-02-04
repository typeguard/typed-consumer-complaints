// To parse this JSON data, add NuGet 'Newtonsoft.Json' then do:
//
//    using QuickType;
//
//    var data = ConsumerComplaints.FromJson(jsonString);

namespace QuickType
{
    using System;
    using System.Net;
    using System.Collections.Generic;

    using Newtonsoft.Json;

    public partial class ConsumerComplaints
    {
        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("averageRating")]
        public long AverageRating { get; set; }

        [JsonProperty("createdAt")]
        public long CreatedAt { get; set; }

        [JsonProperty("description")]
        public string Description { get; set; }

        [JsonProperty("displayType")]
        public DisplayType DisplayType { get; set; }

        [JsonProperty("downloadCount")]
        public long DownloadCount { get; set; }

        [JsonProperty("hideFromCatalog")]
        public bool HideFromCatalog { get; set; }

        [JsonProperty("hideFromDataJson")]
        public bool HideFromDataJson { get; set; }

        [JsonProperty("indexUpdatedAt")]
        public long? IndexUpdatedAt { get; set; }

        [JsonProperty("newBackend")]
        public bool NewBackend { get; set; }

        [JsonProperty("numberOfComments")]
        public long NumberOfComments { get; set; }

        [JsonProperty("oid")]
        public long Oid { get; set; }

        [JsonProperty("provenance")]
        public Provenance Provenance { get; set; }

        [JsonProperty("publicationAppendEnabled")]
        public bool PublicationAppendEnabled { get; set; }

        [JsonProperty("publicationDate")]
        public long PublicationDate { get; set; }

        [JsonProperty("publicationGroup")]
        public long PublicationGroup { get; set; }

        [JsonProperty("publicationStage")]
        public PublicationStage PublicationStage { get; set; }

        [JsonProperty("rowClass")]
        public string RowClass { get; set; }

        [JsonProperty("rowsUpdatedAt")]
        public long RowsUpdatedAt { get; set; }

        [JsonProperty("rowsUpdatedBy")]
        public RowsUpdatedBy RowsUpdatedBy { get; set; }

        [JsonProperty("tableId")]
        public long TableId { get; set; }

        [JsonProperty("totalTimesRated")]
        public long TotalTimesRated { get; set; }

        [JsonProperty("viewCount")]
        public long ViewCount { get; set; }

        [JsonProperty("viewLastModified")]
        public long ViewLastModified { get; set; }

        [JsonProperty("viewType")]
        public ViewType ViewType { get; set; }

        [JsonProperty("grants")]
        public Grant[] Grants { get; set; }

        [JsonProperty("metadata")]
        public Metadata Metadata { get; set; }

        [JsonProperty("owner")]
        public Owner Owner { get; set; }

        [JsonProperty("ratings")]
        public Ratings Ratings { get; set; }

        [JsonProperty("rights")]
        public Right[] Rights { get; set; }

        [JsonProperty("tableAuthor")]
        public TableAuthor TableAuthor { get; set; }

        [JsonProperty("flags")]
        public ConsumerComplaintFlag[] Flags { get; set; }

        [JsonProperty("moderationStatus")]
        public bool? ModerationStatus { get; set; }

        [JsonProperty("category")]
        public string Category { get; set; }

        [JsonProperty("tags")]
        public string[] Tags { get; set; }

        [JsonProperty("modifyingViewUid")]
        public ModifyingViewUid? ModifyingViewUid { get; set; }
    }

    public partial class Grant
    {
        [JsonProperty("inherited")]
        public bool Inherited { get; set; }

        [JsonProperty("type")]
        public GrantType PurpleType { get; set; }

        [JsonProperty("flags")]
        public GrantFlag[] Flags { get; set; }
    }

    public partial class Metadata
    {
        [JsonProperty("jsonQuery")]
        public JsonQuery JsonQuery { get; set; }

        [JsonProperty("rdfSubject")]
        public RdfSubject? RdfSubject { get; set; }

        [JsonProperty("rdfClass")]
        public string RdfClass { get; set; }

        [JsonProperty("rowIdentifier")]
        public string RowIdentifier { get; set; }

        [JsonProperty("availableDisplayTypes")]
        public AvailableDisplayType[] AvailableDisplayTypes { get; set; }

        [JsonProperty("rowLabel")]
        public string RowLabel { get; set; }

        [JsonProperty("renderTypeConfig")]
        public RenderTypeConfig RenderTypeConfig { get; set; }

        [JsonProperty("richRendererConfigs")]
        public RichRendererConfigs RichRendererConfigs { get; set; }

        [JsonProperty("custom_fields")]
        public CustomFields CustomFields { get; set; }
    }

    public partial class CustomFields
    {
        [JsonProperty("TEST")]
        public Test Test { get; set; }
    }

    public partial class Test
    {
        [JsonProperty("CFPB1")]
        public string Cfpb1 { get; set; }
    }

    public partial class JsonQuery
    {
        [JsonProperty("order")]
        public Order[] Order { get; set; }

        [JsonProperty("select")]
        public Select[] Select { get; set; }

        [JsonProperty("group")]
        public Group[] Group { get; set; }
    }

    public partial class Group
    {
        [JsonProperty("columnFieldName")]
        public string ColumnFieldName { get; set; }
    }

    public partial class Order
    {
        [JsonProperty("ascending")]
        public bool Ascending { get; set; }

        [JsonProperty("columnFieldName")]
        public string ColumnFieldName { get; set; }
    }

    public partial class Select
    {
        [JsonProperty("columnFieldName")]
        public string ColumnFieldName { get; set; }

        [JsonProperty("aggregate")]
        public string Aggregate { get; set; }
    }

    public partial class RenderTypeConfig
    {
        [JsonProperty("visible")]
        public Visible Visible { get; set; }
    }

    public partial class Visible
    {
        [JsonProperty("table")]
        public bool? Table { get; set; }

        [JsonProperty("fatrow")]
        public bool? Fatrow { get; set; }
    }

    public partial class RichRendererConfigs
    {
        [JsonProperty("fatRow")]
        public FatRow FatRow { get; set; }
    }

    public partial class FatRow
    {
        [JsonProperty("columns")]
        public Column[] Columns { get; set; }
    }

    public partial class Column
    {
        [JsonProperty("styles")]
        public Styles Styles { get; set; }

        [JsonProperty("rows")]
        public Row[] Rows { get; set; }
    }

    public partial class Row
    {
        [JsonProperty("fields")]
        public Field[] Fields { get; set; }
    }

    public partial class Field
    {
        [JsonProperty("tableColumnId")]
        public long TableColumnId { get; set; }

        [JsonProperty("type")]
        public FieldType PurpleType { get; set; }
    }

    public partial class Styles
    {
        [JsonProperty("width")]
        public Width Width { get; set; }
    }

    public partial class Owner
    {
        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("displayName")]
        public string DisplayName { get; set; }

        [JsonProperty("screenName")]
        public string ScreenName { get; set; }

        [JsonProperty("type")]
        public OwnerType PurpleType { get; set; }

        [JsonProperty("flags")]
        public OwnerFlag[] Flags { get; set; }

        [JsonProperty("profileImageUrlLarge")]
        public string ProfileImageUrlLarge { get; set; }

        [JsonProperty("profileImageUrlMedium")]
        public string ProfileImageUrlMedium { get; set; }

        [JsonProperty("profileImageUrlSmall")]
        public string ProfileImageUrlSmall { get; set; }
    }

    public partial class Ratings
    {
        [JsonProperty("rating")]
        public long Rating { get; set; }
    }

    public partial class TableAuthor
    {
        [JsonProperty("id")]
        public Id Id { get; set; }

        [JsonProperty("displayName")]
        public Name DisplayName { get; set; }

        [JsonProperty("screenName")]
        public Name ScreenName { get; set; }

        [JsonProperty("type")]
        public OwnerType PurpleType { get; set; }

        [JsonProperty("flags")]
        public OwnerFlag[] Flags { get; set; }
    }

    public enum DisplayType { Fatrow, Table };

    public enum ConsumerComplaintFlag { Default, Restorable, RestorePossibleForType };

    public enum GrantFlag { Public };

    public enum GrantType { Viewer };

    public enum AvailableDisplayType { Fatrow, Page, Table };

    public enum RdfSubject { The0 };

    public enum FieldType { ColumnData, ColumnLabel };

    public enum Width { The27, The30, The31, The33, The40 };

    public enum ModifyingViewUid { S6EwH6Mp };

    public enum OwnerFlag { OrganizationMember };

    public enum OwnerType { Interactive };

    public enum Provenance { Official };

    public enum PublicationStage { Published };

    public enum Right { Read };

    public enum RowsUpdatedBy { PjxgVe4M, The54A3Qyun, The9E3M2843, VvcaFr6G };

    public enum Name { DanMunz, DougTaylor, Ming, ShannonFiles };

    public enum Id { PjxgVe4M, The54A3Qyun, The9E3M2843, The9EkiH2Hn };

    public enum ViewType { Tabular };

    public partial class ConsumerComplaints
    {
        public static ConsumerComplaints[] FromJson(string json) => JsonConvert.DeserializeObject<ConsumerComplaints[]>(json, Converter.Settings);
    }

    static class DisplayTypeExtensions
    {
        public static DisplayType? ValueForString(string str)
        {
            switch (str)
            {
                case "fatrow": return DisplayType.Fatrow;
                case "table": return DisplayType.Table;
                default: return null;
            }
        }

        public static DisplayType ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this DisplayType value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case DisplayType.Fatrow: serializer.Serialize(writer, "fatrow"); break;
                case DisplayType.Table: serializer.Serialize(writer, "table"); break;
            }
        }
    }

    static class ConsumerComplaintFlagExtensions
    {
        public static ConsumerComplaintFlag? ValueForString(string str)
        {
            switch (str)
            {
                case "default": return ConsumerComplaintFlag.Default;
                case "restorable": return ConsumerComplaintFlag.Restorable;
                case "restorePossibleForType": return ConsumerComplaintFlag.RestorePossibleForType;
                default: return null;
            }
        }

        public static ConsumerComplaintFlag ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this ConsumerComplaintFlag value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case ConsumerComplaintFlag.Default: serializer.Serialize(writer, "default"); break;
                case ConsumerComplaintFlag.Restorable: serializer.Serialize(writer, "restorable"); break;
                case ConsumerComplaintFlag.RestorePossibleForType: serializer.Serialize(writer, "restorePossibleForType"); break;
            }
        }
    }

    static class GrantFlagExtensions
    {
        public static GrantFlag? ValueForString(string str)
        {
            switch (str)
            {
                case "public": return GrantFlag.Public;
                default: return null;
            }
        }

        public static GrantFlag ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this GrantFlag value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case GrantFlag.Public: serializer.Serialize(writer, "public"); break;
            }
        }
    }

    static class GrantTypeExtensions
    {
        public static GrantType? ValueForString(string str)
        {
            switch (str)
            {
                case "viewer": return GrantType.Viewer;
                default: return null;
            }
        }

        public static GrantType ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this GrantType value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case GrantType.Viewer: serializer.Serialize(writer, "viewer"); break;
            }
        }
    }

    static class AvailableDisplayTypeExtensions
    {
        public static AvailableDisplayType? ValueForString(string str)
        {
            switch (str)
            {
                case "fatrow": return AvailableDisplayType.Fatrow;
                case "page": return AvailableDisplayType.Page;
                case "table": return AvailableDisplayType.Table;
                default: return null;
            }
        }

        public static AvailableDisplayType ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this AvailableDisplayType value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case AvailableDisplayType.Fatrow: serializer.Serialize(writer, "fatrow"); break;
                case AvailableDisplayType.Page: serializer.Serialize(writer, "page"); break;
                case AvailableDisplayType.Table: serializer.Serialize(writer, "table"); break;
            }
        }
    }

    static class RdfSubjectExtensions
    {
        public static RdfSubject? ValueForString(string str)
        {
            switch (str)
            {
                case "0": return RdfSubject.The0;
                default: return null;
            }
        }

        public static RdfSubject ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this RdfSubject value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case RdfSubject.The0: serializer.Serialize(writer, "0"); break;
            }
        }
    }

    static class FieldTypeExtensions
    {
        public static FieldType? ValueForString(string str)
        {
            switch (str)
            {
                case "columnData": return FieldType.ColumnData;
                case "columnLabel": return FieldType.ColumnLabel;
                default: return null;
            }
        }

        public static FieldType ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this FieldType value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case FieldType.ColumnData: serializer.Serialize(writer, "columnData"); break;
                case FieldType.ColumnLabel: serializer.Serialize(writer, "columnLabel"); break;
            }
        }
    }

    static class WidthExtensions
    {
        public static Width? ValueForString(string str)
        {
            switch (str)
            {
                case "27%": return Width.The27;
                case "30%": return Width.The30;
                case "31%": return Width.The31;
                case "33%": return Width.The33;
                case "40%": return Width.The40;
                default: return null;
            }
        }

        public static Width ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this Width value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case Width.The27: serializer.Serialize(writer, "27%"); break;
                case Width.The30: serializer.Serialize(writer, "30%"); break;
                case Width.The31: serializer.Serialize(writer, "31%"); break;
                case Width.The33: serializer.Serialize(writer, "33%"); break;
                case Width.The40: serializer.Serialize(writer, "40%"); break;
            }
        }
    }

    static class ModifyingViewUidExtensions
    {
        public static ModifyingViewUid? ValueForString(string str)
        {
            switch (str)
            {
                case "s6ew-h6mp": return ModifyingViewUid.S6EwH6Mp;
                default: return null;
            }
        }

        public static ModifyingViewUid ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this ModifyingViewUid value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case ModifyingViewUid.S6EwH6Mp: serializer.Serialize(writer, "s6ew-h6mp"); break;
            }
        }
    }

    static class OwnerFlagExtensions
    {
        public static OwnerFlag? ValueForString(string str)
        {
            switch (str)
            {
                case "organizationMember": return OwnerFlag.OrganizationMember;
                default: return null;
            }
        }

        public static OwnerFlag ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this OwnerFlag value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case OwnerFlag.OrganizationMember: serializer.Serialize(writer, "organizationMember"); break;
            }
        }
    }

    static class OwnerTypeExtensions
    {
        public static OwnerType? ValueForString(string str)
        {
            switch (str)
            {
                case "interactive": return OwnerType.Interactive;
                default: return null;
            }
        }

        public static OwnerType ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this OwnerType value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case OwnerType.Interactive: serializer.Serialize(writer, "interactive"); break;
            }
        }
    }

    static class ProvenanceExtensions
    {
        public static Provenance? ValueForString(string str)
        {
            switch (str)
            {
                case "official": return Provenance.Official;
                default: return null;
            }
        }

        public static Provenance ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this Provenance value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case Provenance.Official: serializer.Serialize(writer, "official"); break;
            }
        }
    }

    static class PublicationStageExtensions
    {
        public static PublicationStage? ValueForString(string str)
        {
            switch (str)
            {
                case "published": return PublicationStage.Published;
                default: return null;
            }
        }

        public static PublicationStage ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this PublicationStage value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case PublicationStage.Published: serializer.Serialize(writer, "published"); break;
            }
        }
    }

    static class RightExtensions
    {
        public static Right? ValueForString(string str)
        {
            switch (str)
            {
                case "read": return Right.Read;
                default: return null;
            }
        }

        public static Right ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this Right value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case Right.Read: serializer.Serialize(writer, "read"); break;
            }
        }
    }

    static class RowsUpdatedByExtensions
    {
        public static RowsUpdatedBy? ValueForString(string str)
        {
            switch (str)
            {
                case "pjxg-ve4m": return RowsUpdatedBy.PjxgVe4M;
                case "54a3-qyun": return RowsUpdatedBy.The54A3Qyun;
                case "9e3m-2843": return RowsUpdatedBy.The9E3M2843;
                case "vvca-fr6g": return RowsUpdatedBy.VvcaFr6G;
                default: return null;
            }
        }

        public static RowsUpdatedBy ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this RowsUpdatedBy value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case RowsUpdatedBy.PjxgVe4M: serializer.Serialize(writer, "pjxg-ve4m"); break;
                case RowsUpdatedBy.The54A3Qyun: serializer.Serialize(writer, "54a3-qyun"); break;
                case RowsUpdatedBy.The9E3M2843: serializer.Serialize(writer, "9e3m-2843"); break;
                case RowsUpdatedBy.VvcaFr6G: serializer.Serialize(writer, "vvca-fr6g"); break;
            }
        }
    }

    static class NameExtensions
    {
        public static Name? ValueForString(string str)
        {
            switch (str)
            {
                case "Dan Munz": return Name.DanMunz;
                case "Doug Taylor": return Name.DougTaylor;
                case "ming": return Name.Ming;
                case "Shannon Files": return Name.ShannonFiles;
                default: return null;
            }
        }

        public static Name ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this Name value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case Name.DanMunz: serializer.Serialize(writer, "Dan Munz"); break;
                case Name.DougTaylor: serializer.Serialize(writer, "Doug Taylor"); break;
                case Name.Ming: serializer.Serialize(writer, "ming"); break;
                case Name.ShannonFiles: serializer.Serialize(writer, "Shannon Files"); break;
            }
        }
    }

    static class IdExtensions
    {
        public static Id? ValueForString(string str)
        {
            switch (str)
            {
                case "pjxg-ve4m": return Id.PjxgVe4M;
                case "54a3-qyun": return Id.The54A3Qyun;
                case "9e3m-2843": return Id.The9E3M2843;
                case "9eki-h2hn": return Id.The9EkiH2Hn;
                default: return null;
            }
        }

        public static Id ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this Id value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case Id.PjxgVe4M: serializer.Serialize(writer, "pjxg-ve4m"); break;
                case Id.The54A3Qyun: serializer.Serialize(writer, "54a3-qyun"); break;
                case Id.The9E3M2843: serializer.Serialize(writer, "9e3m-2843"); break;
                case Id.The9EkiH2Hn: serializer.Serialize(writer, "9eki-h2hn"); break;
            }
        }
    }

    static class ViewTypeExtensions
    {
        public static ViewType? ValueForString(string str)
        {
            switch (str)
            {
                case "tabular": return ViewType.Tabular;
                default: return null;
            }
        }

        public static ViewType ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this ViewType value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case ViewType.Tabular: serializer.Serialize(writer, "tabular"); break;
            }
        }
    }

    public static class Serialize
    {
        public static string ToJson(this ConsumerComplaints[] self) => JsonConvert.SerializeObject(self, Converter.Settings);
    }

    public class Converter: JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(DisplayType) || t == typeof(ConsumerComplaintFlag) || t == typeof(GrantFlag) || t == typeof(GrantType) || t == typeof(AvailableDisplayType) || t == typeof(RdfSubject) || t == typeof(FieldType) || t == typeof(Width) || t == typeof(ModifyingViewUid) || t == typeof(OwnerFlag) || t == typeof(OwnerType) || t == typeof(Provenance) || t == typeof(PublicationStage) || t == typeof(Right) || t == typeof(RowsUpdatedBy) || t == typeof(Name) || t == typeof(Id) || t == typeof(ViewType) || t == typeof(DisplayType?) || t == typeof(ConsumerComplaintFlag?) || t == typeof(GrantFlag?) || t == typeof(GrantType?) || t == typeof(AvailableDisplayType?) || t == typeof(RdfSubject?) || t == typeof(FieldType?) || t == typeof(Width?) || t == typeof(ModifyingViewUid?) || t == typeof(OwnerFlag?) || t == typeof(OwnerType?) || t == typeof(Provenance?) || t == typeof(PublicationStage?) || t == typeof(Right?) || t == typeof(RowsUpdatedBy?) || t == typeof(Name?) || t == typeof(Id?) || t == typeof(ViewType?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (t == typeof(DisplayType))
                return DisplayTypeExtensions.ReadJson(reader, serializer);
            if (t == typeof(ConsumerComplaintFlag))
                return ConsumerComplaintFlagExtensions.ReadJson(reader, serializer);
            if (t == typeof(GrantFlag))
                return GrantFlagExtensions.ReadJson(reader, serializer);
            if (t == typeof(GrantType))
                return GrantTypeExtensions.ReadJson(reader, serializer);
            if (t == typeof(AvailableDisplayType))
                return AvailableDisplayTypeExtensions.ReadJson(reader, serializer);
            if (t == typeof(RdfSubject))
                return RdfSubjectExtensions.ReadJson(reader, serializer);
            if (t == typeof(FieldType))
                return FieldTypeExtensions.ReadJson(reader, serializer);
            if (t == typeof(Width))
                return WidthExtensions.ReadJson(reader, serializer);
            if (t == typeof(ModifyingViewUid))
                return ModifyingViewUidExtensions.ReadJson(reader, serializer);
            if (t == typeof(OwnerFlag))
                return OwnerFlagExtensions.ReadJson(reader, serializer);
            if (t == typeof(OwnerType))
                return OwnerTypeExtensions.ReadJson(reader, serializer);
            if (t == typeof(Provenance))
                return ProvenanceExtensions.ReadJson(reader, serializer);
            if (t == typeof(PublicationStage))
                return PublicationStageExtensions.ReadJson(reader, serializer);
            if (t == typeof(Right))
                return RightExtensions.ReadJson(reader, serializer);
            if (t == typeof(RowsUpdatedBy))
                return RowsUpdatedByExtensions.ReadJson(reader, serializer);
            if (t == typeof(Name))
                return NameExtensions.ReadJson(reader, serializer);
            if (t == typeof(Id))
                return IdExtensions.ReadJson(reader, serializer);
            if (t == typeof(ViewType))
                return ViewTypeExtensions.ReadJson(reader, serializer);
            if (t == typeof(DisplayType?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return DisplayTypeExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(ConsumerComplaintFlag?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return ConsumerComplaintFlagExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(GrantFlag?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return GrantFlagExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(GrantType?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return GrantTypeExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(AvailableDisplayType?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return AvailableDisplayTypeExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(RdfSubject?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return RdfSubjectExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(FieldType?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return FieldTypeExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(Width?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return WidthExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(ModifyingViewUid?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return ModifyingViewUidExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(OwnerFlag?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return OwnerFlagExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(OwnerType?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return OwnerTypeExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(Provenance?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return ProvenanceExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(PublicationStage?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return PublicationStageExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(Right?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return RightExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(RowsUpdatedBy?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return RowsUpdatedByExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(Name?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return NameExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(Id?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return IdExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(ViewType?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return ViewTypeExtensions.ReadJson(reader, serializer);
            }
            throw new Exception("Unknown type");
        }

        public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
        {
            var t = value.GetType();
            if (t == typeof(DisplayType))
            {
                ((DisplayType)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(ConsumerComplaintFlag))
            {
                ((ConsumerComplaintFlag)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(GrantFlag))
            {
                ((GrantFlag)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(GrantType))
            {
                ((GrantType)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(AvailableDisplayType))
            {
                ((AvailableDisplayType)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(RdfSubject))
            {
                ((RdfSubject)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(FieldType))
            {
                ((FieldType)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(Width))
            {
                ((Width)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(ModifyingViewUid))
            {
                ((ModifyingViewUid)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(OwnerFlag))
            {
                ((OwnerFlag)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(OwnerType))
            {
                ((OwnerType)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(Provenance))
            {
                ((Provenance)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(PublicationStage))
            {
                ((PublicationStage)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(Right))
            {
                ((Right)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(RowsUpdatedBy))
            {
                ((RowsUpdatedBy)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(Name))
            {
                ((Name)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(Id))
            {
                ((Id)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(ViewType))
            {
                ((ViewType)value).WriteJson(writer, serializer);
                return;
            }
            throw new Exception("Unknown type");
        }

        public static readonly JsonSerializerSettings Settings = new JsonSerializerSettings
        {
            MetadataPropertyHandling = MetadataPropertyHandling.Ignore,
            DateParseHandling = DateParseHandling.None,
            Converters = { new Converter() },
        };
    }
}
