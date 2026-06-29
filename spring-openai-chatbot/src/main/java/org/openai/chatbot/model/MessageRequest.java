package org.openai.chatbot.model;

// User Request Message
// {
//   "Question": "How to run java ?"
// }
public class MessageRequest {

    private String question;

    public MessageRequest() {
    }

    public MessageRequest(String question) {
        this.question = question;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }
}
