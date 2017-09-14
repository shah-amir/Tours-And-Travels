package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.Product;
import static com.product.Product.getList;
/**
 * Servlet implementation class Controller
 */
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String action = request.getParameter("action");
		 if(action == null){
			 request.getRequestDispatcher("index.jsp").forward(request, response);
			 
		 }else
			 doPost(request, response);
		 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String action = request.getParameter("action");
		 String id = request.getParameter("id");
		 Product p = new Product();
		 if(action.equals("addtocart")){
			 p.getId(id);
			 request.setAttribute("flag", "100");
			 request.getRequestDispatcher("index.jsp").forward(request, response);
		 }
		 if(action.equals("cart")){
			 request.setAttribute("list", getList());
			 request.getRequestDispatcher("cart.jsp").forward(request, response);
		 }
		 if(action.equals("delete")){
			 p.removeList(id);
			 request.setAttribute("list", getList());
			 request.getRequestDispatcher("cart.jsp").forward(request, response);
		 }
		if(action.equals("increment")){
			
			 request.setAttribute("list", getList());
			 request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		if(action.equals("add")){
		//	 request.setAttribute("list", getList());
			 request.getRequestDispatcher("cart.jsp").forward(request, response);
		 }
	
			
	}

}
