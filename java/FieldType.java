package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum FieldType {
    COLUMN_DATA, COLUMN_LABEL;

    @JsonValue
    public String toValue() {
        switch (this) {
        case COLUMN_DATA: return "columnData";
        case COLUMN_LABEL: return "columnLabel";
        }
        return null;
    }

    @JsonCreator
    public static FieldType forValue(String value) throws IOException {
        if (value.equals("columnData")) return COLUMN_DATA;
        if (value.equals("columnLabel")) return COLUMN_LABEL;
        throw new IOException("Cannot deserialize FieldType");
    }
}
