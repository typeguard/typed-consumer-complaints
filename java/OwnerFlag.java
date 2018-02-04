package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum OwnerFlag {
    ORGANIZATION_MEMBER;

    @JsonValue
    public String toValue() {
        switch (this) {
        case ORGANIZATION_MEMBER: return "organizationMember";
        }
        return null;
    }

    @JsonCreator
    public static OwnerFlag forValue(String value) throws IOException {
        if (value.equals("organizationMember")) return ORGANIZATION_MEMBER;
        throw new IOException("Cannot deserialize OwnerFlag");
    }
}
