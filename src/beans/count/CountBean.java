package beans.count;

public class CountBean {
	//property
	private int count; //input name과 같게 주는 것이 편리
	
	public CountBean() {
		System.out.println("CountBean() 생성..");
	}
	
	public void setCount(int val) {
		count+=val;
		System.out.println("setCount() 호출..");
	}
	
	public int getCount() {
		return count;
	}
	
	
}
