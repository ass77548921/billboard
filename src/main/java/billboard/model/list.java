package billboard.model;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;







@Entity
@Table(name = "list")
public class list {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;
	
	@Column(name="title")
	private String title;
	
	@Column(name="publisher")
	private String publisher;
	
	@Column(name="context")
	private String context;
	
	@Column(name="url")
	private String url;
	
	@Column(name="publishdate")
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	private LocalDateTime  publishdate;
	
	@Column(name="enddate")
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
	private LocalDateTime  enddate;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}
	
	public String getPublishdate() {
		
		
		return publishdate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}

	public void setPublishdate(LocalDateTime  publishdate) {
		this.publishdate = publishdate;
	}
	
	
	
	public String getEnddate() {
		
		
		return enddate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}

	public void setEnddate(LocalDateTime  enddate) {
		this.enddate = enddate;
	}

	
	

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "list [id=" + id + ", title=" + title + ", publisher=" + publisher + ", context=" + context
				+ ", publishdate=" + publishdate + ", enddate=" + enddate + "]";
	}

	
	
	
	
	
	
	

}
