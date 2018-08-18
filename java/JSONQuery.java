package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class JSONQuery {
    private Order[] order;

    @JsonProperty("order")
    public Order[] getOrder() { return order; }
    @JsonProperty("order")
    public void setOrder(Order[] value) { this.order = value; }
}
