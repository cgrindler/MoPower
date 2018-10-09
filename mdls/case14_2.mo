model case14_2
extends Modelica;
import Modelica.Math;

// Inputs:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

//Voltage:
input Real[2] Vr1(start={1.06,0.0});
input Real[2] Vr2(start={1.041055188215118,-0.09071435989073091});
input Real[2] Vr3(start={0.9852123211492948,-0.22238858391477456});
input Real[2] Vr4(start={1.002483316814592,-0.1827243812642808});
input Real[2] Vr5(start={1.0080473578375984,-0.1556936875940605});
input Real[2] Vr6(start={1.0372148387718834,-0.2628409751758962});
input Real[2] Vr8(start={1.0605018005472275,-0.25186490632100544});
input Real[2] Vr9(start={1.0203033258334908,-0.2722446019540472});
input Real[2] Vr10(start={1.0147117350540655,-0.2737902385834234});
input Real[2] Vr11(start={1.0219794311557528,-0.2698278011891353});
input Real[2] Vr12(start={1.018717387780199,-0.2742988950657429});
input Real[2] Vr13(start={1.0134592669592999,-0.27459117650485176});
input Real[2] Vr14(start={0.9956675156231685,-0.2862554773847789});


//Load Power:
input Real[2] Sl2(start={0.217,0.127});
input Real[2] Sl3(start={0.9420000000000001,0.19});
input Real[2] Sl4(start={0.478,-0.039});
input Real[2] Sl5(start={0.076,0.016});
input Real[2] Sl6(start={0.11199999999999999,0.075});
input Real[2] Sl9(start={0.295,0.166});
input Real[2] Sl10(start={0.09,0.057999999999999996});
input Real[2] Sl11(start={0.035,0.018000000000000002});
input Real[2] Sl12(start={0.061,0.016});
input Real[2] Sl13(start={0.135,0.057999999999999996});
input Real[2] Sl14(start={0.149,0.05});

// Outputs:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

//Voltage:
output Real[2] Vr7(start={1.0332167072184912,-0.24557531619561992});


//All Branch Flows:
output Real cns_I1_2;
output Real cns_I1_5;
output Real cns_I2_3;
output Real cns_I2_4;
output Real cns_I2_5;
output Real cns_I3_4;
output Real cns_I4_5;
output Real cns_I4_7;
output Real cns_I4_9;
output Real cns_I5_6;
output Real cns_I6_11;
output Real cns_I6_12;
output Real cns_I6_13;
output Real cns_I7_8;
output Real cns_I7_9;
output Real cns_I9_10;
output Real cns_I9_14;
output Real cns_I10_11;
output Real cns_I12_13;
output Real cns_I13_14;

Complex I1_2;
Complex I1_5;
Complex I2_3;
Complex I2_4;
Complex I2_5;
Complex I3_4;
Complex I4_5;
Complex I4_7;
Complex I4_9;
Complex I5_6;
Complex I6_11;
Complex I6_12;
Complex I6_13;
Complex I7_8;
Complex I7_9;
Complex I9_10;
Complex I9_14;
Complex I10_11;
Complex I12_13;
Complex I13_14;

//Trick equality constraints for Loads:
output Real[2] ceq_Sl4(start={0,0});
output Real[2] ceq_Sl5(start={0,0});
output Real[2] ceq_Sl9(start={0,0});
output Real[2] ceq_Sl10(start={0,0});
output Real[2] ceq_Sl11(start={0,0});
output Real[2] ceq_Sl12(start={0,0});
output Real[2] ceq_Sl13(start={0,0});
output Real[2] ceq_Sl14(start={0,0});

//Voltage Magnitude:
output Real cns_Vabs2;
output Real cns_Vabs3;
output Real cns_Vabs4;
output Real cns_Vabs5;
output Real cns_Vabs6;
output Real cns_Vabs7;
output Real cns_Vabs8;
output Real cns_Vabs9;
output Real cns_Vabs10;
output Real cns_Vabs11;
output Real cns_Vabs12;
output Real cns_Vabs13;
output Real cns_Vabs14;

//Generator Power:
output Real[2] Sg1(start={2.324,-0.16899999999999998});
output Real[2] Sg2(start={0.4,0.424});
output Real[2] Sg3(start={0.0,0.23399999999999999});
output Real[2] Sg6(start={0.0,0.122});
output Real[2] Sg8(start={0.0,0.174});

