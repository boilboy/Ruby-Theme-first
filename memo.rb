require "csv"

puts "1 → (新規でメモを作成する) / 2 → (既存のメモを編集する)"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。
if memo_type == 1
  puts "拡張子を除いたファイルを入力してください"
  file_name = gets.chomp
  p "メモしたい内容を記入してください"
  p "完了したらCtrl + Dを押します"
  memo = STDIN.read
  CSV.open("#{file_name}.csv","w") do |csv|
  csv << [memo]
end

elsif memo_type == 2
  puts "追記したいファイルを拡張子を入れた状態で入力してください"
  file_name = gets.chomp
  p "メモしたい内容を記入してください"
  p "完了したらCtrl + Dを押します"
  memo = STDIN.read
  CSV.open("#{file_name}","a") do |csv|
  csv << [memo]
end

else 
 puts "1か2の数字を入力してください"
end