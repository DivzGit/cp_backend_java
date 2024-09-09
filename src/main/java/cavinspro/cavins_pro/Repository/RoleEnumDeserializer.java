package cavinspro.cavins_pro.Repository;

//package cavinspro.cavins_pro.Serializer;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import cavinspro.cavins_pro.Entity.RoleEnum;

import java.io.IOException;

public class RoleEnumDeserializer extends JsonDeserializer<RoleEnum> {
    @Override
    public RoleEnum deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
        String role = jsonParser.getText();
        return RoleEnum.valueOf(role);
    }
}