//Generator Current:
Real[2] Ig1;
Real[2] Ig2;
Real[2] Ig3;
Real[2] Ig6;
Real[2] Ig8;

//Load Current:
Real[2] Il2;
Real[2] Il3;
Real[2] Il4;
Real[2] Il5;
Real[2] Il6;
Real[2] Il9;
Real[2] Il10;
Real[2] Il11;
Real[2] Il12;
Real[2] Il13;
Real[2] Il14;



equation

//Generator Power Flow:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

Complex(Sg1[1],Sg1[2]) = Complex(Vr1[1],Vr1[2])*Complex(Ig1[1],-Ig1[2]);
Complex(Sg2[1],Sg2[2]) = Complex(Vr2[1],Vr2[2])*Complex(Ig2[1],-Ig2[2]);
Complex(Sg3[1],Sg3[2]) = Complex(Vr3[1],Vr3[2])*Complex(Ig3[1],-Ig3[2]);
Complex(Sg6[1],Sg6[2]) = Complex(Vr6[1],Vr6[2])*Complex(Ig6[1],-Ig6[2]);
Complex(Sg8[1],Sg8[2]) = Complex(Vr8[1],Vr8[2])*Complex(Ig8[1],-Ig8[2]);

//Load Power Flow Equations:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

Complex(Sl2[1],Sl2[2])=Complex(Vr2[1],Vr2[2])*Complex(Il2[1],-Il2[2]);
Complex(Sl3[1],Sl3[2])=Complex(Vr3[1],Vr3[2])*Complex(Il3[1],-Il3[2]);
Complex(Sl6[1],Sl6[2])=Complex(Vr6[1],Vr6[2])*Complex(Il6[1],-Il6[2]);


//Trick equality constraints for Loads:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

Complex(ceq_Sl4[1],ceq_Sl4[2])=Complex(Vr4[1],Vr4[2])*Complex(Il4[1],-Il4[2])-Complex(Sl4[1],Sl4[2]);
Complex(ceq_Sl5[1],ceq_Sl5[2])=Complex(Vr5[1],Vr5[2])*Complex(Il5[1],-Il5[2])-Complex(Sl5[1],Sl5[2]);
Complex(ceq_Sl9[1],ceq_Sl9[2])=Complex(Vr9[1],Vr9[2])*Complex(Il9[1],-Il9[2])-Complex(Sl9[1],Sl9[2]);
Complex(ceq_Sl10[1],ceq_Sl10[2])=Complex(Vr10[1],Vr10[2])*Complex(Il10[1],-Il10[2])-Complex(Sl10[1],Sl10[2]);
Complex(ceq_Sl11[1],ceq_Sl11[2])=Complex(Vr11[1],Vr11[2])*Complex(Il11[1],-Il11[2])-Complex(Sl11[1],Sl11[2]);
Complex(ceq_Sl12[1],ceq_Sl12[2])=Complex(Vr12[1],Vr12[2])*Complex(Il12[1],-Il12[2])-Complex(Sl12[1],Sl12[2]);
Complex(ceq_Sl13[1],ceq_Sl13[2])=Complex(Vr13[1],Vr13[2])*Complex(Il13[1],-Il13[2])-Complex(Sl13[1],Sl13[2]);
Complex(ceq_Sl14[1],ceq_Sl14[2])=Complex(Vr14[1],Vr14[2])*Complex(Il14[1],-Il14[2])-Complex(Sl14[1],Sl14[2]);

//Kirchhoff's Law:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

Complex(Ig1[1],Ig1[2]) = Complex(Vr1[1],Vr1[2])*Complex(6.025029055768224,(-19.447070205514382)) + Complex(Vr2[1],Vr2[2])*Complex((-4.999131600798035),15.263086523179553) + Complex(Vr5[1],Vr5[2])*Complex((-1.025897454970189),4.234983682334831);

Complex(Ig2[1],Ig2[2]) = Complex(Vr1[1],Vr1[2])*Complex((-4.999131600798035),15.263086523179553) + Complex(Vr2[1],Vr2[2])*Complex(9.521323610814779,(-30.272115398779064)) + Complex(Vr3[1],Vr3[2])*Complex((-1.1350191923073958),4.781863151757718) + Complex(Vr4[1],Vr4[2])*Complex((-1.686033150614943),5.115838325872083) + Complex(Vr5[1],Vr5[2])*Complex((-1.7011396670944048),5.193927397969713) + Complex(Il2[1],Il2[2]);

