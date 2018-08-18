// To parse this JSON data, add NuGet 'Newtonsoft.Json' then do:
//
//    using QuickType;
//
//    var consumerComplaints = ConsumerComplaints.FromJson(jsonString);

namespace QuickType
{
    using System;
    using System.Collections.Generic;

    using System.Globalization;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Converters;

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

        [JsonProperty("indexUpdatedAt", NullValueHandling = NullValueHandling.Ignore)]
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

        [JsonProperty("rowClass", NullValueHandling = NullValueHandling.Ignore)]
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

        [JsonProperty("ratings", NullValueHandling = NullValueHandling.Ignore)]
        public Ratings Ratings { get; set; }

        [JsonProperty("rights")]
        public Right[] Rights { get; set; }

        [JsonProperty("tableAuthor")]
        public TableAuthor TableAuthor { get; set; }

        [JsonProperty("flags", NullValueHandling = NullValueHandling.Ignore)]
        public ConsumerComplaintFlag[] Flags { get; set; }

        [JsonProperty("moderationStatus", NullValueHandling = NullValueHandling.Ignore)]
        public bool? ModerationStatus { get; set; }

        [JsonProperty("category", NullValueHandling = NullValueHandling.Ignore)]
        public string Category { get; set; }

        [JsonProperty("tags", NullValueHandling = NullValueHandling.Ignore)]
        public string[] Tags { get; set; }

