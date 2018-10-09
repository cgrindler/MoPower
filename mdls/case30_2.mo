model case30_2
extends Modelica;
import Modelica.Math;

// Inputs:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

//Voltage:
input Real[2] Vr1(start={1.0,0.0});
input Real[2] Vr2(start={1.0,0.0});
input Real[2] Vr3(start={1.0,0.0});
input Real[2] Vr4(start={1.0,0.0});
input Real[2] Vr7(start={1.0,0.0});
input Real[2] Vr8(start={1.0,0.0});
input Real[2] Vr10(start={1.0,0.0});
input Real[2] Vr12(start={1.0,0.0});
input Real[2] Vr13(start={1.0,0.0});
input Real[2] Vr14(start={1.0,0.0});
input Real[2] Vr15(start={1.0,0.0});
input Real[2] Vr16(start={1.0,0.0});
input Real[2] Vr17(start={1.0,0.0});
input Real[2] Vr18(start={1.0,0.0});
input Real[2] Vr19(start={1.0,0.0});
input Real[2] Vr20(start={1.0,0.0});
input Real[2] Vr21(start={1.0,0.0});
input Real[2] Vr22(start={1.0,0.0});
input Real[2] Vr23(start={1.0,0.0});
input Real[2] Vr24(start={1.0,0.0});
input Real[2] Vr26(start={1.0,0.0});
input Real[2] Vr27(start={1.0,0.0});
input Real[2] Vr29(start={1.0,0.0});
input Real[2] Vr30(start={1.0,0.0});


//Load Power:
input Real[2] Sl2(start={0.217,0.127});
input Real[2] Sl3(start={0.024,0.012});
input Real[2] Sl4(start={0.076,0.016});
input Real[2] Sl7(start={0.228,0.109});
input Real[2] Sl8(start={0.3,0.3});
input Real[2] Sl10(start={0.057999999999999996,0.02});
input Real[2] Sl12(start={0.11199999999999999,0.075});
input Real[2] Sl14(start={0.062,0.016});
input Real[2] Sl15(start={0.08199999999999999,0.025});
input Real[2] Sl16(start={0.035,0.018000000000000002});
input Real[2] Sl17(start={0.09,0.057999999999999996});
input Real[2] Sl18(start={0.032,0.009000000000000001});
input Real[2] Sl19(start={0.095,0.034});
input Real[2] Sl20(start={0.022000000000000002,0.006999999999999999});
input Real[2] Sl21(start={0.175,0.11199999999999999});
input Real[2] Sl23(start={0.032,0.016});
input Real[2] Sl24(start={0.087,0.067});
input Real[2] Sl26(start={0.035,0.023});
input Real[2] Sl29(start={0.024,0.009000000000000001});
input Real[2] Sl30(start={0.106,0.019});

// Outputs:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

//Voltage:
output Real[2] Vr5(start={1.0,0.0});
output Real[2] Vr6(start={1.0,0.0});
output Real[2] Vr9(start={1.0,0.0});
output Real[2] Vr11(start={1.0,0.0});
output Real[2] Vr25(start={1.0,0.0});
output Real[2] Vr28(start={1.0,0.0});


//All Branch Flows:
output Real cns_I1_2;
output Real cns_I1_3;
output Real cns_I2_4;
output Real cns_I3_4;
output Real cns_I2_5;
output Real cns_I2_6;
output Real cns_I4_6;
output Real cns_I5_7;
output Real cns_I6_7;
output Real cns_I6_8;
output Real cns_I6_9;
output Real cns_I6_10;
output Real cns_I9_11;
output Real cns_I9_10;
output Real cns_I4_12;
output Real cns_I12_13;
output Real cns_I12_14;
output Real cns_I12_15;
output Real cns_I12_16;
output Real cns_I14_15;
output Real cns_I16_17;
output Real cns_I15_18;
output Real cns_I18_19;
output Real cns_I19_20;
output Real cns_I10_20;
output Real cns_I10_17;
output Real cns_I10_21;
output Real cns_I10_22;
output Real cns_I21_22;
output Real cns_I15_23;
output Real cns_I22_24;
output Real cns_I23_24;
output Real cns_I24_25;
output Real cns_I25_26;
output Real cns_I25_27;
output Real cns_I28_27;
output Real cns_I27_29;
output Real cns_I27_30;
output Real cns_I29_30;
output Real cns_I8_28;
output Real cns_I6_28;

Complex I1_2;
Complex I1_3;
Complex I2_4;
Complex I3_4;
Complex I2_5;
Complex I2_6;
Complex I4_6;
Complex I5_7;
Complex I6_7;
Complex I6_8;
Complex I6_9;
Complex I6_10;
Complex I9_11;
Complex I9_10;
Complex I4_12;
Complex I12_13;
Complex I12_14;
Complex I12_15;
Complex I12_16;
Complex I14_15;
Complex I16_17;
Complex I15_18;
Complex I18_19;
Complex I19_20;
Complex I10_20;
Complex I10_17;
Complex I10_21;
Complex I10_22;
Complex I21_22;
Complex I15_23;
Complex I22_24;
Complex I23_24;
Complex I24_25;
Complex I25_26;
Complex I25_27;
Complex I28_27;
Complex I27_29;
Complex I27_30;
Complex I29_30;
Complex I8_28;
Complex I6_28;

