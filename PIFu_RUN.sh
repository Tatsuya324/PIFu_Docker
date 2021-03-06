#!/bin/bash
PIFuRUN_DIR=$(dirname $(readlink -f $0))

echo "DataGenerationを行いますか？[Y/n]:"
read ANS

case $ANS in
  "" | [Yy]* )
    # ここに「Yes」の時の処理を書く
    if [ -d ${PIFuRUN_DIR}/shared_dir/raw_data/tex ]; then
        echo "DataGeneration用のデータを確認しました。"
        echo "DataGenerationを開始します。"
        . ${PIFuRUN_DIR}/scripts/DataGeneration.sh ${PIFuRUN_DIR}/shared_dir
        echo "DataGenerationが終了しました。"
    else
        echo "DataGeneration用のデータが見つかりませんでした。"
        echo "${PIFuRUN_DIR}/shared_dir/raw_data 配下に raw__100k.obj と tex/raw__dif_2k.jpg を配置してください。"
        echo "処理を終了します。"
    fi
    ;;
  * )
    # ここに「No」の時の処理を書く
    echo "No"
    ;;
esac

echo "ShapeのTrainingを行いますか？[Y/n]:"
read ANS

case $ANS in
  "" | [Yy]* )
    # ここに「Yes」の時の処理を書く
    if [ -e ${PIFuRUN_DIR}/shared_dir/train_data/GEO ]; then
        echo "Training用のデータを確認しました。"
        echo "Trainingを開始します。"
        . ${PIFuRUN_DIR}/scripts/Training_Shape.sh ${PIFuRUN_DIR}/shared_dir
        echo "Trainingが終了しました。"
    else
        echo "Training用のデータが見つかりませんでした。"
        echo ".${PIFuRUN_DIR}/scripts/DataGeneration.sh を実行してTrainingDataを作成してください。"
        echo "処理を終了します。"
    fi
    ;;
  * )
    # ここに「No」の時の処理を書く
    echo "No"
    ;;
esac


echo "ColorのTrainingを行いますか？[Y/n]:"
read ANS

case $ANS in
  "" | [Yy]* )
    # ここに「Yes」の時の処理を書く
    if [ -e ${PIFuRUN_DIR}/shared_dir/train_data/GEO ]; then
        echo "Training用のデータを確認しました。"
        echo "Trainingを開始します。"
        . ${PIFuRUN_DIR}/scripts/Training_Color.sh ${PIFuRUN_DIR}/shared_dir
        echo "Trainingが終了しました。"
    else
        echo "Training用のデータが見つかりませんでした。"
        echo ".${PIFuRUN_DIR}/scripts/DataGeneration.sh を実行してTrainingDataを作成してください。"
        echo "処理を終了します。"
    fi
    ;;
  * )
    # ここに「No」の時の処理を書く
    echo "No"
    ;;
esac


echo "Testを行いますか？[Y/n]:"
read ANS

case $ANS in
  "" | [Yy]* )
    # ここに「Yes」の時の処理を書く
    if [ -e ${PIFuRUN_DIR}/shared_dir/train_data/GEO ]; then
        echo "Training用のデータを確認しました。"
        echo "Trainingを開始します。"
        . ${PIFuRUN_DIR}/scripts/Test.sh ${PIFuRUN_DIR}/shared_dir
        echo "Trainingが終了しました。"
    else
        echo "Training用のデータが見つかりませんでした。"
        echo ".${PIFuRUN_DIR}/scripts/DataGeneration.sh を実行してTrainingDataを作成してください。"
        echo "処理を終了します。"
    fi
    ;;
  * )
    # ここに「No」の時の処理を書く
    echo "No"
    ;;
esac