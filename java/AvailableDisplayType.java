package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum AvailableDisplayType {
    FATROW, PAGE, TABLE;

    @JsonValue
    public String toValue() {
        switch (this) {
        case FATROW: return "fatrow";
        case PAGE: return "page";
        case TABLE: return "table";
        }
        return null;
    }

    @JsonCreator
    public static AvailableDisplayType forValue(String value) throws IOException {
        if (value.equals("fatrow")) return FATROW;
        if (value.equals("page")) return PAGE;
        if (value.equals("table")) return TABLE;
        throw new IOException("Cannot deserialize AvailableDisplayType");
    }
}
