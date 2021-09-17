package vn.t3h.services;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;

import vn.t3h.data.TinhToan;
import vn.t3h.threads.WorkerThreads;

@Service
public class HomeService {
	private String fixStr = "Hello Spring Spring .!";
	
	public String hello() {
		return fixStr;
	}
}
