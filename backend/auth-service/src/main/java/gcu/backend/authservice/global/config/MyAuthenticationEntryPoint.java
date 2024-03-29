package gcu.backend.authservice.global.config;

import java.io.IOException;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

// "MyAuthenticationEntryPoint" is a class that implements "AuthenticationEntryPoint" interface.
// It is used to handle authentication entry point.
@RequiredArgsConstructor
public class MyAuthenticationEntryPoint implements AuthenticationEntryPoint {

    /*
     * commence(), this method is called when authentication entry point is called.
     * 
     * Args:
     * - request: HttpServletRequest : HttpServletRequest object
     * - response: HttpServletResponse : HttpServletResponse object
     * - authException: AuthenticationException : AuthenticationException object
     * 
     * Return:
     * - void
     */
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException authException) throws IOException, ServletException {
        response.setContentType("application/json");
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        response.getWriter().write("{\"error\": \"Unauthorized\"}");
    }
}
