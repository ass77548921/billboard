package billboard.model;

import java.util.Date;

import jakarta.persistence.*;





@Entity
@Table(name = "list")
public class list {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	
	@Column(name="title")
	private String title;
	
	@Column(name="publisher")
	private String publisher;
	
	@Column(name="context")
	private String context;
	
	@Column(name="publishdate")
	private Date publishdate;
	
	@Column(name="enddate")
	private Date enddate;

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

	public Date getPublishdate() {
		return publishdate;
	}

	public void setPublishdate(Date publishdate) {
		this.publishdate = publishdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	@Override
	public String toString() {
		return "list [id=" + id + ", title=" + title + ", publisher=" + publisher + ", context=" + context
				+ ", publishdate=" + publishdate + ", enddate=" + enddate + "]";
	}
	
	
	
	
	
	

}
