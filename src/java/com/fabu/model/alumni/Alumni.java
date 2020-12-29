/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fabu.model.alumni;

import com.fabu.model.user.User;

/**
 * @author PC
 * @version 1.0
 * @created 27-Dec-2020 9:28:30 PM
 */
public class Alumni extends User{

    private String alumniAddress1;
    private String alumniAddress2;
    private String alumniAddressCity;
    private String alumniAddressCountry;
    private String alumniAddressPostCode;
    private String alumniAddressState;
    private int alumniBatch;
    private String alumniCurEmployer;
    private String alumniCurJob;
    private double alumniCurSalary;
    private String alumniDegree;
    private String alumniFieldOfSpecialization;
    private int alumniGraduateYear;
    private int alumniID;
    private String alumniPrevEmployer;
    private String alumniPrevJob;
    private double alumniPrevSalary;
    private String alumniProfilePicture;
    private String alumniProfStatus;
    private int alumniProfStatusYearGained;
    private String employerAddress1;
    private String employerAddress2;
    private String employerAddressCity;
    private String employerAddressCountry;
    private String employerAddressPostCode;
    private String employerAddressState;

    public Alumni(){}

    // Get Alumni Personal Information
    
    public int getAlumniID(){    return this.alumniID; }
    public String getAlumniProfilePicture(){    return this.alumniProfilePicture; }
    public String getAlumniProfStatus(){    return this.alumniProfStatus; }
    public int getAlumniProfStatusYearGained(){ return this.alumniProfStatusYearGained; }
    
    public String getAlumniAddress1(){  return this.alumniAddress1; }
    public String getAlumniAddress2(){  return this.alumniAddress2; }
    public String getAlumniAddressCity(){   return this.alumniAddressCity; }
    public String getAlumniAddressCountry(){    return this.alumniAddressCountry; }
    public String getAlumniAddressPostCode(){   return this.alumniAddressPostCode; }
    public String getAlumniAddressState(){  return this.alumniAddressState; }    

    // Get Alumni Educational Information
    public int getAlumniBatch(){    return this.alumniBatch; }
    public String getAlumniDegree(){    return this.alumniDegree; }
    public String getAlumniFieldOfSpecialization(){ return this.alumniFieldOfSpecialization; }
    public int getAlumniGraduateYear(){ return this.alumniGraduateYear; }
    
    // Get Alumni Employment Information

    public String getAlumniCurEmployer(){   return this.alumniCurEmployer; }
    public String getAlumniCurJob(){    return this.alumniCurJob; }
    public double getAlumniCurSalary(){ return this.alumniCurSalary; }

    public String getAlumniPrevEmployer(){  return this.alumniPrevEmployer; }
    public String getAlumniPrevJob(){   return this.alumniPrevJob; }
    public double getAlumniPrevSalary(){    return this.alumniPrevSalary; }

    public String getEmployerAddress1(){    return this.employerAddress1; }
    public String getEmployerAddress2(){    return this.employerAddress2; }
    public String getEmployerAddressCity(){ return this.employerAddressCity; }
    public String getEmployerAddressCountry(){  return this.employerAddressCountry; }
    public String getEmployerAddressPostCode(){ return this.employerAddressPostCode; }
    public String getEmployerAddressState(){    return this.employerAddressState; }

    /**
     *
     * @param address1
     * @param address2
     * @param city
     * @param postCode
     * @param state
     * @param country
     */
    public void setAlumniAddress(String address1, String address2, String city, String postCode, String state, String country){
        this.alumniAddress1 = address1;
        this.alumniAddress2 = address2;
        this.alumniAddressCity = city;
        this.alumniAddressPostCode = postCode;
        this.alumniAddressState = state;
        this.alumniAddressCountry = country;
    }

    /**
     *
     * @param alumniGraduateYear
     * @param alumniDegree
     * @param alumniFieldOfSpecialization
     * @param alumniBatch
     */
    public void setAlumniEducationalInfo(int alumniGraduateYear, String alumniDegree, String alumniFieldOfSpecialization, int alumniBatch){
        this.alumniGraduateYear = alumniGraduateYear;
        this.alumniDegree = alumniDegree;
        this.alumniFieldOfSpecialization = alumniFieldOfSpecialization;
        this.alumniBatch = alumniBatch;
    }

    /**
     *
     * @param prevJob
     * @param prevSalary
     * @param curJob
     * @param curSalary
     * @param prevEmployer
     * @param curEmployer
     */
    public void setAlumniEmploymentInfo(String prevJob, double prevSalary, String curJob, double curSalary, String prevEmployer, String curEmployer){
        this.alumniPrevJob = prevJob;
        this.alumniPrevSalary = prevSalary;
        this.alumniPrevEmployer = prevEmployer;

        this.alumniCurJob = curJob;
        this.alumniCurSalary = curSalary;
        this.alumniCurEmployer = curEmployer;
    }

    /**
     *
     * @param alumniID
     * @param alumniProfStatus
     * @param alumniProfStatusYearGained
     * @param alumniName
     * @param alumniEmail
     * @param alumniPhoneNumber
     * @param alumniProfilePicture
     */
    public void setAlumniPersonalInfo(int alumniID, String alumniProfStatus, int alumniProfStatusYearGained, String alumniProfilePicture){
        this.alumniID = alumniID;
        this.alumniProfStatus = alumniProfStatus;
        this.alumniProfStatusYearGained = alumniProfStatusYearGained;
        this.alumniProfilePicture = alumniProfilePicture;
    }

    /**
     *
     * @param address1
     * @param address2
     * @param city
     * @param state
     * @param country
     * @param postCode
     */
    public void setEmployerAddress(String address1, String address2, String city, String state, String country, String postCode){
        this.employerAddress1 = address1;
        this.employerAddress2 = address2;
        this.employerAddressCity = city;
        this.employerAddressPostCode = postCode;
        this.employerAddressState = state;
        this.employerAddressCountry = country;
    }

}

