# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# iedsfb example
# includes: mutate, bind_rows, group_by,
#           summarise, gather, spread, arrange, select, left_join
#            subset colums
# code by: Amy Finnegan
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

descTable <-
  r2d2 %>%
  mutate(p.HIVpos=ifelse(HIV4.r1=="positive", 1, 0)) %>%
  bind_rows("cat"=., "Total"=., .id="id") %>%
  mutate(p.knowsHIV.r1=ifelse(id=="Total", "Total", p.knowsHIV.r1)) %>%
  #rbind(., r2d2Total) %>%
  group_by(p.knowsHIV.r1) %>%
  summarise(c.age=round(mean(c.age.r1, na.rm=T), 1),
            p.age=round(mean(p.age.r1, na.rm=T), 1),
            c.eduCompPri=round(mean(c.eduCompPri.r1, na.rm=T)*100, 1),
            p.eduCompPri=round(mean(p.eduCompPri.r1, na.rm=T)*100, 1),
            p.bio=round(mean(p.bio.r1, na.rm=T)*100, 1),
            p.HIVpos=round(mean(p.HIVpos, na.rm=T)*100, 1),
            Npct=paste0(as.numeric(n()), " (",
                        pct=round(n()/nrow(r2d2)*100, 1),
                        ")")) %>%
  #data.frame(.) %>%
  #melt(., id=c("p.knowsHIV.r1")) %>%
  gather("c.age", "p.age", "c.eduCompPri", "p.eduCompPri",
         "p.bio", "p.HIVpos", "Npct", key="variable", value="value") %>%
  spread(., key=p.knowsHIV.r1, value=value) %>%
  # reshape(.,
  #         idvar="variable",
  #         timevar="p.knowsHIV.r1",
  #         direction="wide") %>%
  mutate(variable=plyr::mapvalues(variable,
                                  from=c("c.age", "p.age",
                                         "c.eduCompPri", "p.eduCompPri",
                                         "p.bio", "p.HIVpos", "Npct"),
                                  to=c("Child's Age (years)", "Caregiver's Age (years)",
                                       "Child completed primary (%)",
                                       "Caregiver completed primary (%)",
                                       "Biological caregiver (%)",
                                       "Caregiver HIV+ (%)",
                                       "N (%)"))) %>%
  mutate(variable=factor(variable,
                         levels=c("N (%)",
                                  "Caregiver's Age (years)",
                                  "Caregiver completed primary (%)",
                                  "Biological caregiver (%)",
                                  "Caregiver HIV+ (%)",
                                  "Child's Age (years)",
                                  "Child completed primary (%)"), ordered=TRUE)) %>%
  arrange(variable) %>%
  mutate(Variable=variable,
         `Not Disclosed`=`0`,
         Disclosed=`1`,
         Total=Total) %>%
  select(Variable, Disclosed, `Not Disclosed`, Total)

# left join example

l <- descTable[,c(1:3)] # subset

l <- # dplyr
  descTable %>%
    select(Variable, Disclosed, `Not Disclosed`)

r <- descTable[,c(1,4)] # subset

r <- # dplyr
  descTable %>%
    select(Variable, Total)

descTable2 <- 
  left_join(l, r, by="Variable")

