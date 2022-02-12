library(rvest)
library(tidyverse)
url <- "https://movie.douban.com/top250"
page <-  read_html(url)
links <- page %>% 
  html_elements(".hd") %>% 
  html_elements("a") %>% 
  html_attr("href")
html <- minimal_html("
  <ul>
    <li><b>C-3PO</b> is a <i>droid</i> that weighs <span class='weight'>167 kg</span></li>
    <li><b>R2-D2</b> is a <i>droid</i> that weighs <span class='weight'>96 kg</span></li>
    <li><b>Yoda</b> weighs <span class='weight'>66 kg</span></li>
    <li><b>R4-P17</b> is a <i>droid</i></li>
  </ul>
  ")
characters <- html %>% html_elements("li")
d <- data.frame(
  name = characters %>% html_element("b") %>% html_text2(),
  species = characters %>% html_element("i") %>% html_text2(),
  weight = characters %>% html_element(".weight") %>% html_text2()
)




