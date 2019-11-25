use vk;

/*
����� ����� ��������� ������������. �� ���� ������ ����� ������������ ������� ��������, ������� ������ 
���� ������� � ����� �������������.
 */

select max(from_user_id)
	from messages
		where to_user_id = 6;
		
/*
���������� ����� ���������� ������, ������� �������� ������������ ������ 10 ���.
*/ 	

SELECT 
	user_id,
	COUNT(*) 
FROM likes 
WHERE media_id IN (
  SELECT user_id FROM profiles WHERE birthday > (select DATE_SUB(curdate(),INTERVAL 10 year))
)
GROUP BY media_id;

/*
���������� ��� ������ �������� ������ (�����) - ������� ��� �������?
*/

select count(media_id)
from likes
where user_id in (
	select user_id from profiles where gender = 'f'
);

select count(user_id)
from likes
where user_id in (
	select user_id from profiles where gender = 'm'
);

-- �� ���� ����������� ��� ���������� ��� 2 �������, �� ����������� ������ ���������� ������ ������ � ������