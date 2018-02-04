package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Visible {
    private Boolean table;
    private Boolean fatrow;

    @JsonProperty("table")
    public Boolean getTable() { return table; }
    @JsonProperty("table")
    public void setTable(Boolean value) { this.table = value; }

    @JsonProperty("fatrow")
    public Boolean getFatrow() { return fatrow; }
    @JsonProperty("fatrow")
    public void setFatrow(Boolean value) { this.fatrow = value; }
}
