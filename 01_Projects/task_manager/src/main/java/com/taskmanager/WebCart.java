package com.taskmanager;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

public class WebCart {
    // Ban noi dung! Chung ta vut List di va dung Map (tuong tu Set nhung luu theo cap Key-Value)
    private Map<String, CartItem> items = new HashMap<>();
    private BigDecimal totalCartPrice = BigDecimal.ZERO;

    public void addProduct(Product product, int quantity) {
        String key = product.getName();
        totalCartPrice.add(BigDecimal.valueOf(product.getPrice()));
        if (items.containsKey(key)) {
            // Neu da co -> Lay ra cong don
            CartItem existingItem = items.get(key);
            existingItem.setQuantity(existingItem.getQuantity() + quantity);
            System.out.println("-> Da tang so luong: " + key + " len " + existingItem.getQuantity());
        } else {
            // Chua co -> Nhet vao Map
            items.put(key, new CartItem(product, quantity));
            System.out.println("-> Them moi vao gio: " + key + " (So luong: " + quantity + ")");
        }
    }

    public void removeProduct(int productId) {
        items.remove(productId);
    }

    public void updateQuantity(int productId, int quantity) {
        // Nếu số lượng khách chỉnh mà nhỏ hơn hoặc bằng 0
        if (quantity <= 0) {
            items.remove(productId); // Xóa sổ luôn sản phẩm khỏi giỏ
        } else {
            items.get(productId).setQuantity(quantity); // Nếu > 0 thì cập nhật bình thường
        }
    }

    public void checkout() {
        System.out.println("Tong tien can thanh toan: $" + totalCartPrice);
    }
}
