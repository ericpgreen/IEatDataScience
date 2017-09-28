r2d2 analysis
================
Your Name Here
date object

Load
====

glimpse()
=========

    ## Observations: 372
    ## Variables: 13
    ## $ X                   <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,...
    ## $ c.age.r1            <int> 10, 11, 10, 12, 15, 14, 12, 10, 9, 15, 14,...
    ## $ c.female.r1         <int> 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, ...
    ## $ p.age.r1            <int> 77, 36, 39, 34, 39, 45, 49, 33, 34, 66, 57...
    ## $ p.female.r1         <int> 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
    ## $ HIV4.r1             <fctr> negative, negative, positive, positive, p...
    ## $ doesKnow16d.r1      <int> 1, 1, 1, NA, 1, 1, 1, 1, NA, NA, 1, 1, 1, ...
    ## $ p.bio.r1            <int> 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, ...
    ## $ p.knowsHIV.r1       <int> 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, ...
    ## $ p.knowsHowInf.r1    <int> 1, 0, 1, NA, 1, 0, 1, 1, NA, NA, 1, 0, 1, ...
    ## $ p.knowsCanSpread.r1 <int> 0, 0, 1, NA, 1, 1, 1, 1, NA, NA, 1, 0, 1, ...
    ## $ p.eduCompPri.r1     <int> 0, 1, 1, 1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 1, ...
    ## $ c.eduCompPri.r1     <int> 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, ...

str()
=====

    ## 'data.frame':    372 obs. of  13 variables:
    ##  $ X                  : int  1 2 3 4 5 6 7 8 9 10 ...
    ##  $ c.age.r1           : int  10 11 10 12 15 14 12 10 9 15 ...
    ##  $ c.female.r1        : int  1 1 0 1 0 0 1 0 1 1 ...
    ##  $ p.age.r1           : int  77 36 39 34 39 45 49 33 34 66 ...
    ##  $ p.female.r1        : int  1 0 1 1 1 1 1 1 1 1 ...
    ##  $ HIV4.r1            : Factor w/ 2 levels "negative","positive": 1 1 2 2 2 2 2 2 2 1 ...
    ##  $ doesKnow16d.r1     : int  1 1 1 NA 1 1 1 1 NA NA ...
    ##  $ p.bio.r1           : int  0 0 1 1 1 1 1 1 1 0 ...
    ##  $ p.knowsHIV.r1      : int  1 1 1 0 1 1 1 1 0 0 ...
    ##  $ p.knowsHowInf.r1   : int  1 0 1 NA 1 0 1 1 NA NA ...
    ##  $ p.knowsCanSpread.r1: int  0 0 1 NA 1 1 1 1 NA NA ...
    ##  $ p.eduCompPri.r1    : int  0 1 1 1 0 1 0 1 1 0 ...
    ##  $ c.eduCompPri.r1    : int  0 0 0 0 1 1 0 0 0 0 ...

clean-construct
===============

    ## 
    ## negative positive 
    ##      141      208

    ##           
    ##              0   1 <NA>
    ##   negative 141   0    0
    ##   positive   0 208    0
    ##   <NA>       0   0   23

    ## 
    ## Call:
    ## lm(formula = p.knowsHIV.r1 ~ p.HIVpos, data = r2d2)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -0.7067 -0.6170  0.2933  0.2933  0.3830 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value            Pr(>|t|)    
    ## (Intercept)  0.61702    0.03952  15.611 <0.0000000000000002 ***
    ## p.HIVpos     0.08971    0.05120   1.752              0.0806 .  
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 0.4693 on 347 degrees of freedom
    ##   (23 observations deleted due to missingness)
    ## Multiple R-squared:  0.008771,   Adjusted R-squared:  0.005914 
    ## F-statistic:  3.07 on 1 and 347 DF,  p-value: 0.08061

    ## 
    ## ===============================================
    ##                         Dependent variable:    
    ##                     ---------------------------
    ##                            p.knowsHIV.r1       
    ## -----------------------------------------------
    ## p.HIVpos                      0.090*           
    ##                               (0.051)          
    ##                                                
    ## Constant                     0.617***          
    ##                               (0.040)          
    ##                                                
    ## -----------------------------------------------
    ## Observations                    349            
    ## R2                             0.009           
    ## Adjusted R2                    0.006           
    ## Residual Std. Error      0.469 (df = 347)      
    ## F Statistic            3.070* (df = 1; 347)    
    ## ===============================================
    ## Note:               *p<0.1; **p<0.05; ***p<0.01

    ## 
    ## =============================================================
    ##                                Dependent variable:           
    ##                     -----------------------------------------
    ##                                   p.knowsHIV.r1              
    ##                             (1)                  (2)         
    ## -------------------------------------------------------------
    ## p.HIVpos                   0.090*               0.084*       
    ##                           (0.051)              (0.050)       
    ##                                                              
    ## Constant                  0.617***             0.617***      
    ##                           (0.040)              (0.040)       
    ##                                                              
    ## -------------------------------------------------------------
    ## Observations                349                  372         
    ## R2                         0.009                0.008        
    ## Adjusted R2                0.006                0.005        
    ## Residual Std. Error   0.469 (df = 347)     0.470 (df = 370)  
    ## F Statistic         3.070* (df = 1; 347) 2.816* (df = 1; 370)
    ## =============================================================
    ## Note:                             *p<0.1; **p<0.05; ***p<0.01

Descriptive Table
=================

| Variable                        | Disclosed  | Not Disclosed | Total     |
|:--------------------------------|:-----------|:--------------|:----------|
| N (%)                           | 249 (66.9) | 123 (33.1)    | 372 (100) |
| Caregiver's Age                 | 47.1       | 49.1          | 47.8      |
| Caregiver completed primary (%) | 63.5       | 58.5          | 61.8      |
| Biological caregiver (%)        | 50.4       | 41.1          | 47.4      |
| Caregiver HIV+ (%)              | 65.1       | 56.1          | 62.1      |
| Child's Age                     | 12.3       | 11.7          | 12.1      |
| Child completed primary (%)     | 27.3       | 10.6          | 21.8      |
