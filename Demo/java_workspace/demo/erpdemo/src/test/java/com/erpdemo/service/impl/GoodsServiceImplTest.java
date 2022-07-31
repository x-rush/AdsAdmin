package com.erpdemo.service.impl;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.erpdemo.BaseJunitTest;
import com.erpdemo.dao.GoodsMapper;
import com.erpdemo.entity.Goods;

public class GoodsServiceImplTest extends BaseJunitTest{

	@Autowired
	private GoodsMapper goodsMapper;
	
	
	@Test
	public void testQueryAll() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteBatch() {
		fail("Not yet implemented");
	}

	@Test
	public void testAdd() {
		
		Goods record = new Goods();
		record.setDelflag(0);
		// .....
		
		int resval = goodsMapper.insert(record);
		assertEquals(1,resval);
	}

	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}

	@Test
	public void testQueryById() {
		fail("Not yet implemented");
	}

	@Test
	public void testQueryList() {
		fail("Not yet implemented");
	}

	@Test
	public void testQueryTotal() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindForSearch() {
		fail("Not yet implemented");
	}

}
