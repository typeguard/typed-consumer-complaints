// To parse the JSON, install Klaxon and do:
//
//   val consumerComplaints = ConsumerComplaints.fromJson(jsonString)

package quicktype

import com.beust.klaxon.*

private fun <T> Klaxon.convert(k: kotlin.reflect.KClass<*>, fromJson: (JsonValue) -> T, toJson: (T) -> String, isUnion: Boolean = false) =
    this.converter(object: Converter {
        @Suppress("UNCHECKED_CAST")
        override fun toJson(value: Any)        = toJson(value as T)
        override fun fromJson(jv: JsonValue)   = fromJson(jv) as Any
        override fun canConvert(cls: Class<*>) = cls == k.java || (isUnion && cls.superclass == k.java)
    })

private val klaxon = Klaxon()
    .convert(DisplayType::class,           { DisplayType.fromValue(it.string!!) },           { "\"${it.value}\"" })
    .convert(ConsumerComplaintFlag::class, { ConsumerComplaintFlag.fromValue(it.string!!) }, { "\"${it.value}\"" })
    .convert(GrantFlag::class,             { GrantFlag.fromValue(it.string!!) },             { "\"${it.value}\"" })
    .convert(GrantType::class,             { GrantType.fromValue(it.string!!) },             { "\"${it.value}\"" })
    .convert(AvailableDisplayType::class,  { AvailableDisplayType.fromValue(it.string!!) },  { "\"${it.value}\"" })
    .convert(FieldType::class,             { FieldType.fromValue(it.string!!) },             { "\"${it.value}\"" })
    .convert(Width::class,                 { Width.fromValue(it.string!!) },                 { "\"${it.value}\"" })
    .convert(ModifyingViewUid::class,      { ModifyingViewUid.fromValue(it.string!!) },      { "\"${it.value}\"" })
    .convert(OwnerType::class,             { OwnerType.fromValue(it.string!!) },             { "\"${it.value}\"" })
    .convert(Provenance::class,            { Provenance.fromValue(it.string!!) },            { "\"${it.value}\"" })
    .convert(PublicationStage::class,      { PublicationStage.fromValue(it.string!!) },      { "\"${it.value}\"" })
    .convert(Right::class,                 { Right.fromValue(it.string!!) },                 { "\"${it.value}\"" })
    .convert(RowsUpdatedBy::class,         { RowsUpdatedBy.fromValue(it.string!!) },         { "\"${it.value}\"" })
    .convert(Name::class,                  { Name.fromValue(it.string!!) },                  { "\"${it.value}\"" })
    .convert(ID::class,                    { ID.fromValue(it.string!!) },                    { "\"${it.value}\"" })
    .convert(ViewType::class,              { ViewType.fromValue(it.string!!) },              { "\"${it.value}\"" })

class ConsumerComplaints(elements: Collection<ConsumerComplaint>) : ArrayList<ConsumerComplaint>(elements) {
    public fun toJson() = klaxon.toJsonString(this)

    companion object {
        public fun fromJson(json: String) = ConsumerComplaints(klaxon.parseArray<ConsumerComplaint>(json)!!)
    }
}

data class ConsumerComplaint (
    val id: String,
    val name: String,
    val averageRating: Long,
    val createdAt: Long,
    val description: String,
    val displayType: DisplayType,
    val downloadCount: Long,
    val hideFromCatalog: Boolean,

    @Json(name = "hideFromDataJson")
    val hideFromDataJSON: Boolean,

    val indexUpdatedAt: Long? = null,
    val newBackend: Boolean,
    val numberOfComments: Long,
    val oid: Long,
    val provenance: Provenance,
    val publicationAppendEnabled: Boolean,
    val publicationDate: Long,
    val publicationGroup: Long,
    val publicationStage: PublicationStage,
    val rowClass: String? = null,
    val rowsUpdatedAt: Long,
    val rowsUpdatedBy: RowsUpdatedBy,

    @Json(name = "tableId")
    val tableID: Long,

    val totalTimesRated: Long,
    val viewCount: Long,
    val viewLastModified: Long,
    val viewType: ViewType,
    val grants: List<Grant>,
    val metadata: Metadata,
    val owner: Owner,
    val ratings: Ratings? = null,
    val rights: List<Right>,
    val tableAuthor: TableAuthor,
    val flags: List<ConsumerComplaintFlag>? = null,
    val moderationStatus: Boolean? = null,
    val category: String? = null,
    val tags: List<String>? = null,
    val modifyingViewUid: ModifyingViewUid? = null
)

