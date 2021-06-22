# PIFu_Docker
[PIFu: Pixel-Aligned Implicit Function for High-Resolution Clothed Human Digitization](https://github.com/shunsukesaito/PIFu)を動作させるためのDockerです。
研究目的で試験的に作成したものですので、動作は保証しません。
自己責任でご利用ください。

## セットアップ

### 1. 新たにターミナルを立ち上げて次のコマンドでこのリポジトリをクローン（ダウンロード）してください
```sh
git clone https://github.com/TatsuyaOkazaki324/PIFu_Docker.git
```

### 2. 次のコマンドでDockerイメージをビルドしてください（時間がかかります）
```sh
./PIFu_Docker/docker/build-docker.sh
```

|オプション |パラメータ |説明                      |既定値   |
|-----------|:---------:|--------------------------|:-------:|
|`-h`       |なし       |ヘルプを表示              |なし     |
|`-p`       |VERSION    |PyTorchのバージョン       |1.7.1    |
|`-c`       |VERSION    |CUDAのバージョン          |11.0     |
|`-d`       |VERSION    |cuDNNのバージョン         |8        |
|`-f`       |FLAVOR     |PyTorchのフレーバー       |devel    |

### 3. ビルドに成功したら次のコマンドでDockerコンテナを起動することができます
```sh
./PIFu_Docker/docker/run-docker.sh
```
**エラーが出た場合はイメージを削除しPyTorchのバージョンを下げてもう一度 2. を実行してみてください**

### 4. 次のコマンドで別のターミナルから起動中のコンテナに入ることができます
```sh
./PIFu_Docker/docker/exec-docker.sh
```

## PIFuのClone
```sh
./PIFu_Docker/docker/run-docker.sh
```
コンテナを起動後に次のコマンドを実行します。
```sh
git clone https://github.com/shunsukesaito/PIFu.git
```