# 1 Phân biệt Model, ModelMap, ModelAndView?

|         | Model                         | ModelMap                      | ModelAndView                           |
| ------- | ----------------------------- | ----------------------------- | -------------------------------------- |
|         | interface                     | implement<br>                 | lớp độc lập                            |
| Runtime | object : BindingAwareModelMap | object : BindingAwareModelMap | Composition chứ object : Model và View |
# 2 Ý nghĩa của @RequestMapping và các biến thể?

|                                          |                                                                                                                                        |
| ---------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| @RequestMapping                          | Ánh xạ, lọc các request  với method tương ứng.                                                                                         |
| Composed Annotations của Request Mapping | Định danh rỏ ràng,ngắn gọn, rõ nghĩa,  tuân thủ đúng chuẩn RESTful API cho việc đọc. cơ chế phía sau vẫn sữ dụng RequestMapping sữ lý. |
# 3 Phân biệt cách nhận dữ liệu bởi @RequestParam và @PathVariable.


|               |                                                                                                                                                                 |
| ------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| @RequestParam | ánh xạ dữ liệu từ đường dẫn URL và tự động ép kiểu<br>lấy dữ liệu sau dấu ?<br>sữ dụng: lọc, tìm kiếm, sắp xêp<br>chứ key value                                 |
| @PathVariable | ánh xạ dữ liệu từ đường dẫn URL và tự động ép kiểu<br>lấy dữ liệu trên uri<br>sữ dụng : định danh duy nhất một tài nguyên.<br>Bắt buộc phải có dữ liệu<br>value |
# 4 Ý nghĩa của RedirectAttribute?
- redirect tạo ra request mới không lưu trữ dữ liệu của Model.
- RedirectAttribute  Giúp truyền tải dữ liệu  băng qua một lệnh Redirect mà không bị mất!
- Flash Attribute cơ chế lưu và xóa dữ liệu trong session sau XÓA NGAY LẬP TỨC sau khi  redirect.