enum class DisplayType(val value: String) {
    Fatrow("fatrow"),
    Table("table");

    companion object {
        public fun fromValue(value: String): DisplayType = when (value) {
            "fatrow" -> Fatrow
            "table"  -> Table
            else     -> throw IllegalArgumentException()
        }
    }
}

enum class ConsumerComplaintFlag(val value: String) {
    Default("default"),
    Restorable("restorable"),
    RestorePossibleForType("restorePossibleForType");

    companion object {
        public fun fromValue(value: String): ConsumerComplaintFlag = when (value) {
            "default"                -> Default
            "restorable"             -> Restorable
            "restorePossibleForType" -> RestorePossibleForType
            else                     -> throw IllegalArgumentException()
        }
    }
}

data class Grant (
    val inherited: Boolean,
    val type: GrantType,
    val flags: List<GrantFlag>
)

enum class GrantFlag(val value: String) {
    Public("public");

    companion object {
        public fun fromValue(value: String): GrantFlag = when (value) {
            "public" -> Public
            else     -> throw IllegalArgumentException()
        }
    }
}

enum class GrantType(val value: String) {
    Viewer("viewer");

    companion object {
        public fun fromValue(value: String): GrantType = when (value) {
            "viewer" -> Viewer
            else     -> throw IllegalArgumentException()
        }
    }
}

data class Metadata (
    val jsonQuery: JSONQuery? = null,
    val rdfSubject: String? = null,
    val rdfClass: String? = null,
    val rowIdentifier: String? = null,
    val availableDisplayTypes: List<AvailableDisplayType>,
    val rowLabel: String? = null,
    val renderTypeConfig: RenderTypeConfig,
    val richRendererConfigs: RichRendererConfigs? = null,

    @Json(name = "custom_fields")
    val customFields: CustomFields? = null
)

enum class AvailableDisplayType(val value: String) {
    Fatrow("fatrow"),
    Page("page"),
    Table("table");

    companion object {
        public fun fromValue(value: String): AvailableDisplayType = when (value) {
            "fatrow" -> Fatrow
            "page"   -> Page
            "table"  -> Table
            else     -> throw IllegalArgumentException()
        }
    }
}

data class CustomFields (
    @Json(name = "TEST")
    val test: Test
)

data class Test (
    @Json(name = "CFPB1")
    val cfpb1: String
)

data class JSONQuery (
    val order: List<Order>
)

data class Order (
    val ascending: Boolean,
    val columnFieldName: String
)

data class RenderTypeConfig (
    val visible: Visible
)

data class Visible (
    val table: Boolean? = null,
    val fatrow: Boolean? = null
)

data class RichRendererConfigs (
    val fatRow: FatRow
)

data class FatRow (
    val columns: List<Column>
)

data class Column (
    val styles: Styles,
    val rows: List<Row>
)

data class Row (
    val fields: List<Field>
)

data class Field (
    @Json(name = "tableColumnId")
    val tableColumnID: Long,

    val type: FieldType
)

enum class FieldType(val value: String) {
    ColumnData("columnData"),
    ColumnLabel("columnLabel");

    companion object {
        public fun fromValue(value: String): FieldType = when (value) {
            "columnData"  -> ColumnData
            "columnLabel" -> ColumnLabel
            else          -> throw IllegalArgumentException()
        }
    }
}

data class Styles (
    val width: Width
)

enum class Width(val value: String) {
    The27("27%"),
    The30("30%"),
    The31("31%"),
    The33("33%"),
    The40("40%");

