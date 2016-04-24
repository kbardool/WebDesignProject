package spring.mvc.sample;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import spring.mvc.bean.SimpleBean;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:application-context.xml","classpath:mvc-config.xml"})
public class SampleTest {

	@Autowired
	private ApplicationContext applicationContext;
	
	@Test
	public void test() {
		//Implement
		
		SimpleBean simpleBean = applicationContext.getBean("simpleBean", SimpleBean.class);
		Assert.assertNotNull(simpleBean);
		
		simpleBean = (SimpleBean)applicationContext.getBean("simpleBean");
		Assert.assertNotNull(simpleBean);
		
		Assert.assertEquals(simpleBean.getSimpleId(), 4);
		Assert.assertEquals(simpleBean.getSimpleText(), "simpletext");
		
	}

}
