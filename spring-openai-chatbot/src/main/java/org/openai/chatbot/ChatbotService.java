package org.openai.chatbot;

import org.openai.chatbot.model.MessageRequest;
import org.springframework.ai.azure.openai.AzureOpenAiChatModel;
import org.springframework.ai.azure.openai.AzureOpenAiChatOptions;
import org.springframework.ai.chat.messages.Message;
import org.springframework.ai.chat.messages.SystemMessage;
import org.springframework.ai.chat.messages.UserMessage;
import org.springframework.ai.chat.model.ChatResponse;
import org.springframework.ai.chat.prompt.ChatOptions;
import org.springframework.ai.chat.prompt.Prompt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.List;

@Service
public class ChatbotService {

    @Autowired
    private ResourceLoader resourceLoader;

    private final AzureOpenAiChatModel chatModel;

    public ChatbotService(AzureOpenAiChatModel chatModel) {
        this.chatModel = chatModel;
    }

    public String callAzureOpenAiByMessage(String message) throws IOException {
        String resGlossary = resourceLoader.getResource("classpath:dictionary.xml")
                .getContentAsString(Charset.defaultCharset());;
        return this.chatModel.call(message);
    }

    // Request Json 客户端请求数据
    // "messages": [
    //	 {
    //	   "role": "system",
    //	   "content":"You are a helpful question-answering system"
    //	 },
    //	 {
    //	   "role": "user",
    //	   "content":"User question"
    //	 }
    // ]
    public ChatResponse callAzureOpenAiByPrompt(MessageRequest messageRequest) {
        SystemMessage systemMessage = new SystemMessage("SYSTEM CONTENT");
        UserMessage userMessage = new UserMessage(messageRequest.getQuestion());
        List<Message> messageList = List.of(systemMessage, userMessage);

        ChatOptions chatOptions = new AzureOpenAiChatOptions.Builder().withTemperature(0.7f).build();
        Prompt prompt = new Prompt(messageList, chatOptions);
        return this.chatModel.call(prompt);
    }
}