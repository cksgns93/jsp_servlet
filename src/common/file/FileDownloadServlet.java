package common.file;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FileDown")
public class FileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		download(request,response);
	}
	
	private void download(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		//1.�ٿ�ε���� ���ϸ� �ޱ�
		String fname = req.getParameter("fname");//���� ���ε�� ���ϸ�(������ ���ϸ�)
		String ofname = req.getParameter("origin_fname");//�������ϸ�
		System.out.println("fname: "+fname);
		//2.������ �����
		ServletContext application = req.getServletContext();
		String upDir = application.getRealPath("/upload");
		String path=upDir+File.separator+fname;
		System.out.println("path: "+path);
		
		//res.setContentType("application/unknown");
		res.setContentType("application/octet-stream");
		//�˼� ���� �������� ���� ==> �������� ����Ʈ Ÿ���� ����
		//ǥ���� �� �ִ� �����̸� �ش� �������� ǥ���ϰ� �� �𸣴� �����̸� �ٿ�ε�â�� �������
		//�ٿ�ε� �޵��� ó���Ѵ�.
		String fname_en = new String(ofname.getBytes(),"ISO-8859-1");
		String arg1="attachment; filename="+fname_en;
		res.setHeader("Content-Disposition", arg1);
		//3.�ش� ��ο� ��Ʈ�� ����
		//(FileInputStream)=> ������ �о
		//(ServletOutputStream)=> Ŭ���̾�Ʈ������ ��������.
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(path));
		ServletOutputStream sos = res.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);
		int n=0;
		byte []data=new byte[4000];
		while((n=bis.read(data))!=-1) {
			bos.write(data,0,n);
			bos.flush();
		}
		bis.close();
		bos.close();
		sos.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		download(request,response);
	}

}
