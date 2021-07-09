# PIFu_Docker

## セットアップ

### 1. 新たにターミナルを立ち上げて次のコマンドでこのリポジトリをクローン（ダウンロード）してください
```sh
git clone https://github.com/TatsuyaOkazaki324/PIFu_Docker.git
```

### 2. 次のコマンドでsetupしてください。
```sh
./setup.sh
```

## Training の方法
### 1.Training Data の準備
学習用データを下記の用に配置する・
```
PIFu_Docker
 |-shared_dir
    |-raw_data
    |   |-raw__100k.obj
    |   |-tex
    |       |-raw__dif_2k.jpg
    |
    |-train_data
```

### 2.Trainingの実行
PIFu_Dockerにて以下を実行
``` sh
./PIFu_RUN
```
### ※DataGenerationのみ
PIFu_Dockerにて以下を実行
``` sh
./scripts/DataGeneration.sh
```
### ※Trainingのみ
PIFu_Dockerにて以下を実行
``` sh
./scripts/Training.sh
```