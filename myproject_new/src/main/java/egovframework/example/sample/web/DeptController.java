package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.DeptVO;

@Controller
public class DeptController {
	
	@Resource(name="deptService")
	private DeptService deptService;
	
	@RequestMapping(value="/deptWrite.do")
	public String deptWrite() {
		
		return "dept/deptWrite";
	}
	
	@RequestMapping(value="/deptWriteSave.do")
	public String InsertDept(DeptVO vo) throws Exception {
		
		System.out.println(vo.getDeptno());
		System.out.println(vo.getDname());
		System.out.println(vo.getLoc());
		
		// 서비스 설정 하고 만든 후 한번에 실행시킨다
		String result = deptService.InsertDept(vo);
		if( result == null ) {
			System.out.println("저장완료");
		} else {
			System.out.println("저장실패");
		}
		
		return "";
	}
	
	@RequestMapping(value="/deptList.do")
	public String selectDeptList(DeptVO vo, ModelMap model) throws Exception {
		
		List<?> list = deptService.SelectDeptList(vo);
		
		System.out.println(list);
		model.addAttribute("resultList", list);
		return "dept/deptList";
	}
	
	@RequestMapping(value="/deptDetail.do")
	public String selectDeptDetail(int deptno, ModelMap model) throws Exception {
		
		DeptVO vo = deptService.selectDeptDetail(deptno);
		System.out.print("부서번호:"+vo.getDeptno());
		
		model.addAttribute("deptVO", vo);
		return "dept/deptDetail";
	}
	
	@RequestMapping(value="/deptDelete.do")
	public String deleteDept(int deptno) throws Exception {
		
		int result = deptService.deleteDept(deptno);
		if(result == 1) {
			System.out.println("삭제완료");
		} else {
			System.out.println("삭제실패");
		}
		return "";
	}
	
	@RequestMapping(value="/deptModifyWrite.do")
	public String selectDeptModify(int deptno, ModelMap model) throws Exception {
		
		DeptVO vo = deptService.selectDeptDetail(deptno);
		
		model.addAttribute("vo", vo);
		return "dept/deptModifyWrite";
	}
	
	@RequestMapping(value="/deptModifySave.do")
	public String updateDept(DeptVO vo) throws Exception {
		
		int result = deptService.updateDept(vo);
		if(result == 1) {
			System.out.println("수정완료");
		} else {
			System.out.println("수정실패");
		}
		
		return "";
	}
	
}
