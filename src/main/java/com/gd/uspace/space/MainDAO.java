package com.gd.uspace.space;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MainDAO {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	Connection connection = null;
	
	public MainDAO() {
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/MariaDB");
			connection = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
