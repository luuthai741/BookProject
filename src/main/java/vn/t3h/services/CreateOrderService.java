package vn.t3h.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.t3h.dao.CustomerOrderDao;
import vn.t3h.dao.CustomerOrderDetailDao;
import vn.t3h.data.CartInfo;
import vn.t3h.data.Customer;
import vn.t3h.model.CustomerOrder;
import vn.t3h.model.CustomerOrderDetail;

@Service
@Transactional
public class CreateOrderService {
	
	@Autowired private CustomerOrderDao customerOrderDao;
	@Autowired private CustomerOrderDetailDao customerOrderDetailDao;
	
	public boolean createOrder(Customer customer, List<CartInfo> items) {
		try {
			var customerOrder = CustomerOrder.builder()
					.phone(customer.getPhone())
					.email(customer.getEmail())
					.customerName(customer.getCustomerName())
					.address(customer.getAddress()).build();
			customerOrderDao.create(customerOrder);
			
			int subTotal = 0;
			for(CartInfo cardInfo : items) {
				var customerOrderDetail = CustomerOrderDetail.builder()
					.productId(cardInfo.getProductId())
					.productName(cardInfo.getName())
					.orderId(customerOrder.getId())
					.price(cardInfo.getPrice())
					.quality(cardInfo.getQuality())
					.total(cardInfo.getPrice() * cardInfo.getQuality()).build();
				subTotal +=  customerOrderDetail.getTotal();
				customerOrderDetailDao.create(customerOrderDetail);
			};
			customerOrder.setSubtotal(subTotal);
			customerOrder.setShippingCost(10000);
			customerOrder.setTotal(customerOrder.getSubtotal() + customerOrder.getShippingCost());
			
			customerOrderDao.update(customerOrder);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