        [JsonProperty("modifyingViewUid", NullValueHandling = NullValueHandling.Ignore)]
        public ModifyingViewUid? ModifyingViewUid { get; set; }
    }

    public partial class Grant
    {
        [JsonProperty("inherited")]
        public bool Inherited { get; set; }

        [JsonProperty("type")]
        public GrantType Type { get; set; }

        [JsonProperty("flags")]
        public GrantFlag[] Flags { get; set; }
    }

    public partial class Metadata
    {
        [JsonProperty("jsonQuery", NullValueHandling = NullValueHandling.Ignore)]
        public JsonQuery JsonQuery { get; set; }

        [JsonProperty("rdfSubject", NullValueHandling = NullValueHandling.Ignore)]
        [JsonConverter(typeof(ParseStringConverter))]
        public long? RdfSubject { get; set; }

        [JsonProperty("rdfClass", NullValueHandling = NullValueHandling.Ignore)]
        public string RdfClass { get; set; }

        [JsonProperty("rowIdentifier", NullValueHandling = NullValueHandling.Ignore)]
        [JsonConverter(typeof(ParseStringConverter))]
        public long? RowIdentifier { get; set; }

        [JsonProperty("availableDisplayTypes")]
        public AvailableDisplayType[] AvailableDisplayTypes { get; set; }

        [JsonProperty("rowLabel", NullValueHandling = NullValueHandling.Ignore)]
        public string RowLabel { get; set; }

        [JsonProperty("renderTypeConfig")]
        public RenderTypeConfig RenderTypeConfig { get; set; }

        [JsonProperty("richRendererConfigs", NullValueHandling = NullValueHandling.Ignore)]
        public RichRendererConfigs RichRendererConfigs { get; set; }

        [JsonProperty("custom_fields", NullValueHandling = NullValueHandling.Ignore)]
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
    }

    public partial class Order
    {
        [JsonProperty("ascending")]
        public bool Ascending { get; set; }

        [JsonProperty("columnFieldName")]
        public string ColumnFieldName { get; set; }
    }

    public partial class RenderTypeConfig
    {
        [JsonProperty("visible")]
        public Visible Visible { get; set; }
    }

    public partial class Visible
    {
        [JsonProperty("table", NullValueHandling = NullValueHandling.Ignore)]
        public bool? Table { get; set; }

        [JsonProperty("fatrow", NullValueHandling = NullValueHandling.Ignore)]
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
        public FieldType Type { get; set; }
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
        public OwnerType Type { get; set; }

        [JsonProperty("profileImageUrlLarge", NullValueHandling = NullValueHandling.Ignore)]
        public string ProfileImageUrlLarge { get; set; }

        [JsonProperty("profileImageUrlMedium", NullValueHandling = NullValueHandling.Ignore)]
        public string ProfileImageUrlMedium { get; set; }

        [JsonProperty("profileImageUrlSmall", NullValueHandling = NullValueHandling.Ignore)]
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
        public OwnerType Type { get; set; }
    }

    public enum DisplayType { Fatrow, Table };

    public enum ConsumerComplaintFlag { Default, Restorable, RestorePossibleForType };

    public enum GrantFlag { Public };

    public enum GrantType { Viewer };

    public enum AvailableDisplayType { Fatrow, Page, Table };

    public enum FieldType { ColumnData, ColumnLabel };

    public enum Width { The27, The30, The31, The33, The40 };

    public enum ModifyingViewUid { S6EwH6Mp };

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
        public static ConsumerComplaints[] FromJson(string json) => JsonConvert.DeserializeObject<ConsumerComplaints[]>(json, QuickType.Converter.Settings);
    }

    public static class Serialize
    {
        public static string ToJson(this ConsumerComplaints[] self) => JsonConvert.SerializeObject(self, QuickType.Converter.Settings);
    }

    internal static class Converter
    {
        public static readonly JsonSerializerSettings Settings = new JsonSerializerSettings
        {
            MetadataPropertyHandling = MetadataPropertyHandling.Ignore,
            DateParseHandling = DateParseHandling.None,
            Converters = {
                DisplayTypeConverter.Singleton,
                ConsumerComplaintFlagConverter.Singleton,
                GrantFlagConverter.Singleton,
                GrantTypeConverter.Singleton,
                AvailableDisplayTypeConverter.Singleton,
                FieldTypeConverter.Singleton,
                WidthConverter.Singleton,
                ModifyingViewUidConverter.Singleton,
                OwnerTypeConverter.Singleton,
                ProvenanceConverter.Singleton,
                PublicationStageConverter.Singleton,
                RightConverter.Singleton,
                RowsUpdatedByConverter.Singleton,
                NameConverter.Singleton,
                IdConverter.Singleton,
                ViewTypeConverter.Singleton,
                new IsoDateTimeConverter { DateTimeStyles = DateTimeStyles.AssumeUniversal }
            },
        };
    }

    internal class DisplayTypeConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(DisplayType) || t == typeof(DisplayType?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            switch (value)
            {
                case "fatrow":
                    return DisplayType.Fatrow;
                case "table":
                    return DisplayType.Table;
            }
            throw new Exception("Cannot unmarshal type DisplayType");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (DisplayType)untypedValue;
            switch (value)
            {
                case DisplayType.Fatrow:
                    serializer.Serialize(writer, "fatrow");
                    return;
                case DisplayType.Table:
                    serializer.Serialize(writer, "table");
                    return;
            }
            throw new Exception("Cannot marshal type DisplayType");
        }

        public static readonly DisplayTypeConverter Singleton = new DisplayTypeConverter();
    }

    internal class ConsumerComplaintFlagConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(ConsumerComplaintFlag) || t == typeof(ConsumerComplaintFlag?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            switch (value)
            {
                case "default":
                    return ConsumerComplaintFlag.Default;
                case "restorable":
                    return ConsumerComplaintFlag.Restorable;
                case "restorePossibleForType":
                    return ConsumerComplaintFlag.RestorePossibleForType;
            }
            throw new Exception("Cannot unmarshal type ConsumerComplaintFlag");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (ConsumerComplaintFlag)untypedValue;
            switch (value)
            {
                case ConsumerComplaintFlag.Default:
                    serializer.Serialize(writer, "default");
                    return;
                case ConsumerComplaintFlag.Restorable:
                    serializer.Serialize(writer, "restorable");
                    return;
                case ConsumerComplaintFlag.RestorePossibleForType:
                    serializer.Serialize(writer, "restorePossibleForType");
                    return;
            }
            throw new Exception("Cannot marshal type ConsumerComplaintFlag");
        }

        public static readonly ConsumerComplaintFlagConverter Singleton = new ConsumerComplaintFlagConverter();
    }

    internal class GrantFlagConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(GrantFlag) || t == typeof(GrantFlag?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            if (value == "public")
            {
                return GrantFlag.Public;
            }
            throw new Exception("Cannot unmarshal type GrantFlag");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (GrantFlag)untypedValue;
            if (value == GrantFlag.Public)
            {
                serializer.Serialize(writer, "public");
                return;
            }
            throw new Exception("Cannot marshal type GrantFlag");
        }

        public static readonly GrantFlagConverter Singleton = new GrantFlagConverter();
    }

    internal class GrantTypeConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(GrantType) || t == typeof(GrantType?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            if (value == "viewer")
            {
                return GrantType.Viewer;
            }
            throw new Exception("Cannot unmarshal type GrantType");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (GrantType)untypedValue;
            if (value == GrantType.Viewer)
            {
                serializer.Serialize(writer, "viewer");
                return;
            }
            throw new Exception("Cannot marshal type GrantType");
        }

        public static readonly GrantTypeConverter Singleton = new GrantTypeConverter();
    }

    internal class AvailableDisplayTypeConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(AvailableDisplayType) || t == typeof(AvailableDisplayType?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            switch (value)
            {
                case "fatrow":
                    return AvailableDisplayType.Fatrow;
                case "page":
                    return AvailableDisplayType.Page;
                case "table":
                    return AvailableDisplayType.Table;
            }
            throw new Exception("Cannot unmarshal type AvailableDisplayType");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (AvailableDisplayType)untypedValue;
            switch (value)
            {
                case AvailableDisplayType.Fatrow:
                    serializer.Serialize(writer, "fatrow");
                    return;
                case AvailableDisplayType.Page:
                    serializer.Serialize(writer, "page");
                    return;
                case AvailableDisplayType.Table:
                    serializer.Serialize(writer, "table");
                    return;
            }
            throw new Exception("Cannot marshal type AvailableDisplayType");
        }

        public static readonly AvailableDisplayTypeConverter Singleton = new AvailableDisplayTypeConverter();
    }

    internal class ParseStringConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(long) || t == typeof(long?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            long l;
            if (Int64.TryParse(value, out l))
            {
                return l;
            }
            throw new Exception("Cannot unmarshal type long");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (long)untypedValue;
            serializer.Serialize(writer, value.ToString());
            return;
        }

        public static readonly ParseStringConverter Singleton = new ParseStringConverter();
    }

    internal class FieldTypeConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(FieldType) || t == typeof(FieldType?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            switch (value)
            {
                case "columnData":
                    return FieldType.ColumnData;
                case "columnLabel":
                    return FieldType.ColumnLabel;
            }
            throw new Exception("Cannot unmarshal type FieldType");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (FieldType)untypedValue;
            switch (value)
            {
                case FieldType.ColumnData:
                    serializer.Serialize(writer, "columnData");
                    return;
                case FieldType.ColumnLabel:
                    serializer.Serialize(writer, "columnLabel");
                    return;
            }
            throw new Exception("Cannot marshal type FieldType");
        }

        public static readonly FieldTypeConverter Singleton = new FieldTypeConverter();
    }

    internal class WidthConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(Width) || t == typeof(Width?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            switch (value)
            {
                case "27%":
                    return Width.The27;
                case "30%":
                    return Width.The30;
                case "31%":
                    return Width.The31;
                case "33%":
                    return Width.The33;
                case "40%":
                    return Width.The40;
            }
            throw new Exception("Cannot unmarshal type Width");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (Width)untypedValue;
            switch (value)
            {
                case Width.The27:
                    serializer.Serialize(writer, "27%");
                    return;
                case Width.The30:
                    serializer.Serialize(writer, "30%");
                    return;
                case Width.The31:
                    serializer.Serialize(writer, "31%");
                    return;
                case Width.The33:
                    serializer.Serialize(writer, "33%");
                    return;
                case Width.The40:
                    serializer.Serialize(writer, "40%");
                    return;
            }
            throw new Exception("Cannot marshal type Width");
        }

        public static readonly WidthConverter Singleton = new WidthConverter();
    }

    internal class ModifyingViewUidConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(ModifyingViewUid) || t == typeof(ModifyingViewUid?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            if (value == "s6ew-h6mp")
            {
                return ModifyingViewUid.S6EwH6Mp;
            }
            throw new Exception("Cannot unmarshal type ModifyingViewUid");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (ModifyingViewUid)untypedValue;
            if (value == ModifyingViewUid.S6EwH6Mp)
            {
                serializer.Serialize(writer, "s6ew-h6mp");
                return;
            }
            throw new Exception("Cannot marshal type ModifyingViewUid");
        }

        public static readonly ModifyingViewUidConverter Singleton = new ModifyingViewUidConverter();
    }

    internal class OwnerTypeConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(OwnerType) || t == typeof(OwnerType?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            if (value == "interactive")
            {
                return OwnerType.Interactive;
            }
            throw new Exception("Cannot unmarshal type OwnerType");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (OwnerType)untypedValue;
            if (value == OwnerType.Interactive)
            {
                serializer.Serialize(writer, "interactive");
                return;
            }
            throw new Exception("Cannot marshal type OwnerType");
        }

        public static readonly OwnerTypeConverter Singleton = new OwnerTypeConverter();
    }

    internal class ProvenanceConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(Provenance) || t == typeof(Provenance?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            if (value == "official")
            {
                return Provenance.Official;
            }
            throw new Exception("Cannot unmarshal type Provenance");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (Provenance)untypedValue;
            if (value == Provenance.Official)
            {
                serializer.Serialize(writer, "official");
                return;
            }
            throw new Exception("Cannot marshal type Provenance");
        }

        public static readonly ProvenanceConverter Singleton = new ProvenanceConverter();
    }

    internal class PublicationStageConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(PublicationStage) || t == typeof(PublicationStage?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            if (value == "published")
            {
                return PublicationStage.Published;
            }
            throw new Exception("Cannot unmarshal type PublicationStage");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (PublicationStage)untypedValue;
            if (value == PublicationStage.Published)
            {
                serializer.Serialize(writer, "published");
                return;
            }
            throw new Exception("Cannot marshal type PublicationStage");
        }

        public static readonly PublicationStageConverter Singleton = new PublicationStageConverter();
    }

    internal class RightConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(Right) || t == typeof(Right?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            if (value == "read")
            {
                return Right.Read;
            }
            throw new Exception("Cannot unmarshal type Right");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (Right)untypedValue;
            if (value == Right.Read)
            {
                serializer.Serialize(writer, "read");
                return;
            }
            throw new Exception("Cannot marshal type Right");
        }

        public static readonly RightConverter Singleton = new RightConverter();
    }

    internal class RowsUpdatedByConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(RowsUpdatedBy) || t == typeof(RowsUpdatedBy?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            switch (value)
            {
                case "54a3-qyun":
                    return RowsUpdatedBy.The54A3Qyun;
                case "9e3m-2843":
                    return RowsUpdatedBy.The9E3M2843;
                case "pjxg-ve4m":
                    return RowsUpdatedBy.PjxgVe4M;
                case "vvca-fr6g":
                    return RowsUpdatedBy.VvcaFr6G;
            }
            throw new Exception("Cannot unmarshal type RowsUpdatedBy");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (RowsUpdatedBy)untypedValue;
            switch (value)
            {
                case RowsUpdatedBy.The54A3Qyun:
                    serializer.Serialize(writer, "54a3-qyun");
                    return;
                case RowsUpdatedBy.The9E3M2843:
                    serializer.Serialize(writer, "9e3m-2843");
                    return;
                case RowsUpdatedBy.PjxgVe4M:
                    serializer.Serialize(writer, "pjxg-ve4m");
                    return;
                case RowsUpdatedBy.VvcaFr6G:
                    serializer.Serialize(writer, "vvca-fr6g");
                    return;
            }
            throw new Exception("Cannot marshal type RowsUpdatedBy");
        }

        public static readonly RowsUpdatedByConverter Singleton = new RowsUpdatedByConverter();
    }

    internal class NameConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(Name) || t == typeof(Name?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            switch (value)
            {
                case "Dan Munz":
                    return Name.DanMunz;
                case "Doug Taylor":
                    return Name.DougTaylor;
                case "Shannon Files":
                    return Name.ShannonFiles;
                case "ming":
                    return Name.Ming;
            }
            throw new Exception("Cannot unmarshal type Name");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (Name)untypedValue;
            switch (value)
            {
                case Name.DanMunz:
                    serializer.Serialize(writer, "Dan Munz");
                    return;
                case Name.DougTaylor:
                    serializer.Serialize(writer, "Doug Taylor");
                    return;
                case Name.ShannonFiles:
                    serializer.Serialize(writer, "Shannon Files");
                    return;
                case Name.Ming:
                    serializer.Serialize(writer, "ming");
                    return;
            }
            throw new Exception("Cannot marshal type Name");
        }

        public static readonly NameConverter Singleton = new NameConverter();
    }

    internal class IdConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(Id) || t == typeof(Id?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            switch (value)
            {
                case "54a3-qyun":
                    return Id.The54A3Qyun;
                case "9e3m-2843":
                    return Id.The9E3M2843;
                case "9eki-h2hn":
                    return Id.The9EkiH2Hn;
                case "pjxg-ve4m":
                    return Id.PjxgVe4M;
            }
            throw new Exception("Cannot unmarshal type Id");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (Id)untypedValue;
            switch (value)
            {
                case Id.The54A3Qyun:
                    serializer.Serialize(writer, "54a3-qyun");
                    return;
                case Id.The9E3M2843:
                    serializer.Serialize(writer, "9e3m-2843");
                    return;
                case Id.The9EkiH2Hn:
                    serializer.Serialize(writer, "9eki-h2hn");
                    return;
                case Id.PjxgVe4M:
                    serializer.Serialize(writer, "pjxg-ve4m");
                    return;
            }
            throw new Exception("Cannot marshal type Id");
        }

        public static readonly IdConverter Singleton = new IdConverter();
    }

    internal class ViewTypeConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(ViewType) || t == typeof(ViewType?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            if (value == "tabular")
            {
                return ViewType.Tabular;
            }
            throw new Exception("Cannot unmarshal type ViewType");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (ViewType)untypedValue;
            if (value == ViewType.Tabular)
            {
                serializer.Serialize(writer, "tabular");
                return;
            }
            throw new Exception("Cannot marshal type ViewType");
        }

        public static readonly ViewTypeConverter Singleton = new ViewTypeConverter();
    }
}
