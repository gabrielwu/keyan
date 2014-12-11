package com.keyan.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadFile extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8120073028156124274L;

	/**
	 * Constructor of the object.
	 */
	public UploadFile() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// TODO
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String fileOri = "";
		DiskFileItemFactory factory = new DiskFileItemFactory();/**创建一个新的文件上传操作*/
		ServletFileUpload upload = new ServletFileUpload(factory);
		/**设置能上传的最大文件的大小*/
		upload.setSizeMax(30*1024*1024);
		/**Parse the request*/
		List fileItems;
		try {
			fileItems = upload.parseRequest(request);
			//开始读取上传信息
			Iterator iter = fileItems.iterator();
			// 依次处理每个上传的文件
			while(iter.hasNext()) {
				FileItem item = (FileItem) iter.next();
				if (item.isFormField() && item.getFieldName().equals("file_path")) {
					fileOri = item.getString();
				}
			}

			System.out.println("原始文件："+fileOri);
			iter = fileItems.iterator();
			while(iter.hasNext()) {
				FileItem item = (FileItem) iter.next();
				// 忽略其他不是文件域的所有表单信息
				if (!item.isFormField()) {
					UUID uuid = UUID.randomUUID();
					String newName = uuid.toString();
					String oriName = item.getName();
					System.out.println(oriName+"：1123");
					if (oriName.equals("")) {
						out.print("<script>");
						out.print("parent.uploadFileResult('-1','');");
						out.print("</script>");
					} else {
						String extName = oriName.substring(oriName.lastIndexOf(".") + 1);
						String fullName = newName +"."+ extName;
						String filePath = "uploadFile/"+fullName;
						System.out.println(filePath);
						String path = this.getServletContext().getRealPath("/");
						String filePathOri = path + fileOri;
						String flag = "1";
						try{
							item.write(new File(request.getRealPath(filePath)));
							File file = new File(filePathOri);
							if (file.isFile()) {
								file.delete();
								System.out.println("file deleted!");
							}
						}catch(Exception e){
							flag = "0";
							e.printStackTrace();
						}
						out.print("<script>");
						out.print("parent.uploadFileResult('"+flag+"','"+filePath+"');");
						out.print("</script>");
					}
				}
			}
		} catch (FileUploadException e1) {
			e1.printStackTrace();
		}
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
