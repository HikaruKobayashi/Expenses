# Money Hub
Money Hubはお金の出し入れをよりシンプルに見える化する家計簿アプリです。

## 機能と特徴
- 日々のお金の出し入れを収入、貯金、固定費、変動費の4つに細分化することでどこにお金を多く使用しているのか、資産は現在どれくらいあるのかといった情報を簡単に取得することができます。

<img width="467" alt="スクリーンショット 2020-02-18 2 12 53" src="https://user-images.githubusercontent.com/51415392/74674837-93661680-51f5-11ea-94cd-7f865e18bb7f.png">

- 目標貯金額を設定すると、目標貯金達成率を%で教えてくれます。

<img width="467" alt="スクリーンショット 2020-02-18 2 35 13" src="https://user-images.githubusercontent.com/51415392/74675738-8518fa00-51f7-11ea-89e8-f2bacd67f04c.png">

- 集計レポートでは、それぞれを年間、月間、週間で表示することができ、1年間のお金の流れを知ることができるので来年度の参考としてお使いできます。

<img width="1202" alt="スクリーンショット 2020-02-18 2 33 30" src="https://user-images.githubusercontent.com/51415392/74675565-2a7f9e00-51f7-11ea-8082-228dab218723.png">

## URL
https://money-hub-sample.herokuapp.com/

## 動作方法
1.アプリを作成したいディレクトリに移動する。ex) `cd desktop`  
2.$`git clone https://github.com/HikaruKobayashi/MoneyHub.git`を実行する。  
3.$`cd MoneyHub`でMoneyHubディレクトリに移動する。  
4.$`docker-compose up -d`でアプリを起動する。  
5.$`docker ps -a`で起動しているコンテナのidを取得する。  
6.$`docker exec -it コンテナid bash`でコンテナの中に入る。  
7.#`rake db:create`でDBを作成する。  
8.#`rails db:migrate`でマイグレーションする。  
→ http://localhost:3000/ を起動してMoneyHubが表示されていることを確認する。  

## 開発に使用した技術
- Docker
- Heroku
- Ruby on Rails
