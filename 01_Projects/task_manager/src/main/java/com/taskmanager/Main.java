package com.taskmanager;

public class Main {
    public static void main(String[] args) {
        Product vongTay = new Product("Vong Tay Phong Thuy", 100.0);
        Product dayChuyen = new Product("Day Chuyen Go", 50.0);

        WebCart myCart = new WebCart();

        // Lần 1: Khách bấm mua vòng tay (1 chiếc)
        myCart.addProduct(vongTay, 1);

        // Lần 2: Khách bấm mua dây chuyền (2 chiếc)
        myCart.addProduct(dayChuyen, 2);

        // Lần 3: Khách lướt web một hồi, lại bấm mua THÊM 1 cái vòng tay nữa!
        myCart.addProduct(vongTay, 1);

        // In hóa đơn ra xem
        myCart.printCart();

    }
}
