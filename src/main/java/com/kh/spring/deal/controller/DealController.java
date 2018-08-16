package com.kh.spring.deal.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.common.page.PageCreate;
import com.kh.spring.common.page.PageCreateDeal;
import com.kh.spring.deal.model.service.DealService;
import com.kh.spring.deal.model.vo.Deal;
import com.kh.spring.deal.model.vo.DealImage;

import com.kh.spring.dealReview.model.service.DealReviewService;
import com.kh.spring.dealReview.model.vo.DealReview;

@Controller
public class DealController {
	
	@Autowired
	private DealService service;
	
	@Autowired
	private DealReviewService reviewService;
	
	@RequestMapping("/deal/dealList.do")
	public ModelAndView dealList(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage){
		
		ModelAndView mv=new ModelAndView();
		int numPerPage=10;
		
		List<Deal> list=service.selectDealList(cPage,numPerPage);
		
		
		int totalCount=service.selectCount();

		
		String pageBar=new PageCreateDeal().getPageBar(cPage,numPerPage,totalCount,"dealList.do");
		
		
		mv.addObject("pageBar", pageBar);
		mv.addObject("list",list);
		mv.addObject("cPage", cPage);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("deal/dealList");
		
		return mv;
		
	}
	
	@RequestMapping("/deal/dealForm.do")
	public String dealForm() {
		return "deal/dealForm";
	}

	
	@RequestMapping("/deal/dealWriter.do")
	public String dealWriter() {
		return "deal/dealWriter";
	}
	
	
	