//Trick equality constraints for Loads:
output Real[2] ceq_Sl3(start={0,0});
output Real[2] ceq_Sl4(start={0,0});
output Real[2] ceq_Sl7(start={0,0});
output Real[2] ceq_Sl8(start={0,0});
output Real[2] ceq_Sl10(start={0,0});
output Real[2] ceq_Sl12(start={0,0});
output Real[2] ceq_Sl14(start={0,0});
output Real[2] ceq_Sl15(start={0,0});
output Real[2] ceq_Sl16(start={0,0});
output Real[2] ceq_Sl17(start={0,0});
output Real[2] ceq_Sl18(start={0,0});
output Real[2] ceq_Sl19(start={0,0});
output Real[2] ceq_Sl20(start={0,0});
output Real[2] ceq_Sl21(start={0,0});
output Real[2] ceq_Sl24(start={0,0});
output Real[2] ceq_Sl26(start={0,0});
output Real[2] ceq_Sl29(start={0,0});
output Real[2] ceq_Sl30(start={0,0});

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
output Real cns_Vabs15;
output Real cns_Vabs16;
output Real cns_Vabs17;
output Real cns_Vabs18;
output Real cns_Vabs19;
output Real cns_Vabs20;
output Real cns_Vabs21;
output Real cns_Vabs22;
output Real cns_Vabs23;
output Real cns_Vabs24;
output Real cns_Vabs25;
output Real cns_Vabs26;
output Real cns_Vabs27;
output Real cns_Vabs28;
output Real cns_Vabs29;
output Real cns_Vabs30;

//Generator Power:
output Real[2] Sg1(start={0.2354,0.0});
output Real[2] Sg2(start={0.6097,0.0});
output Real[2] Sg22(start={0.2159,0.0});
output Real[2] Sg27(start={0.2691,0.0});
output Real[2] Sg23(start={0.192,0.0});
output Real[2] Sg13(start={0.37,0.0});

//Generator Current:
Real[2] Ig1;
Real[2] Ig2;
Real[2] Ig22;
Real[2] Ig27;
Real[2] Ig23;
Real[2] Ig13;

//Load Current:
Real[2] Il2;
Real[2] Il3;
Real[2] Il4;
Real[2] Il7;
Real[2] Il8;
Real[2] Il10;
Real[2] Il12;
Real[2] Il14;
Real[2] Il15;
Real[2] Il16;
Real[2] Il17;
Real[2] Il18;
Real[2] Il19;
Real[2] Il20;
Real[2] Il21;
Real[2] Il23;
Real[2] Il24;
Real[2] Il26;
Real[2] Il29;
Real[2] Il30;



equation

//Generator Power Flow:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

Complex(Sg1[1],Sg1[2]) = Complex(Vr1[1],Vr1[2])*Complex(Ig1[1],-Ig1[2]);
Complex(Sg2[1],Sg2[2]) = Complex(Vr2[1],Vr2[2])*Complex(Ig2[1],-Ig2[2]);
Complex(Sg22[1],Sg22[2]) = Complex(Vr22[1],Vr22[2])*Complex(Ig22[1],-Ig22[2]);
Complex(Sg27[1],Sg27[2]) = Complex(Vr27[1],Vr27[2])*Complex(Ig27[1],-Ig27[2]);
Complex(Sg23[1],Sg23[2]) = Complex(Vr23[1],Vr23[2])*Complex(Ig23[1],-Ig23[2]);
Complex(Sg13[1],Sg13[2]) = Complex(Vr13[1],Vr13[2])*Complex(Ig13[1],-Ig13[2]);

//Load Power Flow Equations:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

Complex(Sl2[1],Sl2[2])=Complex(Vr2[1],Vr2[2])*Complex(Il2[1],-Il2[2]);
Complex(Sl23[1],Sl23[2])=Complex(Vr23[1],Vr23[2])*Complex(Il23[1],-Il23[2]);


//Trick equality constraints for Loads:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

