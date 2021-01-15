/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller.alumni.singleton;

/**
 *
 * @author ainal farhan
 */
public interface AlumniPageList {
    String ALUMNI_MODULE_PAGE_MAIN_PATH = "/WEB-INF/alumni/jsp";
    
//  ---------------------------------- VIEWS ----------------------------------------------------//
    String ALUMNI_VIEW_PATH = ALUMNI_MODULE_PAGE_MAIN_PATH + "/views";
    
    String DELETE_ALUMNI_INFO_PAGE = ALUMNI_VIEW_PATH + "/deleteAlumniInfoPage.jsp";
    String MANAGE_ALUMNI_INFO_PAGE = ALUMNI_VIEW_PATH + "/manageAlumniInfoPage.jsp";
    String UPDATE_ALUMNI_INFO_PAGE = ALUMNI_VIEW_PATH + "/updateAlumniInfoPage.jsp";
    String VIEW_ALUMNI_LIST_INFO_PAGE = ALUMNI_VIEW_PATH + "/viewAlumniListInfoPage.jsp";
//  ---------------------------------- VIEWS ----------------------------------------------------//
    
//  ---------------------------------- COMPONENTS ----------------------------------------------------//
    String ALUMNI_COMPONENT_PATH = ALUMNI_MODULE_PAGE_MAIN_PATH + "/components";
    
    String PROCESS_STATUS_OVERLAY_PAGE = ALUMNI_COMPONENT_PATH + "/processStatusOverlay.jsp";
//  ---------------------------------- COMPONENTS ----------------------------------------------------//
}
