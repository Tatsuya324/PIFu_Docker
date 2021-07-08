#!/bin/bash

if [ -e ./PIFu ]; then
    echo "PIFuリポジトリの存在を確認しました。"
else
    echo "PIFuリポジトリが見つかりません。GitHubよりCloneします。"
    git clone https://github.com/shunsukesaito/PIFu.git
fi


echo "PIFuのDemoを実行しますか？[Y/n]:"
read ANS

case $ANS in
  "" | [Yy]* )
    # ここに「Yes」の時の処理を書く
    echo "公式リポジトリより学習済みモデルをダウンロードします。"
    ./PIFu/scripts/download_trained_model.sh
    echo "testを開始します。"
    ./PIFu/scripts/test.sh
    echo "testが終了しました。"
    echo "PIFu/results/pifu_demo に結果を出力しています。"
    ;;
  * )
    # ここに「No」の時の処理を書く
    echo "No"
    ;;
esac