Complex(ceq_Sl3[1],ceq_Sl3[2])=Complex(Vr3[1],Vr3[2])*Complex(Il3[1],-Il3[2])-Complex(Sl3[1],Sl3[2]);
Complex(ceq_Sl4[1],ceq_Sl4[2])=Complex(Vr4[1],Vr4[2])*Complex(Il4[1],-Il4[2])-Complex(Sl4[1],Sl4[2]);
Complex(ceq_Sl7[1],ceq_Sl7[2])=Complex(Vr7[1],Vr7[2])*Complex(Il7[1],-Il7[2])-Complex(Sl7[1],Sl7[2]);
Complex(ceq_Sl8[1],ceq_Sl8[2])=Complex(Vr8[1],Vr8[2])*Complex(Il8[1],-Il8[2])-Complex(Sl8[1],Sl8[2]);
Complex(ceq_Sl10[1],ceq_Sl10[2])=Complex(Vr10[1],Vr10[2])*Complex(Il10[1],-Il10[2])-Complex(Sl10[1],Sl10[2]);
Complex(ceq_Sl12[1],ceq_Sl12[2])=Complex(Vr12[1],Vr12[2])*Complex(Il12[1],-Il12[2])-Complex(Sl12[1],Sl12[2]);
Complex(ceq_Sl14[1],ceq_Sl14[2])=Complex(Vr14[1],Vr14[2])*Complex(Il14[1],-Il14[2])-Complex(Sl14[1],Sl14[2]);
Complex(ceq_Sl15[1],ceq_Sl15[2])=Complex(Vr15[1],Vr15[2])*Complex(Il15[1],-Il15[2])-Complex(Sl15[1],Sl15[2]);
Complex(ceq_Sl16[1],ceq_Sl16[2])=Complex(Vr16[1],Vr16[2])*Complex(Il16[1],-Il16[2])-Complex(Sl16[1],Sl16[2]);
Complex(ceq_Sl17[1],ceq_Sl17[2])=Complex(Vr17[1],Vr17[2])*Complex(Il17[1],-Il17[2])-Complex(Sl17[1],Sl17[2]);
Complex(ceq_Sl18[1],ceq_Sl18[2])=Complex(Vr18[1],Vr18[2])*Complex(Il18[1],-Il18[2])-Complex(Sl18[1],Sl18[2]);
Complex(ceq_Sl19[1],ceq_Sl19[2])=Complex(Vr19[1],Vr19[2])*Complex(Il19[1],-Il19[2])-Complex(Sl19[1],Sl19[2]);
Complex(ceq_Sl20[1],ceq_Sl20[2])=Complex(Vr20[1],Vr20[2])*Complex(Il20[1],-Il20[2])-Complex(Sl20[1],Sl20[2]);
Complex(ceq_Sl21[1],ceq_Sl21[2])=Complex(Vr21[1],Vr21[2])*Complex(Il21[1],-Il21[2])-Complex(Sl21[1],Sl21[2]);
Complex(ceq_Sl24[1],ceq_Sl24[2])=Complex(Vr24[1],Vr24[2])*Complex(Il24[1],-Il24[2])-Complex(Sl24[1],Sl24[2]);
Complex(ceq_Sl26[1],ceq_Sl26[2])=Complex(Vr26[1],Vr26[2])*Complex(Il26[1],-Il26[2])-Complex(Sl26[1],Sl26[2]);
Complex(ceq_Sl29[1],ceq_Sl29[2])=Complex(Vr29[1],Vr29[2])*Complex(Il29[1],-Il29[2])-Complex(Sl29[1],Sl29[2]);
Complex(ceq_Sl30[1],ceq_Sl30[2])=Complex(Vr30[1],Vr30[2])*Complex(Il30[1],-Il30[2])-Complex(Sl30[1],Sl30[2]);

//Kirchhoff's Law:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

Complex(Ig1[1],Ig1[2]) = Complex(Vr1[1],Vr1[2])*Complex(6.295336787564768,(-19.897279792746115)) + Complex(Vr2[1],Vr2[2])*Complex((-5.000000000000001),15.0) + Complex(Vr3[1],Vr3[2])*Complex((-1.295336787564767),4.922279792746115);

Complex(Ig2[1],Ig2[2]) = Complex(Vr1[1],Vr1[2])*Complex((-5.000000000000001),15.0) + Complex(Vr2[1],Vr2[2])*Complex(9.689291101055808,(-29.891651583710406)) + Complex(Vr4[1],Vr4[2])*Complex((-1.8461538461538456),5.23076923076923) + Complex(Vr5[1],Vr5[2])*Complex((-1.176470588235294),4.705882352941176) + Complex(Vr6[1],Vr6[2])*Complex((-1.6666666666666665),5.0) + Complex(Il2[1],Il2[2]);

Complex(0,0) = Complex(Vr1[1],Vr1[2])*Complex((-1.295336787564767),4.922279792746115) + Complex(Vr3[1],Vr3[2])*Complex(7.177689728741237,(-28.441691557451996)) + Complex(Vr4[1],Vr4[2])*Complex((-5.88235294117647),23.52941176470588) + Complex(Il3[1],Il3[2]);

Complex(0,0) = Complex(Vr2[1],Vr2[2])*Complex((-1.8461538461538456),5.23076923076923) + Complex(Vr3[1],Vr3[2])*Complex((-5.88235294117647),23.52941176470588) + Complex(Vr4[1],Vr4[2])*Complex(13.610859728506785,(-56.12574660633484)) + Complex(Vr6[1],Vr6[2])*Complex((-5.88235294117647),23.52941176470588) + Complex(Vr12[1],Vr12[2])*Complex(0.0,3.846153846153846) + Complex(Il4[1],Il4[2]);

