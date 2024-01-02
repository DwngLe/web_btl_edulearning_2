
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
        EnrolledCourse e = edao.findEnroll("f881e324-2dc8-4d5b-aaa4-3727d63885d7", "c02");
        System.out.println(e.toString());
    }
}
