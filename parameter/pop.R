popstruc <- THpop %>% 
  select(age_category, pop) %>% 
  rename(agefloor = age_category) %>% 
  as.data.frame()

popbirth <- THpop %>% 
  select(age_category, birth) %>% 
  as.data.frame() # unit should be per person per day

mort <- THpop %>% 
  pull(death) # unit should be per person per day

ihr <- mort_sever_default %>% 
  select(age_category, ihr) %>% 
  as.data.frame()

ifr <- mort_sever_default %>% 
  select(age_category, ifr) %>% 
  as.data.frame()




########## POP AGEING
# per year ageing matrix
A <- length(age_categories)
dd<-seq(1:A)/seq(1:A)
ageing <- t(diff(diag(dd),lag=1)/(5*365.25))
ageing<-cbind(ageing,0*seq(1:A)) # no ageing from last compartment