package dao;

import Utils.BookStatusInTable;
import Utils.returnObj;
import db.DBUtil;
import global.BookStatus;
import model.BookRecord;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookRecordDao {
    public static List<BookRecord> getAllRecord() throws Exception{
        Connection cn = DBUtil.getConnection();
        PreparedStatement ptmt = cn.prepareStatement("SELECT * FROM tieyif4_book_record");
        ResultSet rs = ptmt.executeQuery();
        List<BookRecord> res = new ArrayList<>();
        while (rs.next()) {
            BookRecord bookRecord = new BookRecord();
            bookRecord.setRid(rs.getInt("rid"));
            bookRecord.setUid(rs.getInt("uid"));
            bookRecord.setCreateTime(rs.getString("createtime"));
            bookRecord.setBid(rs.getInt("bid"));
            bookRecord.setOwnerid(rs.getInt("ownerid"));
            bookRecord.setStataus(rs.getInt("status"));
            res.add(bookRecord);
        }
        return res;
    }

    public static BookRecord getRecordByRid(int rid) throws Exception{
        Connection cn = DBUtil.getConnection();
        PreparedStatement ptmt = cn.prepareStatement("SELECT * FROM tieyif4_book_record WHERE `rid` = " + rid);
        ResultSet rs = ptmt.executeQuery();
        BookRecord bookRecord = new BookRecord();
        while (rs.next()) {

            bookRecord.setRid(rs.getInt("rid"));
            bookRecord.setUid(rs.getInt("uid"));
            bookRecord.setCreateTime(rs.getString("createtime"));
            bookRecord.setBid(rs.getInt("bid"));
            bookRecord.setOwnerid(rs.getInt("ownerid"));
            bookRecord.setStataus(rs.getInt("status"));
            bookRecord.setLeft(rs.getString("left"));

        }
        return bookRecord;
    }

    public static List<BookRecord> getRecordByUid(int userId) throws Exception {
        Connection cn = DBUtil.getConnection();
        PreparedStatement ptmt = cn.prepareStatement("SELECT * FROM tieyif4_book_record WHERE `uid` = " + userId);
        ResultSet rs = ptmt.executeQuery();
        List<BookRecord> res = new ArrayList<>();
        while (rs.next()) {
            BookRecord bookRecord = new BookRecord();
            bookRecord.setRid(rs.getInt("rid"));
            bookRecord.setUid(rs.getInt("uid"));
            bookRecord.setCreateTime(rs.getString("createtime"));
            bookRecord.setBid(rs.getInt("bid"));
            bookRecord.setOwnerid(rs.getInt("ownerid"));
            bookRecord.setStataus(rs.getInt("status"));

            res.add(bookRecord);
        }
        return res;
    }

    public static List<BookRecord> getRecordByOwnerid(int userId) throws Exception {
        Connection cn = DBUtil.getConnection();
        PreparedStatement ptmt = cn.prepareStatement("SELECT * FROM tieyif4_book_record WHERE `ownerid` = " + userId);
        ResultSet rs = ptmt.executeQuery();
        List<BookRecord> res = new ArrayList<>();
        while (rs.next()) {
            BookRecord bookRecord = new BookRecord();
            bookRecord.setRid(rs.getInt("rid"));
            bookRecord.setUid(rs.getInt("uid"));
            bookRecord.setCreateTime(rs.getString("createtime"));
            bookRecord.setBid(rs.getInt("bid"));
            bookRecord.setOwnerid(rs.getInt("ownerid"));
            bookRecord.setStataus(rs.getInt("status"));

            res.add(bookRecord);
        }
        return res;
    }

    public static List<BookRecord> getOwnerRecordByStatus(int userId, BookStatus bookStatus) throws Exception {
        Connection cn = DBUtil.getConnection();
        PreparedStatement ptmt = cn.prepareStatement("SELECT * FROM tieyif4_book_record WHERE `ownerid`=? AND `status`=?");
        ptmt.setInt(1, userId);
        ptmt.setInt(2, BookStatusInTable.getIntForBookStatus(bookStatus));
        ResultSet rs = ptmt.executeQuery();
        List<BookRecord> res = new ArrayList<>();
        while (rs.next()) {
            BookRecord bookRecord = new BookRecord();
            bookRecord.setRid(rs.getInt("rid"));
            bookRecord.setUid(rs.getInt("uid"));
            bookRecord.setCreateTime(rs.getString("createtime"));
            bookRecord.setBid(rs.getInt("bid"));
            bookRecord.setOwnerid(rs.getInt("ownerid"));
            bookRecord.setStataus(rs.getInt("status"));

            res.add(bookRecord);
        }
        return res;
    }

    // 我们用uid为0来表示上传
    public static List<BookRecord> getAllUploadRecords(int ownerid) throws Exception{
        Connection cn = DBUtil.getConnection();
        PreparedStatement ptmt = cn.prepareStatement("SELECT * FROM tieyif4_book_record WHERE `ownerid`=? AND `uid`=0");
        ptmt.setInt(1, ownerid);
        ResultSet rs = ptmt.executeQuery();
        List<BookRecord> res = new ArrayList<>();
        while (rs.next()) {
            BookRecord bookRecord = new BookRecord();
            bookRecord.setRid(rs.getInt("rid"));
            bookRecord.setUid(rs.getInt("uid"));
            bookRecord.setCreateTime(rs.getString("createtime"));
            bookRecord.setBid(rs.getInt("bid"));
            bookRecord.setOwnerid(rs.getInt("ownerid"));
            bookRecord.setStataus(rs.getInt("status"));

            res.add(bookRecord);
        }
        return res;
    }

    public static String getRecordCreateTimeByCondition(int userId, int ownerId, BookStatus bookStatus) throws Exception{
        Connection cn = DBUtil.getConnection();
        ResultSet rs;
        if(userId != 0) {
            PreparedStatement ptmt = cn.prepareStatement("SELECT * FROM tieyif4_book_record WHERE `uid`=? AND `status`=?");
            ptmt.setInt(1, userId);
            ptmt.setInt(2, BookStatusInTable.getIntForBookStatus(bookStatus));
            rs = ptmt.executeQuery();
        } else {
            PreparedStatement ptmt = cn.prepareStatement("SELECT * FROM tieyif4_book_record WHERE `uid`=? AND `status`=?");
            ptmt.setInt(1, ownerId);
            ptmt.setInt(2, BookStatusInTable.getIntForBookStatus(bookStatus));
            rs = ptmt.executeQuery();
        }
//        List<BookRecord> res = new ArrayList<>();
        while (rs.next()) {
//            BookRecord bookRecord = new BookRecord();
//            bookRecord.setRid(rs.getInt("rid"));
//            bookRecord.setUid(rs.getInt("uid"));
            return rs.getString("createtime");
//            bookRecord.setBid(rs.getInt("bid"));
//            bookRecord.setOwnerid(rs.getInt("ownerid"));
//            bookRecord.setStataus(rs.getInt("status"));

//            res.add(bookRecord);
        }
//        return res;
        return "";
    }

    public static returnObj insertRecord(BookRecord record){
        returnObj res = new returnObj();
        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ptmt = conn.prepareStatement("INSERT INTO tieyif4_book_record (uid,createtime,bid,ownerid,status,`left`) VALUES (?,?,?,?,?,?)");
            ptmt.setInt(1,record.getUid());
            ptmt.setString(2,record.getCreateTime());
            ptmt.setInt(3,record.getBid());
            ptmt.setInt(4,record.getOwnerid());
            ptmt.setInt(5,BookStatusInTable.getIntForBookStatus(BookStatus.REQUESTING));
            ptmt.setString(6,record.getLeft());
            System.out.println(record.getUid());
            System.out.println(record.getBid());
            System.out.println(record.getOwnerid());
            ptmt.execute();
            res.setStatus(true);
            return res;
        }catch (Exception E){
            res.setMsg(E.getMessage());
            return res;
        }
    }
}
