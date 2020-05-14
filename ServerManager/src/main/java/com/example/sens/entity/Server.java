package com.example.sens.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * <pre>
 *     服务器信息
 * </pre>
 *
 */
@Data
@TableName("server")
public class Server implements Serializable {

    private static final long serialVersionUID = -5144055068797033748L;

    /**
     * ID
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 使用人
     */
    private String applyUserName;


    /**
     * 服务器名称
     */
    private String serverName;

    /**
     * 服务器状态
     */
    private String serverStatus;

    /**
     * 申请时间
     */
    private Long applyTime;

    /**
     * 释放时间
     */
    private Long releaseTime;

    /**
     * 项目名称
     */
    private String projectName;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getApplyUserName() {
        return applyUserName;
    }

    public void setApplyUserName(String applyUserName) {
        this.applyUserName = applyUserName;
    }

    public String getServerName() {
        return serverName;
    }

    public void setServerName(String serverName) {
        this.serverName = serverName;
    }

    public String getServerStatus() {
        return serverStatus;
    }

    public void setServerStatus(String serverStatus) {
        this.serverStatus = serverStatus;
    }

    public Long getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(Long applyTime) {
        this.applyTime = applyTime;
    }

    public Long getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(Long releaseTime) {
        this.releaseTime = releaseTime;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    @Override
    public String toString() {
        return "Server{" +
                "id=" + id +
                ", applyUserName='" + applyUserName + '\'' +
                ", serverName='" + serverName + '\'' +
                ", serverStatus='" + serverStatus + '\'' +
                ", applyTime=" + applyTime +
                ", releaseTime=" + releaseTime +
                ", projectName='" + projectName + '\'' +
                '}';
    }
}
