package com.taskmanager;

public class Main {
    public static void main(String[] args) {
        Cart myCart = new Cart();

        // Tạo 2 sản phẩm
        Product p1 = new Product("Ban phim co", 50.0);
        Product p2 = new Product("Chuot khong day", 20.0);

        // Thêm vào giỏ hàng
        myCart.addProduct(p1);
        myCart.addProduct(p2);

        // Tính tiền
        myCart.applyDiscount();
        myCart.checkout();
    }
}
