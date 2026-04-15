# validation-data-adjust-tool-container

## 概要

空間ID変換ツール（data-adjust-tool）を組み込んだ Apache NiFi 環境を、コンテナとして利用できるようにしたものです。

ローカルでの Java / Python / NiFi の環境構築なしで、ブラウザから動作確認が可能です。

---

## 特徴

* Apache NiFi + Python Processor を含む実行環境をコンテナ化
* data-adjust-tool の API / extensions を組み込み済み
* Docker 環境があればすぐに利用可能
* Cloud Shell 等の環境でも動作確認可能

---

## コンテナイメージ

```bash
ghcr.io/aoshima-yuki/validation-data-adjust-tool-container:latest
```

---

## 利用方法（基本）

### 1. イメージ取得

```bash
docker pull ghcr.io/aoshima-yuki/validation-data-adjust-tool-container:latest
```

### 2. 起動

```bash
docker run -d --name nifi-http -p 8080:8080 \
  ghcr.io/aoshima-yuki/validation-data-adjust-tool-container:latest
```

### 3. アクセス

```text
http://localhost:8080/nifi
```

---

## Cloud Shellでの利用方法（Docker未インストール環境向け）

### 1. コンテナ起動

```bash
docker pull ghcr.io/aoshima-yuki/validation-data-adjust-tool-container:latest
docker run -d --name nifi-http -p 8080:8080 \
  ghcr.io/aoshima-yuki/validation-data-adjust-tool-container:latest
```

### 2. Webプレビューでアクセス

Cloud Shell の「Web Preview」からポート8080を開く

```text
https://8080-xxxx.cloudshell.dev/nifi
```

---

## Processorの確認方法

NiFi画面で「Add Processor」から以下を確認してください。

* Python Processor が利用可能であること
* SpatialID関連 Processor が表示されること

---

## 注意事項（重要）

### ■ NiFiの挙動について

本コンテナは検証用途のため、以下の点に注意してください。

* 起動直後の挙動については現在継続確認中です
* Processor配置や操作時に、以下のエラーが表示される場合があります

```text
Unable to communicate with NiFi
Please ensure the application is running and check the logs for any errors.
```

→ 本事象については現在原因および安定動作条件を確認中です

---

### ■ flow.json.gz について

NiFiのフロー定義は `flow.json.gz` に保存されますが、

* 環境差異（ポート / TLS / 設定）に依存する
* 起動条件によっては不整合が発生する可能性がある

ため、

👉 **flow の同梱方法および再現性については現在検証中です**

---

## 想定用途

* 空間ID変換処理の検証
* NiFi + Python Processor の動作確認
* data-adjust-tool の試行環境
* 非技術者向けデモ環境

---

## 補足

本コンテナは簡易的な検証環境です。
本番利用を前提とした構成（セキュリティ設定、クラスタ構成等）は含まれていません。
