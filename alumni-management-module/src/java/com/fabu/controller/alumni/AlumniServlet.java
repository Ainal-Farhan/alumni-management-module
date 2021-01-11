/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fabu.controller.alumni;

import com.fabu.model.Alumni;
import com.google.gson.Gson;
import java.io.File;
import java.io.FileOutputStream;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.lang.ClassNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author PC
 */
@WebServlet("/mobile-api/alumniList")
@MultipartConfig
public class AlumniServlet extends HttpServlet {
    
    private static ArrayList<Alumni> alumniList;
    
    private static Alumni currentAlumni;
    
    private static int totalAlumni = 0;
    
    private static int totalPages;
    private final int TOTAL_ALUMNI_PER_PAGE = 10;
    private static int currentPage = 1;
    
    private static final Comparator<Alumni> ascAlumniName;
    private static final Comparator<Alumni> descAlumniName;

    // We initialize static variables inside a static block.
    static {
        ascAlumniName = (Alumni alumni1, Alumni alumni2) -> alumni1.getName().compareTo(alumni2.getName());
        descAlumniName = (Alumni alumni1, Alumni alumni2) -> alumni2.getName().compareTo(alumni1.getName());
    }
            
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
            
            if(requestType == null) {
                out.println("<script>alert('requestType is null');</script>");
            }
            else if(requestType.equalsIgnoreCase("viewAlumniList")) {
                if(getAllAlumniInfoFromDatabase()) {
                    sortAlumniByNameAscendingOrder();
                    goToFirstPage();
                    processViewAlumniList(request, response);
                }
                else {
                    out.println("<script>alert('Error Happen when retrieving all of the alumni information from database');</script>");
                }
            }
            else if(requestType.equalsIgnoreCase("updateAlumniProfilePicture")) {
//                final String path = request.getSession().getServletContext().getRealPath("/") + "assets\\img\\profile\\alumni";
//                
//                if(request.getPart("remove-btn") != null) {
//                    String defaultImageName = "default.png";
//                    
//                    saveUpdatedProfilePictureIntoDatabase(defaultImageName);
//                
//                    Logger.getLogger(AlumniServlet.class.getName()).log(Level.INFO, "File {0} being uploaded to {1}", 
//                            new Object[]{defaultImageName, path});
//
//                    processViewUpdateAlumniInfoPage(request, response);
//                
//                    return;
//                }
//                
//                final Part imageFilePart = request.getPart("selectedImage");
//                String fileName = getFileName(imageFilePart);
//                String extension = "";
//                
//                OutputStream outFile = null;
//                InputStream filecontent = null;
//                
//                if(fileName.substring(fileName.length() - 5, fileName.length() - 4).equals(".")) {
//                    if(fileName.substring(fileName.length() - 5).equalsIgnoreCase(".jpeg")) {
//                        extension = ".jpeg";
//                    }
//                }
//                else if (fileName.substring(fileName.length() - 4, fileName.length() - 3).equals(".")) {
//                    if(fileName.substring(fileName.length() - 4).equalsIgnoreCase(".jpg")) {
//                        extension = ".jpg";
//                    }
//                    else if(fileName.substring(fileName.length() - 4).equalsIgnoreCase(".png")) {
//                        extension = ".png";
//                    }
//                }
//                
//                fileName = Integer.toString(currentAlumni.getId()) + "_profile-picture" + extension;
//                
//                File uploadedImage = new File(path + File.separator + fileName);
//                
//                outFile = new FileOutputStream(uploadedImage);
//                filecontent = imageFilePart.getInputStream();
//
//                int read = 0;
//                final byte[] bytes = new byte[1024];
//
//                while ((read = filecontent.read(bytes)) != -1) {
//                    outFile.write(bytes, 0, read);
//                }
//                
//                saveUpdatedProfilePictureIntoDatabase(fileName);
//                
//                Logger.getLogger(AlumniServlet.class.getName()).log(Level.INFO, "File{0}being uploaded to {1}", 
//                        new Object[]{fileName, path});
                
                out.println("<script>alert('Heroku does not allow creating new file(images) inside the web-app');</script>");
                
                
                setAttributesForCurrentAlumni(request, response);
                RequestDispatcher dispatcher = getServletConfig().getServletContext().getRequestDispatcher("/WEB-INF/jsp/views/updateAlumniInfoPage.jsp");
                dispatcher.include(request, response);
            }
            else if(requestType.equalsIgnoreCase("manageAlumnusAlumnaInfo")) {
                if(setCurrentAlumni(request)) {
                    viewManageInfoPage(request, response);
                }
                else {
                    HttpSession session = request.getSession();
                    
                    String message = "Error happen when retrieving current alumni information with alumniID =" + session.getAttribute("currentAlumniID") + " from database<br />";
                            
                    viewOverlay(request, response, message);
                    out.println("Error happen when retrieving current alumni information with alumniID = " + session.getAttribute("currentAlumniID") + " from database<br />");
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
                    viewOverlay(request, response, "Any changes made have been reverted");
                }
                
                viewManageInfoPage(request, response);
            }
            else if(requestType.equalsIgnoreCase("confirmDeleteAlumniInfo")) {
                String btnYesSelected = request.getParameter("yes-btn");
                String btnNoSelected = request.getParameter("no-btn");
                
                if(btnYesSelected != null) {
                    String message = "";
                     
                    if(deleteAlumniAccountFromDatabase(request, response)) {
                        message = "Successfully delete alumni";
                    }
                    else {
                        message = "Failed to delete alumni";
                    }
                           
                    viewOverlay(request, response, message);
                    processViewAlumniList(request, response);
                }
                else if(btnNoSelected != null) {
                    viewManageInfoPage(request, response);
                }
            }
            else if(requestType.equalsIgnoreCase("goToSelectedPage")) {
                goToSelectedPage(Integer.parseInt(request.getParameter("selectedPage")));
                processViewAlumniList(request, response);
            }
            else if(requestType.equalsIgnoreCase("goToFirstPage")) {
                goToFirstPage();
                processViewAlumniList(request, response);
            }
            else if(requestType.equalsIgnoreCase("goToPreviousPage")) {
                goToPreviousPage();
                processViewAlumniList(request, response);
            }
            else if(requestType.equalsIgnoreCase("goToNextPage")) {
                goToNextPage();
                processViewAlumniList(request, response);
            }
            else if(requestType.equalsIgnoreCase("goToLastPage")) {
                goToLastPage();
                processViewAlumniList(request, response);
            }
            else if(requestType.equalsIgnoreCase("filterAlumniInfo")) {
                
                if(request.getParameter("filterReq").equalsIgnoreCase("orderByNameAtoZ")) {
                    sortAlumniByNameAscendingOrder();
                    request.setAttribute("filterReq", "orderByNameAtoZ");
                }
                else if(request.getParameter("filterReq").equalsIgnoreCase("orderByNameZtoA")) {
                    sortAlumniByNameDescendingOrder();
                    request.setAttribute("filterReq", "orderByNameZtoA");
                }
                
                goToFirstPage();
                processViewAlumniList(request, response);
            }
            else if(requestType.equalsIgnoreCase("searchAlumni")) {
                String searchBtn = request.getParameter("searchBtn");
                String resetBtn = request.getParameter("resetBtn");
                
                if(searchBtn != null) {
                    String searchReq = request.getParameter("searchReq");
                    String searchInfo = request.getParameter("searchInfo");

                    if(searchReq.equalsIgnoreCase("searchByName")) {
                        searchByAlumniName(searchInfo);
                    }
                    else if(searchReq.equalsIgnoreCase("searchByBatch")) {
                        searchByAlumniBatch(Integer.parseInt(searchInfo));
                    }
                    else if(searchReq.equalsIgnoreCase("searchByLocationInState")) {
                        searchByAlumniLocationInState(searchInfo);
                    }

                    sortAlumniByNameAscendingOrder();
                    request.setAttribute("filterReq", "orderByNameAtoZ");
                    request.setAttribute("selectedSearchReq", searchReq);
                    goToFirstPage();
                    processViewAlumniList(request, response);
                }
                else if(resetBtn != null){
                    if(getAllAlumniInfoFromDatabase()) {
                        sortAlumniByNameAscendingOrder();
                        goToFirstPage();
                        processViewAlumniList(request, response);
                    }
                    else {
                        out.println("Error Happen when retrieving all of the alumni information from database");
                    }
                }
            }
        }
    }
    
    private String getFileName(final Part part) {
    final String partHeader = part.getHeader("content-disposition");
        Logger.getLogger(AlumniServlet.class.getName()).log(Level.INFO, "Part Header = {0}", partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
    
    private void viewOverlay(HttpServletRequest request, HttpServletResponse response, String message)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("processMessage", message);
        session.setAttribute("displayMessage", "block");

        RequestDispatcher dispatcher = getServletConfig().getServletContext().getRequestDispatcher("/WEB-INF/jsp/components/processStatusOverlay.jsp");
        dispatcher.include(request, response);
    }
    
    private void searchByAlumniName(String searchInfo) {
        ArrayList<Alumni> searchResults = new ArrayList<Alumni>();
        
        for(int i = 0; i < totalAlumni; i++) {
            if(alumniList.get(i).getName().toUpperCase().contains(searchInfo.toUpperCase())) {
                searchResults.add(alumniList.get(i));
            }
        }
        
        alumniList = searchResults;
        
        totalAlumni = searchResults.size();
        totalPages = totalAlumni / TOTAL_ALUMNI_PER_PAGE;
            
        int remain = totalAlumni % TOTAL_ALUMNI_PER_PAGE;
        if(remain > 0) {
            totalPages += 1;
        }
    }

    private void searchByAlumniBatch(int searchInfo) {
        ArrayList<Alumni> searchResults = new ArrayList<Alumni>();
        
        for(int i = 0; i < totalAlumni; i++) {
            if(alumniList.get(i).getAlumniBatch() == searchInfo) {
                searchResults.add(alumniList.get(i));
            }
        }
        
        alumniList = searchResults;
        
        totalAlumni = searchResults.size();
        totalPages = totalAlumni / TOTAL_ALUMNI_PER_PAGE;
            
        int remain = totalAlumni % TOTAL_ALUMNI_PER_PAGE;
        if(remain > 0) {
            totalPages += 1;
        }
    }

    private void searchByAlumniLocationInState(String searchInfo) {
        ArrayList<Alumni> searchResults = new ArrayList<Alumni>();
        
        for(int i = 0; i < totalAlumni; i++) {
            if(alumniList.get(i).getAlumniAddressState().toUpperCase().contains(searchInfo.toUpperCase())) {
                searchResults.add(alumniList.get(i));
            }
        }
        
        alumniList = searchResults;
        
        totalAlumni = searchResults.size();
        totalPages = totalAlumni / TOTAL_ALUMNI_PER_PAGE;
            
        int remain = totalAlumni % TOTAL_ALUMNI_PER_PAGE;
        if(remain > 0) {
            totalPages += 1;
        }
    }
    
    private boolean deleteAlumniAccountFromDatabase(HttpServletRequest request, HttpServletResponse response) {
        boolean status = false;
        try {
            int currentAlumniID = currentAlumni.getAlumniID();
            
            Connection con = getCon();
            
            String statementQuery1 = "DELETE FROM `alumni` WHERE `alumni`.`alumniID` = ?";
            String statementQuery2 = "DELETE FROM `user` WHERE `user`.`id` = ?";
            
            PreparedStatement statement1 = con.prepareStatement(statementQuery1);
            PreparedStatement statement2 = con.prepareStatement(statementQuery2);
            
            statement1.setInt(1, currentAlumniID);
            statement2.setInt(1, currentAlumniID);
            
            int result1 = statement1.executeUpdate();
            int result2 = statement2.executeUpdate();
            
            if(result1 == 0 || result2 == 0) {
                status = false;
            }
            else if(result1 > 0 && result2 > 0) {
                status = true;
            }
            
            if(status) {                
                for(int i = 0; i < totalAlumni; i++) {
                    if(alumniList.get(i).getAlumniID() == currentAlumniID) {
                        alumniList.remove(i);
                        break;
                    }
                }
                currentAlumni = null;
                --totalAlumni;
            }            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AlumniServlet.class.getName()).log(Level.SEVERE, null, ex);
            status = false;
        } finally {
            return status;
        }
    }
    
    private void sortAlumniByNameAscendingOrder() {
        Alumni[] alumniArray = new Alumni[totalAlumni];
        
        for(int i = 0; i < totalAlumni; i++) {
            alumniArray[i] = alumniList.get(i);
        }
        
        Arrays.sort(alumniArray, ascAlumniName);
        
        for(int i = 0; i < totalAlumni; i++) { 
            alumniList.set(i, alumniArray[i]);
        }
    }
    
    private void sortAlumniByNameDescendingOrder() {
        Alumni[] alumniArray = new Alumni[totalAlumni];
        
        for(int i = 0; i < totalAlumni; i++) {
            alumniArray[i] = alumniList.get(i);
        }
        
        Arrays.sort(alumniArray, descAlumniName);
        
        for(int i = 0; i < totalAlumni; i++) { 
            alumniList.set(i, alumniArray[i]);
        }
    }
    
    private boolean setCurrentAlumni(HttpServletRequest request) {
        if(getAllAlumniInfoFromDatabase()) {
            currentAlumni = null;

            boolean status = false;

            HttpSession session = request.getSession();
            int currentAlumniID = (Integer)session.getAttribute("currentAlumniID");

            for(int i = 0; i < totalAlumni; i++) {
                if(currentAlumniID == alumniList.get(i).getAlumniID()) {
                    currentAlumni = alumniList.get(i);
                    status = true;
                    break;
                }
                status = false;
            }

            return status;
        }
        
        else
            return false;
    }
    
    private boolean saveUpdatedInfoIntoDatabase(HttpServletRequest request, HttpServletResponse response) {
        boolean status = false;
        try {
            int currentAlumniID = currentAlumni.getAlumniID();
            
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
            
            String statementQuery = "UPDATE `alumni` SET `alumniAddress1` = ?, `alumniAddress2` = ?, `alumniAddressCity` = ?, `alumniAddressCountry` = ?, `alumniAddressPostCode` = ?, `alumniAddressState` = ?, `alumniBatch` = ?, `alumniCurEmployer` = ?, `alumniCurJob` = ?, `alumniCurSalary` = ?, `alumniDegree` = ?, `alumniFieldOfSpecialization` = ?, `alumniGraduateYear` = ?, `alumniPrevEmployer` = ?, `alumniPrevJob` = ?, `alumniPrevSalary` = ?, `alumniProfStatus` = ?, `alumniProfStatusYearGained` = ?, `employerAddress1` = ?, `employerAddress2` = ?, `employerAddressCity` = ?, `employerAddressCountry` = ?, `employerAddressPostCode` = ?, `employerAddressState` = ? WHERE `alumni`.`alumniID` = ?;";
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
            statement.setString(12, updatedAlumniFieldOfSpecialization);
            statement.setInt(13, updatedAlumniGraduateYear);
            statement.setString(14, updatedAlumniPrevEmployer);
            statement.setString(15, updatedAlumniPrevJob);
            statement.setDouble(16, updatedAlumniPrevSalary);
            statement.setString(17, updatedAlumniProfStatus);
            statement.setInt(18, updatedAlumniProfStatusGainedYear);
            statement.setString(19, updatedEmployerAddress1);
            statement.setString(20, updatedEmployerAddress2);
            statement.setString(21, updatedEmployerAddressCity);
            statement.setString(22, updatedEmployerAddressCountry);
            statement.setString(23, updatedEmployerAddressPostCode);
            statement.setString(24, updatedEmployerAddressState);
            statement.setInt(25, currentAlumniID);
            
            int result = statement.executeUpdate();
            
            if(result == 0) {
                status = false;
            }
            else if(result > 0) {
                status = true;
            }
            
            if(status) {                
                currentAlumni.setAlumniPersonalInfo(currentAlumniID, updatedAlumniProfStatus, 
                        updatedAlumniProfStatusGainedYear, currentAlumni.getAlumniProfilePicture());
                
                currentAlumni.setAlumniAddress(updatedAlumniAddress1, updatedAlumniAddress2, updatedAlumniAddressCity, 
                        updatedAlumniAddressPostCode, updatedAlumniAddressState, updatedAlumniAddressCountry);
                
                currentAlumni.setAlumniEducationalInfo(updatedAlumniGraduateYear, updatedAlumniDegree, updatedAlumniFieldOfSpecialization, updatedAlumniBatch);
                
                currentAlumni.setAlumniEmploymentInfo(updatedAlumniPrevJob, updatedAlumniPrevSalary, updatedAlumniCurJob, updatedAlumniCurSalary, 
                        updatedAlumniPrevEmployer, updatedAlumniCurEmployer);
                
                currentAlumni.setEmployerAddress(updatedEmployerAddress1, updatedEmployerAddress2, updatedEmployerAddressCity, 
                        updatedEmployerAddressPostCode, updatedEmployerAddressState, updatedEmployerAddressCountry);
                
                for(int i = 0; i < totalAlumni; i++) {
                    if(alumniList.get(i).getAlumniID() == currentAlumniID) {
                        alumniList.set(i, currentAlumni);
                        break;
                    }
                }
            }            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AlumniServlet.class.getName()).log(Level.SEVERE, null, ex);
            status = false;
        } finally {
            return status;
        }
    }
    
    private boolean saveUpdatedProfilePictureIntoDatabase(String pictureName) {
        boolean status = false;
        try {
            int currentAlumniID = currentAlumni.getAlumniID();
            
            Connection con = getCon();
            
            String statementQuery = "UPDATE `alumni` SET `alumniProfilePicture` = ? WHERE `alumni`.`alumniID` = ?;";
            PreparedStatement statement = con.prepareStatement(statementQuery);
            
            statement.setString(1, pictureName);
            statement.setInt(2, currentAlumniID);
            
            int result = statement.executeUpdate();
            
            if(result == 0) {
                status = false;
            }
            else if(result > 0) {
                status = true;
            }
            
            if(status) {                
                currentAlumni.setAlumniPersonalInfo(currentAlumniID, currentAlumni.getAlumniProfStatus(), 
                        currentAlumni.getAlumniProfStatusYearGained(), pictureName);
                                
                for(int i = 0; i < totalAlumni; i++) {
                    if(alumniList.get(i).getAlumniID() == currentAlumniID) {
                        alumniList.set(i, currentAlumni);
                        break;
                    }
                }
            }            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AlumniServlet.class.getName()).log(Level.SEVERE, null, ex);
            status = false;
        } finally {
            return status;
        }
    }
    
    private void processViewUpdateAlumniInfoPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
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
        int selectedAlumniID = Integer.parseInt(request.getParameter("selectedAlumniID"));
                
        for(int i = 0; i < totalAlumni; i++) {
            if(alumniList.get(i).getAlumniID() == selectedAlumniID) {
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
        request.setAttribute("id", currentAlumni.getAlumniID());
        request.setAttribute("name", currentAlumni.getName());
        request.setAttribute("phoneNumber", currentAlumni.getPhone());
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
        request.setAttribute("email", currentAlumni.getEmail());
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
               
        String[] alumniID = new String[TOTAL_ALUMNI_PER_PAGE];
        String[] alumniName = new String[TOTAL_ALUMNI_PER_PAGE];
        String[] alumniEmail = new String[TOTAL_ALUMNI_PER_PAGE];
        String[] alumniState = new String[TOTAL_ALUMNI_PER_PAGE]; 
        String[] alumniGraduationYear = new String[TOTAL_ALUMNI_PER_PAGE];
        String[] alumniBatch = new String[TOTAL_ALUMNI_PER_PAGE];
        String[] alumniProfStatus = new String[TOTAL_ALUMNI_PER_PAGE];
        String[] alumniCurJob = new String[TOTAL_ALUMNI_PER_PAGE];
        
        int j = currentPage * TOTAL_ALUMNI_PER_PAGE - TOTAL_ALUMNI_PER_PAGE;
                
        for(int i = 0; i < TOTAL_ALUMNI_PER_PAGE; i++, j++) {
            if(alumniList.isEmpty() || j >= totalAlumni) {
                alumniID[i] = "";
                alumniName[i] = "";
                alumniEmail[i] = "";
                alumniState[i] = "";
                alumniGraduationYear[i] = "";
                alumniBatch[i] = "";
                alumniProfStatus[i] = "";
                alumniCurJob[i] = "";
                continue;
            }
            
            alumniID[i] = Integer.toString(alumniList.get(j).getAlumniID());
            alumniName[i] = alumniList.get(j).getName();
            alumniEmail[i] = alumniList.get(j).getEmail();
            alumniState[i] = alumniList.get(j).getAlumniAddressState();
            alumniGraduationYear[i] = Integer.toString(alumniList.get(j).getAlumniGraduateYear());
            alumniBatch[i] = Integer.toString(alumniList.get(j).getAlumniBatch());
            alumniProfStatus[i] = alumniList.get(j).getAlumniProfStatus();
            alumniCurJob[i] = alumniList.get(j).getAlumniCurJob();
        }
        
        request.setAttribute("totalAlumni", totalAlumni);        
        request.setAttribute("totalPages", totalPages);        
        request.setAttribute("currentPage", currentPage);    
        request.setAttribute("TOTAL_ALUMNI_PER_PAGE", TOTAL_ALUMNI_PER_PAGE);

        request.setAttribute("alumniIDArray", alumniID);
        request.setAttribute("alumniNameArray", alumniName);
        request.setAttribute("alumniEmailArray", alumniEmail);
        request.setAttribute("alumniStateArray", alumniState);
        request.setAttribute("alumniGraduationYearArray", alumniGraduationYear);
        request.setAttribute("alumniBatchArray", alumniBatch);
        request.setAttribute("alumniProfStatusArray", alumniProfStatus);
        request.setAttribute("alumniCurJobArray", alumniCurJob);
        
        RequestDispatcher dispatcher = getServletConfig().getServletContext().getRequestDispatcher("/WEB-INF/jsp/views/viewAlumniListInfoPage.jsp");
        dispatcher.include(request, response);
    }
    
    private void goToFirstPage() {
        if(totalPages == 0) {
            currentPage = 0;
            return;
        }
        currentPage = 1;
    }
    
    private void goToPreviousPage() {
        if(totalPages == 0) {
            currentPage = 0;
            return;
        }
        if(currentPage == 1)
            return;
        currentPage--;
    }
    
    private void goToNextPage() {
        if(totalPages == 0) {
            currentPage = 0;
            return;
        }
        if(currentPage == totalPages)
            return;
        currentPage++;
    }
    
    private void goToLastPage() {
        if(totalPages == 0) {
            currentPage = 0;
            return;
        }
        currentPage = totalPages;
    }
    
    private void goToSelectedPage(int selectedPage) {
        currentPage = selectedPage;
    }
    
    private boolean getAllAlumniInfoFromDatabase() {
        alumniList = new ArrayList<Alumni>();
        
        boolean status = false;
        try {
            Connection con = getCon();
            
            String statementQuery1 = "SELECT * FROM alumni";
            
            Statement statement1 = con.createStatement();
            ResultSet result1 = statement1.executeQuery(statementQuery1);
            
            String statementQuery2 = "SELECT * FROM user WHERE role = 'alumni';";
            
            Statement statement2 = con.createStatement();
            ResultSet result2 = statement2.executeQuery(statementQuery2);
            
            while(result1.next() && result2.next()) {
                Alumni alumni = new Alumni();
                
                alumni.setId(result2.getInt("id"));
                alumni.setName(result2.getString("name"));
                alumni.setPhone(result2.getString("phone"));
                alumni.setEmail(result2.getString("email"));
                alumni.setRole(result2.getString("role"));
                alumni.setPassword(result2.getString("password"));
                alumni.setCreatedAt(result2.getDate("created_at"));
                
                alumni.setAlumniPersonalInfo(result1.getInt("alumniID"), result1.getString("alumniProfStatus"), 
                        result1.getInt("alumniProfStatusYearGained"), result1.getString("alumniProfilePicture"));
                
                alumni.setAlumniAddress(result1.getString("alumniAddress1"), result1.getString("alumniAddress2"), 
                        result1.getString("alumniAddressCity"), result1.getString("alumniAddressPostCode"), 
                        result1.getString("alumniAddressState"), result1.getString("alumniAddressCountry"));
                
                alumni.setAlumniEducationalInfo(result1.getInt("alumniGraduateYear"), result1.getString("alumniDegree"), 
                        result1.getString("alumniFieldOfSpecialization"), result1.getInt("alumniBatch"));
                
                alumni.setAlumniEmploymentInfo(result1.getString("alumniPrevJob"), result1.getDouble("alumniPrevSalary"), 
                        result1.getString("alumniCurJob"), result1.getDouble("alumniCurSalary"), 
                        result1.getString("alumniPrevEmployer"), result1.getString("alumniCurEmployer"));
                
                alumni.setEmployerAddress(result1.getString("employerAddress1"), result1.getString("employerAddress2"), 
                        result1.getString("employerAddressCity"), result1.getString("employerAddressPostCode"), 
                        result1.getString("employerAddressState"), result1.getString("employerAddressCountry"));
                
                alumniList.add(alumni);
                status = true;
            }
            
            totalAlumni = alumniList.size();
            totalPages = totalAlumni / TOTAL_ALUMNI_PER_PAGE;
            
            int remain = totalAlumni % TOTAL_ALUMNI_PER_PAGE;
            if(remain > 0) {
                totalPages += 1;
            }
            
            return true;
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AlumniServlet.class.getName()).log(Level.SEVERE, null, ex);
            status = false;
        } finally {
            return status;
        }
    }
    
    private ArrayList<Alumni> getAllAlumniInfoFromDatabaseForMobile() {
        ArrayList<Alumni> alumniUserList = new ArrayList<>();
        
        try {
            Connection con = getCon();
            
            String statementQuery1 = "SELECT * FROM alumni";
            
            Statement statement1 = con.createStatement();
            ResultSet result1 = statement1.executeQuery(statementQuery1);
            
            String statementQuery2 = "SELECT * FROM user WHERE role = 'alumni';";
            
            Statement statement2 = con.createStatement();
            ResultSet result2 = statement2.executeQuery(statementQuery2);
            
            while(result1.next() && result2.next()) {
                Alumni alumni = new Alumni();
                
                alumni.setId(result2.getInt("id"));
                alumni.setName(result2.getString("name"));
                alumni.setPhone(result2.getString("phone"));
                alumni.setEmail(result2.getString("email"));
                alumni.setRole(result2.getString("role"));
                alumni.setPassword(result2.getString("password"));
                alumni.setCreatedAt(result2.getDate("created_at"));
                
                alumni.setAlumniPersonalInfo(result1.getInt("alumniID"), result1.getString("alumniProfStatus"), 
                        result1.getInt("alumniProfStatusYearGained"), result1.getString("alumniProfilePicture"));
                
                alumni.setAlumniAddress(result1.getString("alumniAddress1"), result1.getString("alumniAddress2"), 
                        result1.getString("alumniAddressCity"), result1.getString("alumniAddressPostCode"), 
                        result1.getString("alumniAddressState"), result1.getString("alumniAddressCountry"));
                
                alumni.setAlumniEducationalInfo(result1.getInt("alumniGraduateYear"), result1.getString("alumniDegree"), 
                        result1.getString("alumniFieldOfSpecialization"), result1.getInt("alumniBatch"));
                
                alumni.setAlumniEmploymentInfo(result1.getString("alumniPrevJob"), result1.getDouble("alumniPrevSalary"), 
                        result1.getString("alumniCurJob"), result1.getDouble("alumniCurSalary"), 
                        result1.getString("alumniPrevEmployer"), result1.getString("alumniCurEmployer"));
                
                alumni.setEmployerAddress(result1.getString("employerAddress1"), result1.getString("employerAddress2"), 
                        result1.getString("employerAddressCity"), result1.getString("employerAddressPostCode"), 
                        result1.getString("employerAddressState"), result1.getString("employerAddressCountry"));
                
                alumniUserList.add(alumni);
            }
            
            return alumniUserList;
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AlumniServlet.class.getName()).log(Level.SEVERE, null, ex);
        } 
        
        return null;
    }
    
    private Connection getCon() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver"); 
        Connection con = DriverManager.getConnection("jdbc:mysql://johnny.heliohost.org:3306/ainalfa_alumni_module-db?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false", "ainalfa_ainal2", "ainal2@123");
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
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            ArrayList<Alumni> alumni = getAllAlumniInfoFromDatabaseForMobile();
            Gson gson = new Gson();
            String jsonString = gson.toJson(alumni);
            
            out.println(jsonString);
            
            out.close();
        }
    }
    
    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
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
