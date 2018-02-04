// To parse and unparse this JSON data, add this code to your project and do:
//
//    r, err := UnmarshalConsumerComplaints(bytes)
//    bytes, err = r.Marshal()

package main

import "encoding/json"

type ConsumerComplaints []ConsumerComplaint

func UnmarshalConsumerComplaints(data []byte) (ConsumerComplaints, error) {
	var r ConsumerComplaints
	err := json.Unmarshal(data, &r)
	return r, err
}

func (r *ConsumerComplaints) Marshal() ([]byte, error) {
	return json.Marshal(r)
}

type ConsumerComplaint struct {
	ID                       string                  `json:"id"`
	Name                     string                  `json:"name"`
	AverageRating            int64                   `json:"averageRating"`
	CreatedAt                int64                   `json:"createdAt"`
	Description              string                  `json:"description"`
	DisplayType              DisplayType             `json:"displayType"`
	DownloadCount            int64                   `json:"downloadCount"`
	HideFromCatalog          bool                    `json:"hideFromCatalog"`
	HideFromDataJSON         bool                    `json:"hideFromDataJson"`
	IndexUpdatedAt           *int64                  `json:"indexUpdatedAt"`
	NewBackend               bool                    `json:"newBackend"`
	NumberOfComments         int64                   `json:"numberOfComments"`
	OID                      int64                   `json:"oid"`
	Provenance               Provenance              `json:"provenance"`
	PublicationAppendEnabled bool                    `json:"publicationAppendEnabled"`
	PublicationDate          int64                   `json:"publicationDate"`
	PublicationGroup         int64                   `json:"publicationGroup"`
	PublicationStage         PublicationStage        `json:"publicationStage"`
	RowClass                 *string                 `json:"rowClass"`
	RowsUpdatedAt            int64                   `json:"rowsUpdatedAt"`
	RowsUpdatedBy            RowsUpdatedBy           `json:"rowsUpdatedBy"`
	TableID                  int64                   `json:"tableId"`
	TotalTimesRated          int64                   `json:"totalTimesRated"`
	ViewCount                int64                   `json:"viewCount"`
	ViewLastModified         int64                   `json:"viewLastModified"`
	ViewType                 ViewType                `json:"viewType"`
	Grants                   []Grant                 `json:"grants"`
	Metadata                 Metadata                `json:"metadata"`
	Owner                    Owner                   `json:"owner"`
	Ratings                  *Ratings                `json:"ratings"`
	Rights                   []Right                 `json:"rights"`
	TableAuthor              TableAuthor             `json:"tableAuthor"`
	Flags                    []ConsumerComplaintFlag `json:"flags"`
	ModerationStatus         *bool                   `json:"moderationStatus"`
	Category                 *string                 `json:"category"`
	Tags                     []string                `json:"tags"`
	ModifyingViewUid         *ModifyingViewUid       `json:"modifyingViewUid"`
}

type Grant struct {
	Inherited bool        `json:"inherited"`
	Type      GrantType   `json:"type"`
	Flags     []GrantFlag `json:"flags"`
}

type Metadata struct {
	JSONQuery             *JSONQuery             `json:"jsonQuery"`
	RDFSubject            *RDFSubject            `json:"rdfSubject"`
	RDFClass              *string                `json:"rdfClass"`
	RowIdentifier         *string                `json:"rowIdentifier"`
	AvailableDisplayTypes []AvailableDisplayType `json:"availableDisplayTypes"`
	RowLabel              *string                `json:"rowLabel"`
	RenderTypeConfig      RenderTypeConfig       `json:"renderTypeConfig"`
	RichRendererConfigs   *RichRendererConfigs   `json:"richRendererConfigs"`
	CustomFields          *CustomFields          `json:"custom_fields"`
}

type CustomFields struct {
	Test Test `json:"TEST"`
}

type Test struct {
	Cfpb1 string `json:"CFPB1"`
}

type JSONQuery struct {
	Order  []Order  `json:"order"`
	Select []Select `json:"select"`
	Group  []Group  `json:"group"`
}

type Group struct {
	ColumnFieldName string `json:"columnFieldName"`
}

type Order struct {
	Ascending       bool   `json:"ascending"`
	ColumnFieldName string `json:"columnFieldName"`
}