	@RequestMapping("/deal/dealImages.do")
	public void profileUpload( MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String realFolder=request.getSession().getServletContext().getRealPath("/resources/images/test/");
		
		UUID uuid = UUID.randomUUID();

	
		String org_filename = file.getOriginalFilename();
		
		String str_filename = uuid.toString() + org_filename;
		
		
		System.out.println("������ : " + org_filename);
		System.out.println("�̸� �缳�� : " + str_filename);
		String filepath = realFolder + str_filename;
		
		System.out.println("���ϰ�� : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
		f.mkdirs();
		}
		
		file.transferTo(f);
	      out.println(str_filename);
	      out.close();
	}
	
	
	
	
	@RequestMapping("/deal/dealWriteEnd.do")
	public ModelAndView dealWriteEnd(String subject, String content,String deal_writer, int member_pk,HttpServletRequest request) {
		
		//�޾ƿ� �� Ȯ��
		System.out.println("���� :"+subject);
		System.out.println("���� : "+content);
		
		String cutting=content;
		List<String> imageList=new ArrayList<String>();
		
		while(cutting.contains("<img")){
			int start=cutting.indexOf("src=");
			String checkSrc = cutting.substring(start+5, start+9);
			if(checkSrc.equals("http")) {
				//���ͳ� �ּ� ������ �̹���
				int startHttp=cutting.indexOf("src=");
				int endHttp=cutting.indexOf("\"",start+5);
				String image = cutting.substring(startHttp+5, endHttp);
				imageList.add(image);
				cutting=cutting.substring(endHttp);
			}else {
				//���ε��� �̹���
				int startUpload=cutting.indexOf("test/");
				int endUpload=cutting.indexOf("&",start+5);
				String image1 = cutting.substring(startUpload+5, endUpload);
				imageList.add(image1);
				cutting=cutting.substring(endUpload);
			}	
		}
		
		
		//�ű� �ּ�
		String realFolder=request.getSession().getServletContext().getRealPath("/resources/images/deal/");
		
		
		//�����ּ�
		String testFolder=request.getSession().getServletContext().getRealPath("/resources/images/test/");
		
		
		//���� �ּ��� ���ϸ� ��������
		
		File file= new File(testFolder);
		File[] fileList=file.listFiles();

		
		for(int i=0;i<imageList.size();i++) {
			for(File a: fileList) {
				if(imageList.get(i).equals(a.getName())) {
				
				 File file1=new File(testFolder+a.getName());
				 File file2=new File(realFolder+a.getName());
				
				 
				 if(file1.exists()) {
					 file1.renameTo(file2);
					 System.out.println("���� �ű�� ����");
				 }
				 if(!file2.exists()) {
					 file2.mkdirs();
				 }
			}
		}
		}
		
		
		
		
		
		

		//�ҷ��� ��� �ٲٱ�
		String content1=content.replace("/spring/resources/images/test/", "/spring/resources/images/deal/");
		System.out.println(content1);
	
	
		
		
		int result=service.insertDeal(subject,content1,deal_writer,imageList,member_pk);
		
		
		ModelAndView mv= new ModelAndView();
		String msg="";
		String loc="";
		if(result>0) {
			msg="�Խñ� �ۼ� ����";
		}else {
			msg="�Խñ� �ۼ� ����";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc","/deal/dealList.do" );
		mv.setViewName("common/msg");

		return mv;
	}
	
	
	
	
	
	
	
	@RequestMapping("/deal/dealView.do")
	public ModelAndView dealView(int deal_pk) {
		ModelAndView mv=new ModelAndView();
		
		
		
		Deal deal=service.selectOne(deal_pk);
		
		
		List<DealReview> dealreviews=reviewService.dealReviewList(deal_pk);
		
		
		
		mv.addObject("dealreviews", dealreviews);
		mv.addObject("deal", deal);
		mv.setViewName("/deal/dealView");
		
		return mv;
		
	}
	
	
	
	
	@RequestMapping("/deal/dealDelete.do")
	public ModelAndView dealDelete(int deal_pk, HttpServletRequest request) {
		ModelAndView mv= new ModelAndView();
		
		
		
		
		List<DealImage> list=service.dealImageList(deal_pk);
		System.out.println("����� ����"+list.size());
		//�̹��� �̸� ���� ����Ʈ
		List<String> listImgName=new ArrayList<String>();
		
		
		for(DealImage a: list) {
			listImgName.add(a.getDeal_ori_img());
			System.out.println(a.getDeal_ori_img());
		}
		System.out.println("������ ����� ����"+listImgName.size());
		//�̹��� �� ����
		int result=service.deleteDeal(deal_pk);
		
		//������ġ
		String realFolder=request.getSession().getServletContext().getRealPath("/resources/images/deal/");
		//deal Pk�� �ش��ϴ� �̹��� ���ϸ��� �ִٸ� 
		if(result>0) {
			for(String a: listImgName) {
				String deleteFile=realFolder+a;
				File file= new File(deleteFile);
				if(file.exists()) {
					
					file.delete();
				}	
			}
		}
		
		
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="�ŷ��� ���� ����";
		}else {
			msg="�ŷ��� ���� ����";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc","/deal/dealList.do" );
		mv.setViewName("common/msg");

		return mv;
		
	}
	
	@RequestMapping("/deal/dealUpdate.do")
	public ModelAndView dealUpdate(int deal_pk) {
		ModelAndView mv= new ModelAndView();
		Deal deal=service.selectOne(deal_pk);
		mv.addObject("deal",deal);
		mv.setViewName("/deal/dealUpdate");
		
		return mv;
	}
	
	
	@RequestMapping("/deal/dealUpdateEnd.do")
	public ModelAndView dealUpdateEnd(String subject, String content,String deal_writer,int deal_pk, HttpServletRequest request) {
				//�޾ƿ� �� Ȯ��
				System.out.println("���� :"+subject);
				System.out.println("���� : "+content);
				
				//���� �߶� �̹��� �� ��������
				String cutting=content;
				
				//�̹��� �� �޾ƿ��� ����Ʈ
				List<String> imageList=new ArrayList<String>();
				
				//�̹��� �� �߶���� ����
				while(cutting.contains("<img")){
					int start=cutting.indexOf("src=");
					String checkSrc = cutting.substring(start+5, start+9);
					
					if(checkSrc.equals("http")) {
						//���ͳ� �ּ� ������ �̹���
						int startHttp=cutting.indexOf("src=");
						int endHttp=cutting.indexOf("\"",start+5);
						String image = cutting.substring(startHttp+5, endHttp);
						imageList.add(image);
						cutting=cutting.substring(endHttp);
					}else {
						
						
						int startUpload=cutting.indexOf("test/");
						System.out.println("�׽�Ʈ�� ����������"+startUpload);
						int startUploadDeal=cutting.indexOf("deal/");
						System.out.println("���̾���������"+startUploadDeal);
						
						
						if(startUpload!=-1&&(startUpload<startUploadDeal||startUploadDeal==-1)) {
						//���ε��� �̹���
						int endUpload=cutting.indexOf("&",start+5);
						String image1 = cutting.substring(startUpload+5, endUpload);
						System.out.println("�߰��� �̹����� : "+image1);
						imageList.add(image1);
						cutting=cutting.substring(endUpload);
						
						}else if(startUploadDeal!=-1&&(startUpload>startUploadDeal||startUpload==-1)){
							int endUploadDeal=cutting.indexOf("&",start+5);
							String image1 = cutting.substring(startUploadDeal+5, endUploadDeal);
							imageList.add(image1);
							System.out.println("���� �ִ� �̹����� : "+image1);
							cutting=cutting.substring(endUploadDeal);
						}
					}	
				}
				
				
				
				//�̹��� �� Ȯ���ϱ� 
				for(String a: imageList) {
					System.out.println("�̹��� �� : "+a);
				}
				
				
				//����Ǿ� �ִ� �̹��� �� ��������
				List<DealImage> saveImage=service.selectDealImageList(deal_pk);
				for(DealImage a: saveImage) {
					System.out.println("�̹��� �� �������� : "+a.getDeal_ori_img());
				}
				
				
				
				
				//�� �������� ���� ���� 
				List<String> deleteImage=new ArrayList<String>();
				
				//���� ���ϸ� ��������
				for(int i=0;i<saveImage.size();i++) {
					boolean check=imageList.contains(saveImage.get(i).getDeal_ori_img());
					if(!check) {
						deleteImage.add(saveImage.get(i).getDeal_ori_img());
					}
				}
				
				//�ű� �ּ�
				String realFolder=request.getSession().getServletContext().getRealPath("/resources/images/deal/");
				System.out.println("���� ��ο�����������������:" + realFolder);
				
				//�����ּ�
				String testFolder=request.getSession().getServletContext().getRealPath("/resources/images/test/");
				
				//�ӽ����� ���� ��������(���� �ԷµǴ� ��)
				File file= new File(testFolder);
				File[] fileList=file.listFiles();
				
				
				File fileDeal=new File(realFolder);
				File[] fileDealList=fileDeal.listFiles();
				
				
				//���� ���� �Ⱦ��� ���� �����ϱ�
				for(int i=0;i<deleteImage.size();i++) {
				System.out.println("���� ���� �Գ״� �����ּ��� : "+deleteImage.get(i));
					for(File a: fileDealList) {
						if(deleteImage.get(i).equals(a.getName())) {
						 File fileDelete=new File(realFolder+a.getName());
						 if(fileDelete.exists()) {
							 fileDelete.delete();
						 }
						}
					}
				}
				
				//submit �ӽ� ������ �ִ� ���� deal������ �̵���Ű��
				for(int i=0;i<imageList.size();i++) {
					for(File a: fileList) {
						if(imageList.get(i).equals(a.getName())) {
						
						 File file1=new File(testFolder+a.getName());
						 
						 File file2=new File(realFolder+a.getName());
						
						 
						 if(file1.exists()) {
							 file1.renameTo(file2);
							
						 }
						 if(!file2.exists()) {
							 file2.mkdirs();
							 System.out.println("���ϻ��� ����");
						 }
					}
				}
				}

				//��� �����Ҷ�  �ҷ��� ��ġ ��������ֱ�
				String content1=content.replace("/spring/resources/images/test/", "/spring/resources/images/deal/");
				
				System.out.println("���� �̾ƿ°� Ȯ���ϱ�"+content1);
				//DB ������Ʈ ���ֱ�
				int result=service.updateDeal(deal_pk,subject,content1,deal_writer,imageList);
				
				
				ModelAndView mv= new ModelAndView();
				String msg="";
				String loc="";
				if(result>0) {
					msg="�Խñ� �ۼ� ����";
				}else {
					msg="�Խñ� �ۼ� ����";
				}
				mv.addObject("msg",msg);
				mv.addObject("loc","/deal/dealList.do");
				mv.setViewName("common/msg");

				return mv;
	}
	
	@RequestMapping("/deal/dealSelect.do")
	public ModelAndView dealSelect(String selectOption, String searchOption,@RequestParam(value="cPage",required=false,defaultValue="1") int cPage) {
		
			
			ModelAndView mv=new ModelAndView();
			int numPerPage=10;
			Map<String, String> search=new HashMap<String, String>();

			search.put("selectOption", selectOption);
			search.put("searchOption", searchOption);
			
			
			List<Deal> searchList=service.searchList(cPage,numPerPage,search);
		
			
			int totalCount=service.searchSelectCount(search);
		
			String pageBar=new PageCreate().getPageBar(cPage,numPerPage,totalCount,"dealSelect.do?selectOption="+selectOption+"&searchOption="+searchOption);
		
			
			System.out.println(pageBar);
			
			mv.addObject("pageBar", pageBar);
			mv.addObject("list",searchList);
			mv.addObject("cPage", cPage);
			mv.addObject("totalCount", totalCount);
			mv.setViewName("deal/dealSelect");
			
			return mv;
	}

	
}
