package servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.PackageDao;


@WebServlet("/InsertReviewContentServlet")
public class InsertReviewContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		// 폴더 작업
	    ServletContext application = getServletContext();
	    String path = application.getRealPath("/upload/img");
	    System.out.println("(참고) real path : " + path);

	    // 폴더를 만들기 위해 할 작업
	    File filePath = new File(path);
	    if (!filePath.exists()) {
	        filePath.mkdirs();
	    }

	    // 파일 저장 (MultipartRequest 객체 생성)
	    MultipartRequest multi = null;
	    try {
	        multi = new MultipartRequest(
	            request,
	            path,
	            100 * 1024 * 1024,
	            "UTF-8",
	            new DefaultFileRenamePolicy()
	        );
	    } catch (IOException e) {
	        e.printStackTrace();
	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "파일 업로드 오류");
	        return;
	    }

	    // 파일정보 알기
	    Enumeration<?> files = multi.getFileNames();
	    ArrayList<String> listFilenames = new ArrayList<String>();
	    while (files.hasMoreElements()) {
	        String fileObject = (String) files.nextElement();
	        String filename = multi.getFilesystemName(fileObject);
	        listFilenames.add(filename);
	        String fileOriginalName = multi.getOriginalFileName(fileObject);
	        File file = multi.getFile(fileObject);

	        if (file != null) {
	            long fileSize = file.length();
	            System.out.println("File Name: " + filename);
	            System.out.println("Original File Name: " + fileOriginalName);
	            System.out.println("File Size: " + fileSize);
	        }
	    }

	    // 리뷰 최대 idx
	    int maxReviewIdx = Integer.parseInt(multi.getParameter("review_idx"));
	    

	    // 리뷰 내용
	    int packageIdx = Integer.parseInt(multi.getParameter("package_idx"));
	    int star = Integer.parseInt(multi.getParameter("star"));
	    String age = multi.getParameter("age");
	    String like = multi.getParameter("like");
	    String content = multi.getParameter("content");

	    // 리뷰 태그(여러개)
	    String[] tagStrArray = multi.getParameterValues("tag");
	    int[] tag = new int[0];

	    if (tagStrArray != null) {
	        tag = new int[tagStrArray.length];
	        for (int i = 0; i < tagStrArray.length; i++) {
	            tag[i] = Integer.parseInt(tagStrArray[i]);
	        }
	    }

	    // 리뷰 이미지(여러개)
//	    String[] imgStrArray = multi.getParameterValues("img");
	    String[] imgStrArray = new String[listFilenames.size()];
	    for(int i=0; i<=imgStrArray.length-1; i++) {
	    	imgStrArray[i] = listFilenames.get(i);
	    }
	    if (imgStrArray != null) {
	        for (String imgPath : imgStrArray) {
	            System.out.println("Image path to save in DB: " + imgPath);
	        }
	    } else {
	        System.out.println("imgStrArray is null");
	    }

	    PackageDao pDao = new PackageDao();

	    // 내용 한 개 insert
	    try {
	        pDao.insertReviewContent(packageIdx, like, age, star, content, maxReviewIdx);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    // tag 여러개 insert
	    try {
	        pDao.insertReviewTag(tag, maxReviewIdx);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    // image 여러개 insert
	    try {
	        pDao.insertReviewImg(maxReviewIdx, imgStrArray);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	 // RequestDispatcher 객체를 가져온다.
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/hanatour/jsp/tour/tour_package.jsp?countryCity=태국&package_idx="+packageIdx);


	    // 요청을 포워딩한다.
	    dispatcher.forward(request, response);

	  

	}


}