Complex(0,0) = Complex(Vr2[1],Vr2[2])*Complex((-1.176470588235294),4.705882352941176) + Complex(Vr5[1],Vr5[2])*Complex(4.135050469892098,(-11.789574068917508)) + Complex(Vr7[1],Vr7[2])*Complex((-2.9585798816568047),7.100591715976331);

Complex(0,0) = Complex(Vr2[1],Vr2[2])*Complex((-1.6666666666666665),5.0) + Complex(Vr4[1],Vr4[2])*Complex((-5.88235294117647),23.52941176470588) + Complex(Vr6[1],Vr6[2])*Complex(22.5409615901155,(-84.54534668661984)) + Complex(Vr7[1],Vr7[2])*Complex((-4.10958904109589),10.95890410958904) + Complex(Vr8[1],Vr8[2])*Complex((-5.88235294117647),23.52941176470588) + Complex(Vr9[1],Vr9[2])*Complex(0.0,4.761904761904762) + Complex(Vr10[1],Vr10[2])*Complex(0.0,1.7857142857142856) + Complex(Vr28[1],Vr28[2])*Complex((-5.000000000000001),15.0);

Complex(0,0) = Complex(Vr5[1],Vr5[2])*Complex((-2.9585798816568047),7.100591715976331) + Complex(Vr6[1],Vr6[2])*Complex((-4.10958904109589),10.95890410958904) + Complex(Vr7[1],Vr7[2])*Complex(7.068168922752695,(-18.049495825565373)) + Complex(Il7[1],Il7[2]);

Complex(0,0) = Complex(Vr6[1],Vr6[2])*Complex((-5.88235294117647),23.52941176470588) + Complex(Vr8[1],Vr8[2])*Complex(7.258499730167296,(-28.106567728008635)) + Complex(Vr28[1],Vr28[2])*Complex((-1.3761467889908257),4.587155963302752) + Complex(Il8[1],Il8[2]);

Complex(0,0) = Complex(Vr6[1],Vr6[2])*Complex(0.0,4.761904761904762) + Complex(Vr9[1],Vr9[2])*Complex(0.0,(-18.614718614718615)) + Complex(Vr10[1],Vr10[2])*Complex(0.0,9.090909090909092) + Complex(Vr11[1],Vr11[2])*Complex(0.0,4.761904761904762);

Complex(0,0) = Complex(Vr6[1],Vr6[2])*Complex(0.0,1.7857142857142856) + Complex(Vr9[1],Vr9[2])*Complex(0.0,9.090909090909092) + Complex(Vr10[1],Vr10[2])*Complex(13.560885290781265,(-43.40193406394545)) + Complex(Vr17[1],Vr17[2])*Complex((-4.10958904109589),10.95890410958904) + Complex(Vr20[1],Vr20[2])*Complex((-1.7241379310344827),4.022988505747127) + Complex(Vr21[1],Vr21[2])*Complex((-5.1724137931034475),12.068965517241379) + Complex(Vr22[1],Vr22[2])*Complex((-2.5547445255474455),5.474452554744525) + Complex(Il10[1],Il10[2]);

Complex(0,0) = Complex(Vr9[1],Vr9[2])*Complex(0.0,4.761904761904762) + Complex(Vr11[1],Vr11[2])*Complex(0.0,(-4.761904761904762));

Complex(0,0) = Complex(Vr4[1],Vr4[2])*Complex(0.0,3.846153846153846) + Complex(Vr12[1],Vr12[2])*Complex(6.545525679560139,(-24.2810496066258)) + Complex(Vr13[1],Vr13[2])*Complex(0.0,7.142857142857142) + Complex(Vr14[1],Vr14[2])*Complex((-1.4634146341463414),3.1707317073170733) + Complex(Vr15[1],Vr15[2])*Complex((-3.2110091743119273),5.963302752293578) + Complex(Vr16[1],Vr16[2])*Complex((-1.871101871101871),4.158004158004158) + Complex(Il12[1],Il12[2]);

Complex(Ig13[1],Ig13[2]) = Complex(Vr12[1],Vr12[2])*Complex(0.0,7.142857142857142) + Complex(Vr13[1],Vr13[2])*Complex(0.0,(-7.142857142857142));

Complex(0,0) = Complex(Vr12[1],Vr12[2])*Complex((-1.4634146341463414),3.1707317073170733) + Complex(Vr14[1],Vr14[2])*Complex(3.952102416951771,(-5.4331751462311)) + Complex(Vr15[1],Vr15[2])*Complex((-2.4886877828054295),2.262443438914027) + Complex(Il14[1],Il14[2]);

