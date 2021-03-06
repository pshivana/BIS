package com.bis.sales.services;


import com.bis.common.DateUtils;
import com.bis.domain.Hawker;
import com.bis.domain.SalesTransaction;
import com.bis.sales.repository.SalesTransactionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class SalesTransactionServiceImpl implements SalesTransactionService {

    private SalesTransactionRepository salesRepository;

    @Autowired
    public SalesTransactionServiceImpl(SalesTransactionRepository salesRepository) {
        this.salesRepository = salesRepository;
    }

    @Override
    public void addSalesTransaction(SalesTransaction salesTransaction) {
       salesTransaction.setDate(DateUtils.addTimeToDate(salesTransaction.getDate()));
        salesTransaction.calculateAndSetTotalAmount();
        salesRepository.save(salesTransaction);
    }

    @Override
    public void updateSalesTransaction(SalesTransaction salesTransaction) {
        salesTransaction.calculateAndSetTotalAmount();
        salesRepository.update(salesTransaction);
    }

    @Override
    public SalesTransaction getSalesTransaction(int transactionId) {
        return salesRepository.getDetached(transactionId);
    }

    @Override
    public List<SalesTransaction> getSalesTransactions(Date fromDate, Date toDate) {
        return salesRepository.getSalesTransactions(fromDate, toDate);
    }

    public List<SalesTransaction> getSalesTransactions(Date fromDate, Date toDate, Hawker hawker) {
        return salesRepository.getSalesTransactions(hawker,fromDate,toDate);
    }

}
