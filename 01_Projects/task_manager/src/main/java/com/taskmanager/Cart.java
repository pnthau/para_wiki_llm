package com.taskmanager;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<Product> items = new ArrayList<>();

    public void addProduct(Product p) {
        items.add(p);
        System.out.println("Da them vao gio hang: " + p.getName() + " (Gia: $" + p.getPrice() + ")");
    }

    private boolean hasDiscount = false;

    public void applyDiscount() {
        this.hasDiscount = true;
        System.out.println("Da ap dung ma giam gia 10%!");
    }

    public void checkout() {
        double total = 0;
        for (Product p : items) {
            total += p.getPrice();
        }
        if (hasDiscount) {
            total = total * 0.9; // Giam 10 phan tram
        }
        System.out.println("--------------------");
        System.out.println("Tong tien can thanh toan: $" + total);
    }
}
