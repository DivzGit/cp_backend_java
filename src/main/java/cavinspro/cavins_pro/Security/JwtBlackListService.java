package cavinspro.cavins_pro.Security;

import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
public class JwtBlackListService {
    private Set<String> backlist =new HashSet<>();

    public void addToBlackList(String token){
        backlist.add(token);
    }

    public boolean isBlackListed(String token){
        return backlist.contains(token);
    }
}
