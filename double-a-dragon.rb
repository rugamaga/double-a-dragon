# "ダブルあドラゴン" をやってできた文字列を出力するスクリプト
# https://note.com/euchaeta/n/n06a4dc5bfb8c
# のブログを見てもっと色々見てみたいので作った。

require "bundler/inline"
gemfile do
  source 'https://rubygems.org'
  gem "google-cloud-translate"
end

require "google/cloud"
require "google/cloud/translate"

# ---------------- 各種設定

# TranslateAPIを使うので GOOGLE_APPLICATION_CREDENTIALS も必要です
# GCPでAPIを使えるようにIAMをセットアップしてください。
# (使わないけど引き出しておいて設定項目であることを可視にしておきます)
GOOGLE_APPLICATION_CREDENTIALS = ENV['GOOGLE_APPLICATION_CREDENTIALS']

# 利用するTranslateAPIを設置したGCPのPROJECT_ID
PROJECT_ID = ENV['PROJECT_ID']

# 初期生成する文字列のサイズ
# ひらがなを乱数で適当にこの文字数まで並べます
TEXT_SIZE = 300

# 初期文字列で選ぶ文字の候補
# デフォルトでひらがな全体にしてあります。
CANDIDATES = %w(
あ い う え お
か き く け こ
さ し す せ そ
た ち つ て と
な に ぬ ね の
は ひ ふ へ ほ
ま み む め も
や ゆ よ
ら り る れ ろ
わ を ん
)

# 何回まで翻訳ループするか
# 元ブログでは100回回してるようなのですが
# 実際には10回くらいでもう収束してそうです
MAX_LOOP = 100

# ---------------- ランダム文字列を生成
samples = (0..TEXT_SIZE).map { CANDIDATES.sample }
original = samples.join('')

puts "元テキスト: #{original}"

# ---------------- TranslateAPIをループ
client = Google::Cloud::Translate.new version: :v2, project_id: PROJECT_ID

current_ja = original
current_en = ''
MAX_LOOP.times do
  current_en = client.translate(current_ja, from: 'ja', to: 'en').text
  current_ja = client.translate(current_en, from: 'en', to: 'ja').text

  puts "英翻訳: #{current_en}"
  puts "日翻訳: #{current_ja}"
end