Complex(Ig3[1],Ig3[2]) = Complex(Vr2[1],Vr2[2])*Complex((-1.1350191923073958),4.781863151757718) + Complex(Vr3[1],Vr3[2])*Complex(3.1209949022329564,(-9.82238012935164)) + Complex(Vr4[1],Vr4[2])*Complex((-1.9859757099255606),5.0688169775939205) + Complex(Il3[1],Il3[2]);

Complex(0,0) = Complex(Vr2[1],Vr2[2])*Complex((-1.686033150614943),5.115838325872083) + Complex(Vr3[1],Vr3[2])*Complex((-1.9859757099255606),5.0688169775939205) + Complex(Vr4[1],Vr4[2])*Complex(10.512989522036175,(-38.654171207607796)) + Complex(Vr5[1],Vr5[2])*Complex((-6.840980661495672),21.578553981691588) + Complex(Vr7[1],Vr7[2])*Complex(0.0,4.889512660317341) + Complex(Vr9[1],Vr9[2])*Complex(0.0,1.8554995578159006) + Complex(Il4[1],Il4[2]);

Complex(0,0) = Complex(Vr1[1],Vr1[2])*Complex((-1.025897454970189),4.234983682334831) + Complex(Vr2[1],Vr2[2])*Complex((-1.7011396670944048),5.193927397969713) + Complex(Vr4[1],Vr4[2])*Complex((-6.840980661495672),21.578553981691588) + Complex(Vr5[1],Vr5[2])*Complex(9.568017783560265,(-35.533639456044824)) + Complex(Vr6[1],Vr6[2])*Complex(0.0,4.257445335253384) + Complex(Il5[1],Il5[2]);

Complex(Ig6[1],Ig6[2]) = Complex(Vr5[1],Vr5[2])*Complex(0.0,4.257445335253384) + Complex(Vr6[1],Vr6[2])*Complex(6.579923407466222,(-17.34073280991911)) + Complex(Vr11[1],Vr11[2])*Complex((-1.9550285631772604),4.0940743442404415) + Complex(Vr12[1],Vr12[2])*Complex((-1.525967440450974),3.1759639650294003) + Complex(Vr13[1],Vr13[2])*Complex((-3.0989274038379877),6.102755448193116) + Complex(Il6[1],Il6[2]);

Complex(0,0) = Complex(Vr4[1],Vr4[2])*Complex(0.0,4.889512660317341) + Complex(Vr7[1],Vr7[2])*Complex(0.0,(-19.549005948264654)) + Complex(Vr8[1],Vr8[2])*Complex(0.0,5.676979846721544) + Complex(Vr9[1],Vr9[2])*Complex(0.0,9.09008271975275);

Complex(Ig8[1],Ig8[2]) = Complex(Vr7[1],Vr7[2])*Complex(0.0,5.676979846721544) + Complex(Vr8[1],Vr8[2])*Complex(0.0,(-5.676979846721544));

Complex(0,0) = Complex(Vr4[1],Vr4[2])*Complex(0.0,1.8554995578159006) + Complex(Vr7[1],Vr7[2])*Complex(0.0,9.09008271975275) + Complex(Vr9[1],Vr9[2])*Complex(5.326055039467359,(-24.092506375267877)) + Complex(Vr10[1],Vr10[2])*Complex((-3.902049552447428),10.365394127060915) + Complex(Vr14[1],Vr14[2])*Complex((-1.4240054870199312),3.0290504569306034) + Complex(Il9[1],Il9[2]);

Complex(0,0) = Complex(Vr9[1],Vr9[2])*Complex((-3.902049552447428),10.365394127060915) + Complex(Vr10[1],Vr10[2])*Complex(5.782934306147828,(-14.768337876521436)) + Complex(Vr11[1],Vr11[2])*Complex((-1.8808847537003996),4.402943749460521) + Complex(Il10[1],Il10[2]);

