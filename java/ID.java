package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum ID {
    PJXG_VE4_M, THE_54_A3_QYUN, THE_9_E3_M_2843, THE_9_EKI_H2_HN;

    @JsonValue
    public String toValue() {
        switch (this) {
        case PJXG_VE4_M: return "pjxg-ve4m";
        case THE_54_A3_QYUN: return "54a3-qyun";
        case THE_9_E3_M_2843: return "9e3m-2843";
        case THE_9_EKI_H2_HN: return "9eki-h2hn";
        }
        return null;
    }

    @JsonCreator
    public static ID forValue(String value) throws IOException {
        if (value.equals("pjxg-ve4m")) return PJXG_VE4_M;
        if (value.equals("54a3-qyun")) return THE_54_A3_QYUN;
        if (value.equals("9e3m-2843")) return THE_9_E3_M_2843;
        if (value.equals("9eki-h2hn")) return THE_9_EKI_H2_HN;
        throw new IOException("Cannot deserialize ID");
    }
}
