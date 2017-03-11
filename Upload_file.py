#!
# 1. upload to amazon drive
# 2. check if file size is the same
# 3. delete source file

file_size()
{
acd_cli metadata $1 | sed -n '/size/p' | sed -n 's/\([^0-9]*\)\([0-9][0-9]*\),/\2/p'

}
