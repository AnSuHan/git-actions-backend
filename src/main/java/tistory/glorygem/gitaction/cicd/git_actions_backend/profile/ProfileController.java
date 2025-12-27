package tistory.glorygem.gitaction.cicd.git_actions_backend.profile;

import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/// 프로필 확인 용 컨트롤러
@RestController
public class ProfileController {

    private final Environment env;

    public ProfileController(Environment env) {
        this.env = env;
    }

    @GetMapping("/profile")
    public String profile() {
        String[] profiles = env.getActiveProfiles();
        if (profiles.length == 0) return "default";
        return profiles[0];    // dev, prod-green, prod-blue 중 하나
    }
}
