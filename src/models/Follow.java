package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="follows")

public class Follow {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;

    @Column(name="follow_id",nullable=false)
    private Integer follow_id;

    @Column(name="followed_id",nullable=false)
    private Integer followed_id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFollow_id() {
        return follow_id;
    }

    public void setFollow_id(Integer follow_id) {
        this.follow_id = follow_id;
    }

    public Integer getFollowed_id() {
        return followed_id;
    }

    public void setFollowed_id(Integer followed_id) {
        this.followed_id = followed_id;
    }



}
