package word;

import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OfficeUtil
{
	String Charset = "";
	byte[] dataStream;//�ļ���
	String _msgText = "";//������Ϣ
	String _msgError = "";//������Ϣ
	int BodySize = 0;
	int ErrorSize = 0;
	int FileSize = 0;
	String MsgVersion = "DBSTEP V3.0";
	static String _$288 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
	
	public void load(HttpServletRequest request) throws Exception
	{
		Charset = request.getHeader("charset");
		if (Charset == null)
		{
			Charset = "GB2312";
		}
		int HeadSize = 64;
		javax.servlet.ServletInputStream mRead = request.getInputStream();
		byte tempByte[] = new byte[HeadSize];
		mRead.read(tempByte, 0, HeadSize);// ������
		String tempByteString = new String(tempByte, 0, HeadSize);
		//(0, 15)�汾�ţ���DBSTEP V3.0
		MsgVersion = tempByteString.substring(0, 15);
		BodySize = Integer.parseInt(tempByteString.substring(16, 31).trim());
		ErrorSize = Integer.parseInt(tempByteString.substring(32, 47).trim());
		FileSize = Integer.parseInt(tempByteString.substring(48, 63).trim());

		if (BodySize > 0)// ��������
		{
			tempByte = new byte[BodySize];
			for (int _readnum = 0; _readnum < BodySize; _readnum += mRead.read(tempByte, _readnum, BodySize - _readnum));
			_msgText = new String(tempByte, 0, BodySize);
		}
		if (ErrorSize > 0)
		{
			tempByte = new byte[ErrorSize];
			mRead.read(tempByte, 0, ErrorSize);
			_msgError = new String(tempByte, 0, ErrorSize);
		}

		int _size = FileSize;
		if (_size > 0)
		{
			ByteArrayOutputStream bo = new ByteArrayOutputStream();
			tempByte = new byte[102400];
			for (int j = 102400; _size > 0; _size -= j)
			{
				if (_size < 102400)
				{
					j = _size;
					tempByte = new byte[j];
				}
				for(int _readnum = 0; _readnum < j; _readnum += mRead.read(tempByte, _readnum, j - _readnum));
				bo.write(tempByte, 0, j);
			}
			dataStream = bo.toByteArray();
			bo.close();
			mRead.close();
		}
	}
	
	public String DecodeBase64(String Value)
	{
		ByteArrayOutputStream o = new ByteArrayOutputStream();
		String m = "";
		byte d[] = new byte[4];
		try
		{
			int count = 0;
			byte x[] = Value.getBytes();
			do
			{
				if(count >= x.length)
					break;
				for(int n = 0; n <= 3; n++)
				{
					if(count >= x.length)
					{
						d[n] = 64;
					}
					else
					{
						int y = _$288.indexOf(x[count]);
						if(y < 0)
							y = 65;
						d[n] = (byte) y;
					}
					count++;
				}
				o.write((byte) (((d[0] & 0x3f) << 2) + ((d[1] & 0x30) >> 4)));
				if(d[2] != 64)
				{
					o.write((byte) (((d[1] & 0xf) << 4) + ((d[2] & 0x3c) >> 2)));
					if(d[3] != 64)
						o.write((byte) (((d[2] & 3) << 6) + (d[3] & 0x3f)));
				}
			}
			while(true);
		}
		catch(StringIndexOutOfBoundsException e)
		{
			_msgError += e.toString();
			System.out.println(e.toString());
		}
		try
		{
			m = o.toString(Charset);
		}
		catch(Exception ea)
		{
			System.out.println(ea.toString());
		}
		return m;
	}

	public String EncodeBase64(String Value)
	{
		ByteArrayOutputStream o = new ByteArrayOutputStream();
		byte d[] = new byte[4];
		try
		{
			int count = 0;
			for (byte x[] = Value.getBytes(Charset); count < x.length;)
			{
				byte c = x[count];
				count++;
				d[0] = (byte)((c & 0xfc) >> 2);
				d[1] = (byte)((c & 3) << 4);
				if (count < x.length)
				{
					c = x[count];
					count++;
					d[1] = (byte)(d[1] + (byte)((c & 0xf0) >> 4));
					d[2] = (byte)((c & 0xf) << 2);
					if (count < x.length)
					{
						c = x[count];
						count++;
						d[2] = (byte)(d[2] + ((c & 0xc0) >> 6));
						d[3] = (byte)(c & 0x3f);
					} else
					{
						d[3] = 64;
					}
				} else
				{
					d[2] = 64;
					d[3] = 64;
				}
				int n = 0;
				while (n <= 3) 
				{
					o.write(_$288.charAt(d[n]));
					n++;
				}
			}

		}
		catch (StringIndexOutOfBoundsException e)
		{
			_msgError += e.toString();
			System.out.println(e.toString());
		}
		catch (Exception ea)
		{
			System.out.println(ea.toString());
		}
		return o.toString();
	}

	public String GetMsgByName(String FieldName)
	{
		int i = 0;
		int j = 0;
		String mReturn = "";
		String mFieldName = FieldName.trim().concat("=");
		i = _msgText.indexOf(mFieldName);
		if (i != -1)
		{
			j = _msgText.indexOf("\r\n", i + 1);
			i += mFieldName.length();
			if (j != -1)
			{
				String mFieldValue = _msgText.substring(i, j);
				mReturn = DecodeBase64(mFieldValue);
				return mReturn;
			} else
			{
				return mReturn;
			}
		} else
		{
			return mReturn;
		}
	}
	
	private static String FormatHead(String vString)
	{
		if (vString.length() > 16)
			return vString.substring(0, 16);
		for (int i = vString.length() + 1; i < 17; i++)
			vString = vString.concat(" ");
		return vString;
	}
	
	public void send(HttpServletResponse response) throws Exception
	{
		javax.servlet.ServletOutputStream out = response.getOutputStream();
		int BodySize = _msgText.getBytes(Charset).length;
		int ErrorSize = _msgError.getBytes(Charset).length;
		FileSize = (dataStream != null && dataStream.length > 0) ? dataStream.length : 0;
		String HeadString = FormatHead(MsgVersion) + FormatHead(String.valueOf(BodySize)) + FormatHead(String.valueOf(ErrorSize)) + FormatHead(String.valueOf(FileSize));
		out.write(HeadString.getBytes());
		int Position = 64;
		if (BodySize > 0)
			out.write(_msgText.getBytes());
		Position += BodySize;
		if (ErrorSize > 0)
			out.write(_msgError.getBytes(Charset));
		Position += ErrorSize;
		if (FileSize > 0)
			out.write(dataStream);
		out.flush();
	}
	
	public void setMsgError(String v)
	{
		_msgError = v;
	}
	
	public void setBytes(byte[] v)
	{
		dataStream = v;
	}
	
	public byte[] getDataStream()
	{
		return dataStream;
	}

	public void SetMsgByName(String FieldName, String FieldValue)
	{
		String mFieldText = "";
		String mFieldHead = "";
		String mFieldNill = "";
		int i = 0;
		int j = 0;
		boolean f = false;
		String mFieldName = FieldName.trim().concat("=");
		String mFieldValue = EncodeBase64(FieldValue);
		mFieldText = mFieldName + mFieldValue + "\r\n";
		i = _msgText.indexOf(mFieldName);
		if (i != -1)
		{
			j = _msgText.indexOf("\r\n", i + 1);
			if (j != -1)
			{
				mFieldHead = _msgText.substring(0, i);
				mFieldNill = _msgText.substring(j + 2);
				f = true;
			}
		}
		if (f)
			_msgText = (new StringBuffer(mFieldHead + mFieldText + mFieldNill)).toString();
		else
			_msgText = _msgText.concat(mFieldText);
	}
}
