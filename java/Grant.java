package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Grant {
    private boolean inherited;
    private GrantType type;
    private GrantFlag[] flags;

    @JsonProperty("inherited")
    public boolean getInherited() { return inherited; }
    @JsonProperty("inherited")
    public void setInherited(boolean value) { this.inherited = value; }

    @JsonProperty("type")
    public GrantType getType() { return type; }
    @JsonProperty("type")
    public void setType(GrantType value) { this.type = value; }

    @JsonProperty("flags")
    public GrantFlag[] getFlags() { return flags; }
    @JsonProperty("flags")
    public void setFlags(GrantFlag[] value) { this.flags = value; }
}
