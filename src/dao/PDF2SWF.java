package dao;

import java.io.File;

public class PDF2SWF {

	// 要转换的pdf文件路径
		private static String INPUT_PATH;
		// 转换后的swf文件路径
		private static String OUTPUT_PATH;
		// pdf2swf.exe的路径
		private static String PDF2SWF_PATH = "D:\\SWFTools";
		
		public static void main(String[] args) {
			//String file=System.getProperty("user.dir")+"\\WebRoot\\";
			//PDF2SWF.pdfToSwf("5.pdf", "F:\\5.swf");
		}
		/**  
	     * PDF转SWF
	     * @param pdffile PDF文件全路径  
	     * @param swffile 转换后SWF文件存放路径  
		 * @return 
	     */
		public static boolean pdfToSwf(String pdffile, String swffile)
		{
			
			//String file=System.getProperty("user.dir")+"\\WebRoot\\";
			INPUT_PATH = pdffile;
			OUTPUT_PATH = swffile+".swf";
			if(checkContentType()==0)
			{
				return toSwf();
			}else {
				return false;
			}
		}
		/**  
	     * 检查文件是否是pdf类型的  
	     * @return  
	     */ 
		private static int checkContentType()
		{
			String type = INPUT_PATH.substring(INPUT_PATH.lastIndexOf(".") + 1, INPUT_PATH.length())
					.toLowerCase();
			if (type.equals("pdf")){   
	            System.out.println("*****是pdf文件*****");   
	            return 0;   
			} 
			else{
				System.out.println("*****非pdf文件*****"); 
				return 9;
			}		
		}
		/**  
	     * 调用批处理文件生成swf文件  
	     */ 
		private static boolean toSwf() {  
			if(new File(INPUT_PATH).isFile()){
				System.out.println("*****正在转换..*****");
				try {    
					// 调用创建的bat文件进行转换 
					String cmd = "cmd /c start D:\\SWFTools\\pdf2swf.bat \"" 
							+ PDF2SWF_PATH + "\" \"" + INPUT_PATH + "\" \"" + OUTPUT_PATH + "\"";
					Runtime.getRuntime().exec(cmd);
					return true;
			    } 
			    catch (Exception e) {  
			        e.printStackTrace();  
			        return false;
			    }  
			}
			else{
				return false;
			}
		}  

}
