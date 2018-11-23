/**
 * Dao
 */
package file.dao;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Repository;
import dswork.core.db.BaseDao;
import dswork.core.util.FileUtil;


@Repository
@SuppressWarnings("all")
public class DsFileDao extends BaseDao<DsFile, Long>
{
	
	public DsFileDao() {
		System.out.println("fffffffffffffffffffffffffffffffff");
	}
	@Override
	public Class getEntityClass()
	{
		return DsFileDao.class;
	}
	//根据id查询文档
	public  DsFile getById(long id) 
	{
		Map a = new HashedMap();
		DsFile dsfile= (DsFile) executeSelect("select", id);
		System.out.println("获取成功！");
		return dsfile;
	}
	//保存文档
	public  int add(DsFile file ) throws FileNotFoundException 
	{
		byte[] b = null;
		file.getId();
		byte[] file1 = (byte[]) file.getFilebody();
		executeInsert("insert", file);
		System.out.println("保存成功！");
		return 1;
//		b= set(c);
//		a.remove("filebody");
//		a.put("filebody", b);
//		executeInsert("insert", a);
	}
	public  int updateById(DsFile file) 
	{
		DsFile dsfile= (DsFile) executeSelect("update", file);
		System.out.println("更新成功！");
		return 1;
	}
	//将文件改为二进制
	public byte[] set(File aid ) throws FileNotFoundException 
	{
		byte[] a = null;
		try
		{
			InputStream in = new FileInputStream(aid);
			a = FileUtil.getToByte(in);
			in.close();
		}
		catch(Exception e)
		{
		}
		return a;
	}
}