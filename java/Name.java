package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum Name {
    DAN_MUNZ, DOUG_TAYLOR, MING, SHANNON_FILES;

    @JsonValue
    public String toValue() {
        switch (this) {
        case DAN_MUNZ: return "Dan Munz";
        case DOUG_TAYLOR: return "Doug Taylor";
        case MING: return "ming";
        case SHANNON_FILES: return "Shannon Files";
        }
        return null;
    }

    @JsonCreator
    public static Name forValue(String value) throws IOException {
        if (value.equals("Dan Munz")) return DAN_MUNZ;
        if (value.equals("Doug Taylor")) return DOUG_TAYLOR;
        if (value.equals("ming")) return MING;
        if (value.equals("Shannon Files")) return SHANNON_FILES;
        throw new IOException("Cannot deserialize Name");
    }
}
