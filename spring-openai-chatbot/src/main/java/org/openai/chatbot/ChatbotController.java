package org.openai.chatbot;

import org.openai.chatbot.model.MessageRequest;
import org.springframework.ai.chat.model.ChatResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController("/v1/chatbot")
public class ChatbotController {

    private final ChatbotService chatbotService;

    public ChatbotController(ChatbotService chatbotService) {
        this.chatbotService = chatbotService;
    }

    @PostMapping("/chat")
    public ResponseEntity<ChatResponse> chat(@RequestBody MessageRequest messageRequest) {
        ChatResponse response = this.chatbotService.callAzureOpenAiByPrompt(messageRequest);
        return ResponseEntity.ok(response);
    }
}
