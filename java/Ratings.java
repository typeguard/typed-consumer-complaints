package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Ratings {
    private long rating;

    @JsonProperty("rating")
    public long getRating() { return rating; }
    @JsonProperty("rating")
    public void setRating(long value) { this.rating = value; }
}
