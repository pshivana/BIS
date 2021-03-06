package com.bis.reporting.repository;

import com.bis.domain.AlertType;
import com.bis.repository.BaseRepository;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class AlertTypeRepository extends BaseRepository<AlertType> {

    @Autowired
    public AlertTypeRepository(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
        super(AlertType.class);
        setSessionFactory(sessionFactory);
    }
}
