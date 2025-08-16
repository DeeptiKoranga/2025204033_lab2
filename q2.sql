use assignment1;

delimiter //
create procedure GetWatchHistoryBySubscriber(in sub_id int)
begin
	select sub.SubscriberName, s.Title as ShowTitle, w.WatchTime -- getting subcriber name, show title, watch time from tables subscribers, shows, watchhistory.
    from WatchHistory w
    join Shows s 
        on s.ShowID = w.ShowID
    join Subscribers sub 
        on sub.SubscriberID = w.SubscriberID
    where w.SubscriberID = sub_id;
end //
delimiter ;

call GetWatchHistoryBySubscriber(2); -- test case , calling sub_id = 2
