acronym = ""
temp = argument0

if string_pos(" ", temp) != 0{
shorterName = string_copy(temp, 0, string_pos(" ", temp)+1)
shorterName += "."
return shorterName
}else{
return temp
}
