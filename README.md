# dic
a dictionary tool in shell 

该脚本是一个可以在终端使用的翻译[英->汉,汉->英]脚本,借用 [有道词典的公共接口](http://fanyi.youdao.com/openapi?path=data-mode) 来进行查询

可以设置别名 `alias dic='sh /script/dic.sh'` 以后就可以用 `dic` 这个命令来调用了

# 示例

```bash
Last login: Sat Jan  7 21:25:23 on ttys001
chenshang@bogon:~$ sh /script/dic.sh a
>>>>>>>>> a <<<<<<<<<
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   448    0   445    0     3     67      0 --:--:--  0:00:06 --:--:--   110
[
  "n. 字母A；第一流的；学业成绩达最高标准的评价符号",
  "abbr. [物]安（ampere）"
]
chenshang@bogon:~$ sh /script/dic.sh i am a boy
>>>>>>>>> i am a boy <<<<<<<<<
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   342    0   324  100    18  10182    565 --:--:-- --:--:-- --:--:-- 10451
[
  "我是一个男孩"
]
chenshang@bogon:~$
chenshang@bogon:~$ dic ?
sh dic.sh {需要翻译的单词或句子}
chenshang@bogon:~$
```
