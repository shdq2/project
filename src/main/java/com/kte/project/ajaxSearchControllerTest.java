package com.kte.project;

import static org.junit.Assert.fail;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

public class ajaxSearchControllerTest {
	
	private MockMvc mockMvc = null;

	@Before // 테스트 실행 전
	public void setup() {
		// 테스트 하고자 하는 controller객체 만듬
		mockMvc = MockMvcBuilders.standaloneSetup(new ajaxSearchController()).build();
	}

	
	@Test // 테스트
	public void test() throws Exception {
	MockHttpServletRequestBuilder msrb = post("/changeTab.do")
		.param("active_tab", "detail-1").param("day_type", "1박");
		
// 테스트 수행
		mockMvc.perform(msrb).andDo(print()).andExpect(status().is3xxRedirection());
	}


}
