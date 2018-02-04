package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Row {
    private Field[] fields;

    @JsonProperty("fields")
    public Field[] getFields() { return fields; }
    @JsonProperty("fields")
    public void setFields(Field[] value) { this.fields = value; }
}
