package com.green.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.green.board.dto.BoardDto;
import com.green.board.mapper.BoardMapper;
import com.green.menus.dto.MenuDTO;
import com.green.menus.mapper.MenuMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Board")
public class BoardController {
		
	@Autowired
	private MenuMapper menuMapper;
	
	@Autowired
	private BoardMapper boardMapper;
	
	// /Board/List?menu_id=MENU01
	@RequestMapping("/List") 
	public ModelAndView list(MenuDTO menudto) {
		
		// 메뉴목록 조회 - menu.jsp
		List<MenuDTO> menuList = menuMapper.getMenuList();
//		log.info("menuList:" + menuList);
		 
		// 게시물 목록 조회 - list.jsp
		List<BoardDto> boardList = boardMapper.getBoardList(menudto);
//		log.info("boardList:" + boardList);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/list");
		mv.addObject("menuList", menuList);
		mv.addObject("boardList", boardList);
		
		return mv; 
	}
	
	//	/Borad/View?idx=1
	@RequestMapping("/View")
	public ModelAndView view (BoardDto boarddto) {
		
		// 메뉴목록 조회 - menu.jsp
		List<MenuDTO> menuList = menuMapper.getMenuList();
		
		// idx 글의 조회수 1 증가
		boardMapper.incHit(boarddto);
		
		// idx 로 조회한 게시글 
		BoardDto board = boardMapper.getBoard(boarddto);
//		log.debug("board:" + board);
		System.out.println("board:" + board);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/view");
		mv.addObject("menuList", menuList);
		mv.addObject("board", board);
		return mv;
	}
	
	// /Board/Delete?userid=${board.idx    }
	@RequestMapping("/Delete")
	public ModelAndView delete(BoardDto boarddto) {
		
		boardMapper.deleteboard(boarddto);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Board/List?menu_id=" + boarddto.getMenu_id());
		return mv;
	}
	
}
