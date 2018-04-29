#by Anto Oswin
cd1 <- read.csv("E:\\Studies\\MCS ASU\\Spring 18\\CSE 578 DV\\Final Project\\Stack_data_formed2014\\Combined_Data_1.csv")
temp = as.data.frame(table(cd1[2]))
temp1 = head(temp[order(-temp[,2]),],40)
temp2 = cd1[(cd1$user_id %in% temp1$Var1),]
write.csv(temp2, "E:\\Studies\\MCS ASU\\Spring 18\\CSE 578 DV\\Final Project\\Stack_data_formed2014\\Top_40_Users.csv", row.names=FALSE)
#temp = as.data.frame(table(temp2[2]))
temp3 = aggregate(tag ~ user_id, data = temp2[,c("user_id","tag")], paste, collapse = " ")
temp3$tag <- sapply(strsplit(temp3$tag, " ", fixed = TRUE), function(x) paste(unique(x), collapse = " "))
a = c("file", "spring", "class", "memory", "string" , "android" , "data" , "static" , "web" , "statement" , "exception" , "io" , "design" , "list" , "loop" , "eclipse" , "interface" , "apache" , "integer" , "thread" , "type" , "variables" , "handling" , "code" , "image" , "method" , "date" , "compiler", "array" , "netbeans" , "search" , "server" , "sql" , "binary" , "object" , "reference" , "operator" , "user" , "xml" , "methods" , "parsing" , "http" , "testing" , "time" , "tree" , "layout", "loops", "maven", "database", "error","abstract","overloading","hibernate","constructor","double","types", "jar","processing");
x <- unlist(strsplit(temp3$tag, " "))

x <- x[!x %in% a]

temp3$tag = paste(x, collapse = " ")
temp3$tag = gsub("-","",temp3$tag)

write.csv(temp3, "E:\\Studies\\MCS ASU\\Spring 18\\CSE 578 DV\\Final Project\\Stack_data_formed2014\\Top_40_ID_Tag1.csv", row.names=FALSE)
library(anytime)
cd1=read.csv("E:\\Studies\\MCS ASU\\Spring 18\\CSE 578 DV\\Final Project\\Stack_data_formed2014\\Top_40_Users - Votes.csv")
cd1$time=format(as.Date(anydate(cd1$time)),"%Y%m%d")
cd1 = cd1[order( cd1[,2], cd1[,3] ),]
write.csv(cd1, "E:\\Studies\\MCS ASU\\Spring 18\\CSE 578 DV\\Final Project\\Stack_data_formed2014\\Top_40_Users Votes & mmdd.csv", row.names=FALSE)
