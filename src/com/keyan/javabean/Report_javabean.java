package com.keyan.javabean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import com.keyan.dbUtil.DB;

public class Report_javabean {
	private String[] aTable;
	private ArrayList<Map<String, Float>> membersA;
	private ArrayList<Map<String, String>> members1;
	private Map<String, String> members2;
	private float aRMBRatio;
    public Report_javabean(float a) {
		super();
		this.aRMBRatio = a;
		aTable = new String[6];
		this.aTable[0] = "r_paper";
		this.aTable[1] = "r_project";
		this.aTable[2] = "r_book";
		this.aTable[3] = "r_awards";
		this.aTable[4] = "r_patent";
		this.aTable[5] = "r_software";
		this.membersA = new ArrayList<Map<String, Float>>();
		this.members1 = new ArrayList<Map<String, String>>();
		this.members2 = new HashMap<String, String>();
	}
    
	@SuppressWarnings("unchecked")
	public ArrayList<Map<String, Object>> getReportAllOri(Map<String, String> cMap){
		Lab_javabean ljb = new Lab_javabean();
    	ArrayList<Map<String, String>> labList = ljb.getList();
    	ArrayList<Map<String, Object>> reportAll = new ArrayList<Map<String, Object>>();
    	float a1 = 0f;
    	float a2 = 0f;
    	float a3 = 0f;
    	float a4 = 0f;
    	float a5 = 0f;
    	float a6 = 0f;
    	float a_total = 0f;
    	for (Map<String, String> lab: labList) {
    		String lab_id = lab.get("id");
    		Map<String,Object> map = this.getReportAllLab(cMap, lab_id);  // TODO
    		Map<String,String> mapLabInfo = (Map<String, String>) map.get("labInfo");
    		a1 += Float.parseFloat(mapLabInfo.get("a1"));
    		a2 += Float.parseFloat(mapLabInfo.get("a2"));
    		a3 += Float.parseFloat(mapLabInfo.get("a3"));
    		a4 += Float.parseFloat(mapLabInfo.get("a4"));
    		a5 += Float.parseFloat(mapLabInfo.get("a5"));
    		a6 += Float.parseFloat(mapLabInfo.get("a6"));
    		a_total += Float.parseFloat(mapLabInfo.get("a_total"));
    		reportAll.add(map);
    	}
    	Map<String, Object> total = new HashMap<String, Object>();
    	total.put("a1", String.valueOf(a1));
    	total.put("a2", String.valueOf(a2));
    	total.put("a3", String.valueOf(a3));
    	total.put("a4", String.valueOf(a4));
    	total.put("a5", String.valueOf(a5));
    	total.put("a6", String.valueOf(a6));
    	total.put("a_total", String.valueOf(a_total));
		reportAll.add(total); // 注意最后一行是总计
		return reportAll;
    }
	@SuppressWarnings("unchecked")
	public ArrayList<ArrayList<String>> getReportAchieve(ArrayList<Map<String, Object>> listObject, String table){
		ArrayList<ArrayList<String>> list = new ArrayList<ArrayList<String>>();
		ArrayList<String> listHead = new ArrayList<String>();
		int table_id = Integer.parseInt(table);
		switch (table_id) {
		case 1:
			listHead.add("论文题目");
			listHead.add("检索号");
			listHead.add("发表日期");
			listHead.add("期刊/会议");
			listHead.add("期刊类型");
			listHead.add("期刊名称");
			listHead.add("卷（期）：页");
			listHead.add("会议类型");
			listHead.add("会议名称");
			listHead.add("会议日期");
			listHead.add("会议地点");
			listHead.add("通讯作者");
			listHead.add("作者");
			listHead.add("关键词");
			listHead.add("影响因子");
			listHead.add("引用次数");
			listHead.add("JCR分区情况"); //TODO
			break;
		case 2:
			listHead.add("项目名称");
			listHead.add("计划名称");
			listHead.add("项目来源");
			listHead.add("项目经费");
			listHead.add("经费卡号");
			listHead.add("每年到帐");
			listHead.add("项目状态");
			listHead.add("开始日期");
			listHead.add("结束日期");
			listHead.add("纵/横向");
			listHead.add("项目类型");
			listHead.add("组长");
			break;
		case 3:
			listHead.add("著作名称");
			listHead.add("ISBN");
			listHead.add("出版时间");
			listHead.add("出版社");
			listHead.add("字数（千字）");
			listHead.add("著作类型");
			listHead.add("组长");
			break;
		case 4:
			listHead.add("奖项名称");
			listHead.add("获奖时间");
			listHead.add("级别");
			listHead.add("授奖部门");
			listHead.add("奖项类型");
			listHead.add("组长");
			break;
		case 5:
			listHead.add("专利名称");
			listHead.add("专利号");
			listHead.add("申请号");
			listHead.add("公开号");
			listHead.add("发表日期");
			listHead.add("公开日期");
			listHead.add("专利类型");
			listHead.add("组长");
			break;
		case 6:
			listHead.add("软件著作权名称");
			listHead.add("登记号");
			listHead.add("发表日期");
			listHead.add("授权日期");
			listHead.add("著作权类型");
			listHead.add("组长");
			break;
		}
		listHead.add("A值");
		listHead.add("成员(A值分配)");
		listHead.add("提交人");
		listHead.add("2013类型（CCF推荐等级）");
		listHead.add("链接");
		listHead.add("审核状态");
		listHead.add("审核日期");
		listHead.add("是否奖励");
		listHead.add("备注");
		list.add(listHead);

		switch (table_id) {
		case 1:
			for (Map<String, Object> map:listObject) {
				ArrayList<String> listContent = new ArrayList<String>();
				listContent.add((String) map.get("title"));
				listContent.add((String) map.get("number"));
				listContent.add((String) map.get("date_publish"));
				if (((String) map.get("category")).equals("1")) {
					listContent.add("期刊");
					listContent.add((String) map.get("type"));
					listContent.add((String) map.get("publication"));
					listContent.add((String) map.get("j_volume") + "(" + (String) map.get("j_issue") + "):" + (String) map.get("j_page"));
					listContent.add("");
					listContent.add("");
					listContent.add("");
					listContent.add("");
				} else {
					listContent.add("会议");
					listContent.add("");
					listContent.add("");
					listContent.add("");
					listContent.add((String) map.get("type"));
					listContent.add((String) map.get("publication"));
					listContent.add((String) map.get("c_date"));
					listContent.add((String) map.get("c_location"));
				}
				listContent.add((String) map.get("leader"));
				listContent.add((String) map.get("authors"));
				listContent.add((String) map.get("keywords"));
				listContent.add((String) map.get("factor"));
				listContent.add((String) map.get("citiations"));
				listContent.add((String) map.get("area"));
				listContent.add((String) map.get("a_value"));
				listContent.add((String) map.get("membersA"));
				listContent.add((String) map.get("committer"));
				listContent.add((String) map.get("type2013"));
				listContent.add((String) map.get("link"));
				listContent.add((String) map.get("_pass"));
				listContent.add((String) map.get("date_pass"));
				listContent.add((String) map.get("_isAwarded"));
				listContent.add((String) map.get("remark"));
				list.add(listContent);
			}
			break;
		case 2:
			for (Map<String, Object> map:listObject) {
				ArrayList<String> listContent = new ArrayList<String>();
				listContent.add((String) map.get("title"));
				listContent.add((String) map.get("plan"));
				listContent.add((String) map.get("source"));
				listContent.add((String) map.get("cost"));
				listContent.add((String) map.get("card"));
				listContent.add((String) map.get("costYears"));
				listContent.add((String) map.get("status"));
				listContent.add((String) map.get("date1"));
				listContent.add((String) map.get("date2"));
				if (((String) map.get("category")).equals("1")) {
					listHead.add("纵向");
				} else {
					listHead.add("横向");
				}
				listContent.add((String) map.get("type"));
				listContent.add((String) map.get("leader"));
				listContent.add((String) map.get("a_value"));
				listContent.add((String) map.get("membersA"));
				listContent.add((String) map.get("committer"));
				listContent.add((String) map.get("type2013"));
				listContent.add((String) map.get("link"));
				listContent.add((String) map.get("_pass"));
				listContent.add((String) map.get("date_pass"));
				listContent.add((String) map.get("_isAwarded"));
				listContent.add((String) map.get("remark"));
				list.add(listContent);
			}
			break;
		case 3:
			for (Map<String, Object> map:listObject) {
				ArrayList<String> listContent = new ArrayList<String>();
				listContent.add((String) map.get("title"));
				listContent.add((String) map.get("isbn"));
				listContent.add((String) map.get("date_press"));
				listContent.add((String) map.get("press"));
				listContent.add((String) map.get("words_count"));
				listContent.add((String) map.get("type"));
				listContent.add((String) map.get("leader"));
				listContent.add((String) map.get("a_value"));
				listContent.add((String) map.get("membersA"));
				listContent.add((String) map.get("committer"));
				listContent.add((String) map.get("type2013"));
				listContent.add((String) map.get("link"));
				listContent.add((String) map.get("_pass"));
				listContent.add((String) map.get("date_pass"));
				listContent.add((String) map.get("_isAwarded"));
				listContent.add((String) map.get("remark"));
				list.add(listContent);
			}
			break;
		case 4:
			for (Map<String, Object> map:listObject) {
				ArrayList<String> listContent = new ArrayList<String>();
				listContent.add((String) map.get("title"));
				listContent.add((String) map.get("date"));
				listContent.add((String) map.get("level"));
				listContent.add((String) map.get("department"));
				listContent.add((String) map.get("type"));
				listContent.add((String) map.get("leader"));
				listContent.add((String) map.get("a_value"));
				listContent.add((String) map.get("membersA"));
				listContent.add((String) map.get("committer"));
				listContent.add((String) map.get("type2013"));
				listContent.add((String) map.get("link"));
				listContent.add((String) map.get("_pass"));
				listContent.add((String) map.get("date_pass"));
				listContent.add((String) map.get("_isAwarded"));
				listContent.add((String) map.get("remark"));
				list.add(listContent);
			}
			break;
		case 5:
			for (Map<String, Object> map:listObject) {
				ArrayList<String> listContent = new ArrayList<String>();
				listContent.add((String) map.get("title"));
				listContent.add((String) map.get("number"));
				listContent.add((String) map.get("number_apply"));
				listContent.add((String) map.get("number_public"));
				listContent.add((String) map.get("date_apply"));
				listContent.add((String) map.get("date_public"));
				listContent.add((String) map.get("type"));
				listContent.add((String) map.get("leader"));
				listContent.add((String) map.get("a_value"));
				listContent.add((String) map.get("membersA"));
				listContent.add((String) map.get("committer"));
				listContent.add((String) map.get("type2013"));
				listContent.add((String) map.get("link"));
				listContent.add((String) map.get("_pass"));
				listContent.add((String) map.get("date_pass"));
				listContent.add((String) map.get("_isAwarded"));
				listContent.add((String) map.get("remark"));
				list.add(listContent);
			}
			break;
		case 6:
			for (Map<String, Object> map:listObject) {
				ArrayList<String> listContent = new ArrayList<String>();
				listContent.add((String) map.get("title"));
				listContent.add((String) map.get("number"));
				listContent.add((String) map.get("date_publish"));
				listContent.add((String) map.get("date_authorized"));
				listContent.add((String) map.get("type"));
				listContent.add((String) map.get("leader"));
				listContent.add((String) map.get("a_value"));
				listContent.add((String) map.get("membersA"));
				listContent.add((String) map.get("committer"));
				listContent.add((String) map.get("type2013"));
				listContent.add((String) map.get("link"));
				listContent.add((String) map.get("_pass"));
				listContent.add((String) map.get("date_pass"));
				listContent.add((String) map.get("_isAwarded"));
				listContent.add((String) map.get("remark"));
				list.add(listContent);
			}
			break;
		}
		return list;
	}
	@SuppressWarnings("unchecked")
	public ArrayList<ArrayList<String>> getReportAll(Map<String, String> cMap){
		ArrayList<Map<String, Object>> listOri = this.getReportAllOri(cMap);  // TODO
		ArrayList<ArrayList<String>> list = new ArrayList<ArrayList<String>>();
		ArrayList<String> listHead = new ArrayList<String>();
		listHead.add("姓名");
		listHead.add("论文奖励");
		listHead.add("项目奖励");
		listHead.add("著作奖励");
		listHead.add("奖项奖励");
		listHead.add("专利奖励");
		listHead.add("软件著作权奖励");
		listHead.add("备注");
		listHead.add("A值总计");
		listHead.add("人民币(元)");
		listHead.add("实验室A值总计");
		listHead.add("实验室人民币（元）总计");
		listHead.add("实验室");
		list.add(listHead);
		int i;
		for (i = 0; i < listOri.size() - 1; i++) {
			Map<String, Object> map = listOri.get(i);
			ArrayList<Map<String, String>> userList = (ArrayList<Map<String, String>>) map.get("users");
			Map<String, String> labInfo = (Map<String, String>) map.get("labInfo");
			int j = 1;
			int amount = userList.size();
			for (Map<String, String> user: userList) {
				ArrayList<String> listContent = new ArrayList<String>();
				listContent.add(user.get("name"));
				listContent.add(user.get("a1"));
				listContent.add(user.get("a2"));
				listContent.add(user.get("a3"));
				listContent.add(user.get("a4"));
				listContent.add(user.get("a5"));
				listContent.add(user.get("a6"));
				listContent.add("");
				float rmb = Float.parseFloat(user.get("a_total")) * aRMBRatio; // TODO
				listContent.add(user.get("a_total"));
				listContent.add(String.valueOf(rmb));
				if (j == amount) {
					float rmbLab = Float.parseFloat(labInfo.get("a_total")) * aRMBRatio;
					listContent.add(labInfo.get("a_total"));
					listContent.add(String.valueOf(rmbLab));
					listContent.add(labInfo.get("name"));
				}
				j++;
				list.add(listContent);
			}
		}
		Map<String, Object> map = listOri.get(i);
		ArrayList<String> listContent = new ArrayList<String>();
		listContent.add("合计");
		listContent.add((String) map.get("a1"));
		listContent.add((String) map.get("a2"));
		listContent.add((String) map.get("a3"));
		listContent.add((String) map.get("a4"));
		listContent.add((String) map.get("a5"));
		listContent.add((String) map.get("a6"));
		listContent.add("");
		listContent.add((String) map.get("a_total"));
		float rmbAll = Float.parseFloat((String) map.get("a_total")) * aRMBRatio;
		listContent.add(String.valueOf(rmbAll));
		listContent.add((String) map.get("a_total"));
		listContent.add(String.valueOf(rmbAll));
		list.add(listContent);
		return list;
    }
    public Map<String,Object> getReportAllLab(Map<String, String> cMap, String lab_id){
    	Lab_javabean ljb = new Lab_javabean();
    	User_javabean ujb = new User_javabean();
    	Map<String, String> labInfo = ljb.getLabById(lab_id); 
    	ArrayList<Map<String, String>> userList = ujb.getUserListByLab(lab_id);
    	userList = this.reportAllUserAddA(userList, cMap);  // TODO
    	float a1 = 0f;
    	float a2 = 0f;
    	float a3 = 0f;
    	float a4 = 0f;
    	float a5 = 0f;
    	float a6 = 0f;
    	float a_total = 0f;
    	for (Map<String, String> map:userList) {
    		a1 += Float.parseFloat(map.get("a1"));
    		a2 += Float.parseFloat(map.get("a2"));
    		a3 += Float.parseFloat(map.get("a3"));
    		a4 += Float.parseFloat(map.get("a4"));
    		a5 += Float.parseFloat(map.get("a5"));
    		a6 += Float.parseFloat(map.get("a6"));
    		a_total += Float.parseFloat(map.get("a_total"));
    	}
    	//System.out.println(lab_id+":");
    	labInfo.put("a1", String.valueOf(a1));
    	labInfo.put("a2", String.valueOf(a2));
    	labInfo.put("a3", String.valueOf(a3));
    	labInfo.put("a4", String.valueOf(a4));
    	labInfo.put("a5", String.valueOf(a5));
    	labInfo.put("a6", String.valueOf(a6));
    	labInfo.put("a_total", String.valueOf(a_total));
    	Map<String, Object>	reportLab = new HashMap<String, Object>();
    	reportLab.put("labInfo", labInfo);
    	reportLab.put("users", userList);
    	return reportLab;
    }
    /**
     * 用户信息加上各个成果a值
     * @param listOri
     * @param year
     * @return
     */
    public ArrayList<Map<String, String>> reportAllUserAddA(ArrayList<Map<String, String>> listOri, Map<String, String> cMap) {
    	String date1 = cMap.get("date1");
    	String date2 = cMap.get("date2");
    	String pass = cMap.get("pass");
    	DB db = new DB();
    	ArrayList<Map<String, String>> list = listOri;
    	for (Map<String, String> map: list) {
    		String user_id = map.get("id");
    		float a_total = 0;
        	for (int i = 0; i < this.aTable.length; i++) {
        		String table = this.aTable[i];  // TODO project
        		String sql = "select count(a.id) as count, sum(a.a_value*m.a_percent/100) as a_a " +
        					 "from "+ table + " a, "+table+"_member m " +
        					 "where m.user_id="+user_id+" and " +
        					 "m.r_id=a.id and a.date_commit>='"+date1+"' and a.date_commit<='"+date2+" 23:59:59' " +
        					 "and pass in ("+pass+")"; 
        		Map<String, String> temp = db.getSingleRow(sql);
        	    float a = 0;
        	    if (!temp.get("count").equals("0")) {
        	    	a = Float.parseFloat(temp.get("a_a"));
        	    } else {
        	    }
    	    	map.put("a"+(i+1), String.valueOf(a));
    	    	a_total += a;
        	}
        	map.put("a_total", String.valueOf(a_total)); // TODO project
    	}
    	db.close();
    	return list;
    }
    
    
    /**
     * 获取实验室报表
     * @param cMap
     * @param lab_id
     * @return
     */
    public ArrayList<Map<String, Object>> getReportLab(Map<String, String> cMap, String lab_id) {
    	User_javabean ujb = new User_javabean();
    	ArrayList<Map<String, String>> users1 = ujb.getUserListByLab(lab_id);
    	this.members1 = users1;
    	ArrayList<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
    	ArrayList<ArrayList<String>> listSheet;
    	String[] sheet = {"论文","项目","著作","奖励","专利","软件著作权"};
    	for (int i = 0; i < 6; i++) {
    		listSheet = this.getReportLabAchieve(cMap, lab_id, i+1);
        	Map<String, Object> map = new HashMap<String, Object>();
        	map.put("content", listSheet);
        	map.put("sheet", sheet[i]);
        	list.add(map);
    	}
    	listSheet = this.getReportLabTotal(cMap, lab_id);
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("content", listSheet);
    	map.put("sheet", "汇总");
    	list.add(map);
    	return list;
    }
    public Map<String, String> reportLabOtherA(Map<String, String> cMap,String lab_id, String user_id) {
    	String date1 = cMap.get("date1");
    	String date2 = cMap.get("date2");
    	String pass = cMap.get("pass");
    	DB db = new DB();
    	String sqlLab = "";
    	String sqlA = "";
    	String sqlWhere = "where a.user_id=u.id" +
    			" and u.lab_id<>"+lab_id+
    			" and m.r_id=a.id " +
    			" and m.user_id="+user_id+
    			" and u.lab_id=l.id" +
    			" and a.date_commit>='"+date1+"' and a.date_commit<='"+date2+" 23:59:59' and a.pass in("+pass+")";
    	String table = "";
    	String table_member = "";
    	float aTotal = 0;
    	float a = 0;
    	String labString = "";
    	Map<String, String> labs = new HashMap<String, String>();
    	for (int i = 0; i < this.aTable.length; i++) {
    		table = this.aTable[i];
    		table_member = table + "_member";
    		sqlLab = "select distinct l.name as name, l.id as id " +
    				"from "+table+" a, "+table_member+" m, r_user u, r_lab l ";
    		sqlA = "select count(a.id) as count, group_concat(distinct l.name SEPARATOR ',' ) as lab, sum(a_percent*a_value/100) as a_a " +
    				"from "+table+" a, "+table_member+" m, r_user u, r_lab l ";
    		sqlA += sqlWhere;
    		sqlLab += sqlWhere;
    		//System.out.println(sqlLab);
    		Map<String, String> map = db.getSingleRow(sqlA);
    		a = 0;
    		if (Integer.parseInt(map.get("count"))!=0) {
    			a = Float.parseFloat(map.get("a_a"));
    			aTotal += a;
    		}
    		ArrayList<Map<String, String>> listLab = db.getRsList(sqlLab);
    		for (Map<String, String> lab: listLab) {
    			if (!labs.containsKey(lab.get("id"))) {
    				labs.put(lab.get("id"), lab.get("name"));
    				labString += lab.get("name")+",";
    			}
    		}
    	}
    	//System.out.println(user_id+" : "+aTotal );
    	Map<String, String> returnMap = new HashMap<String, String>();
    	returnMap.put("a", String.valueOf(aTotal));
    	returnMap.put("labs", labString);
    	db.close();
    	return returnMap;
    }
    // 获取实验室报表汇总sheet
    public ArrayList<ArrayList<String>> getReportLabTotal(
    		Map<String, String> cMap,String lab_id){
    	ArrayList<ArrayList<String>> listTotal = new ArrayList<ArrayList<String>>();
		ArrayList<String> listHead = new ArrayList<String>();
		listHead.add("姓名");
		listHead.add("论文");
		listHead.add("项目");
		listHead.add("著作");
		listHead.add("奖项");
		listHead.add("专利");
		listHead.add("软件著作权");
		listHead.add("其他");
		listHead.add("备注");
		listHead.add("总计");
		listTotal.add(listHead);
		float otherATotal = 0; // 其他奖励
		float[] achieveATotal = new float[6]; // 本实验室成员各成果汇总,每类成果一个和
    	for (Map<String, String> map: this.members1) { // 本实验室成员各成果a值
    		ArrayList<String> list = new ArrayList<String>();
    		String id = map.get("id");
    		String name = map.get("name");
    		list.add(name);
    		float totalMA = 0;
    		for (int i = 0; i < 6; i++) {
    			Map<String, Float> mapA = this.membersA.get(i);
    			float a = mapA.get(id);
    			totalMA += a;
    			achieveATotal[i] += a; // 各成果a累加
    			list.add(String.valueOf(a));
    		}
    		Map<String, String> otherMap = this.reportLabOtherA(cMap, lab_id, id);
    		float otherA = Float.parseFloat(otherMap.get("a")); // TODO 该用户其他奖励
    		//System.out.println("otherA:"+otherA);
    		String otherLab = otherMap.get("labs");
    		totalMA += otherA;
    		otherATotal += otherA;
    		list.add(String.valueOf(otherA));
    		list.add(otherLab);
    		list.add(String.valueOf(totalMA));
    		listTotal.add(list);
    	}
    	// 该实验室各成果汇总
		ArrayList<String> list = new ArrayList<String>();
		list.add("共计");
		float members1Total = 0;
		for (int i = 0; i < 6; i++) {
			float a = achieveATotal[i];
			list.add(String.valueOf(a));
			members1Total += achieveATotal[i];
		}
		members1Total += otherATotal;
		list.add(String.valueOf(otherATotal));
		list.add("");
		list.add(String.valueOf(members1Total));
		listTotal.add(list);
		
    	// 该实验室各成果汇总
		ArrayList<String> listBlank = new ArrayList<String>();
		list.add("");
		listTotal.add(listBlank);
		// 其他成员成果a值
		Set<String> members2Id = this.members2.keySet();
		for (String m2Id: members2Id) {
			ArrayList<String> listMembers2 = new ArrayList<String>();
    		String name = this.members2.get(m2Id);
    		listMembers2.add(name);
    		float member2A = 0;
			for (int i = 0; i < 6; i++) {
    			Map<String, Float> mapA = this.membersA.get(i);
    			float a = 0;
    			if (mapA.containsKey(m2Id)) {
        			a = mapA.get(m2Id);
    			}
    			member2A += a;
    			listMembers2.add(String.valueOf(a));
			}
			listMembers2.add("");
			listMembers2.add("");
			listMembers2.add(String.valueOf(member2A));
			listTotal.add(listMembers2);
		}
    	return listTotal;
    }
    public String getSqlAchieve(Map<String, String> cMap, String lab_id, int i){// TODO
    	String date1 = cMap.get("date1");
    	String date2 = cMap.get("date2");
    	String pass = cMap.get("pass");
    	String sqlSelect = "select a.*, t2.name as _type2013, " +
    				"case a.pass when '1' then '通过' when '2' then '未通过' when '3' then '未审核' end as _pass, " +
    				"case a.isAwarded when 't' then '是' when 'f' then '否' end as _isAwarded, " + // TODO
    				"t.name as type_name, ";
	    String sqlFrom = "from " + this.aTable[i-1]+" a, r_user u1,r_user u2, r_type t, r_type t2 ";
    	String sqlWhere = "where a.date_commit>='"+date1+"' and a.date_commit<='"+date2+" 23:59:59' " +
		   				  "and a.type_id=t.id and a.pass in ("+pass+") and t2.id=a.type2013_id " +
		                  "and a.leader_id=u1.id and a.user_id=u2.id and u2.lab_id="+lab_id;
	    switch (i) {
	    	case 1:
	    		sqlSelect += "case t.category when '1' then '期刊' when '2' then '会议' end as category_name, t3.name as area, ";
	    		sqlFrom += ", r_type t3 ";
	    		sqlWhere += " and t3.id=a.area_id";
	    		break;
	    	case 2:
	    		sqlSelect += "case t.category when '1' then '纵向' when '2' then '横向' end as category_name, ";
	    		break;
	    	case 3:
	    		break;
	    	case 4:
	    		break;
	    	case 5:
	    		break;
	    	case 6:
	    		break;
    	}
	    sqlSelect += "u1.name as leader, u2.name as committer "; 
	    String sql = sqlSelect + sqlFrom + sqlWhere;
	    return sql;
    }
    public String getSqlUsers2(String aIds, String lab_id, int i){
    	String sql = "select distinct u.id,u.name,u.lab_id,l.name as lab_name " +
			"from r_lab l, "+this.aTable[i-1]+"_member m, r_user u " +
			"where m.r_id in ("+aIds+") and m.user_id=u.id and u.lab_id=l.id and u.lab_id<>"+lab_id;
	    //System.out.println("!!!::"+sql);
    	return sql;
    }
    public ArrayList<ArrayList<String>> getReportLabAchieve(Map<String, String> cMap, String lab_id, int i) {
        Achievement_javabean ajb = new Achievement_javabean(String.valueOf(i), this.aTable[i-1]);
        Lab_javabean ljb = new Lab_javabean();
    	DB db = new DB();
    	String labName = ljb.getLabNameById(lab_id);
    	String sqlAchieve = this.getSqlAchieve(cMap, lab_id, i);
    	ArrayList<Map<String, String>> listAchieve = db.getRsList(sqlAchieve);
    	listAchieve = ajb.dataAddMembers(listAchieve);
    	// 成果id集合
    	String aIds = "0";
    	for (Map<String, String> map: listAchieve) {
    		aIds += ","+map.get("id");
    	}
    	// 查询不是本实验室且参与到成果中来的用户
    	String sqlUser2 = this.getSqlUsers2(aIds, lab_id, i);
    	ArrayList<Map<String, String>> users2MayRepeat = db.getRsList(sqlUser2);
    	ArrayList<Map<String, String>> users2 = new ArrayList<Map<String, String>>();
    	// 加入不是本实验室的成员，前一个成果里有的重复的不加
    	for (Map<String, String> mapUser2: users2MayRepeat) {
    		String user2Id = mapUser2.get("id");
    		String user2Name = mapUser2.get("name");
			users2.add(mapUser2);
    		if (!this.members2.containsKey(user2Id)) {
    			this.members2.put(user2Id, user2Name);
    		}
    	}
    	// 存放所有用户id
    	ArrayList<String> usersAllId = new ArrayList<String>();
    	ArrayList<String> usersAllName = new ArrayList<String>();
    	for (Map<String, String> u: this.members1) {
    		usersAllId.add(u.get("id"));
    		usersAllName.add(u.get("name"));
    	}
    	for (Map<String, String> u: users2) {
    		usersAllId.add(u.get("id"));
    		usersAllName.add(u.get("name"));
    	}
    	// 所有论文所有用户a值
    	ArrayList<ArrayList<String>> listAllA = this.labReportAddUsersA(listAchieve, usersAllId, i);
    	ArrayList<ArrayList<String>> listContent = this.getLabReportContent(i, usersAllName, listAllA, listAchieve, labName);
    	db.close();
    	return listContent;
    }
    /**
     * 获取成员a值链表，每个成果一个链表，
     * 所有成果构成一个链表，
     * 注意最后一个是加和链表，存每个人的a值和，并多一个总计
     * @param listOri
     * @param users
     * @param table
     * @return
     */
    public ArrayList<ArrayList<String>> labReportAddUsersA(ArrayList<Map<String,String>> listOri, 
    		ArrayList<String> users, int j) {
    	DB db = new DB();
    	//int countA = listOri.size();
    	int countM = users.size();
    	float[] totalM = new float[countM];
    	for (int i = 0; i < countM; i++) {
    		totalM[i] = 0;
    	}
    	ArrayList<Map<String,String>> list = listOri;
    	ArrayList<ArrayList<String>> listAllA = new ArrayList<ArrayList<String>>();
    	for (Map<String,String> map: list) {
    		String id = map.get("id");
    		ArrayList<String> listUsersA = new ArrayList<String>();
    		int i = 0;
    		for (String user_id: users) {
    			String sql = "select count(m.id)as count, sum(a.a_value*m.a_percent/100) as a_a " +
    					"from "+this.aTable[j-1]+" a, "+this.aTable[j-1]+"_member m "+
    					"where m.r_id=a.id and a.id="+id+" and m.user_id="+user_id;
        		Map<String, String> temp = db.getSingleRow(sql);
        	    float a = 0;
        	    if (!temp.get("count").equals("0")) {
        	    	a = Float.parseFloat(temp.get("a_a"));
        	    }
        	    listUsersA.add(String.valueOf(a));
        	    totalM[i++] += a;
    		}
    		listAllA.add(listUsersA);
    	}
    	float total = 0;
		ArrayList<String> listTotalA = new ArrayList<String>();
		Map<String, Float> map = new HashMap<String, Float>();
		for (int i = 0; i < countM; i++) {
			float temp = totalM[i];
			listTotalA.add(String.valueOf(temp));
			total += temp;
			map.put(users.get(i), temp);//汇总表用
		}
		map.put("total", total);// 汇总表用
		this.membersA.add(j-1, map);//汇总表用
		listTotalA.add(String.valueOf(total));
		listAllA.add(listTotalA);
    	return listAllA;
    }
    public ArrayList<ArrayList<String>> getLabReportContent(
    		int i, ArrayList<String> usersName, ArrayList<ArrayList<String>> listAllA, 
    		ArrayList<Map<String, String>> listAchieve, String labName){
    	ArrayList<ArrayList<String>> listContent = new ArrayList<ArrayList<String>>();
    	ArrayList<String> listHead = new ArrayList<String>();
    	int columnText = 0;
    	int columnA = listAllA.get(listAllA.size()-1).size()-1;
    	int row = listAchieve.size();
    	switch(i){
			case 1:
				listHead.add("论文题目");
				listHead.add("期刊/会议");
				listHead.add("期刊/会议名称");
				listHead.add("论文类型");
				listHead.add("发表时间");
				listHead.add("通信作者");
				listHead.add("作者");
				listHead.add("CCF推荐等级"); //TODO
				listHead.add("JCR分区情况"); //TODO
				break;
			case 2:
				listHead.add("项目名称");
				listHead.add("来源");
				listHead.add("计划名称");
				listHead.add("项目时间");
				listHead.add("编号");
				listHead.add("经费");
				listHead.add("组长");
				listHead.add("组员");
				listHead.add("状态");
				listHead.add("项目类型");
				listHead.add("经费卡号"); //TODO
				listHead.add("2013类型"); //TODO
				break;
			case 3:
				listHead.add("著作名称");
				listHead.add("著作类型");
				listHead.add("作者");
				listHead.add("出版社");
				listHead.add("2013类型"); //TODO
				break;
			case 4:
				listHead.add("名称");
				listHead.add("授奖部门");
				listHead.add("获奖类别");
				listHead.add("级别");
				listHead.add("获奖时间");
				listHead.add("获奖人");
				listHead.add("2013类型"); //TODO
				break;
			case 5:
				listHead.add("专利名称");
				listHead.add("类型");
				listHead.add("专利号");
				listHead.add("申请号");
				listHead.add("公开号");
				listHead.add("申请日");
				listHead.add("公开日");
				listHead.add("发明人");
				listHead.add("2013类型"); //TODO
				break;
			case 6:
				listHead.add("软件名称");
				listHead.add("著作权人");
				listHead.add("首次发表时间");
				listHead.add("授权日");
				listHead.add("登记号");
				listHead.add("2013类型"); //TODO
				break;
    	}
		listHead.add("所属实验室");
		listHead.add("审核状态");
		listHead.add("已奖励"); //TODO
		listHead.add("链接"); //TODO
		listHead.add("备注"); //TODO
		columnText = listHead.size();
		listHead.add("A值");
    	for (String name: usersName) {
    		listHead.add(name);
    	}
    	listContent.add(listHead);
    	
    	int countAchieve = listAchieve.size();

    	switch(i){
			case 1:
				for (int n = 0; n < countAchieve; n++) {
			    	ArrayList<String> list = new ArrayList<String>();
			    	Map<String, String> map = listAchieve.get(n);
			    	list.add(map.get("title"));
			    	list.add(map.get("category_name"));
			    	list.add(map.get("publication"));
			    	list.add(map.get("type_name"));
			    	list.add(map.get("date_publish"));
			    	list.add(map.get("leader"));
			    	list.add(map.get("members"));
			    	list.add(map.get("_type2013")); //TODO
			    	list.add(map.get("area")); //TODO
			    	list.add(labName);
			    	list.add(map.get("_pass"));
			    	list.add(map.get("_isAwarded")); //TODO
			    	list.add(map.get("link")); //TODO
			    	list.add(map.get("remark")); //TODO
			    	list.add(map.get("a_value"));
			    	ArrayList<String> membersA = listAllA.get(n);
			    	for (String a: membersA) {
			    		list.add(a);
			    	}
			    	listContent.add(list);
				}
				break;
			case 2:
				for (int n = 0; n < countAchieve; n++) {
			    	ArrayList<String> list = new ArrayList<String>();
			    	Map<String, String> map = listAchieve.get(n);
			    	list.add(map.get("title"));
			    	list.add(map.get("source"));
			    	list.add(map.get("plan"));
			    	list.add(map.get("date1")+"至"+map.get("date2"));
			    	list.add(map.get("number"));
			    	list.add(map.get("cost"));
			    	list.add(map.get("leader"));
			    	list.add(map.get("members"));
			    	list.add(map.get("status"));
			    	list.add(map.get("type_name"));
			    	list.add(map.get("card")); //TODO
			    	list.add(map.get("_type2013")); //TODO
			    	list.add(labName);
			    	list.add(map.get("_pass"));
			    	list.add(map.get("_isAwarded")); //TODO
			    	list.add(map.get("link")); //TODO
			    	list.add(map.get("remark")); //TODO
			    	list.add(map.get("a_value"));
			    	ArrayList<String> membersA = listAllA.get(n);
			    	for (String a: membersA) {
			    		list.add(a);
			    	}
			    	listContent.add(list);
				}
				break;
			case 3:
				for (int n = 0; n < countAchieve; n++) {
			    	ArrayList<String> list = new ArrayList<String>();
			    	Map<String, String> map = listAchieve.get(n);
			    	list.add(map.get("title"));
			    	list.add(map.get("type_name"));
			    	list.add(map.get("members"));
			    	list.add(map.get("press"));;
			    	list.add(map.get("_type2013")); //TODO
			    	list.add(labName);
			    	list.add(map.get("_pass"));
			    	list.add(map.get("_isAwarded")); //TODO
			    	list.add(map.get("link")); //TODO
			    	list.add(map.get("remark")); //TODO
			    	list.add(map.get("a_value"));
			    	ArrayList<String> membersA = listAllA.get(n);
			    	for (String a: membersA) {
			    		list.add(a);
			    	}
			    	listContent.add(list);
				}
				break;
			case 4:
				for (int n = 0; n < countAchieve; n++) {
			    	ArrayList<String> list = new ArrayList<String>();
			    	Map<String, String> map = listAchieve.get(n);
			    	list.add(map.get("title"));
			    	list.add(map.get("department"));
			    	list.add(map.get("type_name"));
			    	list.add(map.get("level"));
			    	list.add(map.get("date"));
			    	list.add(map.get("members"));
			    	list.add(map.get("_type2013")); //TODO
			    	list.add(labName);
			    	list.add(map.get("_pass"));
			    	list.add(map.get("_isAwarded")); //TODO
			    	list.add(map.get("link")); //TODO
			    	list.add(map.get("remark")); //TODO
			    	list.add(map.get("a_value"));
			    	ArrayList<String> membersA = listAllA.get(n);
			    	for (String a: membersA) {
			    		list.add(a);
			    	}
			    	listContent.add(list);
				}
				break;
			case 5:
				for (int n = 0; n < countAchieve; n++) {
			    	ArrayList<String> list = new ArrayList<String>();
			    	Map<String, String> map = listAchieve.get(n);
			    	list.add(map.get("title"));
			    	list.add(map.get("type_name"));
			    	list.add(map.get("number"));
			    	list.add(map.get("number_apply"));
			    	list.add(map.get("number_public"));
			    	list.add(map.get("date_apply"));
			    	list.add(map.get("date_public"));
			    	list.add(map.get("members"));
			    	list.add(map.get("_type2013")); //TODO
			    	list.add(labName);
			    	list.add(map.get("_pass"));
			    	list.add(map.get("_isAwarded")); //TODO
			    	list.add(map.get("link")); //TODO
			    	list.add(map.get("remark")); //TODO
			    	list.add(map.get("a_value"));
			    	ArrayList<String> membersA = listAllA.get(n);
			    	for (String a: membersA) {
			    		list.add(a);
			    	}
			    	listContent.add(list);
				}
				break;
			case 6:
				for (int n = 0; n < countAchieve; n++) {
			    	ArrayList<String> list = new ArrayList<String>();
			    	Map<String, String> map = listAchieve.get(n);
			    	list.add(map.get("title"));
			    	list.add(map.get("members"));
			    	list.add(map.get("date_publish"));
			    	list.add(map.get("date_authorized"));
			    	list.add(map.get("number"));
			    	list.add(map.get("_type2013")); //TODO
			    	list.add(labName);
			    	list.add(map.get("_pass"));
			    	list.add(map.get("_isAwarded")); //TODO
			    	list.add(map.get("link")); //TODO
			    	list.add(map.get("remark")); //TODO
			    	list.add(map.get("a_value"));
			    	ArrayList<String> membersA = listAllA.get(n);
			    	for (String a: membersA) {
			    		list.add(a);
			    	}
			    	listContent.add(list);
				}
				break;
    	}
    	ArrayList<String> total = new ArrayList<String>();
		for (int k = 0; k < columnText; k++) {
			total.add("");
		}
		ArrayList<String> listTotalA = listAllA.get(row);
		total.add(listTotalA.get(columnA));
		for (int j = 0; j < columnA; j++) {
			total.add(listTotalA.get(j));
		}
		listContent.add(total);
    	return listContent;
    }
}
