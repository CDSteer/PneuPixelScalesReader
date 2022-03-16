import java.sql.Timestamp;
import java.util.Random;

public class Session {
  public static final int MAX_REVERSALS = 10;
  public static final int MAX_TRAILS = 40;
  private static final int NUM_PROTOTYPES = 2;
  private static final int INCRIMENT = 300;

  private Random rand = new Random();

  private String pNum;
  private int startValue;
  private int endValue;
  private int currentValue;
  private int pressureLvl;

  private Table table;
  private String tableName;

  private String prototypeName;


  public Session(String _pNum, int _startValue, int _endValue, String _prototypeName, int _pressureLvl){
     this.pNum = _pNum;
     this.startValue = _startValue;
     this.endValue = _endValue;
     this.currentValue = _startValue;
     this.prototypeName = _prototypeName;
     this.pressureLvl = _pressureLvl;

    table = new Table();
    tableName = String.valueOf(year())+String.valueOf(month())+String.valueOf((day()))+String.valueOf((hour()))+String.valueOf((minute()))+String.valueOf((second()))+"_"+ this.prototypeName +"_"+ this.pNum + "_" + this.startValue + "_" + this.endValue;
    System.out.println(tableName);
    table.addColumn("id");
    table.addColumn("timestamp");
    table.addColumn("scale_value");
  }


  public void addToCSV(int _scale){
    TableRow newRow = table.addRow();
    newRow.setInt("id", table.getRowCount() - 1);
    Timestamp timestamp = new Timestamp(System.currentTimeMillis());
    newRow.setString("timestamp", String.valueOf(timestamp));
    newRow.setString("scale_value", String.valueOf(_scale));
    saveTable(table, "data/"+pressureLvl+"/"+pNum+"/"+tableName+".csv");
     System.out.println("Data Saved");
  }

  public int getStartValue(){
    return this.startValue;
  }
  public int getEndValue(){
    return this.endValue;
  }
  public int getCurrentValue(){
    return this.currentValue;
  }

  public void changeCurrentValue(){
    this.currentValue = this.currentValue-INCRIMENT;
  }

  public void minuschangeCurrentValue(){
    this.currentValue = this.currentValue-INCRIMENT;
  }

  public void plusCurrentValue(){
    this.currentValue = this.currentValue+INCRIMENT;
  }

  private float calculateNewtowns(){
    float newtons = 0;
    return newtons;
  }

}
