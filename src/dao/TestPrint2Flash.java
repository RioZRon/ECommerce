package dao;


import com.jacob.activeX.*;
import com.jacob.com.*;

public class TestPrint2Flash
{

	static String[] as={"F:\\33.docx"};
	public static void main(String[] args) throws java.io.IOException
	{
		args=as;
		if (args.length > 0)
		{
			try
			{
				ComThread.InitSTA();

				// Create Server object
				ActiveXComponent p2f = new ActiveXComponent("Print2Flash3.Server"); 

				// Setup interface and protection options
				ActiveXComponent defProfile = new ActiveXComponent(p2f.getProperty("DefaultProfile").toDispatch());
				defProfile.setProperty("InterfaceOptions", P2FConst.INTLOGO | P2FConst.INTZOOMSLIDER | P2FConst.INTPREVPAGE | P2FConst.INTGOTOPAGE | P2FConst.INTNEXTPAGE);
				defProfile.setProperty("ProtectionOptions", P2FConst.PROTDISPRINT | P2FConst.PROTENAPI);

				// Convert document
				p2f.invoke("ConvertFile", "F:\\ee.ppt");
				System.out.println("转换成功");
			}
			catch (Exception e)
			{
				System.out.println("转换错误: "+e.toString());
			}
			finally {
				ComThread.Release();
			}
		}
		else System.out.println("Please provide a document file name as a parameter");
			System.out.println("Press Enter to exit...");
			System.in.read();
	}
}
