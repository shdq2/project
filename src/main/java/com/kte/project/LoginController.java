package com.kte.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kte.project.VO.CustomVO;
import com.kte.project.dao.LoginDAO;
import com.kte.project.dao.visitDAO;

@Controller
public class LoginController {
   @Autowired
   LoginDAO lDAO = null; 
   @Autowired
   visitDAO vDAO = null; 
   
   @RequestMapping(value="/login.do", method = RequestMethod.GET)
   public String login(Model model) {
      CustomVO vo = new CustomVO();
      model.addAttribute("vo", vo);

      return "login";
   }
   
   @RequestMapping(value="/login.do", method = RequestMethod.POST)
   public String p_login(HttpServletRequest request, @ModelAttribute("vo") CustomVO vo,HttpSession httpsession,Model model) {
      CustomVO cvo = lDAO.selectCustomOne(vo);
      if(cvo != null) {
         if(cvo.getCustom_block() != 1) {
            if(cvo.getCustom_block() == 999) {
               httpsession.setAttribute("custom",cvo);
               httpsession.setAttribute("custom_id",cvo.getCustom_id());
               httpsession.setAttribute("custom_name",cvo.getCustom_name());
               
               return "redirect:admin.do";
            }else {
               httpsession.setAttribute("custom",cvo);
               httpsession.setAttribute("custom_id",cvo.getCustom_id());
               httpsession.setAttribute("custom_name",cvo.getCustom_name());
               
               model.addAttribute("url", "visit.do");
               model.addAttribute("msg", "환영합니다");
               model.addAttribute("ret", "y");   
            }
            
         }else {
            model.addAttribute("url", "login.do");
            model.addAttribute("msg", "차단된 아이디입니다");
            model.addAttribute("ret", "n");
         }
         
      }else {
         model.addAttribute("url", "login.do");
         model.addAttribute("msg", "회원 정보가 올바르지 않습니다");
         model.addAttribute("ret", "n");
         System.out.println("존재하지 않는 아이디");
      }
      
      return "alert";
   }
   
   @RequestMapping(value="/logout.do", method = RequestMethod.GET)
   public String p_logout(HttpServletRequest request) {
      HttpSession httpsession = request.getSession();
      httpsession.invalidate();
      
      return "redirect:login.do";
   }
}