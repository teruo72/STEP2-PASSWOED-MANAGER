#!/bin/bash

echo "パスワードマネージャーへようこそ！"

i=1

while [ "$i" -le 1 ]

do
	echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
	read answer
	
	if [ "$answer" = "Add Password" ]; then
		echo サービス名を入力してください：
		read service
		
		echo ユーザー名を入力してください：
		read user
		
		echo パスワードを入力してください：
		read password
		
		echo -e "サービス名:$service""\n""ユーザー名:$user""\n""パスワード:$password" >> data.csv
		echo "パスワードの追加は成功しました。"

	elif [ "$answer" = "Get Password" ]; then
		echo サービス名を入力してください：
		read service
		
		grep -q $service data.csv
		if [ $? -eq 0 ]; then
			grep -A 3 $service data.csv
		else	
			echo そのサービスは登録されていません。
		fi

	elif [ "$answer" = "Exit" ]; then
		i=$((i + 1))
	else
		echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
	fi

done

echo Thank you!

