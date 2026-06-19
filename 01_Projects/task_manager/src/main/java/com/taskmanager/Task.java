package com.taskmanager;

public class Task {
    private String name;

    public Task(String name) {
        this.name = name;
    }

    public void printTask() {
        System.out.println("Nhiem vu dang cho: " + name);
    }
}
