| Tình huống                                      | Annotation sử dụng                                      |
|-------------------------------------------------|--------------------------------------------------------|
| Lấy ID từ URL `/users/10`                       | `@PathVariable Long id`                                |
| Lấy từ khóa tìm kiếm `/search?q=java`           | `@RequestParam String q`                               |
| Lấy Object JSON gửi qua POST                    | `@RequestBody UserDto dto`                             |
| Lấy Token xác thực ở Header                     | `@RequestHeader("Authorization") String token`         |
| Lấy thông tin User đang đăng nhập               | `Principal principal` hoặc `Authentication auth`       |
