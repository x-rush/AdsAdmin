package com.sunrise.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.sunrise.bean.Emp;
import com.sunrise.bean.User;
import com.sunrise.service.EmpService;
import com.sunrise.service.UserService;
import com.sunrise.util.MD5Util;

@Controller
@RequestMapping("/user")
public class UserAction {
	
	@Autowired
	private UserService service;
	
	@Autowired
	private EmpService eservice;
	
	@RequestMapping("/login")
	public ModelAndView userLogin(String name,String pwd,
			String verifyCode,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//验证码
		String yzm = (String) session.getAttribute("verifyCodeValue");
		if(!verifyCode.equalsIgnoreCase(yzm)) {
			mav.addObject("message", "验证码输入有误！");
			mav.setViewName("login");
			return mav;
		}
		
		//查询用户名
		User user = service.getUserByUsername(name);
		//判断用户
		if(user == null) {
			//不存在该用户
			mav.addObject("err1", "登陆失败：用户名不存在！");
			mav.setViewName("login");
		}else {
			if(user.getPassword().equals(MD5Util.getMD5(pwd))) {
				//密码正确
				/*TODO:1.查询EMP表中信息
						将信息放到模型对象
						 跳转到emplist.jsp的页面
				 * */
//				List<Emp> list = eservice.getEmpList();
//				mav.addObject("empList", list);
//				mav.setViewName("emplist");
				/*分页方法*/
				int count = eservice.getCountEmp();
				mav.addObject("pageCount", count/10+1);
				List<Emp> list= eservice.getListEmp(1, 10);
				mav.addObject("empList", list);
				mav.setViewName("emplist");
			}else {
				//密码不正确
				mav.addObject("err2", "登陆失败：密码错误！");				
				mav.setViewName("login");
			}
		}
		return mav;
	}
	
	@RequestMapping("/regist")
	public String userReg(User user, ModelMap map) {
		user.setPassword(MD5Util.getMD5(user.getPassword()));
		boolean boo = service.register(user);
		if(boo==true) {
			//注册成功
			map.addAttribute("reg_succ", "注册成功，请登录");
			return "login";
		}else {
			map.addAttribute("err3", "注册失败，用户名已被注册");
			return "regist";
		}
	}
	
	@RequestMapping("/getVerifyCode")
	public void generate(HttpServletResponse response, 
										HttpSession session) {
		//用于存放生成的图片流
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		//将绘制信息放入流中，并返回验证码值
		String verifyCodeValue = drawImg(output);
		//将验证码设置到session中，防止校验失败
		session.setAttribute("verifyCodeValue", verifyCodeValue);
		//创建输出对象
		ServletOutputStream out;
		try {
			out = response.getOutputStream();
			output.writeTo(out); //将图片生成的信息流写到响应的输出对象中。
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/* 绘制验证码 */
	private String drawImg(ByteArrayOutputStream output) {
		StringBuilder builder = new StringBuilder();
		// 随机产生4个字符
		for (int i = 0; i < 4; i++) {
			builder.append(randomChar());
		}
		String code = builder.toString();
		
		//定义图片的长和宽
		int width = 70;
		int height = 25;
		//建立BufferedImage对象，指定图片长和宽以及色彩
		//图片缓冲流
		BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
		// 获取Graphics2D绘制对象，开始绘制验证码
		Graphics2D g = bi.createGraphics(); 
		Font font = new Font("Times New Roman", Font.PLAIN, 20); //创建字体对象
		Color color = new Color(66, 2, 82);  //创建颜色对象
		g.setFont(font); //设置字体
		g.setColor(color); //设置字体颜色
		g.setBackground(new Color(226, 226, 240)); //设置背景颜色
		g.clearRect(0, 0, width, height); //绘制背景
		//绘制形状，获取矩形对象
		FontRenderContext context = g.getFontRenderContext();//文字读取上下文对象，
		Rectangle2D bounds = font.getStringBounds(code, context);
		
		//计算文件的坐标和间距
		//初始位置坐标y=(getHeight() - bounds.getHeight())/2位置刚好在top线上
		//修改后 y0 = y + ascent 就正好落在基线的位置
		double x = (width - bounds.getWidth()) / 2;
		double y = (height - bounds.getHeight()) / 2;
		double ascent = bounds.getY();
		double baseY = y - ascent;
//		g.drawString(code, (int) x, (int) baseY);
		g.drawString(code, (int) x, (int) baseY);
		//结束绘制
		g.dispose(); 
		//获取流，输出图片
		try {
			ImageIO.write(bi, "jpg", output);
//			response.flushBuffer(); //刷新响应刘
		} catch (IOException e) {
			e.printStackTrace();
		}
		//将随机生成的值返回
		return code;
	}


	private char randomChar() {
		Random r = new Random();
		String s ="ABCDEFGHJKLMNPRSTUVWXYZ0123456789";
		return s.charAt(r.nextInt(s.length()));
	}
	
	
	
	
}
