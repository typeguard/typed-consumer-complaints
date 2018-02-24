package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class TableAuthor {
    private ID id;
    private Name displayName;
    private Name screenName;
    private OwnerType type;
    private OwnerFlag[] flags;

    @JsonProperty("id")
    public ID getID() { return id; }
    @JsonProperty("id")
    public void setID(ID value) { this.id = value; }

    @JsonProperty("displayName")
    public Name getDisplayName() { return displayName; }
    @JsonProperty("displayName")
    public void setDisplayName(Name value) { this.displayName = value; }

    @JsonProperty("screenName")
    public Name getScreenName() { return screenName; }
    @JsonProperty("screenName")
    public void setScreenName(Name value) { this.screenName = value; }

    @JsonProperty("type")
    public OwnerType getType() { return type; }
    @JsonProperty("type")
    public void setType(OwnerType value) { this.type = value; }

    @JsonProperty("flags")
    public OwnerFlag[] getFlags() { return flags; }
    @JsonProperty("flags")
    public void setFlags(OwnerFlag[] value) { this.flags = value; }
}
