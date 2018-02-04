package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class ConsumerComplaints {
    private String id;
    private String name;
    private long averageRating;
    private long createdAt;
    private String description;
    private DisplayType displayType;
    private long downloadCount;
    private boolean hideFromCatalog;
    private boolean hideFromDataJSON;
    private Long indexUpdatedAt;
    private boolean newBackend;
    private long numberOfComments;
    private long oid;
    private Provenance provenance;
    private boolean publicationAppendEnabled;
    private long publicationDate;
    private long publicationGroup;
    private PublicationStage publicationStage;
    private String rowClass;
    private long rowsUpdatedAt;
    private RowsUpdatedBy rowsUpdatedBy;
    private long tableID;
    private long totalTimesRated;
    private long viewCount;
    private long viewLastModified;
    private ViewType viewType;
    private Grant[] grants;
    private Metadata metadata;
    private Owner owner;
    private Ratings ratings;
    private Right[] rights;
    private TableAuthor tableAuthor;
    private ConsumerComplaintFlag[] flags;
    private Boolean moderationStatus;
    private String category;
    private String[] tags;
    private ModifyingViewUid modifyingViewUid;

    @JsonProperty("id")
    public String getId() { return id; }
    @JsonProperty("id")
    public void setId(String value) { this.id = value; }

    @JsonProperty("name")
    public String getName() { return name; }
    @JsonProperty("name")
    public void setName(String value) { this.name = value; }

    @JsonProperty("averageRating")
    public long getAverageRating() { return averageRating; }
    @JsonProperty("averageRating")
    public void setAverageRating(long value) { this.averageRating = value; }

    @JsonProperty("createdAt")
    public long getCreatedAt() { return createdAt; }
    @JsonProperty("createdAt")
    public void setCreatedAt(long value) { this.createdAt = value; }

    @JsonProperty("description")
    public String getDescription() { return description; }
    @JsonProperty("description")
    public void setDescription(String value) { this.description = value; }

    @JsonProperty("displayType")
    public DisplayType getDisplayType() { return displayType; }
    @JsonProperty("displayType")
    public void setDisplayType(DisplayType value) { this.displayType = value; }

    @JsonProperty("downloadCount")
    public long getDownloadCount() { return downloadCount; }
    @JsonProperty("downloadCount")
    public void setDownloadCount(long value) { this.downloadCount = value; }

    @JsonProperty("hideFromCatalog")
    public boolean getHideFromCatalog() { return hideFromCatalog; }
    @JsonProperty("hideFromCatalog")
    public void setHideFromCatalog(boolean value) { this.hideFromCatalog = value; }

    @JsonProperty("hideFromDataJson")
    public boolean getHideFromDataJSON() { return hideFromDataJSON; }
    @JsonProperty("hideFromDataJson")
    public void setHideFromDataJSON(boolean value) { this.hideFromDataJSON = value; }

    @JsonProperty("indexUpdatedAt")
    public Long getIndexUpdatedAt() { return indexUpdatedAt; }
    @JsonProperty("indexUpdatedAt")
    public void setIndexUpdatedAt(Long value) { this.indexUpdatedAt = value; }

    @JsonProperty("newBackend")
    public boolean getNewBackend() { return newBackend; }
    @JsonProperty("newBackend")
    public void setNewBackend(boolean value) { this.newBackend = value; }

    @JsonProperty("numberOfComments")
    public long getNumberOfComments() { return numberOfComments; }
    @JsonProperty("numberOfComments")
    public void setNumberOfComments(long value) { this.numberOfComments = value; }

    @JsonProperty("oid")
    public long getOid() { return oid; }
    @JsonProperty("oid")
    public void setOid(long value) { this.oid = value; }

    @JsonProperty("provenance")
    public Provenance getProvenance() { return provenance; }
    @JsonProperty("provenance")
    public void setProvenance(Provenance value) { this.provenance = value; }

    @JsonProperty("publicationAppendEnabled")
    public boolean getPublicationAppendEnabled() { return publicationAppendEnabled; }
    @JsonProperty("publicationAppendEnabled")
    public void setPublicationAppendEnabled(boolean value) { this.publicationAppendEnabled = value; }

    @JsonProperty("publicationDate")
    public long getPublicationDate() { return publicationDate; }
    @JsonProperty("publicationDate")
    public void setPublicationDate(long value) { this.publicationDate = value; }

    @JsonProperty("publicationGroup")
    public long getPublicationGroup() { return publicationGroup; }
    @JsonProperty("publicationGroup")
    public void setPublicationGroup(long value) { this.publicationGroup = value; }

    @JsonProperty("publicationStage")
    public PublicationStage getPublicationStage() { return publicationStage; }
    @JsonProperty("publicationStage")
    public void setPublicationStage(PublicationStage value) { this.publicationStage = value; }

    @JsonProperty("rowClass")
    public String getRowClass() { return rowClass; }
    @JsonProperty("rowClass")
    public void setRowClass(String value) { this.rowClass = value; }

    @JsonProperty("rowsUpdatedAt")
    public long getRowsUpdatedAt() { return rowsUpdatedAt; }
    @JsonProperty("rowsUpdatedAt")
    public void setRowsUpdatedAt(long value) { this.rowsUpdatedAt = value; }

    @JsonProperty("rowsUpdatedBy")
    public RowsUpdatedBy getRowsUpdatedBy() { return rowsUpdatedBy; }
    @JsonProperty("rowsUpdatedBy")
    public void setRowsUpdatedBy(RowsUpdatedBy value) { this.rowsUpdatedBy = value; }

    @JsonProperty("tableId")
    public long getTableID() { return tableID; }
    @JsonProperty("tableId")
    public void setTableID(long value) { this.tableID = value; }

    @JsonProperty("totalTimesRated")
    public long getTotalTimesRated() { return totalTimesRated; }
    @JsonProperty("totalTimesRated")
    public void setTotalTimesRated(long value) { this.totalTimesRated = value; }

    @JsonProperty("viewCount")
    public long getViewCount() { return viewCount; }
    @JsonProperty("viewCount")
    public void setViewCount(long value) { this.viewCount = value; }

    @JsonProperty("viewLastModified")
    public long getViewLastModified() { return viewLastModified; }
    @JsonProperty("viewLastModified")
    public void setViewLastModified(long value) { this.viewLastModified = value; }

    @JsonProperty("viewType")
    public ViewType getViewType() { return viewType; }
    @JsonProperty("viewType")
    public void setViewType(ViewType value) { this.viewType = value; }

    @JsonProperty("grants")
    public Grant[] getGrants() { return grants; }
    @JsonProperty("grants")
    public void setGrants(Grant[] value) { this.grants = value; }

    @JsonProperty("metadata")
    public Metadata getMetadata() { return metadata; }
    @JsonProperty("metadata")
    public void setMetadata(Metadata value) { this.metadata = value; }

    @JsonProperty("owner")
    public Owner getOwner() { return owner; }
    @JsonProperty("owner")
    public void setOwner(Owner value) { this.owner = value; }

    @JsonProperty("ratings")
    public Ratings getRatings() { return ratings; }
    @JsonProperty("ratings")
    public void setRatings(Ratings value) { this.ratings = value; }

    @JsonProperty("rights")
    public Right[] getRights() { return rights; }
    @JsonProperty("rights")
    public void setRights(Right[] value) { this.rights = value; }

    @JsonProperty("tableAuthor")
    public TableAuthor getTableAuthor() { return tableAuthor; }
    @JsonProperty("tableAuthor")
    public void setTableAuthor(TableAuthor value) { this.tableAuthor = value; }

    @JsonProperty("flags")
    public ConsumerComplaintFlag[] getFlags() { return flags; }
    @JsonProperty("flags")
    public void setFlags(ConsumerComplaintFlag[] value) { this.flags = value; }

    @JsonProperty("moderationStatus")
    public Boolean getModerationStatus() { return moderationStatus; }
    @JsonProperty("moderationStatus")
    public void setModerationStatus(Boolean value) { this.moderationStatus = value; }

    @JsonProperty("category")
    public String getCategory() { return category; }
    @JsonProperty("category")
    public void setCategory(String value) { this.category = value; }

    @JsonProperty("tags")
    public String[] getTags() { return tags; }
    @JsonProperty("tags")
    public void setTags(String[] value) { this.tags = value; }

    @JsonProperty("modifyingViewUid")
    public ModifyingViewUid getModifyingViewUid() { return modifyingViewUid; }
    @JsonProperty("modifyingViewUid")
    public void setModifyingViewUid(ModifyingViewUid value) { this.modifyingViewUid = value; }
}
