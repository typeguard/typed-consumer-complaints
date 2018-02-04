package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum OwnerType {
    INTERACTIVE;

    @JsonValue
    public String toValue() {
        switch (this) {
        case INTERACTIVE: return "interactive";
        }
        return null;
    }

    @JsonCreator
    public static OwnerType forValue(String value) throws IOException {
        if (value.equals("interactive")) return INTERACTIVE;
        throw new IOException("Cannot deserialize OwnerType");
    }
}
