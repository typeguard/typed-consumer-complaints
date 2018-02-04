package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum ConsumerComplaintFlag {
    DEFAULT, RESTORABLE, RESTORE_POSSIBLE_FOR_TYPE;

    @JsonValue
    public String toValue() {
        switch (this) {
        case DEFAULT: return "default";
        case RESTORABLE: return "restorable";
        case RESTORE_POSSIBLE_FOR_TYPE: return "restorePossibleForType";
        }
        return null;
    }

    @JsonCreator
    public static ConsumerComplaintFlag forValue(String value) throws IOException {
        if (value.equals("default")) return DEFAULT;
        if (value.equals("restorable")) return RESTORABLE;
        if (value.equals("restorePossibleForType")) return RESTORE_POSSIBLE_FOR_TYPE;
        throw new IOException("Cannot deserialize ConsumerComplaintFlag");
    }
}
