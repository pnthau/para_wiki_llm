package com.nexus.zalobot.service;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.*;
import java.util.*;

@Service
public class ZaloService {
    
    // API endpoint của Zalo OA để gửi tin nhắn CSKH
    private final String ZALO_OPEN_API = "https://openapi.zalo.me/v3.0/oa/message/cs";
    
    // TODO: John sẽ thay bằng Access Token lấy từ Zalo for Developers
    private final String ACCESS_TOKEN = "YOUR_ZALO_ACCESS_TOKEN_HERE";

    /**
     * Logic kiểm tra xem thông tin đầu vào có phải là lừa đảo không.
     * Tạm thời hardcode, sau này anh sẽ kết nối với Database hoặc API ChongLuaDao.
     */
    public String checkScam(String input) {
        String lowerInput = input.toLowerCase();
        
        if (lowerInput.contains("0987654321") || lowerInput.contains("0123456789")) {
            return "🔴 CẢNH BÁO TỪ NEXUS: Số điện thoại này nằm trong danh sách đen! Đã bị báo cáo lừa đảo giả danh công an. Tuyệt đối không giao dịch.";
        } else if (lowerInput.contains("http") || lowerInput.contains("vneid") || lowerInput.contains(".apk")) {
            return "🟡 CHÚ Ý CỰC KỲ NGUY HIỂM: Đây là đường link lạ. Không được tải App hoặc cung cấp thông tin. Có thể chứa mã độc chiếm quyền điều khiển điện thoại!";
        } else if (lowerInput.contains("đầu tư") || lowerInput.contains("hoa hồng")) {
            return "🟡 CẢNH BÁO BẪY TÀI CHÍNH: Dấu hiệu của bẫy 'Việc nhẹ lương cao' hoặc 'Sàn đầu tư ảo'. Đừng chuyển tiền cọc nhé!";
        }
        
        return "🟢 An toàn: Hiện chưa có dữ liệu báo cáo về thông tin này trong hệ thống. Tuy nhiên, vẫn hãy áp dụng nguyên tắc 3 KHÔNG để bảo vệ mình.";
    }

    /**
     * Gửi tin nhắn phản hồi về lại cho Zalo user thông qua Open API
     */
    public void replyMessage(String userId, String replyText) {
        RestTemplate restTemplate = new RestTemplate();
        
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("access_token", ACCESS_TOKEN);
        
        // Cấu trúc JSON gửi cho Zalo
        Map<String, Object> body = new HashMap<>();
        Map<String, String> recipient = new HashMap<>();
        recipient.put("user_id", userId);
        body.put("recipient", recipient);
        
        Map<String, String> message = new HashMap<>();
        message.put("text", replyText);
        body.put("message", message);
        
        HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);
        
        try {
            ResponseEntity<String> response = restTemplate.postForEntity(ZALO_OPEN_API, entity, String.class);
            System.out.println("Đã gửi tin nhắn Zalo thành công: " + response.getBody());
        } catch (Exception e) {
            System.err.println("Lỗi khi gửi tin nhắn Zalo. Vui lòng kiểm tra lại Access Token: " + e.getMessage());
        }
    }
}
