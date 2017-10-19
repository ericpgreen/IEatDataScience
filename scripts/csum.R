# week 4

# data to bring csum to zero
zeroDat <- data.frame(variable=c(rep("doesKnow19.r1", min(dat$doesKnow19.r1, na.rm=T)),
                                 rep("doesKnow23.r1", min(dat$doesKnow23.r1, na.rm=T)),
                                 rep("doesKnow27.r1", min(dat$doesKnow27.r1, na.rm=T)),
                                 rep("doesKnow15.r1", min(dat$doesKnow15.r1, na.rm=T)),
                                 rep("ageFull", min(dat$ageFull, na.rm=T))),
                      value=c(seq(0, min(dat$doesKnow19.r1, na.rm=T)-1, 1),
                              seq(0, min(dat$doesKnow23.r1, na.rm=T)-1, 1),
                              seq(0, min(dat$doesKnow27.r1, na.rm=T)-1, 1),
                              seq(0, min(dat$doesKnow15.r1, na.rm=T)-1, 1),
                              seq(0, min(dat$ageFull, na.rm=T)-1, 1)),
                      count=0,
                      all=372,
                      csum=0,
                      pct=0,
                      label=NA)