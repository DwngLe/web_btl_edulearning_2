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
public class LessonPartDao extends Dao<LessonPart>{

    @Override
    public List<LessonPart> getListObject() {
        List<LessonPart> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM lessonpart";
            conn = getConnection();
            ps=conn.prepareStatement(query);
            rs=ps.executeQuery(); 
            LessonDao lessonDao = new LessonDao();
            while(rs.next()){
              UUID id = UUID.fromString(rs.getString("LessonPartID"));
              String title = rs.getString("Title");
              List<Lesson> listLesson = lessonDao.getListObject(id);
              list.add(new LessonPart(id, title, listLesson));
            }      
        } catch (Exception e) {
            System.out.println("Loi truy van");
            System.out.println(e);
        }
        return list;
    }

    @Override
    public LessonPart getObject(UUID id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int createObject(LessonPart object) {
        try {
            String query = "INSERT INTO lessonpart VALUES (?, ?)";
            conn = getConnection();
            ps=conn.prepareStatement(query);
            UUID id = UUID.randomUUID();
            ps.setString(1, id.toString());
            ps.setString(2, object.getTitle());
            int rowsInserted = ps.executeUpdate();
            return rowsInserted;
        } catch (Exception e) {
            System.out.println("Loi truy van");
            System.out.println(e);
        }
        return 0;
    }

    @Override
    public int updateObject(LessonPart object) {
        try {
            String query = "UPDATE lessonpart SET Title = ? WHERE LessonPartID = ?";
            conn = getConnection();
            ps=conn.prepareStatement(query);
            ps.setString(1, object.getTitle());
            ps.setString(2, object.getLessonPartID().toString());
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
            String query = "DELETE FROM lessonpart WHERE LessonPartID = ?";
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
