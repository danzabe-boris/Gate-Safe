package com.gate.gatesafe.log;

import java.util.Date;

public class Activity {
    private String author;
    private String type;
    private String concern;
    private String description;
    private Date date;

    public Activity (){

    }

    public Activity (String author, String type, String concern) {
        this.author = author;
        this.type = type;
        this.concern = concern;
        setDate();

        this.description = "Rapport activity of " + date + " : User " + author + " have realize action to " + type + " " + concern;
    }

    public void setDate() {
//        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
//        Date date = new Date(System.currentTimeMillis());
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        this.date = date;
    }

    public Date getDate() {
        return date;
    }

    public String getDescription() {
        return description;
    }
}