Complex(0,0) = Complex(Vr12[1],Vr12[2])*Complex((-3.2110091743119273),5.963302752293578) + Complex(Vr14[1],Vr14[2])*Complex((-2.4886877828054295),2.262443438914027) + Complex(Vr15[1],Vr15[2])*Complex(9.517878775299176,(-15.862109827571242)) + Complex(Vr18[1],Vr18[2])*Complex((-1.8181818181818181),3.6363636363636362) + Complex(Vr23[1],Vr23[2])*Complex((-2.0),4.0) + Complex(Il15[1],Il15[2]);

Complex(0,0) = Complex(Vr12[1],Vr12[2])*Complex((-1.871101871101871),4.158004158004158) + Complex(Vr16[1],Vr16[2])*Complex(3.7534548122783415,(-8.628592393298277)) + Complex(Vr17[1],Vr17[2])*Complex((-1.8823529411764706),4.470588235294118) + Complex(Il16[1],Il16[2]);

Complex(0,0) = Complex(Vr10[1],Vr10[2])*Complex((-4.10958904109589),10.95890410958904) + Complex(Vr16[1],Vr16[2])*Complex((-1.8823529411764706),4.470588235294118) + Complex(Vr17[1],Vr17[2])*Complex(5.99194198227236,(-15.429492344883158)) + Complex(Il17[1],Il17[2]);

Complex(0,0) = Complex(Vr15[1],Vr15[2])*Complex((-1.8181818181818181),3.6363636363636362) + Complex(Vr18[1],Vr18[2])*Complex(4.745011086474501,(-9.977827050997783)) + Complex(Vr19[1],Vr19[2])*Complex((-2.926829268292683),6.341463414634147) + Complex(Il18[1],Il18[2]);

Complex(0,0) = Complex(Vr18[1],Vr18[2])*Complex((-2.926829268292683),6.341463414634147) + Complex(Vr19[1],Vr19[2])*Complex(8.09924306139613,(-18.410428931875526)) + Complex(Vr20[1],Vr20[2])*Complex((-5.1724137931034475),12.068965517241379) + Complex(Il19[1],Il19[2]);

Complex(0,0) = Complex(Vr10[1],Vr10[2])*Complex((-1.7241379310344827),4.022988505747127) + Complex(Vr19[1],Vr19[2])*Complex((-5.1724137931034475),12.068965517241379) + Complex(Vr20[1],Vr20[2])*Complex(6.896551724137931,(-16.091954022988507)) + Complex(Il20[1],Il20[2]);

Complex(0,0) = Complex(Vr10[1],Vr10[2])*Complex((-5.1724137931034475),12.068965517241379) + Complex(Vr21[1],Vr21[2])*Complex(25.17241379310345,(-52.06896551724138)) + Complex(Vr22[1],Vr22[2])*Complex((-20.0),40.0) + Complex(Il21[1],Il21[2]);

Complex(Ig22[1],Ig22[2]) = Complex(Vr10[1],Vr10[2])*Complex((-2.5547445255474455),5.474452554744525) + Complex(Vr21[1],Vr21[2])*Complex((-20.0),40.0) + Complex(Vr22[1],Vr22[2])*Complex(25.11884708965001,(-49.32060640089837)) + Complex(Vr24[1],Vr24[2])*Complex((-2.564102564102564),3.846153846153846);

Complex(Ig23[1],Ig23[2]) = Complex(Vr15[1],Vr15[2])*Complex((-2.0),4.0) + Complex(Vr23[1],Vr23[2])*Complex(3.447661469933185,(-7.006681514476615)) + Complex(Vr24[1],Vr24[2])*Complex((-1.4476614699331847),3.0066815144766146) + Complex(Il23[1],Il23[2]);

Complex(0,0) = Complex(Vr22[1],Vr22[2])*Complex((-2.564102564102564),3.846153846153846) + Complex(Vr23[1],Vr23[2])*Complex((-1.4476614699331847),3.0066815144766146) + Complex(Vr24[1],Vr24[2])*Complex(5.322108861621956,(-9.128297429595976)) + Complex(Vr25[1],Vr25[2])*Complex((-1.3103448275862069),2.2758620689655173) + Complex(Il24[1],Il24[2]);

Complex(0,0) = Complex(Vr24[1],Vr24[2])*Complex((-1.3103448275862069),2.2758620689655173) + Complex(Vr25[1],Vr25[2])*Complex(4.475953396031775,(-7.849152929301711)) + Complex(Vr26[1],Vr26[2])*Complex((-1.2083131947800871),1.8366360560657322) + Complex(Vr27[1],Vr27[2])*Complex((-1.9572953736654803),3.7366548042704624);

Complex(0,0) = Complex(Vr25[1],Vr25[2])*Complex((-1.2083131947800871),1.8366360560657322) + Complex(Vr26[1],Vr26[2])*Complex(1.2083131947800871,(-1.8366360560657322)) + Complex(Il26[1],Il26[2]);

