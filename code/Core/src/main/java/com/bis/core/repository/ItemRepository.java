package com.bis.core.repository;

import com.bis.domain.Item;
import com.bis.repository.BaseRepository;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ItemRepository extends BaseRepository<Item>{
    @Autowired
    public ItemRepository(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
        super(Item.class);
        setSessionFactory(sessionFactory);
    }

    public List<Item> getAll() {
        return getHibernateTemplate().loadAll(Item.class);
    }
}
