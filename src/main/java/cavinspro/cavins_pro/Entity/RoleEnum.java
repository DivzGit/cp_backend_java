package cavinspro.cavins_pro.Entity;


import cavinspro.cavins_pro.Repository.RoleEnumDeserializer;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

@JsonDeserialize(using = RoleEnumDeserializer.class)
public enum RoleEnum {
    ADMIN,
    USER,
    VENDOR
}

