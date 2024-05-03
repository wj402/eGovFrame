package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;

@Service("codeService")
public class CodeServiceImpl implements CodeService {
	
	@Resource(name = "codeDAO")
	private CodeDAO codeDAO;

	@Override
	public String insertCodes(CodeVO vo) throws Exception {
		return codeDAO.insertCodes(vo);
	}

	@Override // 다형성(오버라이딩, 오버로딩)
	public List<?> selectCodesList(CodeVO vo) throws Exception {
		return codeDAO.selectCodesList(vo);
	}

	@Override
	public int selectCodesCount(CodeVO vo) throws Exception {
		return codeDAO.selectCodesCount(vo);
	}

	@Override
	public int deleteCodes(int code) throws Exception {
		return codeDAO.deleteCodes(code);
	}

	@Override
	public CodeVO selectCodesDetail(int code) throws Exception {
		
		return codeDAO.selectCodesDetail(code);
	}


}
