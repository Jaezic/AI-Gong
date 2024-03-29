package gcu.backend.authservice.global.oauth2.handler;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import gcu.backend.authservice.domain.user.Role;
import gcu.backend.authservice.domain.user.User;
import gcu.backend.authservice.domain.user.repository.UserRepository;
import gcu.backend.authservice.global.jwt.service.JwtService;
import gcu.backend.authservice.global.oauth2.CustomOAuth2User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Enumeration;

// "OAuth2LoginSuccessHandler" is a handler class that implements "AuthenticationSuccessHandler" interface.
@Slf4j
@Component("oauth2LoginSuccessHandler")
@RequiredArgsConstructor
// @Transactional
public class OAuth2LoginSuccessHandler implements AuthenticationSuccessHandler {

    // "userRepository" is a repository class for "User" entity.
    private final JwtService jwtService;

    /*
     * onAuthenticationSuccess(), this method is called when OAuth2 login succeeds.
     * 
     * Args:
     * - request: HttpServletRequest : HttpServletRequest object
     * - response: HttpServletResponse : HttpServletResponse object
     * 
     * Return:
     * - void
     */
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        log.info("OAuth2 Login 성공!");
        try {
            CustomOAuth2User oAuth2User = (CustomOAuth2User) authentication.getPrincipal();
            loginSuccess(response, oAuth2User);

            // User의 Role이 GUEST일 경우 처음 요청한 회원이므로 회원가입 페이지로 리다이렉트
            // if (oAuth2User.getRole() == Role.GUEST) {
            // String accessToken = jwtService.createAccessToken(oAuth2User.getEmail());
            // response.addHeader(jwtService.getAccessHeader(), "Bearer " + accessToken);
            // // response.sendRedirect("oauth2/sign-up"); // 프론트의 회원가입 추가 정보 입력 폼으로 리다이렉트

            // jwtService.sendAccessAndRefreshToken(response, accessToken, null);
            // User findUser = userRepository.findByEmail(oAuth2User.getEmail())
            // .orElseThrow(() -> new IllegalArgumentException("이메일에 해당하는 유저가 없습니다."));
            // findUser.authorizeUser();
            // userRepository.save(findUser);
            // } else {
            // loginSuccess(response, oAuth2User); // 로그인에 성공한 경우 access, refresh 토큰 생성
            // }
        } catch (Exception e) {
            throw e;
        }

    }

    /*
     * loginSuccess(), this method is called when OAuth2 login succeeds.
     * 
     * Args:
     * - response: HttpServletResponse : HttpServletResponse object
     * 
     * Return:
     * - void
     */
    // TODO : 소셜 로그인 시에도 무조건 토큰 생성하지 말고 JWT 인증 필터처럼 RefreshToken 유/무에 따라 다르게 처리해보기
    private void loginSuccess(HttpServletResponse response, CustomOAuth2User oAuth2User)
            throws IOException {

        String accessToken = jwtService.createAccessToken(oAuth2User.getEmail());
        String refreshToken = jwtService.createRefreshToken();
        response.addHeader(jwtService.getAccessHeader(), "Bearer " + accessToken);
        response.addHeader(jwtService.getRefreshHeader(), "Bearer " + refreshToken);

        String port = "80";
        response.sendRedirect(
                "http://ai-gong.com:" + port + "/static.html?access_token=" + accessToken + "&refresh_token="
                        + refreshToken);
        jwtService.sendAccessAndRefreshToken(response, accessToken, refreshToken);
        jwtService.updateRefreshToken(oAuth2User.getEmail(), refreshToken);
    }
}