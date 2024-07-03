package com.javatpoint.dao;  
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.util.List;  
import org.springframework.jdbc.core.BeanPropertyRowMapper;  
import org.springframework.jdbc.core.JdbcTemplate;  
import org.springframework.jdbc.core.RowMapper;  
import com.javatpoint.beans.Emp;  
  
public class EmpDao {  
    JdbcTemplate template;  
  
    public void setTemplate(JdbcTemplate template) {  
        this.template = template;  
    }  

    public int save(Emp p){  
        String sql = "INSERT INTO a (eid,Name, Salary, Designation, dob) VALUES (?,?, ?, ?, ?)";  
        return template.update(sql, p.getEid(), p.getName(), p.getSalary(), p.getDesignation(), p.getDob());  
    }  

    public int update(Emp p){  
        String sql = "UPDATE a SET name = ?, salary = ?, designation = ?, dob=?  WHERE eid = ?";  
        return template.update(sql, p.getName(), p.getSalary(), p.getDesignation(), p.getDob(), p.getEid());  
    }  

    public int delete(String eid){  
        String sql = "DELETE FROM a WHERE eid = ?";  
        return template.update(sql, eid);  
    }  

    public Emp getEmpById(String eid){  
        String sql = "SELECT * FROM a WHERE eid = ?";  
        return template.queryForObject(sql, new Object[]{eid}, new BeanPropertyRowMapper<Emp>(Emp.class));  
    }  

    public List<Emp> getEmployees(){  
        return template.query("SELECT * FROM a", new RowMapper<Emp>() {  
            public Emp mapRow(ResultSet rs, int row) throws SQLException {  
                Emp e = new Emp();  
                e.setEid(rs.getString(1));  
                e.setName(rs.getString(2));  
                e.setSalary(rs.getString(3));  
                e.setDesignation(rs.getString(4));  
                e.setDob(rs.getString(5));
                return e;  
            }  
        });  
    }  
}
  