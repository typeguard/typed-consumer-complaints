package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Group {
    private String columnFieldName;

    @JsonProperty("columnFieldName")
    public String getColumnFieldName() { return columnFieldName; }
    @JsonProperty("columnFieldName")
    public void setColumnFieldName(String value) { this.columnFieldName = value; }
}
