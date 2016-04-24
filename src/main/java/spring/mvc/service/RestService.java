package spring.mvc.service;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import spring.mvc.bean.DBLog;
import spring.mvc.bean.DBLogJSON;
import spring.mvc.bean.DatabaseService;
import spring.mvc.bean.Library;


@Repository
public class RestService{

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public RestService(DatabaseService databaseService) {
		this.jdbcTemplate = databaseService.getJdbcTemplate();
	}
	
	
	public List<Library> queryAllLibrariesJSON() {
		
		System.out.println("**** JDBCExample: queryAllLibaries()");	
		
		final String QUERY_SQL = "SELECT * FROM LIBRARY ORDER BY LIB_NAME";
		
		List<Library> libraryList = this.jdbcTemplate.query(QUERY_SQL, new RowMapper<Library>() {
            public Library mapRow(ResultSet resulSet, int rowNum) throws SQLException {
            	Library library = new Library();
            	library.setId(resulSet.getInt("ID"));
            	library.setLibName(resulSet.getString("LIB_NAME"));
            	library.setLibCreator(resulSet.getString("LIB_CREATOR"));
            	library.setLibCreateDt(resulSet.getDate("LIB_CREATE_DATE"));
            	library.setLibFilename(resulSet.getString("LIB_FILENAME"));
            	library.setLibDescription(resulSet.getString("LIB_DESCRIPTION"));
            	System.out.println(library.toString());
                return library;
            }
        });
        return libraryList; 
	}
	
	
	//JdbcTemplate query with in method RowMapper example 
	public List<DBLog> queryAllDBLogs() {
		System.out.println("\n **** DBLogService : queryAllDBLogs() is called");	
		final String QUERY_SQL = "SELECT * FROM LOG";
		List<DBLog> dbLogs = this.jdbcTemplate.query(QUERY_SQL, new RowMapper<DBLog>() {
            public DBLog mapRow(ResultSet rs, int rowNum) throws SQLException {
            	DBLog dbLog = new DBLog();
            	dbLog.setIDLOG(rs.getInt("IDLOG"));
            	dbLog.setLOGSTRING(rs.getString("LOGSTRING"));
                return dbLog;
            }
        });
        return dbLogs; 
	}
	
	
	//JdbcTemplate query with in method RowMapper example 
	public List<DBLogJSON> queryAllDBLogsJSON() {
			System.out.println("\n**** DBLogService : queryAllDBLogsJSON() is called");	
			final String QUERY_SQL = "SELECT * FROM LOG";
			List<DBLogJSON> dbLogs = this.jdbcTemplate.query(QUERY_SQL, new RowMapper<DBLogJSON>() {
	            public DBLogJSON mapRow(ResultSet rs, int rowNum) throws SQLException {
	            	DBLogJSON dbLogJSON = new DBLogJSON();
	            	dbLogJSON.setIDLOG(rs.getInt("IDLOG"));
	            	dbLogJSON.setLOGSTRING(rs.getString("LOGSTRING"));
	                return dbLogJSON;
	            }
	        });
	        return dbLogs; 
	}
}
