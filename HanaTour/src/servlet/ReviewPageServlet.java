package servlet;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.tagext.Tag;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dao.PackageDao;
import dto.PackageReviewContentDto;
import dto.PackageReviewImgDto;
import dto.PackageReviewTagDto;


@WebServlet("/ReviewPageServlet")
public class ReviewPageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("get");
    	response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        int packageIdx = Integer.parseInt(request.getParameter("package_idx")); // 필요 시 추가
        int pageNum = Integer.parseInt(request.getParameter("page_num"));

        PackageDao pDao = new PackageDao();
        ArrayList<PackageReviewContentDto> reviews = null;
        try {
            reviews = pDao.packageReviewContent(packageIdx, pageNum);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 모든 태그와 이미지를 미리 조회합니다.
        ArrayList<PackageReviewTagDto> allTags = null;
        ArrayList<PackageReviewImgDto> allImages = null;
        try {
            allTags = pDao.packageReviewTag(); // 모든 태그 조회
            allImages = pDao.packageReviewImg(); // 모든 이미지 조회
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 리뷰와 태그, 이미지를 연결하는 로직을 추가합니다.
        JSONArray reviewsArray = new JSONArray();

        for (PackageReviewContentDto dto : reviews) {
            JSONObject reviewObj = new JSONObject();
            reviewObj.put("reviewStar", dto.getReviewStar());
            reviewObj.put("userId", dto.getUserId());
            reviewObj.put("pressLike", dto.getPressLike());
            reviewObj.put("age", dto.getAge());
            reviewObj.put("writeDate", dto.getWriteDate());
            reviewObj.put("packageName", dto.getPackageName());
            reviewObj.put("text", dto.getText());

            // 각 리뷰에 대한 태그와 이미지 필터링
            JSONArray tagsArray = new JSONArray();
            JSONArray imagesArray = new JSONArray();

            for (PackageReviewTagDto tag : allTags) {
                if (tag.getReviewIdx() == dto.getReviewIdx()) {
                    JSONObject tagObj = new JSONObject();
                    tagObj.put("text", tag.getText());
                    tagsArray.add(tagObj);
                }
            }

            for (PackageReviewImgDto img : allImages) {
                if (img.getReviewIdx() == dto.getReviewIdx()) {
                    JSONObject imgObj = new JSONObject();
                    imgObj.put("imgUrl", img.getImgUrl());
                    imagesArray.add(imgObj);
                }
            }

            reviewObj.put("tags", tagsArray);
            reviewObj.put("images", imagesArray);

            reviewsArray.add(reviewObj);
        }

        // 최종 응답 JSON 객체를 생성합니다.
        JSONObject responseObj = new JSONObject();
        responseObj.put("reviews", reviewsArray);

        response.getWriter().print(responseObj.toJSONString());
    }
}
