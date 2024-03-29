package gcu.backend.authservice.domain.user.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;

// "UserSignUpDto", used to specify the user sign up dto
@NoArgsConstructor
@Getter
public class UserSignUpDto {
    private String email;
    private String password;
    private String nickname;
}
