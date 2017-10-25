
r2d2 %>%
  group_by(p.knowsHIV.r1) %>%
  summarise(c.age=mean(c.age.r1, na.rm=T),
            p.age=mean(p.age.r1, na.rm=T)) %>%
  gather(., key="variable", value="value", -p.knowsHIV.r1) %>%
  spread(., key=p.knowsHIV.r1, value=value)
