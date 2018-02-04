package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum Width {
    THE_27, THE_30, THE_31, THE_33, THE_40;

    @JsonValue
    public String toValue() {
        switch (this) {
        case THE_27: return "27%";
        case THE_30: return "30%";
        case THE_31: return "31%";
        case THE_33: return "33%";
        case THE_40: return "40%";
        }
        return null;
    }

    @JsonCreator
    public static Width forValue(String value) throws IOException {
        if (value.equals("27%")) return THE_27;
        if (value.equals("30%")) return THE_30;
        if (value.equals("31%")) return THE_31;
        if (value.equals("33%")) return THE_33;
        if (value.equals("40%")) return THE_40;
        throw new IOException("Cannot deserialize Width");
    }
}
