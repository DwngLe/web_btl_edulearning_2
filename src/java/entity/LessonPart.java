/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.List;
import java.util.UUID;

/**
 *
 * @author My Asus
 */
public class LessonPart {
    private UUID LessonPartID;
    private String title;
    private List<Lesson> ListLesson;

    public LessonPart() {
    }
    
    public LessonPart(String title) {
        this.title = title;
    }
    
    public LessonPart(UUID LessonPartID, String title) {
        this.LessonPartID = LessonPartID;
        this.title = title;
    }

    public LessonPart(UUID LessonPartID, String title, List<Lesson> ListLesson) {
        this.LessonPartID = LessonPartID;
        this.title = title;
        this.ListLesson = ListLesson;
    }

    public UUID getLessonPartID() {
        return LessonPartID;
    }

    public void setLessonPartID(UUID LessonPartID) {
        this.LessonPartID = LessonPartID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<Lesson> getListLesson() {
        return ListLesson;
    }

    public void setListLesson(List<Lesson> ListLesson) {
        this.ListLesson = ListLesson;
    }
    
    
}
