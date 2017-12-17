package xin.hxbreak.util;

import javafx.scene.chart.PieChart;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatUtil {

    public static String getDateFormat(){
        return setDateFormat("yyyy-MM-dd");
    }

    public static String setDateFormat(String template){
        Date date = new Date();
        return setSimpleDateFormat(date,template);
    }
    public static String setSimpleDateFormat (Date date,String template){
        SimpleDateFormat sdf = new SimpleDateFormat(template);
        return sdf.format(date);
    }
}
