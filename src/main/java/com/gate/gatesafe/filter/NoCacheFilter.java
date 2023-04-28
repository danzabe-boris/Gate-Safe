package com.gate.gatesafe.filter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "noCacheFilter")
public class NoCacheFilter implements Filter {

    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletResponse res = (HttpServletResponse) response;

        res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        res.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        res.setDateHeader("Expires", 0); // Proxies.

        chain.doFilter(request, response);
    }
}
