package com.chinasofti.service.area;

import com.chinasofti.model.DataTables;
import com.chinasofti.model.area.Position;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface PositionService {
    DataTables DataTables(Position position);


    int add(Position position, HttpSession session);

    Position query(Integer id);

    int edit(Position position, HttpSession session);

    int remove(Integer id);

    List<Position> queryPosition(String deptid);
}
