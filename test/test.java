import dao.EnrollDAO;
import entity.EnrolledCourse;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

public class Test {
//    public static Date getCurrentDateFormatted() {
//        // Lấy ngày tháng năm hiện tại
//        LocalDate currentDate = LocalDate.now();
//
//        // Chuyển đổi thành java.sql.Date
//        return Date.valueOf(currentDate);
//    }

    public static void main(String[] args) {
        // Gọi hàm và in ra kết quả
//        Date currentDate = getCurrentDateFormatted();
//        System.out.println("Ngày tháng năm hiện tại: " + currentDate);

        EnrollDAO edao = new EnrollDAO();
        EnrolledCourse e = edao.findEnroll("5f36b083-10e1-4508-8bc2-85f2b3f26f75", "c02");
        System.out.println(e.toString());
    }
}
