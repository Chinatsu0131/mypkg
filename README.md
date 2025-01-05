# cpu_monitor
**このリポジトリはROS2のパッケージです。**

![test](https://github.com/Chinatsu0131/robosys2024-ros2/actions/workflows/test.yml/badge.svg)

## 概要
- 本パッケージは、2024年度の千葉工業大学ロボットシステム学の課題2として制作され、CPU負荷率をモニタリングし、定期的にその情報を提供します。


## ノード
- mypkg ディレクトリ内にあるcpu_monitor.py ファイルには,cpu_monitor という名前のノードが実装されています。

- このノードは以下の機能を持ちます:
  - 1秒ごとに現在のCPU負荷率を取得し、その情報を更新します。
  - cpu_load というトピックにCPU負荷率のデータを送信します。
  - 進捗に基づいたメッセージ送信を行い、負荷率の状況を通知します。

## トピック
- cpu_load(std_msgs/String)
  - このトピックには、現在のCPU負荷率が含まれたメッセージが定期的に送信されます。
  
# 実行方法
このパッケージを実行するには、2つの端末を使用します。
1. 端末1: mypkg ディレクトリ内からcpu_monitor ノードを起動します。
```bash
$ ros2 run mypkg cpu_monitor
```
2. 端末2: cpu_load トピックのメッセージを確認します。
```bash
$ ros2 topic echo /cpu_load
---
data: '現在のCPU負荷率 16.80%

  CPU負荷率が10%を超えました。'
---
data: '現在のCPU負荷率 25.46%

  CPU負荷率が20%を超えました。'
---
data: '現在のCPU負荷率 34.93%

  CPU負荷率が30%を超えました。'
```

## ローンチファイル
パッケージには、launch/cpu_monitor.launch.pyというローンチファイルが含まれていますが、現在は１つのノードのみを使用しているため、通常は直接ノードを実行します。

## 必要なソフトウェア
- python
- コンテナ
  - 講師が提供する、Ubuntu 22.04 LTSにROS2をセットアップしたコンテナを使用します。
  - https://hub.docker.com/repository/docker/ryuichiueda/ubuntu22.04-ros2

## テスト環境
- ubuntu 22.04 LTS

## 参考資料
- https://self-development.info/%e3%80%90psutil%e3%80%91python%e3%81%a7cpu%e3%83%bb%e3%83%a1%e3%83%a2%e3%83%aa%e4%bd%bf%e7%94%a8%e7%8e%87%e3%82%84%e3%83%97%e3%83%ad%e3%82%bb%e3%82%b9%e3%82%92%e7%9b%a3%e8%a6%96%e3%82%92%e3%81%99/

# ライセンス
- このソフトウェアパッケージは, 3条項BSDライセンスの下, 再頒布および使用が許可がされます。 
- このパッケージのコードの一部は,下記のスライド(CC-BY-SA 4.0 by Ryuichi Ueda) のものを,本人の許可を得て自身の著作としたものです.
 - (https://ryuichiueda.github.io/slides_marp/robosys2024/lesson8.html)
 - (https://ryuichiueda.github.io/slides_marp/robosys2024/lesson9.html)
 - (https://ryuichiueda.github.io/slides_marp/robosys2024/lesson10.html)
- © 2024 Takumi Kobayshi
