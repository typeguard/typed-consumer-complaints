package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Column {
    private Styles styles;
    private Row[] rows;

    @JsonProperty("styles")
    public Styles getStyles() { return styles; }
    @JsonProperty("styles")
    public void setStyles(Styles value) { this.styles = value; }

    @JsonProperty("rows")
    public Row[] getRows() { return rows; }
    @JsonProperty("rows")
    public void setRows(Row[] value) { this.rows = value; }
}
