package vo;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ProductVO {
	String product_key,category_key,isnew,isrecommend,prod_name,prod_desc1,prod_desc2,ori_price,cell_price,img_url,stock,factory,season,material,alt_text,create_dtm,like_qty,view_qty,del;

	@JsonManagedReference
	List<OptionVO> option_list;


	CategoryVO cvo;



	public CategoryVO getCvo() {
		return cvo;
	}

	public void setCvo(CategoryVO cvo) {
		this.cvo = cvo;
	}

	public String getProduct_key() {
		return product_key;
	}

	public void setProduct_key(String product_key) {
		this.product_key = product_key;
	}

	public String getCategory_key() {
		return category_key;
	}

	public void setCategory_key(String category_key) {
		this.category_key = category_key;
	}

	public String getIsnew() {
		return isnew;
	}

	public void setIsnew(String isnew) {
		this.isnew = isnew;
	}

	public String getIsrecommend() {
		return isrecommend;
	}

	public void setIsrecommend(String isrecommend) {
		this.isrecommend = isrecommend;
	}

	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public String getProd_desc1() {
		return prod_desc1;
	}

	public void setProd_desc1(String prod_desc1) {
		this.prod_desc1 = prod_desc1;
	}

	public String getProd_desc2() {
		return prod_desc2;
	}

	public void setProd_desc2(String prod_desc2) {
		this.prod_desc2 = prod_desc2;
	}

	public String getOri_price() {
		return ori_price;
	}

	public void setOri_price(String ori_price) {
		this.ori_price = ori_price;
	}

	public String getCell_price() {
		return cell_price;
	}

	public void setCell_price(String cell_price) {
		this.cell_price = cell_price;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
	}

	public String getFactory() {
		return factory;
	}

	public void setFactory(String factory) {
		this.factory = factory;
	}

	public String getSeason() {
		return season;
	}

	public void setSeason(String season) {
		this.season = season;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getAlt_text() {
		return alt_text;
	}

	public void setAlt_text(String alt_text) {
		this.alt_text = alt_text;
	}

	public String getCreate_dtm() {
		return create_dtm;
	}

	public void setCreate_dtm(String create_dtm) {
		this.create_dtm = create_dtm;
	}

	public String getLike_qty() {
		return like_qty;
	}

	public void setLike_qty(String like_qty) {
		this.like_qty = like_qty;
	}

	public String getView_qty() {
		return view_qty;
	}

	public void setView_qty(String view_qty) {
		this.view_qty = view_qty;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	// JSON 변환 메서드 추가
    public String getOptionListJson() {
        ObjectMapper mapper = new ObjectMapper();
        try {
            return mapper.writeValueAsString(option_list);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return "[]"; // 오류 발생 시 빈 JSON 배열 반환
        }
    }
    
    public List<OptionVO> getOption_list() {
        return option_list;
    }

    public void setOption_list(List<OptionVO> option_list) {
        this.option_list = option_list;
    }

}
