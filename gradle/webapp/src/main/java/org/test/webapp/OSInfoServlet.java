package org.test.webapp;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OSInfoServlet extends HttpServlet {
  @Override protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
  
    resp.getWriter().println(new Date());
    
    resp.getWriter().println("OS Info Servlet Requested");

    String jre_arch = System.getProperty("os.arch");
    resp.getWriter().println("JRE Arch " + jre_arch);

    String os_version = System.getProperty("os.version");
    resp.getWriter().println("OS Version " + os_version);

    String os_name = System.getProperty("os.name");
    resp.getWriter().println("OS Name " + os_name);

  }
}
