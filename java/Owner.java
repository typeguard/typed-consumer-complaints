package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Owner {
    private String id;
    private String displayName;
    private String screenName;
    private OwnerType type;
    private OwnerFlag[] flags;
    private String profileImageURLLarge;
    private String profileImageURLMedium;
    private String profileImageURLSmall;

    @JsonProperty("id")
    public String getID() { return id; }
    @JsonProperty("id")
    public void setID(String value) { this.id = value; }

    @JsonProperty("displayName")
    public String getDisplayName() { return displayName; }
    @JsonProperty("displayName")
    public void setDisplayName(String value) { this.displayName = value; }

    @JsonProperty("screenName")
    public String getScreenName() { return screenName; }
    @JsonProperty("screenName")
    public void setScreenName(String value) { this.screenName = value; }

    @JsonProperty("type")
    public OwnerType getType() { return type; }
    @JsonProperty("type")
    public void setType(OwnerType value) { this.type = value; }

    @JsonProperty("flags")
    public OwnerFlag[] getFlags() { return flags; }
    @JsonProperty("flags")
    public void setFlags(OwnerFlag[] value) { this.flags = value; }

    @JsonProperty("profileImageUrlLarge")
    public String getProfileImageURLLarge() { return profileImageURLLarge; }
    @JsonProperty("profileImageUrlLarge")
    public void setProfileImageURLLarge(String value) { this.profileImageURLLarge = value; }

    @JsonProperty("profileImageUrlMedium")
    public String getProfileImageURLMedium() { return profileImageURLMedium; }
    @JsonProperty("profileImageUrlMedium")
    public void setProfileImageURLMedium(String value) { this.profileImageURLMedium = value; }

    @JsonProperty("profileImageUrlSmall")
    public String getProfileImageURLSmall() { return profileImageURLSmall; }
    @JsonProperty("profileImageUrlSmall")
    public void setProfileImageURLSmall(String value) { this.profileImageURLSmall = value; }
}
