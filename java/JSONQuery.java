package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class JSONQuery {
    private Order[] order;
    private Select[] select;
    private Group[] group;

    @JsonProperty("order")
    public Order[] getOrder() { return order; }
    @JsonProperty("order")
    public void setOrder(Order[] value) { this.order = value; }

    @JsonProperty("select")
    public Select[] getSelect() { return select; }
    @JsonProperty("select")
    public void setSelect(Select[] value) { this.select = value; }

    @JsonProperty("group")
    public Group[] getGroup() { return group; }
    @JsonProperty("group")
    public void setGroup(Group[] value) { this.group = value; }
}
