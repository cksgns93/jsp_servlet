package beans.count;

public class CountBean {
	//property
	private int count; //input name�� ���� �ִ� ���� ��
	
	public CountBean() {
		System.out.println("CountBean() ����..");
	}
	
	public void setCount(int val) {
		count+=val;
		System.out.println("setCount() ȣ��..");
	}
	
	public int getCount() {
		return count;
	}
	
	
}
