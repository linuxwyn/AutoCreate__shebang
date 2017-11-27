# coding=utf-8
path = input('请输入文件所在路径及文件名：')
key_word = input("请输入你所需要查找的关键字：")
with open(path, 'r') as f:
    liNe = f.readline()
    while liNe:
        new_line = liNe.rstrip()
        key_word_list = [key_word, key_word.upper(), key_word.lower()]
        for match in key_word_list:
            if match in new_line:
                print(new_line)
        liNe = f.readline()

