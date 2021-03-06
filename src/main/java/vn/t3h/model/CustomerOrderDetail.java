
package vn.t3h.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Table(name = "customer_order_detail")
@Entity
@NoArgsConstructor @AllArgsConstructor
@Setter @Getter
@Builder
public class CustomerOrderDetail implements Serializable {

	private static final long serialVersionUID = 4641853311314844969L;
	public static Integer STATUS_ACTICE = 1;
	public static Integer STATUS_DEACTICE = 0;
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "detail_id", unique = true, nullable = false)
    private Integer id;
	
	@Column(name="order_id")
	private Integer orderId;
	
	@NotEmpty(message="Tên bài viết không được để trống")
	@Column(name="product_name")
	private String productName;
	
	@Column(name="product_id")
	private Integer productId;
	
	@Column(name="price")
	private Integer price;
	
	@Column(name="quality")
	private Integer quality;
	
	@Column(name="total")
	private Integer total;
	
	@CreationTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss")
	@Column(name="create_time")
	private Date createTime;
}
