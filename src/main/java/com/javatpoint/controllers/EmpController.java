package com.javatpoint.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javatpoint.beans.Emp;
import com.javatpoint.dao.EmpDao;

@Controller
public class EmpController {
    @Autowired
    EmpDao dao;

    @RequestMapping("/empform")
    public String showform(Model m){
        m.addAttribute("command", new Emp());
        return "empform";
    }

    @RequestMapping(value="/save",method = RequestMethod.POST)
    public String save(@ModelAttribute("emp") Emp emp){
        dao.save(emp);
        return "redirect:/viewemp";
    }

    @RequestMapping("/viewemp")
    public String viewemp(@RequestParam(defaultValue = "1") int page, Model m){
        int pageSize = 10;
        List<Emp> list = dao.getEmployees();
        int totalItems = list.size();
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);

        int start = (page - 1) * pageSize;
        int end = Math.min(start + pageSize, totalItems);
        List<Emp> pageList = list.subList(start, end);

        m.addAttribute("list", pageList);
        m.addAttribute("currentPage", page);
        m.addAttribute("totalPages", totalPages);

        return "viewemp";
    }

    @RequestMapping(value="/editemp/{eid}")
    public String edit(@PathVariable String eid, Model m){
        Emp emp = dao.getEmpById(eid);
        m.addAttribute("command", emp);
        return "empeditform";
    }

    @RequestMapping(value="/editsave",method = RequestMethod.POST)
    public String editsave(@ModelAttribute("emp") Emp emp){
        dao.update(emp);
        return "redirect:/viewemp";
    }

    @RequestMapping(value="/deleteemp/{eid}",method = RequestMethod.GET)
    public String delete(@PathVariable String eid){
        dao.delete(eid);
        return "redirect:/viewemp";
    }
}
