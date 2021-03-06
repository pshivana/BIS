package com.bis.domain;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.Predicate;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProcurementTransaction implements java.io.Serializable {

    private Integer transactionId;
    private Vendor vendor = new Vendor();
    private Date date;
    private Character transactionType;
    private Float totalAmount;
    private List<PtDetails> transactionDetails = new ArrayList<PtDetails>();

    public ProcurementTransaction() {
    }

    public Integer getTransactionId() {
        return this.transactionId;
    }

    public void setTransactionId(Integer transactionId) {
        this.transactionId = transactionId;
    }

    public Vendor getVendor() {
        return vendor;
    }

    public void setVendor(Vendor vendor) {
        this.vendor = vendor;
    }

    public Date getDate() {
        return this.date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Character getTransactionType() {
        return this.transactionType;
    }

    public String getTransactionTypeDescription() {
        return ProcurementTransactionType.getNameByCode(this.transactionType);
    }

    public void setTransactionType(Character transactionType) {
        this.transactionType = transactionType;
    }

    public Float getTotalAmount() {
        return this.totalAmount;
    }

    public void setTotalAmount(Float totalAmount) {
        this.totalAmount = totalAmount;
    }

    public List<PtDetails> getTransactionDetails() {
        return transactionDetails;
    }

    public void setTransactionDetails(List<PtDetails> transactionDetails) {
        this.transactionDetails = transactionDetails;
    }

    public void calculateAndSetTotalAmount() {
        List<PtDetails> transactionDetails = this.getTransactionDetails();
        float totalAmount = 0;
        for (PtDetails details : transactionDetails) {
            totalAmount += details.getAmount();
        }
        this.setTotalAmount(totalAmount);
    }

    public PtDetails getPtDetails(final Integer transactionDetailId) {
        if(transactionDetailId == null) return null;
        return (PtDetails) CollectionUtils.find(transactionDetails, new Predicate() {
            @Override
            public boolean evaluate(Object object) {
                PtDetails details = (PtDetails) object;
                if(details.getDetailsId()==null) return false;
                return details.getDetailsId().intValue() == transactionDetailId.intValue();
            }
        });
    }
}
