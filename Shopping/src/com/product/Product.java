package com.product;

import java.util.ArrayList;

public class Product {
 static ArrayList<String> list = new ArrayList<String>();
 
   public void getId(String id){
	   list.add(id);
	   
   }

public static ArrayList<String> getList() {
	return list;
}
   public int getSize(){
	return list.size();
	   
   }
   
   
   public void removeList(String id){
	   list.remove(id);
	   
   }
}
