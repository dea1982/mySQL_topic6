use vk;

/*
Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше 
всех общался с нашим пользователем.
 */

select max(from_user_id)
	from messages
		where to_user_id = 6;
		
/*
Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
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
Определить кто больше поставил лайков (всего) - мужчины или женщины?
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

-- Не смог разобраться как объединить эти 2 запроса, по отдельности считаю количество лайков мужчин и женщин