Complex(Ig27[1],Ig27[2]) = Complex(Vr25[1],Vr25[2])*Complex((-1.9572953736654803),3.7366548042704624) + Complex(Vr27[1],Vr27[2])*Complex(3.62798458298957,(-9.402560061076974)) + Complex(Vr28[1],Vr28[2])*Complex(0.0,2.5) + Complex(Vr29[1],Vr29[2])*Complex((-0.9786476868327402),1.8683274021352312) + Complex(Vr30[1],Vr30[2])*Complex((-0.6920415224913495),1.2975778546712804);

Complex(0,0) = Complex(Vr6[1],Vr6[2])*Complex((-5.000000000000001),15.0) + Complex(Vr8[1],Vr8[2])*Complex((-1.3761467889908257),4.587155963302752) + Complex(Vr27[1],Vr27[2])*Complex(0.0,2.5) + Complex(Vr28[1],Vr28[2])*Complex(6.376146788990827,(-22.07215596330275));

Complex(0,0) = Complex(Vr27[1],Vr27[2])*Complex((-0.9786476868327402),1.8683274021352312) + Complex(Vr29[1],Vr29[2])*Complex(1.901369716821206,(-3.5984312083636047)) + Complex(Vr30[1],Vr30[2])*Complex((-0.9227220299884659),1.7301038062283736) + Complex(Il29[1],Il29[2]);

Complex(0,0) = Complex(Vr27[1],Vr27[2])*Complex((-0.6920415224913495),1.2975778546712804) + Complex(Vr29[1],Vr29[2])*Complex((-0.9227220299884659),1.7301038062283736) + Complex(Vr30[1],Vr30[2])*Complex(1.6147635524798154,(-3.027681660899654)) + Complex(Il30[1],Il30[2]);


//Branch Flow Limits:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

cns_I1_2 = I1_2.re^2 + I1_2.im^2 ;
cns_I1_3 = I1_3.re^2 + I1_3.im^2 ;
cns_I2_4 = I2_4.re^2 + I2_4.im^2 ;
cns_I3_4 = I3_4.re^2 + I3_4.im^2 ;
cns_I2_5 = I2_5.re^2 + I2_5.im^2 ;
cns_I2_6 = I2_6.re^2 + I2_6.im^2 ;
cns_I4_6 = I4_6.re^2 + I4_6.im^2 ;
cns_I5_7 = I5_7.re^2 + I5_7.im^2 ;
cns_I6_7 = I6_7.re^2 + I6_7.im^2 ;
cns_I6_8 = I6_8.re^2 + I6_8.im^2 ;
cns_I6_9 = I6_9.re^2 + I6_9.im^2 ;
cns_I6_10 = I6_10.re^2 + I6_10.im^2 ;
cns_I9_11 = I9_11.re^2 + I9_11.im^2 ;
cns_I9_10 = I9_10.re^2 + I9_10.im^2 ;
cns_I4_12 = I4_12.re^2 + I4_12.im^2 ;
cns_I12_13 = I12_13.re^2 + I12_13.im^2 ;
cns_I12_14 = I12_14.re^2 + I12_14.im^2 ;
cns_I12_15 = I12_15.re^2 + I12_15.im^2 ;
cns_I12_16 = I12_16.re^2 + I12_16.im^2 ;
cns_I14_15 = I14_15.re^2 + I14_15.im^2 ;
cns_I16_17 = I16_17.re^2 + I16_17.im^2 ;
cns_I15_18 = I15_18.re^2 + I15_18.im^2 ;
cns_I18_19 = I18_19.re^2 + I18_19.im^2 ;
cns_I19_20 = I19_20.re^2 + I19_20.im^2 ;
cns_I10_20 = I10_20.re^2 + I10_20.im^2 ;
cns_I10_17 = I10_17.re^2 + I10_17.im^2 ;
cns_I10_21 = I10_21.re^2 + I10_21.im^2 ;
cns_I10_22 = I10_22.re^2 + I10_22.im^2 ;
cns_I21_22 = I21_22.re^2 + I21_22.im^2 ;
cns_I15_23 = I15_23.re^2 + I15_23.im^2 ;
cns_I22_24 = I22_24.re^2 + I22_24.im^2 ;
cns_I23_24 = I23_24.re^2 + I23_24.im^2 ;
cns_I24_25 = I24_25.re^2 + I24_25.im^2 ;
cns_I25_26 = I25_26.re^2 + I25_26.im^2 ;
cns_I25_27 = I25_27.re^2 + I25_27.im^2 ;
cns_I28_27 = I28_27.re^2 + I28_27.im^2 ;
cns_I27_29 = I27_29.re^2 + I27_29.im^2 ;
cns_I27_30 = I27_30.re^2 + I27_30.im^2 ;
cns_I29_30 = I29_30.re^2 + I29_30.im^2 ;
cns_I8_28 = I8_28.re^2 + I8_28.im^2 ;
cns_I6_28 = I6_28.re^2 + I6_28.im^2 ;

