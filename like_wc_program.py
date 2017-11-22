def countLines(name):
    count_lines = 0
    for line in open(name):
        count_lines += 1

    return count_lines


def countChars(name):
    count_chars = 0
    for line in open(name):
        count_chars += len(line)

    return count_chars


if __name__ == '__main__':
    import sys
    def summary(file_name):
        print('You current process file: ', file_name)
        print('*' * 50)
        print('Total lines: ', countLines(file_name))
        print('Total chars: ', countChars(file_name))
        print('*' * 50)


    summary(sys.argv[1])
        
