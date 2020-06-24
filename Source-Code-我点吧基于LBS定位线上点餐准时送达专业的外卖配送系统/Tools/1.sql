Use wodian8

DECLARE @UserId varchar(50)
DECLARE My_Cursor CURSOR --定义游标  
FOR (select UserID from ZL_User_PView where Puser>=7) --查出需要的集合放到游标中  
OPEN My_Cursor; --打开游标  
FETCH NEXT FROM My_Cursor INTO @UserId; --读取第一行数据(将MemberAccount表中的UserId放到@UserId变量中) 

WHILE @@FETCH_STATUS = 0  
    BEGIN  
        PRINT @UserId; --打印数据(打印MemberAccount表中的UserId) 
        
        Update ZL_User set GroupID=6 where UserID=@UserId
		
        FETCH NEXT FROM My_Cursor INTO @UserId; --读取下一行数据(将MemberAccount表中的UserId放到@UserId变量中)  
    END  
CLOSE My_Cursor; --关闭游标  
DEALLOCATE My_Cursor; --释放游标  
GO