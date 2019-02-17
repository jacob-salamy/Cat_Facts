library(mailR)
library(rvest)
library(magrittr)

cat_fact <- read_html("https://www.factretriever.com/cat-facts") %>%
             html_nodes(., '.factsList') %>% html_text(.) %>%
             strsplit(., "[[0-9]{2}\\]") %>% unlist(.) %>%
             gsub('[//[]','',.) %>% sample(., 1)

subject <- paste("Cat Fact Number", sample.int(101,1))

send.mail(from = "catfacts.1921@gmail.com",
          to = "recipient@gmail.com",
          subject =  subject ,
          body =  cat_fact,
          html = TRUE,
          inline = TRUE,
          smtp = list(host.name = "smtp.gmail.com", 
                      user.name = "catfacts.1921@gmail.com", 
                      passwd = "Catfactsarefun", 
                      ssl = TRUE),
          port = 465, 
          authenticate = TRUE,
          send = TRUE)
