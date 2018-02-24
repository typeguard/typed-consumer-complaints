package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Metadata {
    private JSONQuery jsonQuery;
    private RDFSubject rdfSubject;
    private String rdfClass;
    private String rowIdentifier;
    private AvailableDisplayType[] availableDisplayTypes;
    private String rowLabel;
    private RenderTypeConfig renderTypeConfig;
    private RichRendererConfigs richRendererConfigs;
    private CustomFields customFields;

    @JsonProperty("jsonQuery")
    public JSONQuery getJSONQuery() { return jsonQuery; }
    @JsonProperty("jsonQuery")
    public void setJSONQuery(JSONQuery value) { this.jsonQuery = value; }

    @JsonProperty("rdfSubject")
    public RDFSubject getRDFSubject() { return rdfSubject; }
    @JsonProperty("rdfSubject")
    public void setRDFSubject(RDFSubject value) { this.rdfSubject = value; }

    @JsonProperty("rdfClass")
    public String getRDFClass() { return rdfClass; }
    @JsonProperty("rdfClass")
    public void setRDFClass(String value) { this.rdfClass = value; }

    @JsonProperty("rowIdentifier")
    public String getRowIdentifier() { return rowIdentifier; }
    @JsonProperty("rowIdentifier")
    public void setRowIdentifier(String value) { this.rowIdentifier = value; }

    @JsonProperty("availableDisplayTypes")
    public AvailableDisplayType[] getAvailableDisplayTypes() { return availableDisplayTypes; }
    @JsonProperty("availableDisplayTypes")
    public void setAvailableDisplayTypes(AvailableDisplayType[] value) { this.availableDisplayTypes = value; }

    @JsonProperty("rowLabel")
    public String getRowLabel() { return rowLabel; }
    @JsonProperty("rowLabel")
    public void setRowLabel(String value) { this.rowLabel = value; }

    @JsonProperty("renderTypeConfig")
    public RenderTypeConfig getRenderTypeConfig() { return renderTypeConfig; }
    @JsonProperty("renderTypeConfig")
    public void setRenderTypeConfig(RenderTypeConfig value) { this.renderTypeConfig = value; }

    @JsonProperty("richRendererConfigs")
    public RichRendererConfigs getRichRendererConfigs() { return richRendererConfigs; }
    @JsonProperty("richRendererConfigs")
    public void setRichRendererConfigs(RichRendererConfigs value) { this.richRendererConfigs = value; }

    @JsonProperty("custom_fields")
    public CustomFields getCustomFields() { return customFields; }
    @JsonProperty("custom_fields")
    public void setCustomFields(CustomFields value) { this.customFields = value; }
}
