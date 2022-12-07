package Model;

public class RootModel {
private   String name;
   String type;
   String cat;
   String man;
   int qty;
   int id;
public String getName() {
	return name;
}
public String getType() {
	return type;
}
public String getCat() {
	return cat;
}
public String getMan() {
	return man;
}
public int getQty() {
	return qty;
}
public int getId() {
	return id;
}
public void setName(String name) {
	this.name = name;
}
public void setType(String type) {
	this.type = type;
}
public void setCat(String cat) {
	this.cat = cat;
}
public void setMan(String man) {
	this.man = man;
}
public void setQty(int qty) {
	this.qty = qty;
}
public void setId(int id) {
	this.id = id;
}
public RootModel(String name, String type, String cat, String man,int qty,int id) {
	
	this.name = name;
	this.type = type;
	this.cat = cat;
	this.man = man;
	this.qty=qty;
	this.id=id;
}
}
