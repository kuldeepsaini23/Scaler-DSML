# !File Handling

#* Read File(without with you have to close file every time)
# f = open('data.txt', 'r')
# print(f.readline())
# print(f.readline())
# print(f.readline())

# for line in f:
#     print(line)

# f.close()--> Close eveery time

#* Read File(with with you don't have to close file every time)
# with open('data.txt', 'r') as f:
# print(f.read(10))
#     data = f.read()
#     print(data)

#! Write File
# line_data = ["Hello", "World", "Welcome"]
# with open('writeData.txt', 'w') as f:
    # f.write("Hello World")
    # f.seek(0)
    # f.write("R")

    # for line in line_data:
    #     f.write(line)
    #     f.write("\n")
    # f.writelines(line_data)

#! Append File
line_data = ["Hello", "World", "Welcome"]
with open('writeData.txt', 'a') as f:
    f.write("Hello World\n")
    f.seek(0)
    f.write("R")

    for line in line_data:
        f.write(line)
        f.write("\n")
    f.writelines(line_data)
