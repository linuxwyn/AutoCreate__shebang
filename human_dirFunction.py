"""
human_dirFunction.py: 一个列出模块所有属性并以人类可读的方式展现出来的脚本
"""

sep_len = 65
sep_chr = '*'

def human_readable(module, flag = True):
  sep_line = sep_len * sep_chr
  if flag:
    print(sep_line)
    print('名称：', module.__name__, '文件:', module.__file__)         #注意有些模块并没有__file__这个属性（例如sys这个内置模块）
    print(sep_line)
    
  count = 0
  for attr in module.__dict__:
    print('%02d) %s' % (count, attr), end = ' ')                      #仅支持python 3.X，因为在python 2.X中print并不是一个函数
    if attr.startswith('__'):
      print('<built-in name>')
    else:
      print(getattr(module, attr))
    count += 1                                                    
    
  if flag:
    print(sep_line)
    print(module.__name__, 'has %d names' % count)
    print(sep_line)
    
if __name__ == '__main__':                                            #当该脚本以顶层文件执行时所做的操作
  import human_dirFunction
  human_readable(human_dirFunction)
    
