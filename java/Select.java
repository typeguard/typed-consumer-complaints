package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Select {
    private String columnFieldName;
    private String aggregate;

    @JsonProperty("columnFieldName")
    public String getColumnFieldName() { return columnFieldName; }
    @JsonProperty("columnFieldName")
    public void setColumnFieldName(String value) { this.columnFieldName = value; }

    @JsonProperty("aggregate")
    public String getAggregate() { return aggregate; }
    @JsonProperty("aggregate")
    public void setAggregate(String value) { this.aggregate = value; }
}
