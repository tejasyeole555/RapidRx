package com.rapidrx.model;

public class CartItem {

    private int medicineId;
    private String medicineName;
    private double price;
    private int quantity;

    public CartItem() {
    }

    public CartItem(int medicineId, String medicineName,
                    double price, int quantity) {

        this.medicineId = medicineId;
        this.medicineName = medicineName;
        this.price = price;
        this.quantity = quantity;
    }

    public int getMedicineId() {
        return medicineId;
    }

    public void setMedicineId(int medicineId) {
        this.medicineId = medicineId;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal() {
        return price * quantity;
    }
}