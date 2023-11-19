/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Lesson;
import entity.LessonPart;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 *
 * @author My Asus
 */
public class LessonDao extends Dao<Lesson>{

    public LessonDao() {
    }

    @Override
    public List<Lesson> getListObject() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public List<Lesson> getListObject(UUID id) {
        List<Lesson> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM lesson WHERE lesson.LessonPartID = ?";
            conn = getConnection();
            ps=conn.prepareStatement(query);
            ps.setString(1, id.toString());
            rs=ps.executeQuery(); 
            while(rs.next()){
              UUID lessonID = UUID.fromString(rs.getString("LessonID"));
              list.add(new Lesson(lessonID, rs.getString("Name")));
            }      
        } catch (Exception e) {
            System.out.println("Loi truy van");
            System.out.println(e);
        }
        return list;
    }

    @Override
    public Lesson getObject(UUID id) {
        Lesson lesson = new Lesson();
        try {
            String query = "SELECT * FROM lesson WHERE LessonID = ?";
            conn = getConnection();
            ps=conn.prepareStatement(query);
            ps.setString(1, id.toString());
            rs=ps.executeQuery(); 
            while(rs.next()){
              lesson.setLessonID(UUID.fromString(rs.getString("LessonID")));
              lesson.setName(rs.getString("Name"));
              lesson.setVideoURL(rs.getString("VideoURL"));
              lesson.setDesctiption(rs.getString("Description"));
              lesson.setLessonPartID(UUID.fromString(rs.getString("LessonPartID")));
            }      
        } catch (Exception e) {
            System.out.println("Loi truy van");
            System.out.println(e);
        }
        return lesson;
    }

    @Override
    public int createObject(Lesson object) {
        try {
            String query = "INSERT INTO lesson VALUES (?, ?, ?, ?, ?)";
            conn = getConnection();
            ps=conn.prepareStatement(query);
            UUID id = UUID.randomUUID();
            ps.setString(1, id.toString());
            ps.setString(2, object.getName());
            ps.setString(3, object.getVideoURL());
            ps.setString(4, object.getDesctiption());
            ps.setString(5, object.getLessonPartID().toString());
            int rowsInserted = ps.executeUpdate();
            return rowsInserted;
        } catch (Exception e) {
            System.out.println("Loi truy van");
            System.out.println(e);
        }
        return 0;
    }

    @Override
    public int updateObject(Lesson object) {
        try {
            String query = "UPDATE lesson SET Name = ?, VideoURL = ?, Description = ? WHERE LessonID = ?";
            conn = getConnection();
            ps=conn.prepareStatement(query);
            ps.setString(1, object.getName());
            ps.setString(2, object.getVideoURL());
            ps.setString(3, object.getDesctiption());
            ps.setString(4, object.getLessonID().toString());
            int rowUpdate = ps.executeUpdate();
            return rowUpdate;
        } catch (Exception e) {
            System.out.println("Loi truy van");
            System.out.println(e);
        }
        return 0;
    }

    @Override
    public int deleteObject(UUID id) {
        try {
            String query = "DELETE FROM lesson WHERE LessonID = ?";
            conn = getConnection();
            ps=conn.prepareStatement(query);
            ps.setString(1, id.toString());
            int rowsDelete = ps.executeUpdate();
            return rowsDelete;
        } catch (Exception e) {
            System.out.println("Loi truy van");
            System.out.println(e);
        }
        return 0;
    }
    
}
