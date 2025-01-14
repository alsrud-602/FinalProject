package com.board.users.dto;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.oauth2.core.user.OAuth2User;

public class CustomOAuth2User implements OAuth2User {
    private OAuth2User oauth2User;
    private String additionalInfo;

    public CustomOAuth2User(OAuth2User oauth2User, String additionalInfo) {
        this.oauth2User = oauth2User;
        this.additionalInfo = additionalInfo;
    }

    @Override
    public Map<String, Object> getAttributes() {
        return oauth2User.getAttributes();
    }

    @Override
    public String getName() {
        return oauth2User.getName();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return AuthorityUtils.createAuthorityList("ROLE_USER");  // Adjust based on your role management
    }

    public String getAdditionalInfo() {
        return additionalInfo;
    }
}
