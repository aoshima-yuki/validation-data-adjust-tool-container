# validation-data-adjust-tool-container

## 概要
本リポジトリは、空間ID変換ツール（data-adjust-tool）を組み込んだ  
Apache NiFi 実行環境をコンテナイメージとして提供するものです。

ローカル環境での Java / Python / NiFi の構築を不要とし、  
コンテナを起動するだけで空間ID変換処理の検証が可能になります。

---

## 提供内容
- Apache NiFi（実行環境）
- Python実行環境
- data-adjust-tool（SpatialID関連処理）
- NiFi上で利用可能な Python Processor

---

## コンテナイメージ
ghcr.io/aoshima-yuki/validation-data-adjust-tool-container:latest

---

## 利用方法（ローカルでDockerが使える場合）

### 1. イメージ取得
docker pull ghcr.io/aoshima-yuki/validation-data-adjust-tool-container:latest

### 2. 起動
docker run -d --name nifi-http \
  -p 8080:8080 \
  ghcr.io/aoshima-yuki/validation-data-adjust-tool-container:latest

### 3. アクセス
http://localhost:8080/nifi

### 4. ログイン
初回起動時にログに出力されるユーザー・パスワードを使用

確認方法：
docker logs nifi-http | grep Username -A 2

---

## 動作確認

NiFi画面で以下を確認してください。

1. 右クリック → Add Processor
2. 以下で検索

- GenerateSpatialID
- ConvertLinkCSVToSpatialIDCenterPoint

---

## Dockerが使えない場合（Cloud Shellでの検証）

ローカルにDockerをインストールできない場合、  
ブラウザ上で利用可能な Google Cloud Shell を利用して検証できます。

### 手順

1. Cloud Shell を起動  
   Google Cloud Console 右上の「Cloud Shell」を起動

2. コンテナ起動
docker pull ghcr.io/aoshima-yuki/validation-data-adjust-tool-container:latest

docker run -d --name nifi-http \
  -p 8080:8080 \
  ghcr.io/aoshima-yuki/validation-data-adjust-tool-container:latest

3. ポート公開  
Cloud Shell の「Web Preview」からポート 8080 を選択

4. NiFi にアクセス  
http://<CloudShell URL>/nifi

5. ログイン情報確認
docker logs nifi-http | grep Username -A 2

---

## 注意事項

- 初回起動時は NiFi の初期化（NAR展開）に時間がかかる場合があります
- Cloud Shell 環境では HTTP（8080）で起動します
- 環境によっては Python Processor が表示されない場合があります

---

## 補足

本コンテナは検証用途を目的としており、  
本番環境での利用は想定していません。
