package bitcamp.java93.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bitcamp.java93.dao.UsermealDao;
import bitcamp.java93.domain.Usermeal;
import bitcamp.java93.domain.usermealList;
import bitcamp.java93.service.UsermealService;

@Service
public class UsermealServiceImpl implements UsermealService {
  @Autowired
  UsermealDao usermealDao;
  
  public List<Usermeal> list(String startDate, String endDate, int trainingNo) throws Exception {
    HashMap<String,Object> valueMap = new HashMap<>();
    valueMap.put("startDate", startDate);
    valueMap.put("endDate", endDate);
    valueMap.put("trainingNo", trainingNo);
    
    return usermealDao.selectWeeklist(valueMap);
  }
  
  public usermealList getName(int trainingNo) throws Exception {
    return usermealDao.selectPromotionUsername(trainingNo);
  }

  public void add(Usermeal usermeal) throws Exception {
    usermealDao.insert(usermeal);
  }

  @Override
  public void update(Usermeal usermeal) throws Exception {
    usermealDao.update(usermeal);
  }
  
  @Override
  public void nopicUpdate(Usermeal usermeal) throws Exception {
    usermealDao.nopicUpdate(usermeal);
  }
  
  @Override
  public void confirm(int mealno) throws Exception {
    usermealDao.confirm(mealno);
  }
  
  public void remove(int mealno) throws Exception {
    int count = usermealDao.delete(mealno);
    if (count < 1) {
      throw new Exception(mealno + "번 식단을 찾을 수 없습니다.");
    }

    try {
      count = usermealDao.delete(mealno);
    } catch(Exception e) {}
  }

  @Override
  public List<Usermeal> traingList(int no) throws Exception {
    return usermealDao.trainingList(no);
  }
  
  @Override
  public List<Usermeal> usersList(int no) throws Exception {
    return usermealDao.usersList(no);
  }


  
}
