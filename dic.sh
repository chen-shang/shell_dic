#!/bin/bash
p=$*
if [ $# = 1 ] && [ $p = '?' ] || [ $p = '?' ]; then
  echo "sh dic.sh {需要翻译的单词或句子}" 
  exit
 elif [ $# = 0 ]; then
  exit
fi
echo '>>>>>>>>>' ${p} '<<<<<<<<<'
# 转换成 url 编码，主要针对汉字进行
# query=`echo $p | tr -d '\n' | xxd -plain | sed 's/\(..\)/%\1/g'`

history=`cat ~/.dichistory |grep -i "$p===>"| awk -F "===>" '{print $2}'`

function search(){
  if [ "$code" = "20" ];then 
    echo '要翻译的文本过长'
    exit
  elif [ "$code" = "30" ];then
    echo '无法进行有效的翻译'
    exit
  elif [ "$code" = "40" ];then
    echo '不支持的语言类型'
    exit
  elif [ "$code" = "50" ];then
    echo '无效的key'
    exit
  elif [ "$code" = "60" ];then
    echo '无词典结果，仅在获取词典结果生效'
    exit
  else
    explains=`echo $result | jq '.basic|.explains'`
    if [ "$explains" != "null" ];then
       `say $p`
       echo $explains | jq .
    else
      echo $result | jq '.translation'
    fi
  fi
}

if [ x"$history" = 'x' ];then
  result=`curl http://fanyi.youdao.com/openapi.do?keyfrom=macSay\&key=1081776100\&type=data\&doctype=json\&version=1.1 --data-urlencode q="$p"`
  code=`echo $result | jq '.errorCode'`
  search
  if [ "$code" = "0" ];then
    # 记录查询历史
    now=`date "+%Y-%m-%d %H:%M:%S"`
    `echo $now"===$p===>"$result >> ~/.dichistory`
  fi
else
  result=$history 
  code=`echo $result | jq '.errorCode'`
  search
fi