    companion object {
        public fun fromValue(value: String): Width = when (value) {
            "27%" -> The27
            "30%" -> The30
            "31%" -> The31
            "33%" -> The33
            "40%" -> The40
            else  -> throw IllegalArgumentException()
        }
    }
}

enum class ModifyingViewUid(val value: String) {
    S6EwH6Mp("s6ew-h6mp");

    companion object {
        public fun fromValue(value: String): ModifyingViewUid = when (value) {
            "s6ew-h6mp" -> S6EwH6Mp
            else        -> throw IllegalArgumentException()
        }
    }
}

data class Owner (
    val id: String,
    val displayName: String,
    val screenName: String,
    val type: OwnerType,

    @Json(name = "profileImageUrlLarge")
    val profileImageURLLarge: String? = null,

    @Json(name = "profileImageUrlMedium")
    val profileImageURLMedium: String? = null,

    @Json(name = "profileImageUrlSmall")
    val profileImageURLSmall: String? = null
)

enum class OwnerType(val value: String) {
    Interactive("interactive");

    companion object {
        public fun fromValue(value: String): OwnerType = when (value) {
            "interactive" -> Interactive
            else          -> throw IllegalArgumentException()
        }
    }
}

enum class Provenance(val value: String) {
    Official("official");

    companion object {
        public fun fromValue(value: String): Provenance = when (value) {
            "official" -> Official
            else       -> throw IllegalArgumentException()
        }
    }
}

enum class PublicationStage(val value: String) {
    Published("published");

    companion object {
        public fun fromValue(value: String): PublicationStage = when (value) {
            "published" -> Published
            else        -> throw IllegalArgumentException()
        }
    }
}

data class Ratings (
    val rating: Long
)

enum class Right(val value: String) {
    Read("read");

    companion object {
        public fun fromValue(value: String): Right = when (value) {
            "read" -> Read
            else   -> throw IllegalArgumentException()
        }
    }
}

enum class RowsUpdatedBy(val value: String) {
    PjxgVe4M("pjxg-ve4m"),
    The54A3Qyun("54a3-qyun"),
    The9E3M2843("9e3m-2843"),
    VvcaFr6G("vvca-fr6g");

    companion object {
        public fun fromValue(value: String): RowsUpdatedBy = when (value) {
            "pjxg-ve4m" -> PjxgVe4M
            "54a3-qyun" -> The54A3Qyun
            "9e3m-2843" -> The9E3M2843
            "vvca-fr6g" -> VvcaFr6G
            else        -> throw IllegalArgumentException()
        }
    }
}

data class TableAuthor (
    val id: ID,
    val displayName: Name,
    val screenName: Name,
    val type: OwnerType
)

enum class Name(val value: String) {
    DanMunz("Dan Munz"),
    DougTaylor("Doug Taylor"),
    Ming("ming"),
    ShannonFiles("Shannon Files");

    companion object {
        public fun fromValue(value: String): Name = when (value) {
            "Dan Munz"      -> DanMunz
            "Doug Taylor"   -> DougTaylor
            "ming"          -> Ming
            "Shannon Files" -> ShannonFiles
            else            -> throw IllegalArgumentException()
        }
    }
}

enum class ID(val value: String) {
    PjxgVe4M("pjxg-ve4m"),
    The54A3Qyun("54a3-qyun"),
    The9E3M2843("9e3m-2843"),
    The9EkiH2Hn("9eki-h2hn");

    companion object {
        public fun fromValue(value: String): ID = when (value) {
            "pjxg-ve4m" -> PjxgVe4M
            "54a3-qyun" -> The54A3Qyun
            "9e3m-2843" -> The9E3M2843
            "9eki-h2hn" -> The9EkiH2Hn
            else        -> throw IllegalArgumentException()
        }
    }
}

enum class ViewType(val value: String) {
    Tabular("tabular");

    companion object {
        public fun fromValue(value: String): ViewType = when (value) {
            "tabular" -> Tabular
            else      -> throw IllegalArgumentException()
        }
    }
}
