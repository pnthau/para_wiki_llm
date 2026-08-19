# ⚖️ 1. Phân biệt Forward vs Redirect (So sánh cốt lõi)

| Tiêu chí                | Forward (Chuyển tiếp nội bộ)                    | Redirect (Chuyển hướng Client)                          |
|--------------------------|-------------------------------------------------|---------------------------------------------------------|
| Bản chất                | Xử lý hoàn toàn nội bộ trên Server. Server tự   | Server trả lệnh HTTP 302 về cho Trình duyệt, để trình   |
|                          | chuyển request từ Servlet A sang Servlet B.     | duyệt tự tạo 1 Request mới tới URL mới.                 |
| Số chuyến khứ hồi       | 1 chuyến (Client → Server → Client). Nhanh hơn. | 2 chuyến khứ hồi (Client → Server → Client → Server → Client). |
| URL Trình duyệt         | ❌ KHÔNG đổi (vẫn giữ nguyên URL ban đầu).       | ✅ ĐỔI sang URL mới.                                    |
| Chuyển sang trang ngoài | ❌ Không thể (chỉ trong cùng 1 server/domain).   | ✅ Có thể redirect sang Google, Facebook...             |
| Dữ liệu Model/Request   | ✅ Bảo tồn dữ liệu cũ.                          | ❌ Mất sạch dữ liệu cũ (vì tạo Request mới tinh).       |

---

# ⚠️ 2. Bài toán "Lặp dữ liệu" (Double Submit Problem) & Mô hình PRG

### ❌ Lỗi khi dùng Forward sau khi lưu Form:
1. User bấm Submit Form → POST `/save-product`.
2. Server lưu DB xong, dùng Forward → URL vẫn là `/save-product`.
3. User bấm F5 → Trình duyệt gửi lại POST `/save-product` → dữ liệu bị lưu lặp.

### ✅ Giải pháp: Mô hình PRG (POST - REDIRECT - GET)


- Sau khi lưu DB: `return "redirect:/view-product/" + savedProduct.getId();`
- Trình duyệt chuyển sang GET `/view-product/10`.
- Nếu F5 → chỉ tải lại trang GET, không gọi lại hàm lưu DB.

---

# ⚡ 3. Truyền dữ liệu qua Redirect với Flash Attributes

- **Vấn đề:** Redirect tạo request mới → dữ liệu Model mất.
- **Giải pháp:** Dùng Flash Attributes (Spring 3.1+).

```java
@PostMapping("/save-product")
public String saveProduct(ProductForm form, RedirectAttributes redirectAttributes) {
    // 1. Lưu sản phẩm
    Product savedProduct = productService.add(product);

    // 2. Lưu thông báo tạm thời vào Flash Attribute
    redirectAttributes.addFlashAttribute("message", "Thêm sản phẩm thành công!");

    // 3. Redirect sang trang xem
    return "redirect:/view-product/" + savedProduct.getId();
}
