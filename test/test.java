import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

public class Test {
    public static Date getCurrentDateFormatted() {
        // Lấy ngày tháng năm hiện tại
        LocalDate currentDate = LocalDate.now();

        // Chuyển đổi thành java.sql.Date
        return Date.valueOf(currentDate);
    }

    public static void main(String[] args) {
        // Gọi hàm và in ra kết quả
//        Date currentDate = getCurrentDateFormatted();
//        System.out.println("Ngày tháng năm hiện tại: " + currentDate);

        String id = UUID.randomUUID().toString();
        System.out.println(id);
    }
}
