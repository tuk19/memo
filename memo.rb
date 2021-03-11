require "csv"

def operation_csv(input_num, csv_file, input_text)
    if input_num == 1
        open_type = "w"
    elsif input_num == 2
        if File.exist?(csv_file) == false
            puts(csv_file + "が存在しません")
            puts(csv_file + "を作成しました")
            open_type = "w"
        else
            open_type = "a"
        end
    end
    CSV.open(csv_file, open_type) do |csv_text|
        csv_text << input_text
    # 以下も同じ
    # ブロック処理は自動で閉じるので、closeは不要
    # csv_file = CSV.open(csv_file, open_type)
    # csv.puts(input_text)
    # csv_file.close
    end

end


puts "1(新規でメモを作成) 2(既存のメモを編集する)"
input_num = gets.chomp
input_num = input_num.to_i

if input_num == 1 || input_num == 2 then
    puts("拡張子を除いたファイル名を入力してください")
    input_file = gets.chomp
    csv_file = input_file + ".csv"
    puts("メモしたい内容を記入してください")
    puts("完了したら「Ctrl+D」を押します")
    input_text = readlines.map(&:chomp)
    operation_csv(input_num, csv_file, input_text)
else
    puts("1か2以外が入力されました。")
    puts("処理を終了します。")
end

