package com.nexus.zalobot.controller;

import com.nexus.zalobot.service.ZaloService;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

@RestController
@RequestMapping("/webhook/zalo")
public class ZaloBotController {

    private final ZaloService zaloService;

    public ZaloBotController(ZaloService zaloService) {
        this.zaloService = zaloService;
    }

    /**
     * Zalo sẽ gọi API này của chúng ta mỗi khi có người dùng nhắn tin cho Zalo OA
     */
    @PostMapping
    public String receiveWebhook(@RequestBody Map<String, Object> payload) {
        System.out.println("📨 Nhận được Webhook từ Zalo: " + payload);
        
        try {
            String eventName = (String) payload.get("event_name");
            
            // Chỉ xử lý sự kiện người dùng gửi tin nhắn text
            if ("user_send_text".equals(eventName)) {
                
                // Lấy User ID của người gửi để chút nữa nhắn lại cho họ
                Map<String, Object> sender = (Map<String, Object>) payload.get("sender");
                String userId = (String) sender.get("id");
                
                // Lấy nội dung tin nhắn (vd: số điện thoại nghi ngờ)
                Map<String, Object> message = (Map<String, Object>) payload.get("message");
                String text = (String) message.get("text");
                
                System.out.println("Nội dung người dùng gửi: " + text);

                // 1. Kiểm tra xem có phải lừa đảo không
                String replyText = zaloService.checkScam(text);
                
                // 2. Gửi phản hồi lại cho người dùng
                zaloService.replyMessage(userId, replyText);
            }
        } catch (Exception e) {
            System.err.println("❌ Lỗi khi xử lý Webhook: " + e.getMessage());
        }
        
        // Zalo yêu cầu luôn trả về HTTP 200 OK
        return "OK";
    }
    
    /**
     * API dùng để test xem server có sống không
     */
    @GetMapping
    public String healthCheck() {
        return "🛡️ Nexus Zalo Anti-Fraud Bot is running!";
    }
}
