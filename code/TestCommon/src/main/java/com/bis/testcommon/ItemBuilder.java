package com.bis.testcommon;

import com.bis.domain.Item;

public class ItemBuilder {
    private Item  item = new Item();

    public Item build(){
        return this.item;
    }

    public ItemBuilder withDefaults(){
        item = new Item("testName","old",'W','Y');
        item.setItemName("name");
        item.setDescription("description");
        item.setItemLife('W');
        item.setReturnable('Y');
        item.setDefaultPrice(10f);
        return this;
    }

    public ItemBuilder setName(String name) {
        item.setItemName(name);
        return this;
    }

    public ItemBuilder setItemCode(int itemCode) {
        item.setItemCode(itemCode);
        return this;
    }
}