Complex(0,0) = Complex(Vr6[1],Vr6[2])*Complex((-1.9550285631772604),4.0940743442404415) + Complex(Vr10[1],Vr10[2])*Complex((-1.8808847537003996),4.402943749460521) + Complex(Vr11[1],Vr11[2])*Complex(3.83591331687766,(-8.497018093700962)) + Complex(Il11[1],Il11[2]);

Complex(0,0) = Complex(Vr6[1],Vr6[2])*Complex((-1.525967440450974),3.1759639650294003) + Complex(Vr12[1],Vr12[2])*Complex(4.014992027272893,(-5.427938591201612)) + Complex(Vr13[1],Vr13[2])*Complex((-2.4890245868219187),2.251974626172212) + Complex(Il12[1],Il12[2]);

Complex(0,0) = Complex(Vr6[1],Vr6[2])*Complex((-3.0989274038379877),6.102755448193116) + Complex(Vr12[1],Vr12[2])*Complex((-2.4890245868219187),2.251974626172212) + Complex(Vr13[1],Vr13[2])*Complex(6.724946148466233,(-10.66969354947068)) + Complex(Vr14[1],Vr14[2])*Complex((-1.1369941578063267),2.314963475105352) + Complex(Il13[1],Il13[2]);

Complex(0,0) = Complex(Vr9[1],Vr9[2])*Complex((-1.4240054870199312),3.0290504569306034) + Complex(Vr13[1],Vr13[2])*Complex((-1.1369941578063267),2.314963475105352) + Complex(Vr14[1],Vr14[2])*Complex(2.560999644826258,(-5.344013932035955)) + Complex(Il14[1],Il14[2]);


//Branch Flow Limits:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

cns_I1_2 = I1_2.re^2 + I1_2.im^2 ;
cns_I1_5 = I1_5.re^2 + I1_5.im^2 ;
cns_I2_3 = I2_3.re^2 + I2_3.im^2 ;
cns_I2_4 = I2_4.re^2 + I2_4.im^2 ;
cns_I2_5 = I2_5.re^2 + I2_5.im^2 ;
cns_I3_4 = I3_4.re^2 + I3_4.im^2 ;
cns_I4_5 = I4_5.re^2 + I4_5.im^2 ;
cns_I4_7 = I4_7.re^2 + I4_7.im^2 ;
cns_I4_9 = I4_9.re^2 + I4_9.im^2 ;
cns_I5_6 = I5_6.re^2 + I5_6.im^2 ;
cns_I6_11 = I6_11.re^2 + I6_11.im^2 ;
cns_I6_12 = I6_12.re^2 + I6_12.im^2 ;
cns_I6_13 = I6_13.re^2 + I6_13.im^2 ;
cns_I7_8 = I7_8.re^2 + I7_8.im^2 ;
cns_I7_9 = I7_9.re^2 + I7_9.im^2 ;
cns_I9_10 = I9_10.re^2 + I9_10.im^2 ;
cns_I9_14 = I9_14.re^2 + I9_14.im^2 ;
cns_I10_11 = I10_11.re^2 + I10_11.im^2 ;
cns_I12_13 = I12_13.re^2 + I12_13.im^2 ;
cns_I13_14 = I13_14.re^2 + I13_14.im^2 ;