I1_2=Complex(Vr1[1],Vr1[2])*Complex(5.000000000000001,-14.985)+Complex(Vr2[1],Vr2[2])*Complex(-5.000000000000001,15.0);
I1_3=Complex(Vr1[1],Vr1[2])*Complex(1.295336787564767,-4.912279792746115)+Complex(Vr3[1],Vr3[2])*Complex(-1.295336787564767,4.922279792746115);
I2_4=Complex(Vr2[1],Vr2[2])*Complex(1.8461538461538456,-5.22076923076923)+Complex(Vr4[1],Vr4[2])*Complex(-1.8461538461538456,5.23076923076923);
I3_4=Complex(Vr3[1],Vr3[2])*Complex(5.88235294117647,-23.52941176470588)+Complex(Vr4[1],Vr4[2])*Complex(-5.88235294117647,23.52941176470588);
I2_5=Complex(Vr2[1],Vr2[2])*Complex(1.176470588235294,-4.695882352941176)+Complex(Vr5[1],Vr5[2])*Complex(-1.176470588235294,4.705882352941176);
I2_6=Complex(Vr2[1],Vr2[2])*Complex(1.6666666666666665,-4.99)+Complex(Vr6[1],Vr6[2])*Complex(-1.6666666666666665,5.0);
I4_6=Complex(Vr4[1],Vr4[2])*Complex(5.88235294117647,-23.52941176470588)+Complex(Vr6[1],Vr6[2])*Complex(-5.88235294117647,23.52941176470588);
I5_7=Complex(Vr5[1],Vr5[2])*Complex(2.9585798816568047,-7.095591715976331)+Complex(Vr7[1],Vr7[2])*Complex(-2.9585798816568047,7.100591715976331);
I6_7=Complex(Vr6[1],Vr6[2])*Complex(4.10958904109589,-10.95390410958904)+Complex(Vr7[1],Vr7[2])*Complex(-4.10958904109589,10.95890410958904);
I6_8=Complex(Vr6[1],Vr6[2])*Complex(5.88235294117647,-23.52941176470588)+Complex(Vr8[1],Vr8[2])*Complex(-5.88235294117647,23.52941176470588);
I6_9=Complex(Vr6[1],Vr6[2])*Complex(0.0,-4.761904761904762)+Complex(Vr9[1],Vr9[2])*Complex(-0.0,4.761904761904762);
I6_10=Complex(Vr6[1],Vr6[2])*Complex(0.0,-1.7857142857142856)+Complex(Vr10[1],Vr10[2])*Complex(-0.0,1.7857142857142856);
I9_11=Complex(Vr9[1],Vr9[2])*Complex(0.0,-4.761904761904762)+Complex(Vr11[1],Vr11[2])*Complex(-0.0,4.761904761904762);
I9_10=Complex(Vr9[1],Vr9[2])*Complex(0.0,-9.090909090909092)+Complex(Vr10[1],Vr10[2])*Complex(-0.0,9.090909090909092);
I4_12=Complex(Vr4[1],Vr4[2])*Complex(0.0,-3.846153846153846)+Complex(Vr12[1],Vr12[2])*Complex(-0.0,3.846153846153846);
I12_13=Complex(Vr12[1],Vr12[2])*Complex(0.0,-7.142857142857142)+Complex(Vr13[1],Vr13[2])*Complex(-0.0,7.142857142857142);
I12_14=Complex(Vr12[1],Vr12[2])*Complex(1.4634146341463414,-3.1707317073170733)+Complex(Vr14[1],Vr14[2])*Complex(-1.4634146341463414,3.1707317073170733);
I12_15=Complex(Vr12[1],Vr12[2])*Complex(3.2110091743119273,-5.963302752293578)+Complex(Vr15[1],Vr15[2])*Complex(-3.2110091743119273,5.963302752293578);
I12_16=Complex(Vr12[1],Vr12[2])*Complex(1.871101871101871,-4.158004158004158)+Complex(Vr16[1],Vr16[2])*Complex(-1.871101871101871,4.158004158004158);
I14_15=Complex(Vr14[1],Vr14[2])*Complex(2.4886877828054295,-2.262443438914027)+Complex(Vr15[1],Vr15[2])*Complex(-2.4886877828054295,2.262443438914027);
I16_17=Complex(Vr16[1],Vr16[2])*Complex(1.8823529411764706,-4.470588235294118)+Complex(Vr17[1],Vr17[2])*Complex(-1.8823529411764706,4.470588235294118);
I15_18=Complex(Vr15[1],Vr15[2])*Complex(1.8181818181818181,-3.6363636363636362)+Complex(Vr18[1],Vr18[2])*Complex(-1.8181818181818181,3.6363636363636362);
I18_19=Complex(Vr18[1],Vr18[2])*Complex(2.926829268292683,-6.341463414634147)+Complex(Vr19[1],Vr19[2])*Complex(-2.926829268292683,6.341463414634147);
I19_20=Complex(Vr19[1],Vr19[2])*Complex(5.1724137931034475,-12.068965517241379)+Complex(Vr20[1],Vr20[2])*Complex(-5.1724137931034475,12.068965517241379);
I10_20=Complex(Vr10[1],Vr10[2])*Complex(1.7241379310344827,-4.022988505747127)+Complex(Vr20[1],Vr20[2])*Complex(-1.7241379310344827,4.022988505747127);
I10_17=Complex(Vr10[1],Vr10[2])*Complex(4.10958904109589,-10.95890410958904)+Complex(Vr17[1],Vr17[2])*Complex(-4.10958904109589,10.95890410958904);
I10_21=Complex(Vr10[1],Vr10[2])*Complex(5.1724137931034475,-12.068965517241379)+Complex(Vr21[1],Vr21[2])*Complex(-5.1724137931034475,12.068965517241379);
I10_22=Complex(Vr10[1],Vr10[2])*Complex(2.5547445255474455,-5.474452554744525)+Complex(Vr22[1],Vr22[2])*Complex(-2.5547445255474455,5.474452554744525);
I21_22=Complex(Vr21[1],Vr21[2])*Complex(20.0,-40.0)+Complex(Vr22[1],Vr22[2])*Complex(-20.0,40.0);
I15_23=Complex(Vr15[1],Vr15[2])*Complex(2.0,-4.0)+Complex(Vr23[1],Vr23[2])*Complex(-2.0,4.0);
I22_24=Complex(Vr22[1],Vr22[2])*Complex(2.564102564102564,-3.846153846153846)+Complex(Vr24[1],Vr24[2])*Complex(-2.564102564102564,3.846153846153846);
I23_24=Complex(Vr23[1],Vr23[2])*Complex(1.4476614699331847,-3.0066815144766146)+Complex(Vr24[1],Vr24[2])*Complex(-1.4476614699331847,3.0066815144766146);
I24_25=Complex(Vr24[1],Vr24[2])*Complex(1.3103448275862069,-2.2758620689655173)+Complex(Vr25[1],Vr25[2])*Complex(-1.3103448275862069,2.2758620689655173);
I25_26=Complex(Vr25[1],Vr25[2])*Complex(1.2083131947800871,-1.8366360560657322)+Complex(Vr26[1],Vr26[2])*Complex(-1.2083131947800871,1.8366360560657322);
I25_27=Complex(Vr25[1],Vr25[2])*Complex(1.9572953736654803,-3.7366548042704624)+Complex(Vr27[1],Vr27[2])*Complex(-1.9572953736654803,3.7366548042704624);
I28_27=Complex(Vr28[1],Vr28[2])*Complex(-0.0,2.5)+Complex(Vr27[1],Vr27[2])*Complex(0.0,-2.5);
I27_29=Complex(Vr27[1],Vr27[2])*Complex(0.9786476868327402,-1.8683274021352312)+Complex(Vr29[1],Vr29[2])*Complex(-0.9786476868327402,1.8683274021352312);
I27_30=Complex(Vr27[1],Vr27[2])*Complex(0.6920415224913495,-1.2975778546712804)+Complex(Vr30[1],Vr30[2])*Complex(-0.6920415224913495,1.2975778546712804);
I29_30=Complex(Vr29[1],Vr29[2])*Complex(0.9227220299884659,-1.7301038062283736)+Complex(Vr30[1],Vr30[2])*Complex(-0.9227220299884659,1.7301038062283736);
I8_28=Complex(Vr8[1],Vr8[2])*Complex(1.3761467889908257,-4.5771559633027525)+Complex(Vr28[1],Vr28[2])*Complex(-1.3761467889908257,4.587155963302752);
I6_28=Complex(Vr6[1],Vr6[2])*Complex(5.000000000000001,-14.995)+Complex(Vr28[1],Vr28[2])*Complex(-5.000000000000001,15.0);

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
cns_Vabs15 = Vr15[1]^2 + Vr15[2]^2;
cns_Vabs16 = Vr16[1]^2 + Vr16[2]^2;
cns_Vabs17 = Vr17[1]^2 + Vr17[2]^2;
cns_Vabs18 = Vr18[1]^2 + Vr18[2]^2;
cns_Vabs19 = Vr19[1]^2 + Vr19[2]^2;
cns_Vabs20 = Vr20[1]^2 + Vr20[2]^2;
cns_Vabs21 = Vr21[1]^2 + Vr21[2]^2;
cns_Vabs22 = Vr22[1]^2 + Vr22[2]^2;
cns_Vabs23 = Vr23[1]^2 + Vr23[2]^2;
cns_Vabs24 = Vr24[1]^2 + Vr24[2]^2;
cns_Vabs25 = Vr25[1]^2 + Vr25[2]^2;
cns_Vabs26 = Vr26[1]^2 + Vr26[2]^2;
cns_Vabs27 = Vr27[1]^2 + Vr27[2]^2;
cns_Vabs28 = Vr28[1]^2 + Vr28[2]^2;
cns_Vabs29 = Vr29[1]^2 + Vr29[2]^2;
cns_Vabs30 = Vr30[1]^2 + Vr30[2]^2;

end case30_2;