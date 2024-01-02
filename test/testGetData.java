
import dao.BlogDAO;
import entity.Blog;
import java.util.*;


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author duong
 */
public class testGetData {
    public static void main(String[] args) {
        try {
            // Tạo một đối tượng BlogDAO
            BlogDAO blogDAO = new BlogDAO();

            // Gọi phương thức để lấy danh sách tất cả blog
            System.out.println("Danh sách Blog:");
            for (Blog blog : blogDAO.getAllBlog()) {
                System.out.println(blog.toString());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
