package de.alphaomega.it.dmv.utils;

import de.alphaomega.it.dmv.database.entities.User;
import jakarta.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.Map;

public class WebUtils {

    private static int REDIRECT_ID = 0;
    private static final Map<Integer, String> idUriMap = new HashMap<>();
    private static final Map<String, Integer> uriIdMap = new HashMap<>();

    public WebUtils() {

    }

    public static void storeLoggedUser(final HttpSession session, final User user) {
        session.setAttribute("loggedUser", user);
    }

    public static User getLoggedUser(final HttpSession session) {
        return (User) session.getAttribute("loggedUser");
    }

    public static int storeRedirectAfterLoginURL(final String requestURI) {
        Integer redirectId = uriIdMap.get(requestURI);

        if (redirectId == null) {
            redirectId = REDIRECT_ID++;

            uriIdMap.put(requestURI, redirectId);
            idUriMap.put(redirectId, requestURI);
            return redirectId;
        }

        return redirectId;
    }

    public static String getRedirectAfterLoginURL(final int redirectId) {
        return idUriMap.get(redirectId);
    }
}