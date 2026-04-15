# validation-data-adjust-tool-container

## 概要
空間ID変換ツール（data-adjust-tool）を組み込んだ Apache NiFi 環境を、
コンテナとして利用できるようにしたものです。

ローカルでの Java / Python / NiFi の環境構築なしで利用できます。

---

## コンテナイメージ
ghcr.io/aoshima-yuki/validation-data-adjust-tool-container:latest

---

## 使い方

### 1. イメージ取得
docker pull ghcr.io/aoshima-yuki/validation-data-adjust-tool-container:latest

### 2. 起動
docker run -p 8443:8443 \
  -e SINGLE_USER_CREDENTIALS_USERNAME=admin \
  -e SINGLE_USER_CREDENTIALS_PASSWORD=Password123!Ab \
  ghcr.io/aoshima-yuki/validation-data-adjust-tool-container:latest

### 3. アクセス
https://localhost:8443/nifi

### 4. ログイン
Username: admin  
Password: 起動時に指定したパスワード

---

## 動作確認
NiFi画面で「Add Processor」を開き、「SpatialID」で検索し、
以下が表示されることを確認してください。

- GenerateSpatialID
- GenerateCylindricalSpatialID
- ConvertLinkCSVToSpatialIDCenterPoint
