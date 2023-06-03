with open('run_sdcard.hex', 'r') as file:
    data = file.read()

# 遍历数据的每一行
for line in data.split('\n'):
    code=line[10:59]
    bytes_list = []
    for i in code.split(' '):
        if i != '':
            bytes_list.append("0x"+i)
    result_str = ', '.join(bytes_list)
    print(result_str + ',')
