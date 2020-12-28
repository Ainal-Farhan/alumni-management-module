/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fabu.controller.alumni;

import com.fabu.model.alumni.Alumni;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PC
 */
public class AlumniServlet extends HttpServlet {
    
    private static ArrayList<Alumni> alumniList;
    private static int totalAlumni = 0;
    private static Alumni currentAlumni;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            if(alumniList == null || alumniList.isEmpty()) {
                getAllAlumniInfoFromDatabase();
            }
            
            String requestType = request.getParameter("requestType");
            
            if(requestType.equalsIgnoreCase("viewAlumniList")) {
                if(getAllAlumniInfoFromDatabase()) {
                    processViewAlumniList(request, response);
                }
                else {
                    out.println("Error Happen when retrieving all of the alumni information from database");
                }
            }
            else if(requestType.equalsIgnoreCase("manageAlumnusAlumnaInfo")) {
                if(setCurrentAlumni(request, response)) {
                    viewManageInfoPage(request, response);
                }
                else {
                    HttpSession session = request.getSession();
                    out.println("Error happen when retrieving current alumni information with alumniID = " + session.getAttribute("currentAlumniID") + " from database<br />");
                    out.println("- Alumni with such ID might not exist within database<br />");                    
                    out.println("- Check your database connection in Connection getCon() within the AlumniServlet<br />");
                    out.println("- Check your SQL Statement<br />");
                }
            } 
            else if(requestType.equalsIgnoreCase("manageSelectedAlumniInfo")) {
                processManageSelectedAlumniInfo(request, response);
                viewManageInfoPage(request, response);
            }
            else if(requestType.equalsIgnoreCase("deleteOrUpdateAlumniInfo")) {
                String btnUpdateSelected = request.getParameter("update-btn");
                String btnDeleteSelected = request.getParameter("delete-btn");
                
                if(btnUpdateSelected != null) {
                    processViewUpdateAlumniInfoPage(request, response);
                }
                else if(btnDeleteSelected != null) {
                    processViewDeleteAlumniInfoPage(request, response);
                }
            }
            else if(requestType.equalsIgnoreCase("updateAlumniInfo")) {
                String btnSaveSelected = request.getParameter("save-btn");
                String btnCancelSelected = request.getParameter("cancel-btn");
                
                if(btnSaveSelected != null) {
                    saveUpdatedInfoIntoDatabase(request, response);
                }
                else if(btnCancelSelected != null) {
                    viewManageInfoPage(request, response);
                }
            }else if(requestType.equalsIgnoreCase("confirmDeleteAlumniInfo")) {
                String btnYesSelected = request.getParameter("yes-btn");
                String btnNoSelected = request.getParameter("no-btn");
                
                if(btnYesSelected != null) {
                    deleteAlumniAccountFromDatabase(request, response);
                }
                else if(btnNoSelected != null) {
                    viewManageInfoPage(request, response);
                }
            }
        }
    }
    
    private boolean deleteAlumniAccountFromDatabase(HttpServletRequest request, HttpServletResponse response) {
        boolean status = false;
        try {
            String currentAlumniID = currentAlumni.getAlumniID();
            
            Connection con = getCon();
            
            String statementQuery = "DELETE FROM `Alumni` WHERE `Alumni`.`alumniID` LIKE ?";
            PreparedStatement statement = con.prepareStatement(statementQuery);
            
            statement.setString(1, currentAlumniID);
            
            int result = statement.executeUpdate();
            
            if(result == 0) {
                status = false;
            }
            else if(result > 0) {
                status = true;
            }
            
            if(status) {                
                for(int i = 0; i < totalAlumni; i++) {
                    if(alumniList.get(i).getAlumniID().equals(currentAlumniID)) {
                        alumniList.remove(i);
                        break;
                    }
                }
                currentAlumni = null;
                --totalAlumni;
                processViewAlumniList(request, response);
            }            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AlumniServlet.class.getName()).log(Level.SEVERE, null, ex);
            status = false;
        } finally {
            return status;
        }
    }
    
    private boolean setCurrentAlumni(HttpServletRequest request, HttpServletResponse response) {
        currentAlumni = null;
        boolean status = false;
        try {
            Connection con = getCon();
            
            HttpSession session = request.getSession();
            String currentAlumniID = (String)session.getAttribute("currentAlumniID");
            
            String statementQuery = "SELECT * FROM `Alumni` WHERE `Alumni`.`alumniID` IN (?);";
            
            PreparedStatement statement = con.prepareStatement(statementQuery);
            statement.setString(1, currentAlumniID);
            
            boolean result = statement.execute();
            
            if(result) {
                status = true;
                for(int i = 0; i < totalAlumni; i++) {
                    if(currentAlumniID.equals(alumniList.get(i).getAlumniID())) {
                        currentAlumni = alumniList.get(i);
                        break;
                    }
                }
            }else {
                status = false;
            }            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AlumniServlet.class.getName()).log(Level.SEVERE, null, ex);
            status = false;
        } finally {
            return status;
        }
    }
    
    private boolean saveUpdatedInfoIntoDatabase(HttpServletRequest request, HttpServletResponse response) {
        boolean status = false;
        try {
            String currentAlumniID = currentAlumni.getAlumniID();
            String currentAlumniUsername = currentAlumni.getAlumniUsername();
            String currentAlumniPassword = currentAlumni.getAlumniPassword();
            
            String updatedPictureName = request.getParameter("updatedPictureName");
            String updatedAlumniName = request.getParameter("updatedAlumniName");
            String updatedAlumniPhoneNumber = request.getParameter("updatedAlumniPhoneNumber");
            String updatedAlumniProfStatus = request.getParameter("updatedAlumniProfStatus");
            int updatedAlumniProfStatusGainedYear = Integer.parseInt(request.getParameter("updatedAlumniProfStatusGainedYear"));

            String updatedAlumniAddress1 = request.getParameter("updatedAlumniAddress1");
            String updatedAlumniAddress2 = request.getParameter("updatedAlumniAddress2");
            String updatedAlumniAddressCity = request.getParameter("updatedAlumniAddressCity");
            String updatedAlumniAddressPostCode = request.getParameter("updatedAlumniAddressPostCode");
            String updatedAlumniAddressState = request.getParameter("updatedAlumniAddressState");
            String updatedAlumniAddressCountry = request.getParameter("updatedAlumniAddressCountry");

            String updatedAlumniFieldOfSpecialization = request.getParameter("updatedAlumniFieldOfSpecialization");
            String updatedAlumniDegree = request.getParameter("updatedAlumniDegree");
            int updatedAlumniBatch = Integer.parseInt(request.getParameter("updatedAlumniBatch"));
            int updatedAlumniGraduateYear = Integer.parseInt(request.getParameter("updatedAlumniGraduateYear"));
            String updatedAlumniEmail = request.getParameter("updatedAlumniEmail");

            String updatedAlumniCurJob = request.getParameter("updatedAlumniCurJob");
            String updatedAlumniPrevJob = request.getParameter("updatedAlumniPrevJob");
            String updatedAlumniCurEmployer = request.getParameter("updatedAlumniCurEmployer");
            String updatedAlumniPrevEmployer = request.getParameter("updatedAlumniPrevEmployer");
            double updatedAlumniCurSalary = Double.parseDouble(request.getParameter("updatedAlumniCurSalary"));
            double updatedAlumniPrevSalary = Double.parseDouble(request.getParameter("updatedAlumniPrevSalary"));

            String updatedEmployerAddress1 = request.getParameter("updatedEmployerAddress1");
            String updatedEmployerAddress2 = request.getParameter("updatedEmployerAddress2");
            String updatedEmployerAddressCity = request.getParameter("updatedEmployerAddressCity");
            String updatedEmployerAddressPostCode = request.getParameter("updatedEmployerAddressPostCode");
            String updatedEmployerAddressState = request.getParameter("updatedEmployerAddressState");
            String updatedEmployerAddressCountry = request.getParameter("updatedEmployerAddressCountry");
            
            Connection con = getCon();
            
            String statementQuery = "UPDATE `alumni` SET `alumniAddress1` = ?, `alumniAddress2` = ?, `alumniAddressCity` = ?, `alumniAddressCountry` = ?, `alumniAddressPostCode` = ?, `alumniAddressState` = ?, `alumniBatch` = ?, `alumniCurEmployer` = ?, `alumniCurJob` = ?, `alumniCurSalary` = ?, `alumniDegree` = ?, `alumniEmail` = ?, `alumniFieldOfSpecialization` = ?, `alumniGraduateYear` = ?, `alumniName` = ?, `alumniPhoneNumber` = ?, `alumniPrevEmployer` = ?, `alumniPrevJob` = ?, `alumniPrevSalary` = ?, `alumniProfilePicture` = ?, `alumniProfStatus` = ?, `alumniProfStatusYearGained` = ?, `alumniUsername` = ?, `alumniUserPassword` = ?, `employerAddress1` = ?, `employerAddress2` = ?, `employerAddressCity` = ?, `employerAddressCountry` = ?, `employerAddressPostCode` = ?, `employerAddressState` = ? WHERE `alumni`.`alumniID` = ?;";
            PreparedStatement statement = con.prepareStatement(statementQuery);
            
            statement.setString(1, updatedAlumniAddress1);
            statement.setString(2, updatedAlumniAddress2);
            statement.setString(3, updatedAlumniAddressCity);
            statement.setString(4, updatedAlumniAddressCountry);
            statement.setString(5, updatedAlumniAddressPostCode);
            statement.setString(6, updatedAlumniAddressState);
            statement.setInt(7, updatedAlumniBatch);
            statement.setString(8, updatedAlumniCurEmployer);
            statement.setString(9, updatedAlumniCurJob);
            statement.setDouble(10, updatedAlumniCurSalary);
            statement.setString(11, updatedAlumniDegree);
            statement.setString(12, updatedAlumniEmail);
            statement.setString(13, updatedAlumniFieldOfSpecialization);
            statement.setInt(14, updatedAlumniGraduateYear);
            statement.setString(15, updatedAlumniName);
            statement.setString(16, updatedAlumniPhoneNumber);
            statement.setString(17, updatedAlumniPrevEmployer);
            statement.setString(18, updatedAlumniPrevJob);
            statement.setDouble(19, updatedAlumniPrevSalary);
            statement.setString(20, updatedPictureName);
            statement.setString(21, updatedAlumniProfStatus);
            statement.setInt(22, updatedAlumniProfStatusGainedYear);
            statement.setString(23, currentAlumniUsername);
            statement.setString(24, currentAlumniPassword);
            statement.setString(25, updatedEmployerAddress1);
            statement.setString(26, updatedEmployerAddress2);
            statement.setString(27, updatedEmployerAddressCity);
            statement.setString(28, updatedEmployerAddressCountry);
            statement.setString(29, updatedEmployerAddressPostCode);
            statement.setString(30, updatedEmployerAddressState);
            statement.setString(31, currentAlumniID);
            
            int result = statement.executeUpdate();
            
            if(result == 0) {
                status = false;
            }
            else if(result > 0) {
                status = true;
            }
            
            if(status) {                
                currentAlumni.setAlumniLoginCredentials(currentAlumniUsername, currentAlumniPassword);
                currentAlumni.setAlumniPersonalInfo(currentAlumniID, updatedAlumniProfStatus, updatedAlumniProfStatusGainedYear, 
                        updatedAlumniName, updatedAlumniEmail, updatedAlumniPhoneNumber, updatedPictureName);
                currentAlumni.setAlumniAddress(updatedAlumniAddress1, updatedAlumniAddress2, updatedAlumniAddressCity, 
                        updatedAlumniAddressPostCode, updatedAlumniAddressState, updatedAlumniAddressCountry);
                
                currentAlumni.setAlumniEducationalInfo(updatedAlumniGraduateYear, updatedAlumniDegree, updatedAlumniFieldOfSpecialization, updatedAlumniBatch);
                
                currentAlumni.setAlumniEmploymentInfo(updatedAlumniPrevJob, updatedAlumniPrevSalary, updatedAlumniCurJob, updatedAlumniCurSalary, 
                        updatedAlumniPrevEmployer, updatedAlumniCurEmployer);
                currentAlumni.setEmployerAddress(updatedEmployerAddress1, updatedEmployerAddress2, updatedEmployerAddressCity, 
                        updatedEmployerAddressPostCode, updatedEmployerAddressState, updatedEmployerAddressCountry);
                
                for(int i = 0; i < totalAlumni; i++) {
                    if(alumniList.get(i).getAlumniID().equals(currentAlumniID)) {
                        alumniList.set(i, currentAlumni);
                        break;
                    }
                }
                viewManageInfoPage(request, response);
            }            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AlumniServlet.class.getName()).log(Level.SEVERE, null, ex);
            status = false;
        } finally {
            return status;
        }
    }
    
    private void processViewUpdateAlumniInfoPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getAllAlumniInfoFromDatabase();
        
        setAttributesForCurrentAlumni(request, response);
        
        RequestDispatcher dispatcher = getServletConfig().getServletContext().getRequestDispatcher("/WEB-INF/jsp/views/updateAlumniInfoPage.jsp");
        dispatcher.forward(request, response);
    }
    
    private void processViewDeleteAlumniInfoPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        setAttributesForCurrentAlumni(request, response);
        
        RequestDispatcher dispatcher = getServletConfig().getServletContext().getRequestDispatcher("/WEB-INF/jsp/views/deleteAlumniInfoPage.jsp");
        dispatcher.forward(request, response);
    }
    
    private void processManageSelectedAlumniInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String selectedAlumniID = request.getParameter("selectedAlumniID");
                
        for(int i = 0; i < totalAlumni; i++) {
            if(alumniList.get(i).getAlumniID().equals(selectedAlumniID)) {
                currentAlumni = alumniList.get(i);
                break;
            }
        }
    }
    
    private void viewManageInfoPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(currentAlumni == null) {
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()){
                
                out.println("currentAlumni is null");
                
                return;
            }
        }
        
        setAttributesForCurrentAlumni(request, response);
        
        RequestDispatcher dispatcher = getServletConfig().getServletContext().getRequestDispatcher("/WEB-INF/jsp/views/manageAlumniInfoPage.jsp");
        dispatcher.forward(request, response);
    }
    
    private void setAttributesForCurrentAlumni(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("username", currentAlumni.getAlumniUsername());
        request.setAttribute("password", currentAlumni.getAlumniPassword());
        
        request.setAttribute("id", currentAlumni.getAlumniID());
        request.setAttribute("name", currentAlumni.getAlumniName());
        request.setAttribute("phoneNumber", currentAlumni.getAlumniPhoneNumber());
        request.setAttribute("profilePicture", currentAlumni.getAlumniProfilePicture());
        request.setAttribute("profStatus", currentAlumni.getAlumniProfStatus());
        request.setAttribute("profStatusYearGained", currentAlumni.getAlumniProfStatusYearGained());
        
        request.setAttribute("alumniAddress1", currentAlumni.getAlumniAddress1());
        request.setAttribute("alumniAddress2", currentAlumni.getAlumniAddress2());
        request.setAttribute("alumniAddressCity", currentAlumni.getAlumniAddressCity());
        request.setAttribute("alumniAddressCountry", currentAlumni.getAlumniAddressCountry());
        request.setAttribute("alumniAddressPostCode", currentAlumni.getAlumniAddressPostCode());
        request.setAttribute("alumniAddressState", currentAlumni.getAlumniAddressState());
        
        request.setAttribute("batch", currentAlumni.getAlumniBatch());
        request.setAttribute("degree", currentAlumni.getAlumniDegree());
        request.setAttribute("email", currentAlumni.getAlumniEmail());
        request.setAttribute("fieldOfSpecialization", currentAlumni.getAlumniFieldOfSpecialization());
        request.setAttribute("graduateYear", currentAlumni.getAlumniGraduateYear());
        
        request.setAttribute("curEmployer", currentAlumni.getAlumniCurEmployer());
        request.setAttribute("curJob", currentAlumni.getAlumniCurJob());
        request.setAttribute("curSalary", currentAlumni.getAlumniCurSalary());
        
        request.setAttribute("prevEmployer", currentAlumni.getAlumniPrevEmployer());
        request.setAttribute("prevJob", currentAlumni.getAlumniPrevJob());
        request.setAttribute("prevSalary", currentAlumni.getAlumniPrevSalary());
        
        request.setAttribute("employerAddress1", currentAlumni.getEmployerAddress1());
        request.setAttribute("employerAddress2", currentAlumni.getEmployerAddress2());
        request.setAttribute("employerAddressCity", currentAlumni.getEmployerAddressCity());
        request.setAttribute("employerAddressCountry", currentAlumni.getEmployerAddressCountry());
        request.setAttribute("employerAddressPostCode", currentAlumni.getEmployerAddressPostCode());
        request.setAttribute("employerAddressState", currentAlumni.getEmployerAddressState());
    }
    
    private void processViewAlumniList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String[] alumniID = new String[totalAlumni];
        String[] alumniName = new String[totalAlumni];
        String[] alumniEmail = new String[totalAlumni];
        String[] alumniState = new String[totalAlumni]; 
        String[] alumniGraduationYear = new String[totalAlumni];
        String[] alumniBatch = new String[totalAlumni];
        String[] alumniProfStatus = new String[totalAlumni];
        String[] alumniCurJob = new String[totalAlumni];
        
        for(int i = 0; i < totalAlumni; i++) {
            alumniID[i] = alumniList.get(i).getAlumniID();
            alumniName[i] = alumniList.get(i).getAlumniName();
            alumniEmail[i] = alumniList.get(i).getAlumniEmail();
            alumniState[i] = alumniList.get(i).getAlumniAddressState();
            alumniGraduationYear[i] = Integer.toString(alumniList.get(i).getAlumniGraduateYear());
            alumniBatch[i] = Integer.toString(alumniList.get(i).getAlumniBatch());
            alumniProfStatus[i] = alumniList.get(i).getAlumniProfStatus();
            alumniCurJob[i] = alumniList.get(i).getAlumniCurJob();
        }
        
        request.setAttribute("totalAlumni", totalAlumni);
        request.setAttribute("alumniIDArray", alumniID);
        request.setAttribute("alumniNameArray", alumniName);
        request.setAttribute("alumniEmailArray", alumniEmail);
        request.setAttribute("alumniStateArray", alumniState);
        request.setAttribute("alumniGraduationYearArray", alumniGraduationYear);
        request.setAttribute("alumniBatchArray", alumniBatch);
        request.setAttribute("alumniProfStatusArray", alumniProfStatus);
        request.setAttribute("alumniCurJobArray", alumniCurJob);
        
        RequestDispatcher dispatcher = getServletConfig().getServletContext().getRequestDispatcher("/WEB-INF/jsp/views/viewAlumniListInfoPage.jsp");
        dispatcher.forward(request, response);
    }
    
    private boolean getAllAlumniInfoFromDatabase() {
        alumniList = new ArrayList<Alumni>();
        boolean status = false;
        try {
            Connection con = getCon();
            
            String statementQuery = "SELECT * FROM Alumni";
            
            Statement statement = con.createStatement();
            ResultSet result = statement.executeQuery(statementQuery);
            
            while(result.next()) {
                Alumni alumni = new Alumni();
                
                alumni.setAlumniLoginCredentials(result.getString("alumniUsername"), result.getString("alumniUserPassword"));
                alumni.setAlumniPersonalInfo(result.getString("alumniID"), result.getString("alumniProfStatus"), result.getInt("alumniProfStatusYearGained"), 
                        result.getString("alumniName"), result.getString("alumniEmail"), result.getString("alumniPhoneNumber"), result.getString("alumniProfilePicture"));
                alumni.setAlumniAddress(result.getString("alumniAddress1"), result.getString("alumniAddress2"), result.getString("alumniAddressCity"), 
                        result.getString("alumniAddressPostCode"), result.getString("alumniAddressState"), result.getString("alumniAddressCountry"));
                
                alumni.setAlumniEducationalInfo(result.getInt("alumniGraduateYear"), result.getString("alumniDegree"), result.getString("alumniFieldOfSpecialization"), result.getInt("alumniBatch"));
                
                alumni.setAlumniEmploymentInfo(result.getString("alumniPrevJob"), result.getDouble("alumniPrevSalary"), result.getString("alumniCurJob"), result.getDouble("alumniCurSalary"), 
                        result.getString("alumniPrevEmployer"), result.getString("alumniCurEmployer"));
                alumni.setEmployerAddress(result.getString("employerAddress1"), result.getString("employerAddress2"), result.getString("employerAddressCity"), 
                        result.getString("employerAddressPostCode"), result.getString("employerAddressState"), result.getString("employerAddressCountry"));
                
                alumniList.add(alumni);
                status = true;
            }
            
            totalAlumni = alumniList.size();
            return true;
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AlumniServlet.class.getName()).log(Level.SEVERE, null, ex);
            status = false;
        } finally {
            return status;
        }
    }
    
    private Connection getCon() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/alumni_module-db", "root", "");
        
        return con;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
