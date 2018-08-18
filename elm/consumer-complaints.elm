-- To decode the JSON data, add this file to your project, run
--
--     elm-package install NoRedInk/elm-decode-pipeline
--
-- add these imports
--
--     import Json.Decode exposing (decodeString)`);
--     import QuickType exposing (consumerComplaints)
--
-- and you're off to the races with
--
--     decodeString consumerComplaints myJsonString

module QuickType exposing
    ( ConsumerComplaints
    , consumerComplaintsToString
    , consumerComplaints
    , ConsumerComplaint
    , Grant
    , Metadata
    , CustomFields
    , Test
    , JSONQuery
    , Order
    , RenderTypeConfig
    , Visible
    , RichRendererConfigs
    , FatRow
    , Column
    , Row
    , Field
    , Styles
    , Owner
    , Ratings
    , TableAuthor
    , DisplayType(..)
    , ConsumerComplaintFlag(..)
    , GrantFlag(..)
    , GrantType(..)
    , AvailableDisplayType(..)
    , FieldType(..)
    , Width(..)
    , ModifyingViewUid(..)
    , OwnerType(..)
    , Provenance(..)
    , PublicationStage(..)
    , Right(..)
    , RowsUpdatedBy(..)
    , Name(..)
    , ID(..)
    , ViewType(..)
    )

import Json.Decode as Jdec
import Json.Decode.Pipeline as Jpipe
import Json.Encode as Jenc
import Dict exposing (Dict, map, toList)
import Array exposing (Array, map)

type alias ConsumerComplaints = Array ConsumerComplaint

type alias ConsumerComplaint =
    { id : String
    , name : String
    , averageRating : Int
    , createdAt : Int
    , description : String
    , displayType : DisplayType
    , downloadCount : Int
    , hideFromCatalog : Bool
    , hideFromDataJSON : Bool
    , indexUpdatedAt : Maybe Int
    , newBackend : Bool
    , numberOfComments : Int
    , oid : Int
    , provenance : Provenance
    , publicationAppendEnabled : Bool
    , publicationDate : Int
    , publicationGroup : Int
    , publicationStage : PublicationStage
    , rowClass : Maybe String
    , rowsUpdatedAt : Int
    , rowsUpdatedBy : RowsUpdatedBy
    , tableID : Int
    , totalTimesRated : Int
    , viewCount : Int
    , viewLastModified : Int
    , viewType : ViewType
    , grants : Array Grant
    , metadata : Metadata
    , owner : Owner
    , ratings : Maybe Ratings
    , rights : Array Right
    , tableAuthor : TableAuthor
    , flags : Maybe (Array ConsumerComplaintFlag)
    , moderationStatus : Maybe Bool
    , category : Maybe String
    , tags : Maybe (Array String)
    , modifyingViewUid : Maybe ModifyingViewUid
    }

type DisplayType
    = DisplayTypeFatrow
    | DisplayTypeTable

type ConsumerComplaintFlag
    = Default
    | Restorable
    | RestorePossibleForType

type alias Grant =
    { inherited : Bool
    , grantType : GrantType
    , flags : Array GrantFlag
    }

type GrantFlag
    = Public

type GrantType
    = Viewer

type alias Metadata =
    { jsonQuery : Maybe JSONQuery
    , rdfSubject : Maybe String
    , rdfClass : Maybe String
    , rowIdentifier : Maybe String
    , availableDisplayTypes : Array AvailableDisplayType
    , rowLabel : Maybe String
    , renderTypeConfig : RenderTypeConfig
    , richRendererConfigs : Maybe RichRendererConfigs
    , customFields : Maybe CustomFields
    }

type AvailableDisplayType
    = AvailableDisplayTypeFatrow
    | AvailableDisplayTypeTable
    | Page

type alias CustomFields =
    { test : Test
    }

type alias Test =
    { cfpb1 : String
    }

type alias JSONQuery =
    { order : Array Order
    }

type alias Order =
    { ascending : Bool
    , columnFieldName : String
    }

type alias RenderTypeConfig =
    { visible : Visible
    }

type alias Visible =
    { table : Maybe Bool
    , fatrow : Maybe Bool
    }

type alias RichRendererConfigs =
    { fatRow : FatRow
    }

type alias FatRow =
    { columns : Array Column
    }

type alias Column =
    { styles : Styles
    , rows : Array Row
    }

type alias Row =
    { fields : Array Field
    }

type alias Field =
    { tableColumnID : Int
    , fieldType : FieldType
    }

type FieldType
    = ColumnData
    | ColumnLabel

type alias Styles =
    { width : Width
    }

type Width
    = The27
    | The30
    | The31
    | The33
    | The40

type ModifyingViewUid
    = S6EwH6Mp

type alias Owner =
    { id : String
    , displayName : String
    , screenName : String
    , ownerType : OwnerType
    , profileImageURLLarge : Maybe String
    , profileImageURLMedium : Maybe String
    , profileImageURLSmall : Maybe String
    }

type OwnerType
    = Interactive

type Provenance
    = Official

type PublicationStage
    = Published

type alias Ratings =
    { rating : Int
    }

type Right
    = Read

type RowsUpdatedBy
    = RowsUpdatedBy54A3Qyun
    | RowsUpdatedBy9E3M2843
    | RowsUpdatedByPjxgVe4M
    | VvcaFr6G

type alias TableAuthor =
    { id : ID
    , displayName : Name
    , screenName : Name
    , tableAuthorType : OwnerType
    }

type Name
    = DanMunz
    | DougTaylor
    | Ming
    | ShannonFiles

type ID
    = ID54A3Qyun
    | ID9E3M2843
    | IDPjxgVe4M
    | The9EkiH2Hn

type ViewType
    = Tabular

-- decoders and encoders

consumerComplaints : Jdec.Decoder ConsumerComplaints
consumerComplaints = Jdec.array consumerComplaint

consumerComplaintsToString : ConsumerComplaints -> String
consumerComplaintsToString r = Jenc.encode 0 (makeArrayEncoder encodeConsumerComplaint r)

consumerComplaint : Jdec.Decoder ConsumerComplaint
consumerComplaint =
    Jpipe.decode ConsumerComplaint
        |> Jpipe.required "id" Jdec.string
        |> Jpipe.required "name" Jdec.string
        |> Jpipe.required "averageRating" Jdec.int
        |> Jpipe.required "createdAt" Jdec.int
        |> Jpipe.required "description" Jdec.string
        |> Jpipe.required "displayType" displayType
        |> Jpipe.required "downloadCount" Jdec.int
        |> Jpipe.required "hideFromCatalog" Jdec.bool
        |> Jpipe.required "hideFromDataJson" Jdec.bool
        |> Jpipe.optional "indexUpdatedAt" (Jdec.nullable Jdec.int) Nothing
        |> Jpipe.required "newBackend" Jdec.bool
        |> Jpipe.required "numberOfComments" Jdec.int
        |> Jpipe.required "oid" Jdec.int
        |> Jpipe.required "provenance" provenance
        |> Jpipe.required "publicationAppendEnabled" Jdec.bool
        |> Jpipe.required "publicationDate" Jdec.int
        |> Jpipe.required "publicationGroup" Jdec.int
        |> Jpipe.required "publicationStage" publicationStage
        |> Jpipe.optional "rowClass" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.required "rowsUpdatedAt" Jdec.int
        |> Jpipe.required "rowsUpdatedBy" rowsUpdatedBy
        |> Jpipe.required "tableId" Jdec.int
        |> Jpipe.required "totalTimesRated" Jdec.int
        |> Jpipe.required "viewCount" Jdec.int
        |> Jpipe.required "viewLastModified" Jdec.int
        |> Jpipe.required "viewType" viewType
        |> Jpipe.required "grants" (Jdec.array grant)
        |> Jpipe.required "metadata" metadata
        |> Jpipe.required "owner" owner
        |> Jpipe.optional "ratings" (Jdec.nullable ratings) Nothing
        |> Jpipe.required "rights" (Jdec.array right)
        |> Jpipe.required "tableAuthor" tableAuthor
        |> Jpipe.optional "flags" (Jdec.nullable (Jdec.array consumerComplaintFlag)) Nothing
        |> Jpipe.optional "moderationStatus" (Jdec.nullable Jdec.bool) Nothing
        |> Jpipe.optional "category" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.optional "tags" (Jdec.nullable (Jdec.array Jdec.string)) Nothing
        |> Jpipe.optional "modifyingViewUid" (Jdec.nullable modifyingViewUid) Nothing

encodeConsumerComplaint : ConsumerComplaint -> Jenc.Value
encodeConsumerComplaint x =
    Jenc.object
        [ ("id", Jenc.string x.id)
        , ("name", Jenc.string x.name)
        , ("averageRating", Jenc.int x.averageRating)
        , ("createdAt", Jenc.int x.createdAt)
        , ("description", Jenc.string x.description)
        , ("displayType", encodeDisplayType x.displayType)
        , ("downloadCount", Jenc.int x.downloadCount)
        , ("hideFromCatalog", Jenc.bool x.hideFromCatalog)
        , ("hideFromDataJson", Jenc.bool x.hideFromDataJSON)
        , ("indexUpdatedAt", makeNullableEncoder Jenc.int x.indexUpdatedAt)
        , ("newBackend", Jenc.bool x.newBackend)
        , ("numberOfComments", Jenc.int x.numberOfComments)
        , ("oid", Jenc.int x.oid)
        , ("provenance", encodeProvenance x.provenance)
        , ("publicationAppendEnabled", Jenc.bool x.publicationAppendEnabled)
        , ("publicationDate", Jenc.int x.publicationDate)
        , ("publicationGroup", Jenc.int x.publicationGroup)
        , ("publicationStage", encodePublicationStage x.publicationStage)
        , ("rowClass", makeNullableEncoder Jenc.string x.rowClass)
        , ("rowsUpdatedAt", Jenc.int x.rowsUpdatedAt)
        , ("rowsUpdatedBy", encodeRowsUpdatedBy x.rowsUpdatedBy)
        , ("tableId", Jenc.int x.tableID)
        , ("totalTimesRated", Jenc.int x.totalTimesRated)
        , ("viewCount", Jenc.int x.viewCount)
        , ("viewLastModified", Jenc.int x.viewLastModified)
        , ("viewType", encodeViewType x.viewType)
        , ("grants", makeArrayEncoder encodeGrant x.grants)
        , ("metadata", encodeMetadata x.metadata)
        , ("owner", encodeOwner x.owner)
        , ("ratings", makeNullableEncoder encodeRatings x.ratings)
        , ("rights", makeArrayEncoder encodeRight x.rights)
        , ("tableAuthor", encodeTableAuthor x.tableAuthor)
        , ("flags", makeNullableEncoder (makeArrayEncoder encodeConsumerComplaintFlag) x.flags)
        , ("moderationStatus", makeNullableEncoder Jenc.bool x.moderationStatus)
        , ("category", makeNullableEncoder Jenc.string x.category)
        , ("tags", makeNullableEncoder (makeArrayEncoder Jenc.string) x.tags)
        , ("modifyingViewUid", makeNullableEncoder encodeModifyingViewUid x.modifyingViewUid)
        ]

displayType : Jdec.Decoder DisplayType
displayType =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "fatrow" -> Jdec.succeed DisplayTypeFatrow
                "table" -> Jdec.succeed DisplayTypeTable
                somethingElse -> Jdec.fail <| "Invalid DisplayType: " ++ somethingElse
        )

encodeDisplayType : DisplayType -> Jenc.Value
encodeDisplayType x = case x of
    DisplayTypeFatrow -> Jenc.string "fatrow"
    DisplayTypeTable -> Jenc.string "table"

consumerComplaintFlag : Jdec.Decoder ConsumerComplaintFlag
consumerComplaintFlag =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "default" -> Jdec.succeed Default
                "restorable" -> Jdec.succeed Restorable
                "restorePossibleForType" -> Jdec.succeed RestorePossibleForType
                somethingElse -> Jdec.fail <| "Invalid ConsumerComplaintFlag: " ++ somethingElse
        )

encodeConsumerComplaintFlag : ConsumerComplaintFlag -> Jenc.Value
encodeConsumerComplaintFlag x = case x of
    Default -> Jenc.string "default"
    Restorable -> Jenc.string "restorable"
    RestorePossibleForType -> Jenc.string "restorePossibleForType"

grant : Jdec.Decoder Grant
grant =
    Jpipe.decode Grant
        |> Jpipe.required "inherited" Jdec.bool
        |> Jpipe.required "type" grantType
        |> Jpipe.required "flags" (Jdec.array grantFlag)

encodeGrant : Grant -> Jenc.Value
encodeGrant x =
    Jenc.object
        [ ("inherited", Jenc.bool x.inherited)
        , ("type", encodeGrantType x.grantType)
        , ("flags", makeArrayEncoder encodeGrantFlag x.flags)
        ]

grantFlag : Jdec.Decoder GrantFlag
grantFlag =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "public" -> Jdec.succeed Public
                somethingElse -> Jdec.fail <| "Invalid GrantFlag: " ++ somethingElse
        )

encodeGrantFlag : GrantFlag -> Jenc.Value
encodeGrantFlag x = case x of
    Public -> Jenc.string "public"

grantType : Jdec.Decoder GrantType
grantType =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "viewer" -> Jdec.succeed Viewer
                somethingElse -> Jdec.fail <| "Invalid GrantType: " ++ somethingElse
        )

encodeGrantType : GrantType -> Jenc.Value
encodeGrantType x = case x of
    Viewer -> Jenc.string "viewer"

metadata : Jdec.Decoder Metadata
metadata =
    Jpipe.decode Metadata
        |> Jpipe.optional "jsonQuery" (Jdec.nullable jsonQuery) Nothing
        |> Jpipe.optional "rdfSubject" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.optional "rdfClass" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.optional "rowIdentifier" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.required "availableDisplayTypes" (Jdec.array availableDisplayType)
        |> Jpipe.optional "rowLabel" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.required "renderTypeConfig" renderTypeConfig
        |> Jpipe.optional "richRendererConfigs" (Jdec.nullable richRendererConfigs) Nothing
        |> Jpipe.optional "custom_fields" (Jdec.nullable customFields) Nothing

encodeMetadata : Metadata -> Jenc.Value
encodeMetadata x =
    Jenc.object
        [ ("jsonQuery", makeNullableEncoder encodeJSONQuery x.jsonQuery)
        , ("rdfSubject", makeNullableEncoder Jenc.string x.rdfSubject)
        , ("rdfClass", makeNullableEncoder Jenc.string x.rdfClass)
        , ("rowIdentifier", makeNullableEncoder Jenc.string x.rowIdentifier)
        , ("availableDisplayTypes", makeArrayEncoder encodeAvailableDisplayType x.availableDisplayTypes)
        , ("rowLabel", makeNullableEncoder Jenc.string x.rowLabel)
        , ("renderTypeConfig", encodeRenderTypeConfig x.renderTypeConfig)
        , ("richRendererConfigs", makeNullableEncoder encodeRichRendererConfigs x.richRendererConfigs)
        , ("custom_fields", makeNullableEncoder encodeCustomFields x.customFields)
        ]

availableDisplayType : Jdec.Decoder AvailableDisplayType
availableDisplayType =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "fatrow" -> Jdec.succeed AvailableDisplayTypeFatrow
                "table" -> Jdec.succeed AvailableDisplayTypeTable
                "page" -> Jdec.succeed Page
                somethingElse -> Jdec.fail <| "Invalid AvailableDisplayType: " ++ somethingElse
        )

encodeAvailableDisplayType : AvailableDisplayType -> Jenc.Value
encodeAvailableDisplayType x = case x of
    AvailableDisplayTypeFatrow -> Jenc.string "fatrow"
    AvailableDisplayTypeTable -> Jenc.string "table"
    Page -> Jenc.string "page"

customFields : Jdec.Decoder CustomFields
customFields =
    Jpipe.decode CustomFields
        |> Jpipe.required "TEST" test

encodeCustomFields : CustomFields -> Jenc.Value
encodeCustomFields x =
    Jenc.object
        [ ("TEST", encodeTest x.test)
        ]

test : Jdec.Decoder Test
test =
    Jpipe.decode Test
        |> Jpipe.required "CFPB1" Jdec.string

encodeTest : Test -> Jenc.Value
encodeTest x =
    Jenc.object
        [ ("CFPB1", Jenc.string x.cfpb1)
        ]

jsonQuery : Jdec.Decoder JSONQuery
jsonQuery =
    Jpipe.decode JSONQuery
        |> Jpipe.required "order" (Jdec.array order)

encodeJSONQuery : JSONQuery -> Jenc.Value
encodeJSONQuery x =
    Jenc.object
        [ ("order", makeArrayEncoder encodeOrder x.order)
        ]

order : Jdec.Decoder Order
order =
    Jpipe.decode Order
        |> Jpipe.required "ascending" Jdec.bool
        |> Jpipe.required "columnFieldName" Jdec.string

encodeOrder : Order -> Jenc.Value
encodeOrder x =
    Jenc.object
        [ ("ascending", Jenc.bool x.ascending)
        , ("columnFieldName", Jenc.string x.columnFieldName)
        ]

renderTypeConfig : Jdec.Decoder RenderTypeConfig
renderTypeConfig =
    Jpipe.decode RenderTypeConfig
        |> Jpipe.required "visible" visible

encodeRenderTypeConfig : RenderTypeConfig -> Jenc.Value
encodeRenderTypeConfig x =
    Jenc.object
        [ ("visible", encodeVisible x.visible)
        ]

visible : Jdec.Decoder Visible
visible =
    Jpipe.decode Visible
        |> Jpipe.optional "table" (Jdec.nullable Jdec.bool) Nothing
        |> Jpipe.optional "fatrow" (Jdec.nullable Jdec.bool) Nothing

encodeVisible : Visible -> Jenc.Value
encodeVisible x =
    Jenc.object
        [ ("table", makeNullableEncoder Jenc.bool x.table)
        , ("fatrow", makeNullableEncoder Jenc.bool x.fatrow)
        ]

richRendererConfigs : Jdec.Decoder RichRendererConfigs
richRendererConfigs =
    Jpipe.decode RichRendererConfigs
        |> Jpipe.required "fatRow" fatRow

encodeRichRendererConfigs : RichRendererConfigs -> Jenc.Value
encodeRichRendererConfigs x =
    Jenc.object
        [ ("fatRow", encodeFatRow x.fatRow)
        ]

fatRow : Jdec.Decoder FatRow
fatRow =
    Jpipe.decode FatRow
        |> Jpipe.required "columns" (Jdec.array column)

encodeFatRow : FatRow -> Jenc.Value
encodeFatRow x =
    Jenc.object
        [ ("columns", makeArrayEncoder encodeColumn x.columns)
        ]

column : Jdec.Decoder Column
column =
    Jpipe.decode Column
        |> Jpipe.required "styles" styles
        |> Jpipe.required "rows" (Jdec.array row)

encodeColumn : Column -> Jenc.Value
encodeColumn x =
    Jenc.object
        [ ("styles", encodeStyles x.styles)
        , ("rows", makeArrayEncoder encodeRow x.rows)
        ]

row : Jdec.Decoder Row
row =
    Jpipe.decode Row
        |> Jpipe.required "fields" (Jdec.array field)

encodeRow : Row -> Jenc.Value
encodeRow x =
    Jenc.object
        [ ("fields", makeArrayEncoder encodeField x.fields)
        ]

field : Jdec.Decoder Field
field =
    Jpipe.decode Field
        |> Jpipe.required "tableColumnId" Jdec.int
        |> Jpipe.required "type" fieldType

encodeField : Field -> Jenc.Value
encodeField x =
    Jenc.object
        [ ("tableColumnId", Jenc.int x.tableColumnID)
        , ("type", encodeFieldType x.fieldType)
        ]

fieldType : Jdec.Decoder FieldType
fieldType =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "columnData" -> Jdec.succeed ColumnData
                "columnLabel" -> Jdec.succeed ColumnLabel
                somethingElse -> Jdec.fail <| "Invalid FieldType: " ++ somethingElse
        )

encodeFieldType : FieldType -> Jenc.Value
encodeFieldType x = case x of
    ColumnData -> Jenc.string "columnData"
    ColumnLabel -> Jenc.string "columnLabel"

styles : Jdec.Decoder Styles
styles =
    Jpipe.decode Styles
        |> Jpipe.required "width" width

encodeStyles : Styles -> Jenc.Value
encodeStyles x =
    Jenc.object
        [ ("width", encodeWidth x.width)
        ]

width : Jdec.Decoder Width
width =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "27%" -> Jdec.succeed The27
                "30%" -> Jdec.succeed The30
                "31%" -> Jdec.succeed The31
                "33%" -> Jdec.succeed The33
                "40%" -> Jdec.succeed The40
                somethingElse -> Jdec.fail <| "Invalid Width: " ++ somethingElse
        )

encodeWidth : Width -> Jenc.Value
encodeWidth x = case x of
    The27 -> Jenc.string "27%"
    The30 -> Jenc.string "30%"
    The31 -> Jenc.string "31%"
    The33 -> Jenc.string "33%"
    The40 -> Jenc.string "40%"

modifyingViewUid : Jdec.Decoder ModifyingViewUid
modifyingViewUid =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "s6ew-h6mp" -> Jdec.succeed S6EwH6Mp
                somethingElse -> Jdec.fail <| "Invalid ModifyingViewUid: " ++ somethingElse
        )

encodeModifyingViewUid : ModifyingViewUid -> Jenc.Value
encodeModifyingViewUid x = case x of
    S6EwH6Mp -> Jenc.string "s6ew-h6mp"

owner : Jdec.Decoder Owner
owner =
    Jpipe.decode Owner
        |> Jpipe.required "id" Jdec.string
        |> Jpipe.required "displayName" Jdec.string
        |> Jpipe.required "screenName" Jdec.string
        |> Jpipe.required "type" ownerType
        |> Jpipe.optional "profileImageUrlLarge" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.optional "profileImageUrlMedium" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.optional "profileImageUrlSmall" (Jdec.nullable Jdec.string) Nothing

encodeOwner : Owner -> Jenc.Value
encodeOwner x =
    Jenc.object
        [ ("id", Jenc.string x.id)
        , ("displayName", Jenc.string x.displayName)
        , ("screenName", Jenc.string x.screenName)
        , ("type", encodeOwnerType x.ownerType)
        , ("profileImageUrlLarge", makeNullableEncoder Jenc.string x.profileImageURLLarge)
        , ("profileImageUrlMedium", makeNullableEncoder Jenc.string x.profileImageURLMedium)
        , ("profileImageUrlSmall", makeNullableEncoder Jenc.string x.profileImageURLSmall)
        ]

ownerType : Jdec.Decoder OwnerType
ownerType =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "interactive" -> Jdec.succeed Interactive
                somethingElse -> Jdec.fail <| "Invalid OwnerType: " ++ somethingElse
        )

encodeOwnerType : OwnerType -> Jenc.Value
encodeOwnerType x = case x of
    Interactive -> Jenc.string "interactive"

provenance : Jdec.Decoder Provenance
provenance =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "official" -> Jdec.succeed Official
                somethingElse -> Jdec.fail <| "Invalid Provenance: " ++ somethingElse
        )

encodeProvenance : Provenance -> Jenc.Value
encodeProvenance x = case x of
    Official -> Jenc.string "official"

publicationStage : Jdec.Decoder PublicationStage
publicationStage =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "published" -> Jdec.succeed Published
                somethingElse -> Jdec.fail <| "Invalid PublicationStage: " ++ somethingElse
        )

encodePublicationStage : PublicationStage -> Jenc.Value
encodePublicationStage x = case x of
    Published -> Jenc.string "published"

ratings : Jdec.Decoder Ratings
ratings =
    Jpipe.decode Ratings
        |> Jpipe.required "rating" Jdec.int

encodeRatings : Ratings -> Jenc.Value
encodeRatings x =
    Jenc.object
        [ ("rating", Jenc.int x.rating)
        ]

right : Jdec.Decoder Right
right =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "read" -> Jdec.succeed Read
                somethingElse -> Jdec.fail <| "Invalid Right: " ++ somethingElse
        )

encodeRight : Right -> Jenc.Value
encodeRight x = case x of
    Read -> Jenc.string "read"

rowsUpdatedBy : Jdec.Decoder RowsUpdatedBy
rowsUpdatedBy =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "54a3-qyun" -> Jdec.succeed RowsUpdatedBy54A3Qyun
                "9e3m-2843" -> Jdec.succeed RowsUpdatedBy9E3M2843
                "pjxg-ve4m" -> Jdec.succeed RowsUpdatedByPjxgVe4M
                "vvca-fr6g" -> Jdec.succeed VvcaFr6G
                somethingElse -> Jdec.fail <| "Invalid RowsUpdatedBy: " ++ somethingElse
        )

encodeRowsUpdatedBy : RowsUpdatedBy -> Jenc.Value
encodeRowsUpdatedBy x = case x of
    RowsUpdatedBy54A3Qyun -> Jenc.string "54a3-qyun"
    RowsUpdatedBy9E3M2843 -> Jenc.string "9e3m-2843"
    RowsUpdatedByPjxgVe4M -> Jenc.string "pjxg-ve4m"
    VvcaFr6G -> Jenc.string "vvca-fr6g"

tableAuthor : Jdec.Decoder TableAuthor
tableAuthor =
    Jpipe.decode TableAuthor
        |> Jpipe.required "id" id
        |> Jpipe.required "displayName" name
        |> Jpipe.required "screenName" name
        |> Jpipe.required "type" ownerType

encodeTableAuthor : TableAuthor -> Jenc.Value
encodeTableAuthor x =
    Jenc.object
        [ ("id", encodeID x.id)
        , ("displayName", encodeName x.displayName)
        , ("screenName", encodeName x.screenName)
        , ("type", encodeOwnerType x.tableAuthorType)
        ]

name : Jdec.Decoder Name
name =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "Dan Munz" -> Jdec.succeed DanMunz
                "Doug Taylor" -> Jdec.succeed DougTaylor
                "ming" -> Jdec.succeed Ming
                "Shannon Files" -> Jdec.succeed ShannonFiles
                somethingElse -> Jdec.fail <| "Invalid Name: " ++ somethingElse
        )

encodeName : Name -> Jenc.Value
encodeName x = case x of
    DanMunz -> Jenc.string "Dan Munz"
    DougTaylor -> Jenc.string "Doug Taylor"
    Ming -> Jenc.string "ming"
    ShannonFiles -> Jenc.string "Shannon Files"

id : Jdec.Decoder ID
id =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "54a3-qyun" -> Jdec.succeed ID54A3Qyun
                "9e3m-2843" -> Jdec.succeed ID9E3M2843
                "pjxg-ve4m" -> Jdec.succeed IDPjxgVe4M
                "9eki-h2hn" -> Jdec.succeed The9EkiH2Hn
                somethingElse -> Jdec.fail <| "Invalid ID: " ++ somethingElse
        )

encodeID : ID -> Jenc.Value
encodeID x = case x of
    ID54A3Qyun -> Jenc.string "54a3-qyun"
    ID9E3M2843 -> Jenc.string "9e3m-2843"
    IDPjxgVe4M -> Jenc.string "pjxg-ve4m"
    The9EkiH2Hn -> Jenc.string "9eki-h2hn"

viewType : Jdec.Decoder ViewType
viewType =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "tabular" -> Jdec.succeed Tabular
                somethingElse -> Jdec.fail <| "Invalid ViewType: " ++ somethingElse
        )

encodeViewType : ViewType -> Jenc.Value
encodeViewType x = case x of
    Tabular -> Jenc.string "tabular"

--- encoder helpers

makeArrayEncoder : (a -> Jenc.Value) -> Array a -> Jenc.Value
makeArrayEncoder f arr =
    Jenc.array (Array.map f arr)

makeDictEncoder : (a -> Jenc.Value) -> Dict String a -> Jenc.Value
makeDictEncoder f dict =
    Jenc.object (toList (Dict.map (\k -> f) dict))

makeNullableEncoder : (a -> Jenc.Value) -> Maybe a -> Jenc.Value
makeNullableEncoder f m =
    case m of
    Just x -> f x
    Nothing -> Jenc.null