type Select struct {
	ColumnFieldName string  `json:"columnFieldName"`
	Aggregate       *string `json:"aggregate"`
}

type RenderTypeConfig struct {
	Visible Visible `json:"visible"`
}

type Visible struct {
	Table  *bool `json:"table"`
	Fatrow *bool `json:"fatrow"`
}

type RichRendererConfigs struct {
	FatRow FatRow `json:"fatRow"`
}

type FatRow struct {
	Columns []Column `json:"columns"`
}

type Column struct {
	Styles Styles `json:"styles"`
	Rows   []Row  `json:"rows"`
}

type Row struct {
	Fields []Field `json:"fields"`
}

type Field struct {
	TableColumnID int64     `json:"tableColumnId"`
	Type          FieldType `json:"type"`
}

type Styles struct {
	Width Width `json:"width"`
}

type Owner struct {
	ID                    string      `json:"id"`
	DisplayName           string      `json:"displayName"`
	ScreenName            string      `json:"screenName"`
	Type                  OwnerType   `json:"type"`
	Flags                 []OwnerFlag `json:"flags"`
	ProfileImageURLLarge  *string     `json:"profileImageUrlLarge"`
	ProfileImageURLMedium *string     `json:"profileImageUrlMedium"`
	ProfileImageURLSmall  *string     `json:"profileImageUrlSmall"`
}

type Ratings struct {
	Rating int64 `json:"rating"`
}

type TableAuthor struct {
	ID          ID          `json:"id"`
	DisplayName Name        `json:"displayName"`
	ScreenName  Name        `json:"screenName"`
	Type        OwnerType   `json:"type"`
	Flags       []OwnerFlag `json:"flags"`
}

type DisplayType string
const (
	DisplayTypeFatrow DisplayType = "fatrow"
	DisplayTypeTable DisplayType = "table"
)

type ConsumerComplaintFlag string
const (
	Default ConsumerComplaintFlag = "default"
	Restorable ConsumerComplaintFlag = "restorable"
	RestorePossibleForType ConsumerComplaintFlag = "restorePossibleForType"
)

type GrantFlag string
const (
	Public GrantFlag = "public"
)

type GrantType string
const (
	Viewer GrantType = "viewer"
)

type AvailableDisplayType string
const (
	AvailableDisplayTypeFatrow AvailableDisplayType = "fatrow"
	AvailableDisplayTypeTable AvailableDisplayType = "table"
	Page AvailableDisplayType = "page"
)

type RDFSubject string
const (
	The0 RDFSubject = "0"
)

type FieldType string
const (
	ColumnData FieldType = "columnData"
	ColumnLabel FieldType = "columnLabel"
)

type Width string
const (
	The27 Width = "27%"
	The30 Width = "30%"
	The31 Width = "31%"
	The33 Width = "33%"
	The40 Width = "40%"
)

type ModifyingViewUid string
const (
	S6EwH6Mp ModifyingViewUid = "s6ew-h6mp"
)

type OwnerFlag string
const (
	OrganizationMember OwnerFlag = "organizationMember"
)

type OwnerType string
const (
	Interactive OwnerType = "interactive"
)

type Provenance string
const (
	Official Provenance = "official"
)

type PublicationStage string
const (
	Published PublicationStage = "published"
)

type Right string
const (
	Read Right = "read"
)

type RowsUpdatedBy string
const (
	RowsUpdatedBy54A3Qyun RowsUpdatedBy = "54a3-qyun"
	RowsUpdatedBy9E3M2843 RowsUpdatedBy = "9e3m-2843"
	RowsUpdatedByPjxgVe4M RowsUpdatedBy = "pjxg-ve4m"
	VvcaFr6G RowsUpdatedBy = "vvca-fr6g"
)

type Name string
const (
	DanMunz Name = "Dan Munz"
	DougTaylor Name = "Doug Taylor"
	Ming Name = "ming"
	ShannonFiles Name = "Shannon Files"
)

type ID string
const (
	ID54A3Qyun ID = "54a3-qyun"
	ID9E3M2843 ID = "9e3m-2843"
	IDPjxgVe4M ID = "pjxg-ve4m"
	The9EkiH2Hn ID = "9eki-h2hn"
)

type ViewType string
const (
	Tabular ViewType = "tabular"
)
