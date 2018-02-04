package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum DisplayType {
    FATROW, TABLE;

    @JsonValue
    public String toValue() {
        switch (this) {
        case FATROW: return "fatrow";
        case TABLE: return "table";
        }
        return null;
    }

    @JsonCreator
    public static DisplayType forValue(String value) throws IOException {
        if (value.equals("fatrow")) return FATROW;
        if (value.equals("table")) return TABLE;
        throw new IOException("Cannot deserialize DisplayType");
    }
}