I1_2=Complex(Vr1[1],Vr1[2])*Complex(4.999131600798035,-15.236686523179552)+Complex(Vr2[1],Vr2[2])*Complex(-4.999131600798035,15.263086523179553);
I1_5=Complex(Vr1[1],Vr1[2])*Complex(1.025897454970189,-4.210383682334831)+Complex(Vr5[1],Vr5[2])*Complex(-1.025897454970189,4.234983682334831);
I2_3=Complex(Vr2[1],Vr2[2])*Complex(1.1350191923073958,-4.759963151757718)+Complex(Vr3[1],Vr3[2])*Complex(-1.1350191923073958,4.781863151757718);
I2_4=Complex(Vr2[1],Vr2[2])*Complex(1.686033150614943,-5.098838325872083)+Complex(Vr4[1],Vr4[2])*Complex(-1.686033150614943,5.115838325872083);
I2_5=Complex(Vr2[1],Vr2[2])*Complex(1.7011396670944048,-5.176627397969713)+Complex(Vr5[1],Vr5[2])*Complex(-1.7011396670944048,5.193927397969713);
I3_4=Complex(Vr3[1],Vr3[2])*Complex(1.9859757099255606,-5.06241697759392)+Complex(Vr4[1],Vr4[2])*Complex(-1.9859757099255606,5.0688169775939205);
I4_5=Complex(Vr4[1],Vr4[2])*Complex(6.840980661495672,-21.578553981691588)+Complex(Vr5[1],Vr5[2])*Complex(-6.840980661495672,21.578553981691588);
I4_7=Complex(Vr4[1],Vr4[2])*Complex(0.0,-4.999501697665993)+Complex(Vr7[1],Vr7[2])*Complex(-0.0,4.889512660317341);
I4_9=Complex(Vr4[1],Vr4[2])*Complex(0.0,-1.914860224784211)+Complex(Vr9[1],Vr9[2])*Complex(-0.0,1.8554995578159006);
I5_6=Complex(Vr5[1],Vr5[2])*Complex(0.0,-4.568074394048695)+Complex(Vr6[1],Vr6[2])*Complex(-0.0,4.257445335253384);
I6_11=Complex(Vr6[1],Vr6[2])*Complex(1.9550285631772604,-4.0940743442404415)+Complex(Vr11[1],Vr11[2])*Complex(-1.9550285631772604,4.0940743442404415);
I6_12=Complex(Vr6[1],Vr6[2])*Complex(1.525967440450974,-3.1759639650294003)+Complex(Vr12[1],Vr12[2])*Complex(-1.525967440450974,3.1759639650294003);
I6_13=Complex(Vr6[1],Vr6[2])*Complex(3.0989274038379877,-6.102755448193116)+Complex(Vr13[1],Vr13[2])*Complex(-3.0989274038379877,6.102755448193116);
I7_8=Complex(Vr7[1],Vr7[2])*Complex(0.0,-5.676979846721544)+Complex(Vr8[1],Vr8[2])*Complex(-0.0,5.676979846721544);
I7_9=Complex(Vr7[1],Vr7[2])*Complex(0.0,-9.09008271975275)+Complex(Vr9[1],Vr9[2])*Complex(-0.0,9.09008271975275);
I9_10=Complex(Vr9[1],Vr9[2])*Complex(3.902049552447428,-10.365394127060915)+Complex(Vr10[1],Vr10[2])*Complex(-3.902049552447428,10.365394127060915);
I9_14=Complex(Vr9[1],Vr9[2])*Complex(1.4240054870199312,-3.0290504569306034)+Complex(Vr14[1],Vr14[2])*Complex(-1.4240054870199312,3.0290504569306034);
I10_11=Complex(Vr10[1],Vr10[2])*Complex(1.8808847537003996,-4.402943749460521)+Complex(Vr11[1],Vr11[2])*Complex(-1.8808847537003996,4.402943749460521);
I12_13=Complex(Vr12[1],Vr12[2])*Complex(2.4890245868219187,-2.251974626172212)+Complex(Vr13[1],Vr13[2])*Complex(-2.4890245868219187,2.251974626172212);
I13_14=Complex(Vr13[1],Vr13[2])*Complex(1.1369941578063267,-2.314963475105352)+Complex(Vr14[1],Vr14[2])*Complex(-1.1369941578063267,2.314963475105352);

//Voltage Magnitude Equations:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

cns_Vabs2 = Vr2[1]^2 + Vr2[2]^2;
cns_Vabs3 = Vr3[1]^2 + Vr3[2]^2;
cns_Vabs4 = Vr4[1]^2 + Vr4[2]^2;
cns_Vabs5 = Vr5[1]^2 + Vr5[2]^2;
cns_Vabs6 = Vr6[1]^2 + Vr6[2]^2;
cns_Vabs7 = Vr7[1]^2 + Vr7[2]^2;
cns_Vabs8 = Vr8[1]^2 + Vr8[2]^2;
cns_Vabs9 = Vr9[1]^2 + Vr9[2]^2;
cns_Vabs10 = Vr10[1]^2 + Vr10[2]^2;
cns_Vabs11 = Vr11[1]^2 + Vr11[2]^2;
cns_Vabs12 = Vr12[1]^2 + Vr12[2]^2;
cns_Vabs13 = Vr13[1]^2 + Vr13[2]^2;
cns_Vabs14 = Vr14[1]^2 + Vr14[2]^2;

end case14_2;