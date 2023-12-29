
import dao.CourseDAO;
import java.util.ArrayList;
import java.util.List;
import stat.CourseStat;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Admin
 */
public class Test {
    public static void main(String[] args) {
        List<CourseStat> courStat = new ArrayList<>();
        CourseDAO cdao = new CourseDAO();
        courStat = cdao.getStatOfCourse();
    }
}
