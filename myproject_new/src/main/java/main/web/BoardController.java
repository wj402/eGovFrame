package main.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.BoardService;
import main.service.BoardVO;

@Controller
public class BoardController {
	
	@Resource(name="boardService")
	private BoardService boardService;

	@RequestMapping("/boardWrite.do")
	public String boardWrite() {
		
		return "board/boardWrite";
	}
	
	@RequestMapping("/boardWriteSave.do")
	@ResponseBody
	public String insertNBoard(BoardVO vo) throws Exception {
		// result = null;
		
		String result = boardService.insertNBoard(vo);
		String msg = "";
		if(result == null) msg = "ok";
		else msg = "fail";
		return msg;
	}
	
	@RequestMapping("/boardList.do")
	public String selectNBoardList(BoardVO vo, ModelMap model) throws Exception {
		
		List<?> list = boardService.selectNBoardList(vo);
		System.out.println("list :" + list);
		
		model.addAttribute("resultList", list);
		return "board/boardList";
	}
}
