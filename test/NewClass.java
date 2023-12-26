
import dao.EnrollDAO;
import entity.EnrolledCourse;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Admin
 */
public class NewClass {
    public static void main(String[] args) {
        EnrollDAO edao = new EnrollDAO();
        EnrolledCourse e = edao.findEnroll("5f36b083-10e1-4508-8bc2-85f2b3f26f75", "c02");
        System.out.println(e.toString());
    }
}
