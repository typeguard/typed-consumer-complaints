package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class FatRow {
    private Column[] columns;

    @JsonProperty("columns")
    public Column[] getColumns() { return columns; }
    @JsonProperty("columns")
    public void setColumns(Column[] value) { this.columns = value; }
}
