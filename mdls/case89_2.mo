model case89_2
extends Modelica;
import Modelica.Math;

// Inputs:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

//Voltage:
input Real[2] Vr228(start={1.0459089366006051,-0.11477841122350156});
input Real[2] Vr271(start={1.0297447545285463,-0.14062882467667973});
input Real[2] Vr792(start={1.034060334542424,-0.0161216352151535});
input Real[2] Vr913(start={1.030951,0.0});
input Real[2] Vr955(start={0.989754060645874,-0.15913824364684873});
input Real[2] Vr1317(start={1.0348509391534293,0.08797874055284782});
input Real[2] Vr1445(start={1.0341852171012835,0.028250500352577094});
input Real[2] Vr1611(start={1.0379224340804092,-0.1321706519943006});
input Real[2] Vr1815(start={1.0571724501077764,0.03560919427789856});
input Real[2] Vr1968(start={1.0102676970708766,-0.16140590650625963});
input Real[2] Vr2107(start={1.0383023673912712,0.03463882604363844});
input Real[2] Vr2154(start={1.011483177309135,0.23441855576002676});
input Real[2] Vr2168(start={0.9977451540841893,-0.19371314069395812});
input Real[2] Vr2267(start={1.0115277638193456,0.23620848440230496});
input Real[2] Vr2299(start={1.0280857950086935,-0.1662997826286703});
input Real[2] Vr2449(start={1.0843179848042745,-0.07536596172011098});
input Real[2] Vr2908(start={1.0108470789249744,-0.15336432197172484});
input Real[2] Vr3097(start={1.0428769181076105,0.11056928580022563});
input Real[2] Vr3242(start={1.0456901821050963,-0.1360541401979764});
input Real[2] Vr3493(start={1.0292482802058556,-0.15348189904444307});
input Real[2] Vr3659(start={1.0506827022676288,0.05592466410800571});
input Real[2] Vr4427(start={1.0241474564590543,-0.16201980398843083});
input Real[2] Vr4495(start={1.0258674492477469,-0.16146181774624502});
input Real[2] Vr4586(start={1.0349803093729686,-0.16276714843983184});
input Real[2] Vr4665(start={1.0244402232691654,-0.1727835039268001});
input Real[2] Vr4929(start={1.0460010675206701,0.12116202693343374});
input Real[2] Vr5097(start={1.0456340335714913,-0.1359896372412741});
input Real[2] Vr5155(start={1.018483318375952,-0.16015182232465908});
input Real[2] Vr5210(start={1.0323593258314094,0.03319897314553422});
input Real[2] Vr5776(start={1.0696257514945693,-0.10055587851377806});
input Real[2] Vr6069(start={0.9746794522517193,-0.07098610764993854});
input Real[2] Vr6233(start={1.04264755680289,0.14382811871801973});
input Real[2] Vr6542(start={1.0700929011016982,-0.010251008523596518});
input Real[2] Vr6798(start={1.0431861038542511,0.14912486179838394});
input Real[2] Vr6826(start={1.0710712641409168,-0.10853187673480405});
input Real[2] Vr7279(start={1.0142377108647456,-0.20104716522209587});
input Real[2] Vr7526(start={1.0050396812533788,0.1444063690669726});
input Real[2] Vr7563(start={1.0213521699100034,-0.20015162217960522});
input Real[2] Vr7829(start={1.0598125526318671,-0.05116726974273873});
input Real[2] Vr7960(start={1.0423315458860098,0.14443440425286763});
input Real[2] Vr8103(start={1.0045489507858627,0.0024751119211620302});
input Real[2] Vr8335(start={1.0043454810082921,-0.1696079335827855});
input Real[2] Vr8581(start={1.034311859953377,0.10463471527550407});
input Real[2] Vr8605(start={1.0234138796429741,0.028905339266577377});
input Real[2] Vr8964(start={0.9974997504598154,-0.19422604902949014});
input Real[2] Vr9192(start={1.0119912652699736,-0.1574994009299014});
input Real[2] Vr9239(start={1.0423483269934941,0.14451727569693518});


//Load Power:
input Real[2] Sl228(start={-0.2343,0.574});
input Real[2] Sl271(start={0.9670000000000001,0.268});
input Real[2] Sl792(start={2.9530000000000003,0.419});
input Real[2] Sl955(start={2.4419999999999997,1.527});
input Real[2] Sl1317(start={1.493,-0.02});
input Real[2] Sl1445(start={2.384,2.109});
input Real[2] Sl1611(start={2.741,1.665});
input Real[2] Sl1815(start={0.6365999999999999,0.09699999999999999});
input Real[2] Sl1968(start={1.1840000000000002,1.37});
input Real[2] Sl2154(start={-3.5745,0.33049999999999996});
input Real[2] Sl2168(start={0.086,-0.0148});
input Real[2] Sl2299(start={4.021,1.102});
input Real[2] Sl2449(start={3.0189999999999997,-1.032});
input Real[2] Sl2908(start={2.0380000000000003,0.61});
input Real[2] Sl3097(start={3.6191000000000004,0.0366});
input Real[2] Sl3242(start={2.9610000000000003,0.823});
input Real[2] Sl3493(start={2.263,0.611});
input Real[2] Sl4427(start={2.968,0.777});
input Real[2] Sl4495(start={3.363,1.044});
input Real[2] Sl4665(start={3.905,0.625});
input Real[2] Sl4929(start={0.37,0.087});
input Real[2] Sl5155(start={4.113,1.68});
input Real[2] Sl5210(start={3.4761,0.7437});
input Real[2] Sl5776(start={2.227,0.805});
input Real[2] Sl6069(start={-4.5666,-1.3197});
input Real[2] Sl6542(start={3.5598,-1.4798});
input Real[2] Sl6826(start={3.2689999999999997,-0.823});
input Real[2] Sl7526(start={-1.7973,-0.6308});
input Real[2] Sl7563(start={5.317,-0.128});
input Real[2] Sl7829(start={-1.1436,0.3004});
input Real[2] Sl8103(start={0.3934,-0.107});
input Real[2] Sl8335(start={6.3792,1.3957});
input Real[2] Sl8581(start={-12.9913,-1.4084999999999999});
input Real[2] Sl8964(start={9.2591,1.4797});
input Real[2] Sl9192(start={0.17920000000000003,0.233});

// Outputs:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

//Voltage:
output Real[2] Vr89(start={0.9975040486183903,-0.04753455044407161});
output Real[2] Vr317(start={1.0423970758553938,0.14273488579924884});
output Real[2] Vr659(start={1.0415119989400305,0.141877183595326});
output Real[2] Vr1037(start={1.0460030796129256,0.12116203798746304});
output Real[2] Vr1163(start={1.0097306208124943,0.007960529983301897});
output Real[2] Vr1367(start={1.023004341623026,0.02776307226226373});
output Real[2] Vr1531(start={1.0044462748889713,-0.16920273776055994});
output Real[2] Vr1579(start={1.004800517295975,-0.05921777079341282});
output Real[2] Vr1616(start={1.0047503410110383,-0.036414562172324166});
output Real[2] Vr1676(start={1.0093443457298898,0.006910221928467272});
output Real[2] Vr2268(start={0.9913544365532211,-0.055913916212741645});
output Real[2] Vr2441(start={0.9897777314268212,-0.04930468939741327});
output Real[2] Vr2520(start={0.9984836612025565,-0.04996448339108868});
output Real[2] Vr2870(start={1.046003083842278,0.12116200147506753});
output Real[2] Vr3279(start={1.0341434354697052,-0.015393681785568231});
output Real[2] Vr3506(start={0.9900865248304863,-0.15859384166193397});
output Real[2] Vr4014(start={1.0142377108647456,-0.20104716522209587});
output Real[2] Vr4423(start={1.0281543119907732,-0.1662519407880104});
output Real[2] Vr5416(start={1.010257480796817,0.24009164608346717});
output Real[2] Vr5509(start={0.9956994403988033,-0.07399352954488579});
output Real[2] Vr5587(start={1.0294555546633342,-0.1529996181100042});
output Real[2] Vr5762(start={1.0414038192118378,0.04359735298154945});
output Real[2] Vr5848(start={1.0079592613270798,-0.05317664737427308});
output Real[2] Vr5996(start={1.0413546870829367,0.043599483705652156});
output Real[2] Vr6293(start={0.9933719945819539,-0.04273959594182724});
output Real[2] Vr6704(start={1.0031364345456495,-0.026711191494240866});
output Real[2] Vr6833(start={0.9648686970095568,-0.08241417023230908});
output Real[2] Vr7051(start={1.0137343989051155,0.026815450723121262});
output Real[2] Vr7180(start={0.9673335791853604,-0.08412857306195082});
output Real[2] Vr7637(start={0.9760736089991682,0.3463897675167942});
output Real[2] Vr7762(start={1.0102546564255896,-0.03013477702611922});
output Real[2] Vr8179(start={0.9992809578677708,-0.058296892223089584});
output Real[2] Vr8181(start={1.0008662712768532,-0.05170639632935509});
output Real[2] Vr8229(start={1.0696257514945693,-0.10055587851377806});
output Real[2] Vr8329(start={1.036254356356117,0.1303939354761925});
output Real[2] Vr8420(start={1.038367100098647,-0.131247967884178});
output Real[2] Vr8574(start={1.0028804986911048,-0.0334443596004014});
output Real[2] Vr8847(start={1.0119903032737614,0.021374207257361638});
output Real[2] Vr8921(start={1.00646973402401,-0.019571154632223486});
output Real[2] Vr9024(start={1.0557225443362124,0.06635844344372512});
output Real[2] Vr9025(start={1.0037157262936682,-0.04584121982205538});
output Real[2] Vr9064(start={1.0042501595026883,-0.03618904175058211});


//All Branch Flows:
output Real cns_I3097_659;
output Real cns_I9024_4929;
output Real cns_I6069_6833;
output Real cns_I6069_2268;
output Real cns_I6069_7180;
output Real cns_I6069_6293;
output Real cns_I1968_8964;
output Real cns_I8574_1616;
output Real cns_I8574_1163;
output Real cns_I8574_9064;
output Real cns_I8574_8921;
output Real cns_I3493_5587;
output Real cns_I4929_2870;
output Real cns_I4929_659;
output Real cns_I4929_1037;
output Real cns_I1616_7762;
output Real cns_I1616_2520;
output Real cns_I9064_7762;
output Real cns_I9064_89;
output Real cns_I1317_659;
output Real cns_I1317_8605;
output Real cns_I8605_1367;
output Real cns_I8605_8921;
output Real cns_I1163_1676;
output Real cns_I1163_7051;
output Real cns_I913_7762;
output Real cns_I2107_7762;
output Real cns_I2107_5996;
output Real cns_I2107_6293;
output Real cns_I6704_8921;
output Real cns_I228_4586;
output Real cns_I2441_6293;
output Real cns_I955_3506;
output Real cns_I659_8329;
output Real cns_I659_7051;
output Real cns_I659_9239;
output Real cns_I659_7960;
output Real cns_I659_6233;
output Real cns_I659_5416;
output Real cns_I792_3279;
output Real cns_I5416_2267;
output Real cns_I5416_7637;
output Real cns_I8964_2168;
output Real cns_I3659_5996;
output Real cns_I5762_5996;
output Real cns_I8181_8179;
output Real cns_I8181_7762;
output Real cns_I9025_7762;
output Real cns_I8179_5509;
output Real cns_I8179_7762;
output Real cns_I5509_1579;
output Real cns_I8335_1531;
output Real cns_I7762_2268;
output Real cns_I1579_5848;
output Real cns_I7051_8847;
output Real cns_I317_6233;
output Real cns_I1611_8420;
output Real cns_I6069_9192;
output Real cns_I6069_1968;
output Real cns_I6704_4586;
output Real cns_I2441_3506;
output Real cns_I1676_228;
output Real cns_I7180_2168;
output Real cns_I6833_8964;
output Real cns_I3659_3242;
output Real cns_I9025_7563;
output Real cns_I2267_5210;
output Real cns_I7762_271;
output Real cns_I2268_2908;
output Real cns_I317_2449;
output Real cns_I7637_8581;
output Real cns_I5848_7526;
output Real cns_I2520_4665;
output Real cns_I5996_8420;
output Real cns_I2154_5996;

Complex I3097_659;
Complex I9024_4929;
Complex I6069_6833;
Complex I6069_2268;
Complex I6069_7180;
Complex I6069_6293;
Complex I1968_8964;
Complex I8574_1616;
Complex I8574_1163;
Complex I8574_9064;
Complex I8574_8921;
Complex I3493_5587;
Complex I4929_2870;
Complex I4929_659;
Complex I4929_1037;
Complex I1616_7762;
Complex I1616_2520;
Complex I9064_7762;
Complex I9064_89;
Complex I1317_659;
Complex I1317_8605;
Complex I8605_1367;
Complex I8605_8921;
Complex I1163_1676;
Complex I1163_7051;
Complex I913_7762;
Complex I2107_7762;
Complex I2107_5996;
Complex I2107_6293;
Complex I6704_8921;
Complex I228_4586;
Complex I2441_6293;
Complex I955_3506;
Complex I659_8329;
Complex I659_7051;
Complex I659_9239;
Complex I659_7960;
Complex I659_6233;
Complex I659_5416;
Complex I792_3279;
Complex I5416_2267;
Complex I5416_7637;
Complex I8964_2168;
Complex I3659_5996;
Complex I5762_5996;
Complex I8181_8179;
Complex I8181_7762;
Complex I9025_7762;
Complex I8179_5509;
Complex I8179_7762;
Complex I5509_1579;
Complex I8335_1531;
Complex I7762_2268;
Complex I1579_5848;
Complex I7051_8847;
Complex I317_6233;
Complex I1611_8420;
Complex I6069_9192;
Complex I6069_1968;
Complex I6704_4586;
Complex I2441_3506;
Complex I1676_228;
Complex I7180_2168;
Complex I6833_8964;
Complex I3659_3242;
Complex I9025_7563;
Complex I2267_5210;
Complex I7762_271;
Complex I2268_2908;
Complex I317_2449;
Complex I7637_8581;
Complex I5848_7526;
Complex I2520_4665;
Complex I5996_8420;
Complex I2154_5996;

//Trick equality constraints for Loads:
output Real[2] ceq_Sl228(start={0,0});
output Real[2] ceq_Sl271(start={0,0});
output Real[2] ceq_Sl792(start={0,0});
output Real[2] ceq_Sl955(start={0,0});
output Real[2] ceq_Sl1317(start={0,0});
output Real[2] ceq_Sl1445(start={0,0});
output Real[2] ceq_Sl1611(start={0,0});
output Real[2] ceq_Sl1815(start={0,0});
output Real[2] ceq_Sl1968(start={0,0});
output Real[2] ceq_Sl2154(start={0,0});
output Real[2] ceq_Sl2168(start={0,0});
output Real[2] ceq_Sl2299(start={0,0});
output Real[2] ceq_Sl2449(start={0,0});
output Real[2] ceq_Sl2908(start={0,0});
output Real[2] ceq_Sl3097(start={0,0});
output Real[2] ceq_Sl3242(start={0,0});
output Real[2] ceq_Sl3493(start={0,0});
output Real[2] ceq_Sl4427(start={0,0});
output Real[2] ceq_Sl4495(start={0,0});
output Real[2] ceq_Sl4665(start={0,0});
output Real[2] ceq_Sl4929(start={0,0});
output Real[2] ceq_Sl5155(start={0,0});
output Real[2] ceq_Sl5210(start={0,0});
output Real[2] ceq_Sl5776(start={0,0});
output Real[2] ceq_Sl6069(start={0,0});
output Real[2] ceq_Sl6542(start={0,0});
output Real[2] ceq_Sl6826(start={0,0});
output Real[2] ceq_Sl7526(start={0,0});
output Real[2] ceq_Sl7563(start={0,0});
output Real[2] ceq_Sl7829(start={0,0});
output Real[2] ceq_Sl8103(start={0,0});
output Real[2] ceq_Sl8335(start={0,0});
output Real[2] ceq_Sl8581(start={0,0});
output Real[2] ceq_Sl8964(start={0,0});
output Real[2] ceq_Sl9192(start={0,0});

//Voltage Magnitude:
output Real cns_Vabs89;
output Real cns_Vabs228;
output Real cns_Vabs271;
output Real cns_Vabs317;
output Real cns_Vabs659;
output Real cns_Vabs792;
output Real cns_Vabs955;
output Real cns_Vabs1037;
output Real cns_Vabs1163;
output Real cns_Vabs1317;
output Real cns_Vabs1367;
output Real cns_Vabs1445;
output Real cns_Vabs1531;
output Real cns_Vabs1579;
output Real cns_Vabs1611;
output Real cns_Vabs1616;
output Real cns_Vabs1676;
output Real cns_Vabs1815;
output Real cns_Vabs1968;
output Real cns_Vabs2107;
output Real cns_Vabs2154;
output Real cns_Vabs2168;
output Real cns_Vabs2267;
output Real cns_Vabs2268;
output Real cns_Vabs2299;
output Real cns_Vabs2441;
output Real cns_Vabs2449;
output Real cns_Vabs2520;
output Real cns_Vabs2870;
output Real cns_Vabs2908;
output Real cns_Vabs3097;
output Real cns_Vabs3242;
output Real cns_Vabs3279;
output Real cns_Vabs3493;
output Real cns_Vabs3506;
output Real cns_Vabs3659;
output Real cns_Vabs4014;
output Real cns_Vabs4423;
output Real cns_Vabs4427;
output Real cns_Vabs4495;
output Real cns_Vabs4586;
output Real cns_Vabs4665;
output Real cns_Vabs4929;
output Real cns_Vabs5097;
output Real cns_Vabs5155;
output Real cns_Vabs5210;
output Real cns_Vabs5416;
output Real cns_Vabs5509;
output Real cns_Vabs5587;
output Real cns_Vabs5762;
output Real cns_Vabs5776;
output Real cns_Vabs5848;
output Real cns_Vabs5996;
output Real cns_Vabs6069;
output Real cns_Vabs6233;
output Real cns_Vabs6293;
output Real cns_Vabs6542;
output Real cns_Vabs6704;
output Real cns_Vabs6798;
output Real cns_Vabs6826;
output Real cns_Vabs6833;
output Real cns_Vabs7051;
output Real cns_Vabs7180;
output Real cns_Vabs7279;
output Real cns_Vabs7526;
output Real cns_Vabs7563;
output Real cns_Vabs7637;
output Real cns_Vabs7762;
output Real cns_Vabs7829;
output Real cns_Vabs7960;
output Real cns_Vabs8103;
output Real cns_Vabs8179;
output Real cns_Vabs8181;
output Real cns_Vabs8229;
output Real cns_Vabs8329;
output Real cns_Vabs8335;
output Real cns_Vabs8420;
output Real cns_Vabs8574;
output Real cns_Vabs8581;
output Real cns_Vabs8605;
output Real cns_Vabs8847;
output Real cns_Vabs8921;
output Real cns_Vabs8964;
output Real cns_Vabs9024;
output Real cns_Vabs9025;
output Real cns_Vabs9064;
output Real cns_Vabs9192;
output Real cns_Vabs9239;

//Generator Power:
output Real[2] Sg913(start={12.494000000000002,6.8416});
output Real[2] Sg2107(start={12.694,5.5816});
output Real[2] Sg2267(start={3.62,2.0002});
output Real[2] Sg3659(start={10.974,6.8953});
output Real[2] Sg4586(start={-5.457000000000001,0.41950000000000004});
output Real[2] Sg5097(start={0.21100000000000002,0.0252});
output Real[2] Sg6233(start={8.796,3.6828});
output Real[2] Sg6798(start={9.497,2.7274000000000003});
output Real[2] Sg7279(start={-6.817,0.0538});
output Real[2] Sg7960(start={4.19,1.5338999999999998});
output Real[2] Sg8605(start={4.27,1.7021000000000002});
output Real[2] Sg9239(start={4.19,1.5316999999999998});

//Generator Current:
Real[2] Ig913;
Real[2] Ig2107;
Real[2] Ig2267;
Real[2] Ig3659;
Real[2] Ig4586;
Real[2] Ig5097;
Real[2] Ig6233;
Real[2] Ig6798;
Real[2] Ig7279;
Real[2] Ig7960;
Real[2] Ig8605;
Real[2] Ig9239;

//Load Current:
Real[2] Il228;
Real[2] Il271;
Real[2] Il792;
Real[2] Il955;
Real[2] Il1317;
Real[2] Il1445;
Real[2] Il1611;
Real[2] Il1815;
Real[2] Il1968;
Real[2] Il2154;
Real[2] Il2168;
Real[2] Il2299;
Real[2] Il2449;
Real[2] Il2908;
Real[2] Il3097;
Real[2] Il3242;
Real[2] Il3493;
Real[2] Il4427;
Real[2] Il4495;
Real[2] Il4665;
Real[2] Il4929;
Real[2] Il5155;
Real[2] Il5210;
Real[2] Il5776;
Real[2] Il6069;
Real[2] Il6542;
Real[2] Il6826;
Real[2] Il7526;
Real[2] Il7563;
Real[2] Il7829;
Real[2] Il8103;
Real[2] Il8335;
Real[2] Il8581;
Real[2] Il8964;
Real[2] Il9192;



equation

//Generator Power Flow:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

Complex(Sg913[1],Sg913[2]) = Complex(Vr913[1],Vr913[2])*Complex(Ig913[1],-Ig913[2]);
Complex(Sg2107[1],Sg2107[2]) = Complex(Vr2107[1],Vr2107[2])*Complex(Ig2107[1],-Ig2107[2]);
Complex(Sg2267[1],Sg2267[2]) = Complex(Vr2267[1],Vr2267[2])*Complex(Ig2267[1],-Ig2267[2]);
Complex(Sg3659[1],Sg3659[2]) = Complex(Vr3659[1],Vr3659[2])*Complex(Ig3659[1],-Ig3659[2]);
Complex(Sg4586[1],Sg4586[2]) = Complex(Vr4586[1],Vr4586[2])*Complex(Ig4586[1],-Ig4586[2]);
Complex(Sg5097[1],Sg5097[2]) = Complex(Vr5097[1],Vr5097[2])*Complex(Ig5097[1],-Ig5097[2]);
Complex(Sg6233[1],Sg6233[2]) = Complex(Vr6233[1],Vr6233[2])*Complex(Ig6233[1],-Ig6233[2]);
Complex(Sg6798[1],Sg6798[2]) = Complex(Vr6798[1],Vr6798[2])*Complex(Ig6798[1],-Ig6798[2]);
Complex(Sg7279[1],Sg7279[2]) = Complex(Vr7279[1],Vr7279[2])*Complex(Ig7279[1],-Ig7279[2]);
Complex(Sg7960[1],Sg7960[2]) = Complex(Vr7960[1],Vr7960[2])*Complex(Ig7960[1],-Ig7960[2]);
Complex(Sg8605[1],Sg8605[2]) = Complex(Vr8605[1],Vr8605[2])*Complex(Ig8605[1],-Ig8605[2]);
Complex(Sg9239[1],Sg9239[2]) = Complex(Vr9239[1],Vr9239[2])*Complex(Ig9239[1],-Ig9239[2]);

//Load Power Flow Equations:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=



//Trick equality constraints for Loads:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

Complex(ceq_Sl228[1],ceq_Sl228[2])=Complex(Vr228[1],Vr228[2])*Complex(Il228[1],-Il228[2])-Complex(Sl228[1],Sl228[2]);
Complex(ceq_Sl271[1],ceq_Sl271[2])=Complex(Vr271[1],Vr271[2])*Complex(Il271[1],-Il271[2])-Complex(Sl271[1],Sl271[2]);
Complex(ceq_Sl792[1],ceq_Sl792[2])=Complex(Vr792[1],Vr792[2])*Complex(Il792[1],-Il792[2])-Complex(Sl792[1],Sl792[2]);
Complex(ceq_Sl955[1],ceq_Sl955[2])=Complex(Vr955[1],Vr955[2])*Complex(Il955[1],-Il955[2])-Complex(Sl955[1],Sl955[2]);
Complex(ceq_Sl1317[1],ceq_Sl1317[2])=Complex(Vr1317[1],Vr1317[2])*Complex(Il1317[1],-Il1317[2])-Complex(Sl1317[1],Sl1317[2]);
Complex(ceq_Sl1445[1],ceq_Sl1445[2])=Complex(Vr1445[1],Vr1445[2])*Complex(Il1445[1],-Il1445[2])-Complex(Sl1445[1],Sl1445[2]);
Complex(ceq_Sl1611[1],ceq_Sl1611[2])=Complex(Vr1611[1],Vr1611[2])*Complex(Il1611[1],-Il1611[2])-Complex(Sl1611[1],Sl1611[2]);
Complex(ceq_Sl1815[1],ceq_Sl1815[2])=Complex(Vr1815[1],Vr1815[2])*Complex(Il1815[1],-Il1815[2])-Complex(Sl1815[1],Sl1815[2]);
Complex(ceq_Sl1968[1],ceq_Sl1968[2])=Complex(Vr1968[1],Vr1968[2])*Complex(Il1968[1],-Il1968[2])-Complex(Sl1968[1],Sl1968[2]);
Complex(ceq_Sl2154[1],ceq_Sl2154[2])=Complex(Vr2154[1],Vr2154[2])*Complex(Il2154[1],-Il2154[2])-Complex(Sl2154[1],Sl2154[2]);
Complex(ceq_Sl2168[1],ceq_Sl2168[2])=Complex(Vr2168[1],Vr2168[2])*Complex(Il2168[1],-Il2168[2])-Complex(Sl2168[1],Sl2168[2]);
Complex(ceq_Sl2299[1],ceq_Sl2299[2])=Complex(Vr2299[1],Vr2299[2])*Complex(Il2299[1],-Il2299[2])-Complex(Sl2299[1],Sl2299[2]);
Complex(ceq_Sl2449[1],ceq_Sl2449[2])=Complex(Vr2449[1],Vr2449[2])*Complex(Il2449[1],-Il2449[2])-Complex(Sl2449[1],Sl2449[2]);
Complex(ceq_Sl2908[1],ceq_Sl2908[2])=Complex(Vr2908[1],Vr2908[2])*Complex(Il2908[1],-Il2908[2])-Complex(Sl2908[1],Sl2908[2]);
Complex(ceq_Sl3097[1],ceq_Sl3097[2])=Complex(Vr3097[1],Vr3097[2])*Complex(Il3097[1],-Il3097[2])-Complex(Sl3097[1],Sl3097[2]);
Complex(ceq_Sl3242[1],ceq_Sl3242[2])=Complex(Vr3242[1],Vr3242[2])*Complex(Il3242[1],-Il3242[2])-Complex(Sl3242[1],Sl3242[2]);
Complex(ceq_Sl3493[1],ceq_Sl3493[2])=Complex(Vr3493[1],Vr3493[2])*Complex(Il3493[1],-Il3493[2])-Complex(Sl3493[1],Sl3493[2]);
Complex(ceq_Sl4427[1],ceq_Sl4427[2])=Complex(Vr4427[1],Vr4427[2])*Complex(Il4427[1],-Il4427[2])-Complex(Sl4427[1],Sl4427[2]);
Complex(ceq_Sl4495[1],ceq_Sl4495[2])=Complex(Vr4495[1],Vr4495[2])*Complex(Il4495[1],-Il4495[2])-Complex(Sl4495[1],Sl4495[2]);
Complex(ceq_Sl4665[1],ceq_Sl4665[2])=Complex(Vr4665[1],Vr4665[2])*Complex(Il4665[1],-Il4665[2])-Complex(Sl4665[1],Sl4665[2]);
Complex(ceq_Sl4929[1],ceq_Sl4929[2])=Complex(Vr4929[1],Vr4929[2])*Complex(Il4929[1],-Il4929[2])-Complex(Sl4929[1],Sl4929[2]);
Complex(ceq_Sl5155[1],ceq_Sl5155[2])=Complex(Vr5155[1],Vr5155[2])*Complex(Il5155[1],-Il5155[2])-Complex(Sl5155[1],Sl5155[2]);
Complex(ceq_Sl5210[1],ceq_Sl5210[2])=Complex(Vr5210[1],Vr5210[2])*Complex(Il5210[1],-Il5210[2])-Complex(Sl5210[1],Sl5210[2]);
Complex(ceq_Sl5776[1],ceq_Sl5776[2])=Complex(Vr5776[1],Vr5776[2])*Complex(Il5776[1],-Il5776[2])-Complex(Sl5776[1],Sl5776[2]);
Complex(ceq_Sl6069[1],ceq_Sl6069[2])=Complex(Vr6069[1],Vr6069[2])*Complex(Il6069[1],-Il6069[2])-Complex(Sl6069[1],Sl6069[2]);
Complex(ceq_Sl6542[1],ceq_Sl6542[2])=Complex(Vr6542[1],Vr6542[2])*Complex(Il6542[1],-Il6542[2])-Complex(Sl6542[1],Sl6542[2]);
Complex(ceq_Sl6826[1],ceq_Sl6826[2])=Complex(Vr6826[1],Vr6826[2])*Complex(Il6826[1],-Il6826[2])-Complex(Sl6826[1],Sl6826[2]);
Complex(ceq_Sl7526[1],ceq_Sl7526[2])=Complex(Vr7526[1],Vr7526[2])*Complex(Il7526[1],-Il7526[2])-Complex(Sl7526[1],Sl7526[2]);
Complex(ceq_Sl7563[1],ceq_Sl7563[2])=Complex(Vr7563[1],Vr7563[2])*Complex(Il7563[1],-Il7563[2])-Complex(Sl7563[1],Sl7563[2]);
Complex(ceq_Sl7829[1],ceq_Sl7829[2])=Complex(Vr7829[1],Vr7829[2])*Complex(Il7829[1],-Il7829[2])-Complex(Sl7829[1],Sl7829[2]);
Complex(ceq_Sl8103[1],ceq_Sl8103[2])=Complex(Vr8103[1],Vr8103[2])*Complex(Il8103[1],-Il8103[2])-Complex(Sl8103[1],Sl8103[2]);
Complex(ceq_Sl8335[1],ceq_Sl8335[2])=Complex(Vr8335[1],Vr8335[2])*Complex(Il8335[1],-Il8335[2])-Complex(Sl8335[1],Sl8335[2]);
Complex(ceq_Sl8581[1],ceq_Sl8581[2])=Complex(Vr8581[1],Vr8581[2])*Complex(Il8581[1],-Il8581[2])-Complex(Sl8581[1],Sl8581[2]);
Complex(ceq_Sl8964[1],ceq_Sl8964[2])=Complex(Vr8964[1],Vr8964[2])*Complex(Il8964[1],-Il8964[2])-Complex(Sl8964[1],Sl8964[2]);
Complex(ceq_Sl9192[1],ceq_Sl9192[2])=Complex(Vr9192[1],Vr9192[2])*Complex(Il9192[1],-Il9192[2])-Complex(Sl9192[1],Sl9192[2]);

//Kirchhoff's Law:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

Complex(0,0) = Complex(Vr89[1],Vr89[2])*Complex(24.810777187818946,(-243.14878838341292)) + Complex(Vr4495[1],Vr4495[2])*Complex((-0.34538123513492497),23.723633664561433) + Complex(Vr9064[1],Vr9064[2])*Complex((-24.435000503073546),217.51941624304683);

Complex(0,0) = Complex(Vr228[1],Vr228[2])*Complex(11.852882003072668,(-74.19389550512429)) + Complex(Vr1676[1],Vr1676[2])*Complex((-0.2854748750055636),20.407364222942057) + Complex(Vr1968[1],Vr1968[2])*Complex((-0.03590717724560474),0.20337228506782837) + Complex(Vr3493[1],Vr3493[2])*Complex((-2.4128827613721313),9.328092796070631) + Complex(Vr4586[1],Vr4586[2])*Complex((-8.9668314678124),44.290960534134165) + Complex(Vr5776[1],Vr5776[2])*Complex((-0.06397956451501524),0.29552493813337005) + Complex(Vr6826[1],Vr6826[2])*Complex((-0.1063660206455648),0.9953451063665988) + Complex(Il228[1],Il228[2]);

Complex(0,0) = Complex(Vr271[1],Vr271[2])*Complex(14.289169322610626,(-102.96652955581254)) + Complex(Vr1611[1],Vr1611[2])*Complex((-1.4296273441304772),13.33269993643806) + Complex(Vr2299[1],Vr2299[2])*Complex((-2.8349671143814734),10.81487454745525) + Complex(Vr2908[1],Vr2908[2])*Complex((-4.941485043424975),16.584009494301416) + Complex(Vr3242[1],Vr3242[2])*Complex((-0.0019128888454196281),0.1205161086264543) + Complex(Vr3493[1],Vr3493[2])*Complex((-0.03598154206320453),0.5602593376287806) + Complex(Vr4427[1],Vr4427[2])*Complex((-3.4713457897892517),22.615312640460818) + Complex(Vr4495[1],Vr4495[2])*Complex((-0.056949143310996264),0.2554248068139697) + Complex(Vr4665[1],Vr4665[2])*Complex((-0.0037526081592880274),0.2157413539842352) + Complex(Vr5155[1],Vr5155[2])*Complex((-1.1887184218577345),16.070029360059706) + Complex(Vr7279[1],Vr7279[2])*Complex((-0.03294343190774382),0.3795596899401317) + Complex(Vr7563[1],Vr7563[2])*Complex((-0.028685103948059777),1.0912673463366136) + Complex(Vr7762[1],Vr7762[2])*Complex((-0.27693101911112805),22.052017051819128) + Complex(Il271[1],Il271[2]);

Complex(0,0) = Complex(Vr317[1],Vr317[2])*Complex(410.1340950673282,(-4531.7688657449835)) + Complex(Vr2449[1],Vr2449[2])*Complex((-0.27764861252113077),21.977059574541904) + Complex(Vr6233[1],Vr6233[2])*Complex((-409.83606557377044),4508.196721311475);

Complex(0,0) = Complex(Vr659[1],Vr659[2])*Complex(689.8262308226986,(-7118.238753752383)) + Complex(Vr1317[1],Vr1317[2])*Complex((-12.118187974480522),132.94365042591866) + Complex(Vr3097[1],Vr3097[2])*Complex((-8.855418909837276),109.78293306031145) + Complex(Vr3279[1],Vr3279[2])*Complex((-0.3811380304663063),20.826409772626302) + Complex(Vr4929[1],Vr4929[2])*Complex((-18.32687421737696),198.5038138556745) + Complex(Vr5416[1],Vr5416[2])*Complex((-8.375164985449478),102.62227475841891) + Complex(Vr6233[1],Vr6233[2])*Complex((-196.01437438745506),1796.798431885005) + Complex(Vr6798[1],Vr6798[2])*Complex((-111.28775834658184),1255.9618441971381) + Complex(Vr7051[1],Vr7051[2])*Complex((-7.735099870830119),78.92317347879512) + Complex(Vr7960[1],Vr7960[2])*Complex((-149.81273408239696),1573.0337078651683) + Complex(Vr8329[1],Vr8329[2])*Complex((-36.10069971650333),323.84451216275045) + Complex(Vr9239[1],Vr9239[2])*Complex((-140.81201595869516),1525.4635062191974);

Complex(0,0) = Complex(Vr792[1],Vr792[2])*Complex(4.328913671490494,(-4549.762056770462)) + Complex(Vr1445[1],Vr1445[2])*Complex((-0.9515021894150716),20.634370349826394) + Complex(Vr1815[1],Vr1815[2])*Complex((-0.023504712781346863),0.12434168599416474) + Complex(Vr2449[1],Vr2449[2])*Complex((-0.4280809572938852),2.683328808542177) + Complex(Vr3279[1],Vr3279[2])*Complex(0.0,4504.504504504504) + Complex(Vr4495[1],Vr4495[2])*Complex((-0.09255691584349314),0.39573781719335993) + Complex(Vr4665[1],Vr4665[2])*Complex((-0.13062368903701177),0.4139725123843505) + Complex(Vr5210[1],Vr5210[2])*Complex((-1.0525951771024626),11.045478279489233) + Complex(Vr7279[1],Vr7279[2])*Complex((-0.599443793464831),1.8816157364473127) + Complex(Vr7563[1],Vr7563[2])*Complex((-0.03373232261263909),0.12330409827824534) + Complex(Vr8335[1],Vr8335[2])*Complex((-1.016873913939753),7.955402977801799) + Complex(Il792[1],Il792[2]);

Complex(Ig913[1],Ig913[2]) = Complex(Vr913[1],Vr913[2])*Complex(35.378860721225536,(-377.8594293362806)) + Complex(Vr7762[1],Vr7762[2])*Complex((-35.378860721225536),377.8594293362806);

Complex(0,0) = Complex(Vr955[1],Vr955[2])*Complex(4.479203903856117,(-4526.261464230399)) + Complex(Vr1968[1],Vr1968[2])*Complex((-2.2793029645860923),10.41837083613204) + Complex(Vr3506[1],Vr3506[2])*Complex(0.0,4504.504504504504) + Complex(Vr8964[1],Vr8964[2])*Complex((-1.7169003673693486),9.647578121362741) + Complex(Vr9192[1],Vr9192[2])*Complex((-0.4830005719006763),1.6910107683991458) + Complex(Il955[1],Il955[2]);

Complex(0,0) = Complex(Vr1037[1],Vr1037[2])*Complex(187.61726078799248,(-2157.5929990619134)) + Complex(Vr4929[1],Vr4929[2])*Complex((-187.61726078799248),2157.5984990619136);

Complex(0,0) = Complex(Vr1163[1],Vr1163[2])*Complex(247.85065144390563,(-2714.2421568269915)) + Complex(Vr1676[1],Vr1676[2])*Complex((-214.47721179624668),2305.6300268096516) + Complex(Vr7051[1],Vr7051[2])*Complex((-26.012944040954782),321.51998834620105) + Complex(Vr8574[1],Vr8574[2])*Complex((-7.360495606704186),87.2525416711392);

Complex(0,0) = Complex(Vr659[1],Vr659[2])*Complex((-12.118187974480522),132.94365042591866) + Complex(Vr1317[1],Vr1317[2])*Complex(20.948981426019884,(-229.77972362455552)) + Complex(Vr8605[1],Vr8605[2])*Complex((-8.83079345153936),97.04377319863683) + Complex(Il1317[1],Il1317[2]);

Complex(0,0) = Complex(Vr1367[1],Vr1367[2])*Complex(247.86075665234364,(-2498.031279694862)) + Complex(Vr6826[1],Vr6826[2])*Complex((-0.30884751998254995),21.038447619473565) + Complex(Vr8605[1],Vr8605[2])*Complex((-247.52475247524754),2475.2475247524753);

Complex(0,0) = Complex(Vr792[1],Vr792[2])*Complex((-0.9515021894150716),20.634370349826394) + Complex(Vr1445[1],Vr1445[2])*Complex(16.989382710840133,(-135.4855086445693)) + Complex(Vr1815[1],Vr1815[2])*Complex((-1.8221045247280372),7.318851926164795) + Complex(Vr2449[1],Vr2449[2])*Complex((-0.11036151536368477),0.7579846360685581) + Complex(Vr4665[1],Vr4665[2])*Complex((-0.0419156374007218),0.12344340062738124) + Complex(Vr5210[1],Vr5210[2])*Complex((-8.82967997577551),56.83548219701135) + Complex(Vr6542[1],Vr6542[2])*Complex((-4.481177533132567),12.321089588605386) + Complex(Vr7279[1],Vr7279[2])*Complex((-0.09194364137771091),0.41089033292275573) + Complex(Vr8329[1],Vr8329[2])*Complex((-0.5235696976970011),36.4958262043138) + Complex(Vr8335[1],Vr8335[2])*Complex((-0.15439480101017697),1.7911658614209602) + Complex(Il1445[1],Il1445[2]);

Complex(0,0) = Complex(Vr1531[1],Vr1531[2])*Complex(0.23217460327953984,(-4524.1253761604285)) + Complex(Vr5509[1],Vr5509[2])*Complex((-0.2398188284359353),20.266878405085947) + Complex(Vr8335[1],Vr8335[2])*Complex(0.0,4504.504504504504);

Complex(0,0) = Complex(Vr1579[1],Vr1579[2])*Complex(41.03663959347021,(-383.4073556952731)) + Complex(Vr5509[1],Vr5509[2])*Complex((-10.880733559273416),110.66200608579211) + Complex(Vr5848[1],Vr5848[2])*Complex((-30.1559060341968),272.910949609481);

Complex(0,0) = Complex(Vr271[1],Vr271[2])*Complex((-1.4296273441304772),13.33269993643806) + Complex(Vr1611[1],Vr1611[2])*Complex(12.097314444295819,(-4586.0215499478345)) + Complex(Vr3242[1],Vr3242[2])*Complex((-0.25013026210275235),1.7235759233653094) + Complex(Vr4427[1],Vr4427[2])*Complex((-0.024740804038527905),0.18759291056564495) + Complex(Vr5097[1],Vr5097[2])*Complex((-5.9475123538328045),37.15779146775542) + Complex(Vr5155[1],Vr5155[2])*Complex((-1.518023389175838),13.562200864502866) + Complex(Vr7279[1],Vr7279[2])*Complex((-0.8547596459004847),6.087734397314669) + Complex(Vr7563[1],Vr7563[2])*Complex((-2.0725206451149347),9.471049943388852) + Complex(Vr8420[1],Vr8420[2])*Complex(0.0,4504.504504504504) + Complex(Il1611[1],Il1611[2]);

Complex(0,0) = Complex(Vr1616[1],Vr1616[2])*Complex(87.15052560242071,(-765.7115872605947)) + Complex(Vr2520[1],Vr2520[2])*Complex((-19.06838503214681),202.70522349390848) + Complex(Vr7762[1],Vr7762[2])*Complex((-42.17144609722435),306.7014261616316) + Complex(Vr8574[1],Vr8574[2])*Complex((-25.910694473049556),256.4494376050546);

Complex(0,0) = Complex(Vr228[1],Vr228[2])*Complex((-0.2854748750055636),20.407364222942057) + Complex(Vr1163[1],Vr1163[2])*Complex((-214.47721179624668),2305.6300268096516) + Complex(Vr1676[1],Vr1676[2])*Complex(214.78425294989339,(-2327.471043614282));

Complex(0,0) = Complex(Vr792[1],Vr792[2])*Complex((-0.023504712781346863),0.12434168599416474) + Complex(Vr1445[1],Vr1445[2])*Complex((-1.8221045247280372),7.318851926164795) + Complex(Vr1815[1],Vr1815[2])*Complex(6.0370181019257645,(-40.06162615261568)) + Complex(Vr4929[1],Vr4929[2])*Complex((-0.2353596148929517),16.29488069409031) + Complex(Vr5210[1],Vr5210[2])*Complex((-0.0730503346659405),0.3647082406096049) + Complex(Vr6542[1],Vr6542[2])*Complex((-3.883736296530947),16.00989546697139) + Complex(Il1815[1],Il1815[2]);

Complex(0,0) = Complex(Vr228[1],Vr228[2])*Complex((-0.03590717724560474),0.20337228506782837) + Complex(Vr955[1],Vr955[2])*Complex((-2.2793029645860923),10.41837083613204) + Complex(Vr1968[1],Vr1968[2])*Complex(46.25133029618293,(-407.83109365171816)) + Complex(Vr3493[1],Vr3493[2])*Complex((-0.034629103158032915),0.22109150925771237) + Complex(Vr5776[1],Vr5776[2])*Complex((-0.16810182984048475),0.4518666443720995) + Complex(Vr6069[1],Vr6069[2])*Complex((-0.3163768440415278),24.243045964605884) + Complex(Vr6826[1],Vr6826[2])*Complex((-2.9944704569230214),10.305585249441231) + Complex(Vr7829[1],Vr7829[2])*Complex((-0.01969492322066245),0.1937672818189166) + Complex(Vr8964[1],Vr8964[2])*Complex((-17.744597336643174),80.18453733764755) + Complex(Vr9192[1],Vr9192[2])*Complex((-22.686018056125857),283.7372686876884) + Complex(Il1968[1],Il1968[2]);

Complex(Ig2107[1],Ig2107[2]) = Complex(Vr2107[1],Vr2107[2])*Complex(75.79217091758044,(-821.4634273119838)) + Complex(Vr5996[1],Vr5996[2])*Complex((-53.00646016233229),573.1323505052178) + Complex(Vr6293[1],Vr6293[2])*Complex((-7.575076537934477),67.12613004398564) + Complex(Vr7762[1],Vr7762[2])*Complex((-15.210634217313672),181.20494676278025);

Complex(0,0) = Complex(Vr2154[1],Vr2154[2])*Complex(0.9209123103614796,(-101.04755427654455)) + Complex(Vr5996[1],Vr5996[2])*Complex((-0.6480124259998506),100.99364763038301) + Complex(Il2154[1],Il2154[2]);

Complex(0,0) = Complex(Vr2168[1],Vr2168[2])*Complex(0.31255112544275365,(-4527.696228375352)) + Complex(Vr7180[1],Vr7180[2])*Complex((-0.3382448832653567),25.098236079953164) + Complex(Vr8964[1],Vr8964[2])*Complex(0.0,4504.504504504504) + Complex(Il2168[1],Il2168[2]);

Complex(Ig2267[1],Ig2267[2]) = Complex(Vr2267[1],Vr2267[2])*Complex(52.52608162793703,(-490.8522505298506)) + Complex(Vr5210[1],Vr5210[2])*Complex((-0.2801686507980523),26.356681060328043) + Complex(Vr5416[1],Vr5416[2])*Complex((-52.23636957231472),463.5977799542931);

Complex(0,0) = Complex(Vr2268[1],Vr2268[2])*Complex(21.10325360929032,(-238.12074416497833)) + Complex(Vr2908[1],Vr2908[2])*Complex((-0.2206913878513607),21.24713721050041) + Complex(Vr6069[1],Vr6069[2])*Complex((-9.84950580495477),87.86384543467588) + Complex(Vr7762[1],Vr7762[2])*Complex((-11.015787102650695),127.75024744417297);

Complex(0,0) = Complex(Vr271[1],Vr271[2])*Complex((-2.8349671143814734),10.81487454745525) + Complex(Vr2299[1],Vr2299[2])*Complex(13.042711964225232,(-4590.6206974363995)) + Complex(Vr2449[1],Vr2449[2])*Complex((-0.08286603264932368),0.18548781139414255) + Complex(Vr3493[1],Vr3493[2])*Complex((-0.3733993669650146),6.2721855391307715) + Complex(Vr4423[1],Vr4423[2])*Complex(0.0,4504.504504504504) + Complex(Vr4427[1],Vr4427[2])*Complex((-1.5808639034891985),4.858493885690383) + Complex(Vr4495[1],Vr4495[2])*Complex((-0.4024057861538553),3.7894046516774815) + Complex(Vr4665[1],Vr4665[2])*Complex((-7.055930416547687),33.05026131337924) + Complex(Vr5155[1],Vr5155[2])*Complex((-0.062146535224170255),0.9314042048405514) + Complex(Vr6826[1],Vr6826[2])*Complex((-0.006142997188355923),0.13996973114673658) + Complex(Vr7563[1],Vr7563[2])*Complex((-0.20317175532246992),0.882679624956103) + Complex(Vr8335[1],Vr8335[2])*Complex((-0.09119674918538473),0.18506471488349313) + Complex(Vr8574[1],Vr8574[2])*Complex((-0.3802202958689433),27.19493357680159) + Complex(Il2299[1],Il2299[2]);

Complex(0,0) = Complex(Vr2441[1],Vr2441[2])*Complex(28.74207580844942,(-366.7004122564355)) + Complex(Vr3506[1],Vr3506[2])*Complex((-0.1916036272044324),21.963657035969) + Complex(Vr6293[1],Vr6293[2])*Complex((-28.53847342949213),343.6507842134677);

Complex(0,0) = Complex(Vr317[1],Vr317[2])*Complex((-0.27764861252113077),21.977059574541904) + Complex(Vr792[1],Vr792[2])*Complex((-0.4280809572938852),2.683328808542177) + Complex(Vr1445[1],Vr1445[2])*Complex((-0.11036151536368477),0.7579846360685581) + Complex(Vr2299[1],Vr2299[2])*Complex((-0.08286603264932368),0.18548781139414255) + Complex(Vr2449[1],Vr2449[2])*Complex(4.243538453527766,(-46.31999505515684)) + Complex(Vr3493[1],Vr3493[2])*Complex((-0.06690131261140222),0.1760021345218798) + Complex(Vr4427[1],Vr4427[2])*Complex((-0.04900767174823695),0.12918147031286603) + Complex(Vr4495[1],Vr4495[2])*Complex((-0.8786009668213444),7.01242543014705) + Complex(Vr4665[1],Vr4665[2])*Complex((-0.9324327698480057),5.62917216383589) + Complex(Vr5210[1],Vr5210[2])*Complex((-0.1551732296277358),1.3392447609611864) + Complex(Vr7279[1],Vr7279[2])*Complex((-0.3442583916397069),1.298844151763976) + Complex(Vr7563[1],Vr7563[2])*Complex((-0.06666223865417845),0.20116836555724532) + Complex(Vr8335[1],Vr8335[2])*Complex((-0.8701324964115825),6.40139395484682) + Complex(Il2449[1],Il2449[2]);

Complex(0,0) = Complex(Vr1616[1],Vr1616[2])*Complex((-19.06838503214681),202.70522349390848) + Complex(Vr2520[1],Vr2520[2])*Complex(19.439285125754907,(-228.26584087709244)) + Complex(Vr4665[1],Vr4665[2])*Complex((-0.3455335647118248),23.88494110955606);

Complex(0,0) = Complex(Vr2870[1],Vr2870[2])*Complex(235.7100766057749,(-2416.022085209193)) + Complex(Vr4929[1],Vr4929[2])*Complex((-235.7100766057749),2416.0282852091927);

Complex(0,0) = Complex(Vr271[1],Vr271[2])*Complex((-4.941485043424975),16.584009494301416) + Complex(Vr2268[1],Vr2268[2])*Complex((-0.2206913878513607),21.24713721050041) + Complex(Vr2908[1],Vr2908[2])*Complex(12.727593464480131,(-76.8413156188073)) + Complex(Vr3506[1],Vr3506[2])*Complex((-3.9371660776541044),24.37531342780526) + Complex(Vr5155[1],Vr5155[2])*Complex((-3.6426793171046388),16.029950822748305) + Complex(Il2908[1],Il2908[2]);

Complex(0,0) = Complex(Vr659[1],Vr659[2])*Complex((-8.855418909837276),109.78293306031145) + Complex(Vr3097[1],Vr3097[2])*Complex(8.855418909837276,(-109.68903306031144)) + Complex(Il3097[1],Il3097[2]);

Complex(0,0) = Complex(Vr271[1],Vr271[2])*Complex((-0.0019128888454196281),0.1205161086264543) + Complex(Vr1611[1],Vr1611[2])*Complex((-0.25013026210275235),1.7235759233653094) + Complex(Vr3242[1],Vr3242[2])*Complex(4.408416473226548,(-4550.596675912548)) + Complex(Vr3659[1],Vr3659[2])*Complex((-0.26393739199208854),22.083812741918244) + Complex(Vr4427[1],Vr4427[2])*Complex((-0.014018210190982573),0.13351740611691115) + Complex(Vr5097[1],Vr5097[2])*Complex(0.0,4504.504504504504) + Complex(Vr7279[1],Vr7279[2])*Complex((-1.6384108748965802),13.515036311929707) + Complex(Vr7563[1],Vr7563[2])*Complex((-2.2602226018635743),10.207178385427518) + Complex(Il3242[1],Il3242[2]);

Complex(0,0) = Complex(Vr659[1],Vr659[2])*Complex((-0.3811380304663063),20.826409772626302) + Complex(Vr792[1],Vr792[2])*Complex(0.0,4504.504504504504) + Complex(Vr3279[1],Vr3279[2])*Complex(0.3761839983463052,(-4525.060212602906));

Complex(0,0) = Complex(Vr228[1],Vr228[2])*Complex((-2.4128827613721313),9.328092796070631) + Complex(Vr271[1],Vr271[2])*Complex((-0.03598154206320453),0.5602593376287806) + Complex(Vr1968[1],Vr1968[2])*Complex((-0.034629103158032915),0.22109150925771237) + Complex(Vr2299[1],Vr2299[2])*Complex((-0.3733993669650146),6.2721855391307715) + Complex(Vr2449[1],Vr2449[2])*Complex((-0.06690131261140222),0.1760021345218798) + Complex(Vr3493[1],Vr3493[2])*Complex(16.40600833462822,(-4576.289367922233)) + Complex(Vr4427[1],Vr4427[2])*Complex((-2.2745476983277433),5.604726414362871) + Complex(Vr4495[1],Vr4495[2])*Complex((-7.609177923782791),31.96200158111571) + Complex(Vr4586[1],Vr4586[2])*Complex((-0.06077009340303041),2.9627879439490745) + Complex(Vr4665[1],Vr4665[2])*Complex((-0.3430294942891804),1.1181198322055779) + Complex(Vr5155[1],Vr5155[2])*Complex((-2.812577900150543),11.438455038646874) + Complex(Vr5587[1],Vr5587[2])*Complex(0.0,4504.504504504504) + Complex(Vr5776[1],Vr5776[2])*Complex((-0.061917983771621284),0.3222634536265924) + Complex(Vr6826[1],Vr6826[2])*Complex((-0.11089215672671594),1.1456025747782723) + Complex(Vr7563[1],Vr7563[2])*Complex((-0.12198370908592826),0.5077239445571912) + Complex(Vr8335[1],Vr8335[2])*Complex((-0.08731728892087909),0.16555131787700872) + Complex(Il3493[1],Il3493[2]);

Complex(0,0) = Complex(Vr955[1],Vr955[2])*Complex(0.0,4504.504504504504) + Complex(Vr2441[1],Vr2441[2])*Complex((-0.1916036272044324),21.963657035969) + Complex(Vr2908[1],Vr2908[2])*Complex((-3.9371660776541044),24.37531342780526) + Complex(Vr3506[1],Vr3506[2])*Complex(4.119651863050759,(-4549.792290420907));

Complex(Ig3659[1],Ig3659[2]) = Complex(Vr3242[1],Vr3242[2])*Complex((-0.26393739199208854),22.083812741918244) + Complex(Vr3659[1],Vr3659[2])*Complex(43.20428490224818,(-510.32473459512926)) + Complex(Vr5996[1],Vr5996[2])*Complex((-42.91845493562232),486.40915593705296);

Complex(0,0) = Complex(Vr4014[1],Vr4014[2])*Complex(0.0,(-4504.504504504504)) + Complex(Vr7279[1],Vr7279[2])*Complex(0.0,4504.504504504504);

Complex(0,0) = Complex(Vr2299[1],Vr2299[2])*Complex(0.0,4504.504504504504) + Complex(Vr4423[1],Vr4423[2])*Complex(6.947119900332815,(-4552.856595579923)) + Complex(Vr4586[1],Vr4586[2])*Complex((-6.947119900332815),48.35539107541858);

Complex(0,0) = Complex(Vr271[1],Vr271[2])*Complex((-3.4713457897892517),22.615312640460818) + Complex(Vr1611[1],Vr1611[2])*Complex((-0.024740804038527905),0.18759291056564495) + Complex(Vr2299[1],Vr2299[2])*Complex((-1.5808639034891985),4.858493885690383) + Complex(Vr2449[1],Vr2449[2])*Complex((-0.04900767174823695),0.12918147031286603) + Complex(Vr3242[1],Vr3242[2])*Complex((-0.014018210190982573),0.13351740611691115) + Complex(Vr3493[1],Vr3493[2])*Complex((-2.2745476983277433),5.604726414362871) + Complex(Vr4427[1],Vr4427[2])*Complex(15.544418472149477,(-98.95169267618957)) + Complex(Vr4495[1],Vr4495[2])*Complex((-4.693088068605494),22.104133326282586) + Complex(Vr4665[1],Vr4665[2])*Complex((-0.19734892108923016),0.7732340235060918) + Complex(Vr5155[1],Vr5155[2])*Complex((-2.7066238035255585),20.43630587026858) + Complex(Vr7279[1],Vr7279[2])*Complex((-0.06573287504751923),0.37231447939925866) + Complex(Vr7563[1],Vr7563[2])*Complex((-0.18146337120017095),1.2675709443630447) + Complex(Vr8181[1],Vr8181[2])*Complex((-0.2499715416714372),21.997495667086472) + Complex(Vr8335[1],Vr8335[2])*Complex((-0.05466140084928046),0.14342533101160987) + Complex(Il4427[1],Il4427[2]);

Complex(0,0) = Complex(Vr89[1],Vr89[2])*Complex((-0.34538123513492497),23.723633664561433) + Complex(Vr271[1],Vr271[2])*Complex((-0.056949143310996264),0.2554248068139697) + Complex(Vr792[1],Vr792[2])*Complex((-0.09255691584349314),0.39573781719335993) + Complex(Vr2299[1],Vr2299[2])*Complex((-0.4024057861538553),3.7894046516774815) + Complex(Vr2449[1],Vr2449[2])*Complex((-0.8786009668213444),7.01242543014705) + Complex(Vr3493[1],Vr3493[2])*Complex((-7.609177923782791),31.96200158111571) + Complex(Vr4427[1],Vr4427[2])*Complex((-4.693088068605494),22.104133326282586) + Complex(Vr4495[1],Vr4495[2])*Complex(21.676671822707462,(-119.72704460233962)) + Complex(Vr4665[1],Vr4665[2])*Complex((-7.080059803269183),29.855821332642165) + Complex(Vr5155[1],Vr5155[2])*Complex((-0.03910100397318322),0.44693958378152177) + Complex(Vr5210[1],Vr5210[2])*Complex((-0.05023250447650207),0.21285402398611047) + Complex(Vr7279[1],Vr7279[2])*Complex((-0.06986013120605537),0.20956311943097508) + Complex(Vr7563[1],Vr7563[2])*Complex((-0.17183235605400418),0.48255319019686643) + Complex(Vr8335[1],Vr8335[2])*Complex((-0.213671849514775),1.0793347203140815) + Complex(Il4495[1],Il4495[2]);

Complex(Ig4586[1],Ig4586[2]) = Complex(Vr228[1],Vr228[2])*Complex((-8.9668314678124),44.290960534134165) + Complex(Vr3493[1],Vr3493[2])*Complex((-0.06077009340303041),2.9627879439490745) + Complex(Vr4423[1],Vr4423[2])*Complex((-6.947119900332815),48.35539107541858) + Complex(Vr4586[1],Vr4586[2])*Complex(23.5115861251815,(-164.3625119970495)) + Complex(Vr5587[1],Vr5587[2])*Complex((-7.293143028306018),48.36102517097116) + Complex(Vr6704[1],Vr6704[2])*Complex((-0.26393739199208854),22.083812741918244);

Complex(0,0) = Complex(Vr271[1],Vr271[2])*Complex((-0.0037526081592880274),0.2157413539842352) + Complex(Vr792[1],Vr792[2])*Complex((-0.13062368903701177),0.4139725123843505) + Complex(Vr1445[1],Vr1445[2])*Complex((-0.0419156374007218),0.12344340062738124) + Complex(Vr2299[1],Vr2299[2])*Complex((-7.055930416547687),33.05026131337924) + Complex(Vr2449[1],Vr2449[2])*Complex((-0.9324327698480057),5.62917216383589) + Complex(Vr2520[1],Vr2520[2])*Complex((-0.3455335647118248),23.88494110955606) + Complex(Vr3493[1],Vr3493[2])*Complex((-0.3430294942891804),1.1181198322055779) + Complex(Vr4427[1],Vr4427[2])*Complex((-0.19734892108923016),0.7732340235060918) + Complex(Vr4495[1],Vr4495[2])*Complex((-7.080059803269183),29.855821332642165) + Complex(Vr4665[1],Vr4665[2])*Complex(19.53956540717703,(-111.17677501134497)) + Complex(Vr5155[1],Vr5155[2])*Complex((-0.008447661723216975),0.3566086155359281) + Complex(Vr5210[1],Vr5210[2])*Complex((-0.09216935486794431),0.23918644327705946) + Complex(Vr7279[1],Vr7279[2])*Complex((-0.18969634400481947),0.38031604298654154) + Complex(Vr7563[1],Vr7563[2])*Complex((-2.798464042537814),15.292936468769218) + Complex(Vr8335[1],Vr8335[2])*Complex((-0.3432935352478643),1.442045551116681) + Complex(Il4665[1],Il4665[2]);

Complex(0,0) = Complex(Vr659[1],Vr659[2])*Complex((-18.32687421737696),198.5038138556745) + Complex(Vr1037[1],Vr1037[2])*Complex((-187.61726078799248),2157.5984990619136) + Complex(Vr1815[1],Vr1815[2])*Complex((-0.2353596148929517),16.29488069409031) + Complex(Vr2870[1],Vr2870[2])*Complex((-235.7100766057749),2416.0282852091927) + Complex(Vr4929[1],Vr4929[2])*Complex(445.50786987735466,(-4831.21910443366)) + Complex(Vr9024[1],Vr9024[2])*Complex((-3.6168545421664957),43.25155223340768) + Complex(Il4929[1],Il4929[2]);

Complex(Ig5097[1],Ig5097[2]) = Complex(Vr1611[1],Vr1611[2])*Complex((-5.9475123538328045),37.15779146775542) + Complex(Vr3242[1],Vr3242[2])*Complex(0.0,4504.504504504504) + Complex(Vr5097[1],Vr5097[2])*Complex(5.9475123538328045,(-4541.66229597226));

Complex(0,0) = Complex(Vr271[1],Vr271[2])*Complex((-1.1887184218577345),16.070029360059706) + Complex(Vr1611[1],Vr1611[2])*Complex((-1.518023389175838),13.562200864502866) + Complex(Vr2299[1],Vr2299[2])*Complex((-0.062146535224170255),0.9314042048405514) + Complex(Vr2908[1],Vr2908[2])*Complex((-3.6426793171046388),16.029950822748305) + Complex(Vr3493[1],Vr3493[2])*Complex((-2.812577900150543),11.438455038646874) + Complex(Vr4427[1],Vr4427[2])*Complex((-2.7066238035255585),20.43630587026858) + Complex(Vr4495[1],Vr4495[2])*Complex((-0.03910100397318322),0.44693958378152177) + Complex(Vr4665[1],Vr4665[2])*Complex((-0.008447661723216975),0.3566086155359281) + Complex(Vr5155[1],Vr5155[2])*Complex(12.33411295298816,(-102.65866438523679)) + Complex(Vr7279[1],Vr7279[2])*Complex((-0.023135208917959792),0.2600881704510401) + Complex(Vr7563[1],Vr7563[2])*Complex((-0.014130655166777193),0.8615727238033165) + Complex(Vr7762[1],Vr7762[2])*Complex((-0.31541819111829467),24.09827002295153) + Complex(Vr8335[1],Vr8335[2])*Complex((-0.02870137373205351),0.12197995114865791) + Complex(Il5155[1],Il5155[2]);

Complex(0,0) = Complex(Vr792[1],Vr792[2])*Complex((-1.0525951771024626),11.045478279489233) + Complex(Vr1445[1],Vr1445[2])*Complex((-8.82967997577551),56.83548219701135) + Complex(Vr1815[1],Vr1815[2])*Complex((-0.0730503346659405),0.3647082406096049) + Complex(Vr2267[1],Vr2267[2])*Complex((-0.2801686507980523),26.356681060328043) + Complex(Vr2449[1],Vr2449[2])*Complex((-0.1551732296277358),1.3392447609611864) + Complex(Vr4495[1],Vr4495[2])*Complex((-0.05023250447650207),0.21285402398611047) + Complex(Vr4665[1],Vr4665[2])*Complex((-0.09216935486794431),0.23918644327705946) + Complex(Vr5210[1],Vr5210[2])*Complex(11.003102232740586,(-100.08463643783622)) + Complex(Vr7279[1],Vr7279[2])*Complex((-0.1549639294078644),0.8050828571864115) + Complex(Vr8335[1],Vr8335[2])*Complex((-0.3242981115445106),3.754134005795474) + Complex(Il5210[1],Il5210[2]);

Complex(0,0) = Complex(Vr659[1],Vr659[2])*Complex((-8.375164985449478),102.62227475841891) + Complex(Vr2267[1],Vr2267[2])*Complex((-52.23636957231472),463.5977799542931) + Complex(Vr5416[1],Vr5416[2])*Complex(72.3821220113305,(-677.8526182498368)) + Complex(Vr7637[1],Vr7637[2])*Complex((-11.770587453566296),111.8838635371248);

Complex(0,0) = Complex(Vr1531[1],Vr1531[2])*Complex((-0.2398188284359353),20.266878405085947) + Complex(Vr1579[1],Vr1579[2])*Complex((-10.880733559273416),110.66200608579211) + Complex(Vr5509[1],Vr5509[2])*Complex(26.632760620471593,(-297.85601197107)) + Complex(Vr8179[1],Vr8179[2])*Complex((-15.19157811755818),142.47236775115374) + Complex(Vr8335[1],Vr8335[2])*Complex((-0.2959585150006738),22.905182562645372);

Complex(0,0) = Complex(Vr3493[1],Vr3493[2])*Complex(0.0,4504.504504504504) + Complex(Vr4586[1],Vr4586[2])*Complex((-7.293143028306018),48.36102517097116) + Complex(Vr5587[1],Vr5587[2])*Complex(7.5546521426780675,(-4574.928339527294)) + Complex(Vr8574[1],Vr8574[2])*Complex((-0.275777279245662),23.27005600964513);

Complex(0,0) = Complex(Vr5762[1],Vr5762[2])*Complex(41.29576947783794,(-477.17325841057175)) + Complex(Vr5996[1],Vr5996[2])*Complex((-41.29576947783794),477.1955584105717);

Complex(0,0) = Complex(Vr228[1],Vr228[2])*Complex((-0.06397956451501524),0.29552493813337005) + Complex(Vr1968[1],Vr1968[2])*Complex((-0.16810182984048475),0.4518666443720995) + Complex(Vr3493[1],Vr3493[2])*Complex((-0.061917983771621284),0.3222634536265924) + Complex(Vr5776[1],Vr5776[2])*Complex(20.85902517462694,(-4611.905113803455)) + Complex(Vr6826[1],Vr6826[2])*Complex((-19.957193729402157),82.51712206858986) + Complex(Vr7829[1],Vr7829[2])*Complex((-0.3310908479480301),3.6717784755340017) + Complex(Vr8229[1],Vr8229[2])*Complex(0.0,4504.504504504504) + Complex(Vr8847[1],Vr8847[2])*Complex((-0.3031006722089554),22.060573558809576) + Complex(Il5776[1],Il5776[2]);

Complex(0,0) = Complex(Vr1579[1],Vr1579[2])*Complex((-30.1559060341968),272.910949609481) + Complex(Vr5848[1],Vr5848[2])*Complex(31.12920875132441,(-376.7482403421351)) + Complex(Vr7526[1],Vr7526[2])*Complex((-1.2940272012621905),103.82956181228626);

Complex(0,0) = Complex(Vr2107[1],Vr2107[2])*Complex((-53.00646016233229),573.1323505052178) + Complex(Vr2154[1],Vr2154[2])*Complex((-1.1880056333343365),100.98873909703687) + Complex(Vr3659[1],Vr3659[2])*Complex((-42.91845493562232),486.40915593705296) + Complex(Vr5762[1],Vr5762[2])*Complex((-41.29576947783794),477.1955584105717) + Complex(Vr5996[1],Vr5996[2])*Complex(138.56010865827827,(-1664.7917324016169)) + Complex(Vr8420[1],Vr8420[2])*Complex((-0.3876184567767529),25.027424537555717);

Complex(0,0) = Complex(Vr1968[1],Vr1968[2])*Complex((-0.3163768440415278),24.243045964605884) + Complex(Vr2268[1],Vr2268[2])*Complex((-9.84950580495477),87.86384543467588) + Complex(Vr6069[1],Vr6069[2])*Complex(61.55004288837392,(-644.8061350040633)) + Complex(Vr6293[1],Vr6293[2])*Complex((-9.24914952942132),105.80124705606339) + Complex(Vr6833[1],Vr6833[2])*Complex((-24.641669062384494),212.19215025942202) + Complex(Vr7180[1],Vr7180[2])*Complex((-17.140836972785348),188.19210593037246) + Complex(Vr9192[1],Vr9192[2])*Complex((-0.29783706705153445),22.892373188202424) + Complex(Il6069[1],Il6069[2]);

Complex(Ig6233[1],Ig6233[2]) = Complex(Vr317[1],Vr317[2])*Complex((-409.83606557377044),4508.196721311475) + Complex(Vr659[1],Vr659[2])*Complex((-196.01437438745506),1796.798431885005) + Complex(Vr6233[1],Vr6233[2])*Complex(605.8504399612254,(-6304.99515319648));

Complex(0,0) = Complex(Vr2107[1],Vr2107[2])*Complex((-7.575076537934477),67.12613004398564) + Complex(Vr2441[1],Vr2441[2])*Complex((-28.53847342949213),343.6507842134677) + Complex(Vr6069[1],Vr6069[2])*Complex((-9.24914952942132),105.80124705606339) + Complex(Vr6293[1],Vr6293[2])*Complex(45.362699496847924,(-516.2415613135167));

Complex(0,0) = Complex(Vr1445[1],Vr1445[2])*Complex((-4.481177533132567),12.321089588605386) + Complex(Vr1815[1],Vr1815[2])*Complex((-3.883736296530947),16.00989546697139) + Complex(Vr6542[1],Vr6542[2])*Complex(8.723413096840494,(-58.857858579158915)) + Complex(Vr9024[1],Vr9024[2])*Complex((-0.35973863282299157),30.636059646472006) + Complex(Il6542[1],Il6542[2]);

Complex(0,0) = Complex(Vr4586[1],Vr4586[2])*Complex((-0.26393739199208854),22.083812741918244) + Complex(Vr6704[1],Vr6704[2])*Complex(34.18898220289271,(-424.2640041035134)) + Complex(Vr8921[1],Vr8921[2])*Complex((-33.90104124626685),400.3551537654371);

Complex(Ig6798[1],Ig6798[2]) = Complex(Vr659[1],Vr659[2])*Complex((-111.28775834658184),1255.9618441971381) + Complex(Vr6798[1],Vr6798[2])*Complex(111.28775834658184,(-1255.9618441971381));

Complex(0,0) = Complex(Vr228[1],Vr228[2])*Complex((-0.1063660206455648),0.9953451063665988) + Complex(Vr1367[1],Vr1367[2])*Complex((-0.30884751998254995),21.038447619473565) + Complex(Vr1968[1],Vr1968[2])*Complex((-2.9944704569230214),10.305585249441231) + Complex(Vr2299[1],Vr2299[2])*Complex((-0.006142997188355923),0.13996973114673658) + Complex(Vr3493[1],Vr3493[2])*Complex((-0.11089215672671594),1.1456025747782723) + Complex(Vr5776[1],Vr5776[2])*Complex((-19.957193729402157),82.51712206858986) + Complex(Vr6826[1],Vr6826[2])*Complex(25.114436932891888,(-133.38066077125262)) + Complex(Vr7829[1],Vr7829[2])*Complex((-0.18856461400790517),15.547152424951781) + Complex(Vr8964[1],Vr8964[2])*Complex((-1.0037208879412083),1.7021139566608758) + Complex(Vr9192[1],Vr9192[2])*Complex((-0.46170818196540236),1.588054712895141) + Complex(Il6826[1],Il6826[2]);

Complex(0,0) = Complex(Vr6069[1],Vr6069[2])*Complex((-24.641669062384494),212.19215025942202) + Complex(Vr6833[1],Vr6833[2])*Complex(25.024963853518038,(-240.6054404334128)) + Complex(Vr8964[1],Vr8964[2])*Complex((-0.3431307803371276),25.64413666105041);

Complex(0,0) = Complex(Vr659[1],Vr659[2])*Complex((-7.735099870830119),78.92317347879512) + Complex(Vr1163[1],Vr1163[2])*Complex((-26.012944040954782),321.51998834620105) + Complex(Vr7051[1],Vr7051[2])*Complex(81.28559857997276,(-961.1744069096129)) + Complex(Vr8847[1],Vr8847[2])*Complex((-47.53755466818785),560.9431450846167);

Complex(0,0) = Complex(Vr2168[1],Vr2168[2])*Complex((-0.3382448832653567),25.098236079953164) + Complex(Vr6069[1],Vr6069[2])*Complex((-17.140836972785348),188.19210593037246) + Complex(Vr7180[1],Vr7180[2])*Complex(17.50923014972642,(-215.31137483009132));

Complex(Ig7279[1],Ig7279[2]) = Complex(Vr271[1],Vr271[2])*Complex((-0.03294343190774382),0.3795596899401317) + Complex(Vr792[1],Vr792[2])*Complex((-0.599443793464831),1.8816157364473127) + Complex(Vr1445[1],Vr1445[2])*Complex((-0.09194364137771091),0.41089033292275573) + Complex(Vr1611[1],Vr1611[2])*Complex((-0.8547596459004847),6.087734397314669) + Complex(Vr2449[1],Vr2449[2])*Complex((-0.3442583916397069),1.298844151763976) + Complex(Vr3242[1],Vr3242[2])*Complex((-1.6384108748965802),13.515036311929707) + Complex(Vr4014[1],Vr4014[2])*Complex(0.0,4504.504504504504) + Complex(Vr4427[1],Vr4427[2])*Complex((-0.06573287504751923),0.37231447939925866) + Complex(Vr4495[1],Vr4495[2])*Complex((-0.06986013120605537),0.20956311943097508) + Complex(Vr4665[1],Vr4665[2])*Complex((-0.18969634400481947),0.38031604298654154) + Complex(Vr5155[1],Vr5155[2])*Complex((-0.023135208917959792),0.2600881704510401) + Complex(Vr5210[1],Vr5210[2])*Complex((-0.1549639294078644),0.8050828571864115) + Complex(Vr7279[1],Vr7279[2])*Complex(15.955531097184894,(-4609.808573304374)) + Complex(Vr7563[1],Vr7563[2])*Complex((-6.0896977177617835),25.112658055625317) + Complex(Vr8179[1],Vr8179[2])*Complex((-0.40070963397607506),24.462315783651178) + Complex(Vr8335[1],Vr8335[2])*Complex((-5.4260272138190775),31.718442669177893);

Complex(0,0) = Complex(Vr5848[1],Vr5848[2])*Complex((-0.6467688059196247),103.83561095616797) + Complex(Vr7526[1],Vr7526[2])*Complex(0.9704027171276081,(-103.83309073265406)) + Complex(Il7526[1],Il7526[2]);

Complex(0,0) = Complex(Vr271[1],Vr271[2])*Complex((-0.028685103948059777),1.0912673463366136) + Complex(Vr792[1],Vr792[2])*Complex((-0.03373232261263909),0.12330409827824534) + Complex(Vr1611[1],Vr1611[2])*Complex((-2.0725206451149347),9.471049943388852) + Complex(Vr2299[1],Vr2299[2])*Complex((-0.20317175532246992),0.882679624956103) + Complex(Vr2449[1],Vr2449[2])*Complex((-0.06666223865417845),0.20116836555724532) + Complex(Vr3242[1],Vr3242[2])*Complex((-2.2602226018635743),10.207178385427518) + Complex(Vr3493[1],Vr3493[2])*Complex((-0.12198370908592826),0.5077239445571912) + Complex(Vr4427[1],Vr4427[2])*Complex((-0.18146337120017095),1.2675709443630447) + Complex(Vr4495[1],Vr4495[2])*Complex((-0.17183235605400418),0.48255319019686643) + Complex(Vr4665[1],Vr4665[2])*Complex((-2.798464042537814),15.292936468769218) + Complex(Vr5155[1],Vr5155[2])*Complex((-0.014130655166777193),0.8615727238033165) + Complex(Vr7279[1],Vr7279[2])*Complex((-6.0896977177617835),25.112658055625317) + Complex(Vr7563[1],Vr7563[2])*Complex(14.528116571523382,(-86.68420833822897)) + Complex(Vr8335[1],Vr8335[2])*Complex((-0.2663879374224968),1.626629424085513) + Complex(Vr9025[1],Vr9025[2])*Complex((-0.23440149347535696),20.915731169112608) + Complex(Il7563[1],Il7563[2]);

Complex(0,0) = Complex(Vr5416[1],Vr5416[2])*Complex((-11.770587453566296),111.8838635371248) + Complex(Vr7637[1],Vr7637[2])*Complex(12.148132943710225,(-176.34017966757753)) + Complex(Vr8581[1],Vr8581[2])*Complex(0.10752422877803897,64.51911427481082);

Complex(0,0) = Complex(Vr271[1],Vr271[2])*Complex((-0.27693101911112805),22.052017051819128) + Complex(Vr913[1],Vr913[2])*Complex((-35.378860721225536),377.8594293362806) + Complex(Vr1616[1],Vr1616[2])*Complex((-42.17144609722435),306.7014261616316) + Complex(Vr2107[1],Vr2107[2])*Complex((-15.210634217313672),181.20494676278025) + Complex(Vr2268[1],Vr2268[2])*Complex((-11.015787102650695),127.75024744417297) + Complex(Vr5155[1],Vr5155[2])*Complex((-0.31541819111829467),24.09827002295153) + Complex(Vr7762[1],Vr7762[2])*Complex(172.37599498222826,(-1843.4720036391377)) + Complex(Vr8179[1],Vr8179[2])*Complex((-10.548785028171462),124.10335327260542) + Complex(Vr8181[1],Vr8181[2])*Complex((-17.210119550295573),199.3171985127255) + Complex(Vr9025[1],Vr9025[2])*Complex((-16.164539618516862),195.51395538587064) + Complex(Vr9064[1],Vr9064[2])*Complex((-24.03769109964424),282.04224223582577);

Complex(0,0) = Complex(Vr1968[1],Vr1968[2])*Complex((-0.01969492322066245),0.1937672818189166) + Complex(Vr5776[1],Vr5776[2])*Complex((-0.3310908479480301),3.6717784755340017) + Complex(Vr6826[1],Vr6826[2])*Complex((-0.18856461400790517),15.547152424951781) + Complex(Vr7829[1],Vr7829[2])*Complex(0.5393503851765977,(-19.4126981823047)) + Complex(Il7829[1],Il7829[2]);

Complex(Ig7960[1],Ig7960[2]) = Complex(Vr659[1],Vr659[2])*Complex((-149.81273408239696),1573.0337078651683) + Complex(Vr7960[1],Vr7960[2])*Complex(149.81273408239696,(-1573.0337078651683));

Complex(0,0) = Complex(Vr8103[1],Vr8103[2])*Complex(0.4411863599259824,(-21.105642430398508)) + Complex(Vr8847[1],Vr8847[2])*Complex((-0.4358920155056507),20.852369549846077) + Complex(Il8103[1],Il8103[2]);

Complex(0,0) = Complex(Vr5509[1],Vr5509[2])*Complex((-15.19157811755818),142.47236775115374) + Complex(Vr7279[1],Vr7279[2])*Complex((-0.40070963397607506),24.462315783651178) + Complex(Vr7762[1],Vr7762[2])*Complex((-10.548785028171462),124.10335327260542) + Complex(Vr8179[1],Vr8179[2])*Complex(56.72780524970964,(-605.0167460036912)) + Complex(Vr8181[1],Vr8181[2])*Complex((-30.55692459339576),312.46919664859536);

Complex(0,0) = Complex(Vr4427[1],Vr4427[2])*Complex((-0.2499715416714372),21.997495667086472) + Complex(Vr7762[1],Vr7762[2])*Complex((-17.210119550295573),199.3171985127255) + Complex(Vr8179[1],Vr8179[2])*Complex((-30.55692459339576),312.46919664859536) + Complex(Vr8181[1],Vr8181[2])*Complex(48.03968172017122,(-535.5267707815503));

Complex(0,0) = Complex(Vr5776[1],Vr5776[2])*Complex(0.0,4504.504504504504) + Complex(Vr8229[1],Vr8229[2])*Complex(0.0,(-4504.504504504504));

Complex(0,0) = Complex(Vr659[1],Vr659[2])*Complex((-36.10069971650333),323.84451216275045) + Complex(Vr1445[1],Vr1445[2])*Complex((-0.5235696976970011),36.4958262043138) + Complex(Vr8329[1],Vr8329[2])*Complex(36.643622201306165,(-361.56448259869865));

Complex(0,0) = Complex(Vr792[1],Vr792[2])*Complex((-1.016873913939753),7.955402977801799) + Complex(Vr1445[1],Vr1445[2])*Complex((-0.15439480101017697),1.7911658614209602) + Complex(Vr1531[1],Vr1531[2])*Complex(0.0,4504.504504504504) + Complex(Vr2299[1],Vr2299[2])*Complex((-0.09119674918538473),0.18506471488349313) + Complex(Vr2449[1],Vr2449[2])*Complex((-0.8701324964115825),6.40139395484682) + Complex(Vr3493[1],Vr3493[2])*Complex((-0.08731728892087909),0.16555131787700872) + Complex(Vr4427[1],Vr4427[2])*Complex((-0.05466140084928046),0.14342533101160987) + Complex(Vr4495[1],Vr4495[2])*Complex((-0.213671849514775),1.0793347203140815) + Complex(Vr4665[1],Vr4665[2])*Complex((-0.3432935352478643),1.442045551116681) + Complex(Vr5155[1],Vr5155[2])*Complex((-0.02870137373205351),0.12197995114865791) + Complex(Vr5210[1],Vr5210[2])*Complex((-0.3242981115445106),3.754134005795474) + Complex(Vr5509[1],Vr5509[2])*Complex((-0.2959585150006738),22.905182562645372) + Complex(Vr7279[1],Vr7279[2])*Complex((-5.4260272138190775),31.718442669177893) + Complex(Vr7563[1],Vr7563[2])*Complex((-0.2663879374224968),1.626629424085513) + Complex(Vr8335[1],Vr8335[2])*Complex(9.159880581680849,(-4582.7854674962055)) + Complex(Il8335[1],Il8335[2]);

Complex(0,0) = Complex(Vr1611[1],Vr1611[2])*Complex(0.0,4504.504504504504) + Complex(Vr5996[1],Vr5996[2])*Complex((-0.3876184567767529),25.027424537555717) + Complex(Vr8420[1],Vr8420[2])*Complex(0.35792959631685106,(-4527.615003514456));

Complex(0,0) = Complex(Vr1163[1],Vr1163[2])*Complex((-7.360495606704186),87.2525416711392) + Complex(Vr1616[1],Vr1616[2])*Complex((-25.910694473049556),256.4494376050546) + Complex(Vr2299[1],Vr2299[2])*Complex((-0.3802202958689433),27.19493357680159) + Complex(Vr5587[1],Vr5587[2])*Complex((-0.275777279245662),23.27005600964513) + Complex(Vr8574[1],Vr8574[2])*Complex(93.61276667119259,(-994.2043283510711)) + Complex(Vr8921[1],Vr8921[2])*Complex((-25.051398559112666),292.8422107427308) + Complex(Vr9064[1],Vr9064[2])*Complex((-34.58137839505019),303.75535076733274);

Complex(0,0) = Complex(Vr7637[1],Vr7637[2])*Complex((-0.8567942850888236),64.51351464475417) + Complex(Vr8581[1],Vr8581[2])*Complex(0.37464549014392845,(-64.51811613045274)) + Complex(Il8581[1],Il8581[2]);

Complex(Ig8605[1],Ig8605[2]) = Complex(Vr1317[1],Vr1317[2])*Complex((-8.83079345153936),97.04377319863683) + Complex(Vr1367[1],Vr1367[2])*Complex((-247.52475247524754),2475.2475247524753) + Complex(Vr8605[1],Vr8605[2])*Complex(272.1678097564361,(-2713.7907870933577)) + Complex(Vr8921[1],Vr8921[2])*Complex((-15.81226382964921),141.4994891422455);

Complex(0,0) = Complex(Vr5776[1],Vr5776[2])*Complex((-0.3031006722089554),22.060573558809576) + Complex(Vr7051[1],Vr7051[2])*Complex((-47.53755466818785),560.9431450846167) + Complex(Vr8103[1],Vr8103[2])*Complex((-0.4358920155056507),20.852369549846077) + Complex(Vr8847[1],Vr8847[2])*Complex(48.301994321772554,(-605.7159249877665));

Complex(0,0) = Complex(Vr6704[1],Vr6704[2])*Complex((-33.90104124626685),400.3551537654371) + Complex(Vr8574[1],Vr8574[2])*Complex((-25.051398559112666),292.8422107427308) + Complex(Vr8605[1],Vr8605[2])*Complex((-15.81226382964921),141.4994891422455) + Complex(Vr8921[1],Vr8921[2])*Complex(74.76470363502872,(-834.5331536504134));

Complex(0,0) = Complex(Vr955[1],Vr955[2])*Complex((-1.7169003673693486),9.647578121362741) + Complex(Vr1968[1],Vr1968[2])*Complex((-17.744597336643174),80.18453733764755) + Complex(Vr2168[1],Vr2168[2])*Complex(0.0,4504.504504504504) + Complex(Vr6826[1],Vr6826[2])*Complex((-1.0037208879412083),1.7021139566608758) + Complex(Vr6833[1],Vr6833[2])*Complex((-0.3431307803371276),25.64413666105041) + Complex(Vr8964[1],Vr8964[2])*Complex(24.601975730677754,(-4632.7263955084645)) + Complex(Vr9192[1],Vr9192[2])*Complex((-3.827594589986367),13.582166235999383) + Complex(Il8964[1],Il8964[2]);

Complex(0,0) = Complex(Vr4929[1],Vr4929[2])*Complex((-3.6168545421664957),43.25155223340768) + Complex(Vr6542[1],Vr6542[2])*Complex((-0.35973863282299157),30.636059646472006) + Complex(Vr9024[1],Vr9024[2])*Complex(3.979248502824532,(-73.74485601866172));

Complex(0,0) = Complex(Vr7563[1],Vr7563[2])*Complex((-0.23440149347535696),20.915731169112608) + Complex(Vr7762[1],Vr7762[2])*Complex((-16.164539618516862),195.51395538587064) + Complex(Vr9025[1],Vr9025[2])*Complex(16.417299186787336,(-217.8532882955234));

Complex(0,0) = Complex(Vr89[1],Vr89[2])*Complex((-24.435000503073546),217.51941624304683) + Complex(Vr7762[1],Vr7762[2])*Complex((-24.03769109964424),282.04224223582577) + Complex(Vr8574[1],Vr8574[2])*Complex((-34.58137839505019),303.75535076733274) + Complex(Vr9064[1],Vr9064[2])*Complex(83.05406999776798,(-803.1644092462053));

Complex(0,0) = Complex(Vr955[1],Vr955[2])*Complex((-0.4830005719006763),1.6910107683991458) + Complex(Vr1968[1],Vr1968[2])*Complex((-22.686018056125857),283.7372686876884) + Complex(Vr6069[1],Vr6069[2])*Complex((-0.29783706705153445),22.892373188202424) + Complex(Vr6826[1],Vr6826[2])*Complex((-0.46170818196540236),1.588054712895141) + Complex(Vr8964[1],Vr8964[2])*Complex((-3.827594589986367),13.582166235999383) + Complex(Vr9192[1],Vr9192[2])*Complex(27.73621916890194,(-321.9582978853539)) + Complex(Il9192[1],Il9192[2]);

Complex(Ig9239[1],Ig9239[2]) = Complex(Vr659[1],Vr659[2])*Complex((-140.81201595869516),1525.4635062191974) + Complex(Vr9239[1],Vr9239[2])*Complex(140.81201595869516,(-1525.4635062191974));


//Branch Flow Limits:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

cns_I3097_659 = I3097_659.re^2 + I3097_659.im^2 ;
cns_I9024_4929 = I9024_4929.re^2 + I9024_4929.im^2 ;
cns_I6069_6833 = I6069_6833.re^2 + I6069_6833.im^2 ;
cns_I6069_2268 = I6069_2268.re^2 + I6069_2268.im^2 ;
cns_I6069_7180 = I6069_7180.re^2 + I6069_7180.im^2 ;
cns_I6069_6293 = I6069_6293.re^2 + I6069_6293.im^2 ;
cns_I1968_8964 = I1968_8964.re^2 + I1968_8964.im^2 ;
cns_I8574_1616 = I8574_1616.re^2 + I8574_1616.im^2 ;
cns_I8574_1163 = I8574_1163.re^2 + I8574_1163.im^2 ;
cns_I8574_9064 = I8574_9064.re^2 + I8574_9064.im^2 ;
cns_I8574_8921 = I8574_8921.re^2 + I8574_8921.im^2 ;
cns_I3493_5587 = I3493_5587.re^2 + I3493_5587.im^2 ;
cns_I4929_2870 = I4929_2870.re^2 + I4929_2870.im^2 ;
cns_I4929_659 = I4929_659.re^2 + I4929_659.im^2 ;
cns_I4929_1037 = I4929_1037.re^2 + I4929_1037.im^2 ;
cns_I1616_7762 = I1616_7762.re^2 + I1616_7762.im^2 ;
cns_I1616_2520 = I1616_2520.re^2 + I1616_2520.im^2 ;
cns_I9064_7762 = I9064_7762.re^2 + I9064_7762.im^2 ;
cns_I9064_89 = I9064_89.re^2 + I9064_89.im^2 ;
cns_I1317_659 = I1317_659.re^2 + I1317_659.im^2 ;
cns_I1317_8605 = I1317_8605.re^2 + I1317_8605.im^2 ;
cns_I8605_1367 = I8605_1367.re^2 + I8605_1367.im^2 ;
cns_I8605_8921 = I8605_8921.re^2 + I8605_8921.im^2 ;
cns_I1163_1676 = I1163_1676.re^2 + I1163_1676.im^2 ;
cns_I1163_7051 = I1163_7051.re^2 + I1163_7051.im^2 ;
cns_I913_7762 = I913_7762.re^2 + I913_7762.im^2 ;
cns_I2107_7762 = I2107_7762.re^2 + I2107_7762.im^2 ;
cns_I2107_5996 = I2107_5996.re^2 + I2107_5996.im^2 ;
cns_I2107_6293 = I2107_6293.re^2 + I2107_6293.im^2 ;
cns_I6704_8921 = I6704_8921.re^2 + I6704_8921.im^2 ;
cns_I228_4586 = I228_4586.re^2 + I228_4586.im^2 ;
cns_I2441_6293 = I2441_6293.re^2 + I2441_6293.im^2 ;
cns_I955_3506 = I955_3506.re^2 + I955_3506.im^2 ;
cns_I659_8329 = I659_8329.re^2 + I659_8329.im^2 ;
cns_I659_7051 = I659_7051.re^2 + I659_7051.im^2 ;
cns_I659_9239 = I659_9239.re^2 + I659_9239.im^2 ;
cns_I659_7960 = I659_7960.re^2 + I659_7960.im^2 ;
cns_I659_6233 = I659_6233.re^2 + I659_6233.im^2 ;
cns_I659_5416 = I659_5416.re^2 + I659_5416.im^2 ;
cns_I792_3279 = I792_3279.re^2 + I792_3279.im^2 ;
cns_I5416_2267 = I5416_2267.re^2 + I5416_2267.im^2 ;
cns_I5416_7637 = I5416_7637.re^2 + I5416_7637.im^2 ;
cns_I8964_2168 = I8964_2168.re^2 + I8964_2168.im^2 ;
cns_I3659_5996 = I3659_5996.re^2 + I3659_5996.im^2 ;
cns_I5762_5996 = I5762_5996.re^2 + I5762_5996.im^2 ;
cns_I8181_8179 = I8181_8179.re^2 + I8181_8179.im^2 ;
cns_I8181_7762 = I8181_7762.re^2 + I8181_7762.im^2 ;
cns_I9025_7762 = I9025_7762.re^2 + I9025_7762.im^2 ;
cns_I8179_5509 = I8179_5509.re^2 + I8179_5509.im^2 ;
cns_I8179_7762 = I8179_7762.re^2 + I8179_7762.im^2 ;
cns_I5509_1579 = I5509_1579.re^2 + I5509_1579.im^2 ;
cns_I8335_1531 = I8335_1531.re^2 + I8335_1531.im^2 ;
cns_I7762_2268 = I7762_2268.re^2 + I7762_2268.im^2 ;
cns_I1579_5848 = I1579_5848.re^2 + I1579_5848.im^2 ;
cns_I7051_8847 = I7051_8847.re^2 + I7051_8847.im^2 ;
cns_I317_6233 = I317_6233.re^2 + I317_6233.im^2 ;
cns_I1611_8420 = I1611_8420.re^2 + I1611_8420.im^2 ;
cns_I6069_9192 = I6069_9192.re^2 + I6069_9192.im^2 ;
cns_I6069_1968 = I6069_1968.re^2 + I6069_1968.im^2 ;
cns_I6704_4586 = I6704_4586.re^2 + I6704_4586.im^2 ;
cns_I2441_3506 = I2441_3506.re^2 + I2441_3506.im^2 ;
cns_I1676_228 = I1676_228.re^2 + I1676_228.im^2 ;
cns_I7180_2168 = I7180_2168.re^2 + I7180_2168.im^2 ;
cns_I6833_8964 = I6833_8964.re^2 + I6833_8964.im^2 ;
cns_I3659_3242 = I3659_3242.re^2 + I3659_3242.im^2 ;
cns_I9025_7563 = I9025_7563.re^2 + I9025_7563.im^2 ;
cns_I2267_5210 = I2267_5210.re^2 + I2267_5210.im^2 ;
cns_I7762_271 = I7762_271.re^2 + I7762_271.im^2 ;
cns_I2268_2908 = I2268_2908.re^2 + I2268_2908.im^2 ;
cns_I317_2449 = I317_2449.re^2 + I317_2449.im^2 ;
cns_I7637_8581 = I7637_8581.re^2 + I7637_8581.im^2 ;
cns_I5848_7526 = I5848_7526.re^2 + I5848_7526.im^2 ;
cns_I2520_4665 = I2520_4665.re^2 + I2520_4665.im^2 ;
cns_I5996_8420 = I5996_8420.re^2 + I5996_8420.im^2 ;
cns_I2154_5996 = I2154_5996.re^2 + I2154_5996.im^2 ;

I3097_659=Complex(Vr3097[1],Vr3097[2])*Complex(-8.855418909837276,109.78293306031145)+Complex(Vr659[1],Vr659[2])*Complex(8.855418909837276,-109.78293306031145);
I9024_4929=Complex(Vr9024[1],Vr9024[2])*Complex(-3.6168545421664957,43.25155223340768)+Complex(Vr4929[1],Vr4929[2])*Complex(3.6168545421664957,-43.25155223340768);
I6069_6833=Complex(Vr6069[1],Vr6069[2])*Complex(24.641669062384494,-212.19215025942202)+Complex(Vr6833[1],Vr6833[2])*Complex(-24.641669062384494,212.19215025942202);
I6069_2268=Complex(Vr6069[1],Vr6069[2])*Complex(-9.84950580495477,87.86384543467588)+Complex(Vr2268[1],Vr2268[2])*Complex(9.84950580495477,-87.86384543467588);
I6069_7180=Complex(Vr6069[1],Vr6069[2])*Complex(17.140836972785348,-188.19210593037246)+Complex(Vr7180[1],Vr7180[2])*Complex(-17.140836972785348,188.19210593037246);
I6069_6293=Complex(Vr6069[1],Vr6069[2])*Complex(9.24914952942132,-105.80124705606339)+Complex(Vr6293[1],Vr6293[2])*Complex(-9.24914952942132,105.80124705606339);
I1968_8964=Complex(Vr1968[1],Vr1968[2])*Complex(17.744597336643174,-80.18453733764755)+Complex(Vr8964[1],Vr8964[2])*Complex(-17.744597336643174,80.18453733764755);
I8574_1616=Complex(Vr8574[1],Vr8574[2])*Complex(-25.910694473049556,256.4494376050546)+Complex(Vr1616[1],Vr1616[2])*Complex(25.910694473049556,-256.4494376050546);
I8574_1163=Complex(Vr8574[1],Vr8574[2])*Complex(-7.360495606704186,87.2525416711392)+Complex(Vr1163[1],Vr1163[2])*Complex(7.360495606704186,-87.2525416711392);
I8574_9064=Complex(Vr8574[1],Vr8574[2])*Complex(34.58137839505019,-303.75535076733274)+Complex(Vr9064[1],Vr9064[2])*Complex(-34.58137839505019,303.75535076733274);
I8574_8921=Complex(Vr8574[1],Vr8574[2])*Complex(25.051398559112666,-292.8422107427308)+Complex(Vr8921[1],Vr8921[2])*Complex(-25.051398559112666,292.8422107427308);
I3493_5587=Complex(Vr3493[1],Vr3493[2])*Complex(0.0,-4504.504504504504)+Complex(Vr5587[1],Vr5587[2])*Complex(-0.0,4504.504504504504);
I4929_2870=Complex(Vr4929[1],Vr4929[2])*Complex(-235.7100766057749,2416.0282852091927)+Complex(Vr2870[1],Vr2870[2])*Complex(235.7100766057749,-2416.0282852091927);
I4929_659=Complex(Vr4929[1],Vr4929[2])*Complex(-7.316224021097636,91.41075299923138)+Complex(Vr659[1],Vr659[2])*Complex(7.316224021097636,-91.41075299923138);
I4929_1037=Complex(Vr4929[1],Vr4929[2])*Complex(-187.61726078799248,2157.5984990619136)+Complex(Vr1037[1],Vr1037[2])*Complex(187.61726078799248,-2157.5984990619136);
I1616_7762=Complex(Vr1616[1],Vr1616[2])*Complex(42.17144609722435,-306.7014261616316)+Complex(Vr7762[1],Vr7762[2])*Complex(-42.17144609722435,306.7014261616316);
I1616_2520=Complex(Vr1616[1],Vr1616[2])*Complex(19.06838503214681,-202.70522349390848)+Complex(Vr2520[1],Vr2520[2])*Complex(-19.06838503214681,202.70522349390848);
I9064_7762=Complex(Vr9064[1],Vr9064[2])*Complex(-24.03769109964424,282.04224223582577)+Complex(Vr7762[1],Vr7762[2])*Complex(24.03769109964424,-282.04224223582577);
I9064_89=Complex(Vr9064[1],Vr9064[2])*Complex(-24.435000503073546,217.51941624304683)+Complex(Vr89[1],Vr89[2])*Complex(24.435000503073546,-217.51941624304683);
I1317_659=Complex(Vr1317[1],Vr1317[2])*Complex(-12.118187974480522,132.94365042591866)+Complex(Vr659[1],Vr659[2])*Complex(12.118187974480522,-132.94365042591866);
I1317_8605=Complex(Vr1317[1],Vr1317[2])*Complex(8.83079345153936,-97.04377319863683)+Complex(Vr8605[1],Vr8605[2])*Complex(-8.83079345153936,97.04377319863683);
I8605_1367=Complex(Vr8605[1],Vr8605[2])*Complex(-247.52475247524754,2475.2475247524753)+Complex(Vr1367[1],Vr1367[2])*Complex(247.52475247524754,-2475.2475247524753);
I8605_8921=Complex(Vr8605[1],Vr8605[2])*Complex(15.81226382964921,-141.4994891422455)+Complex(Vr8921[1],Vr8921[2])*Complex(-15.81226382964921,141.4994891422455);
I1163_1676=Complex(Vr1163[1],Vr1163[2])*Complex(214.47721179624668,-2305.6300268096516)+Complex(Vr1676[1],Vr1676[2])*Complex(-214.47721179624668,2305.6300268096516);
I1163_7051=Complex(Vr1163[1],Vr1163[2])*Complex(26.012944040954782,-321.51998834620105)+Complex(Vr7051[1],Vr7051[2])*Complex(-26.012944040954782,321.51998834620105);
I913_7762=Complex(Vr913[1],Vr913[2])*Complex(16.11504081905552,-184.4657863968483)+Complex(Vr7762[1],Vr7762[2])*Complex(-16.11504081905552,184.4657863968483);
I2107_7762=Complex(Vr2107[1],Vr2107[2])*Complex(15.210634217313672,-181.20494676278025)+Complex(Vr7762[1],Vr7762[2])*Complex(-15.210634217313672,181.20494676278025);
I2107_5996=Complex(Vr2107[1],Vr2107[2])*Complex(53.00646016233229,-573.1323505052178)+Complex(Vr5996[1],Vr5996[2])*Complex(-53.00646016233229,573.1323505052178);
I2107_6293=Complex(Vr2107[1],Vr2107[2])*Complex(7.575076537934477,-67.12613004398564)+Complex(Vr6293[1],Vr6293[2])*Complex(-7.575076537934477,67.12613004398564);
I6704_8921=Complex(Vr6704[1],Vr6704[2])*Complex(33.90104124626685,-400.3551537654371)+Complex(Vr8921[1],Vr8921[2])*Complex(-33.90104124626685,400.3551537654371);
I228_4586=Complex(Vr228[1],Vr228[2])*Complex(8.9668314678124,-44.290960534134165)+Complex(Vr4586[1],Vr4586[2])*Complex(-8.9668314678124,44.290960534134165);
I2441_6293=Complex(Vr2441[1],Vr2441[2])*Complex(28.53847342949213,-343.6507842134677)+Complex(Vr6293[1],Vr6293[2])*Complex(-28.53847342949213,343.6507842134677);
I955_3506=Complex(Vr955[1],Vr955[2])*Complex(0.0,-4504.504504504504)+Complex(Vr3506[1],Vr3506[2])*Complex(-0.0,4504.504504504504);
I659_8329=Complex(Vr659[1],Vr659[2])*Complex(36.10069971650333,-323.84451216275045)+Complex(Vr8329[1],Vr8329[2])*Complex(-36.10069971650333,323.84451216275045);
I659_7051=Complex(Vr659[1],Vr659[2])*Complex(7.735099870830119,-78.92317347879512)+Complex(Vr7051[1],Vr7051[2])*Complex(-7.735099870830119,78.92317347879512);
I659_9239=Complex(Vr659[1],Vr659[2])*Complex(140.81201595869516,-1525.4635062191974)+Complex(Vr9239[1],Vr9239[2])*Complex(-140.81201595869516,1525.4635062191974);
I659_7960=Complex(Vr659[1],Vr659[2])*Complex(149.81273408239696,-1573.0337078651683)+Complex(Vr7960[1],Vr7960[2])*Complex(-149.81273408239696,1573.0337078651683);
I659_6233=Complex(Vr659[1],Vr659[2])*Complex(196.01437438745506,-1796.798431885005)+Complex(Vr6233[1],Vr6233[2])*Complex(-196.01437438745506,1796.798431885005);
I659_5416=Complex(Vr659[1],Vr659[2])*Complex(8.375164985449478,-102.62227475841891)+Complex(Vr5416[1],Vr5416[2])*Complex(-8.375164985449478,102.62227475841891);
I792_3279=Complex(Vr792[1],Vr792[2])*Complex(0.0,-4504.504504504504)+Complex(Vr3279[1],Vr3279[2])*Complex(-0.0,4504.504504504504);
I5416_2267=Complex(Vr5416[1],Vr5416[2])*Complex(-52.23636957231472,463.5977799542931)+Complex(Vr2267[1],Vr2267[2])*Complex(52.23636957231472,-463.5977799542931);
I5416_7637=Complex(Vr5416[1],Vr5416[2])*Complex(11.770587453566296,-111.8838635371248)+Complex(Vr7637[1],Vr7637[2])*Complex(-11.770587453566296,111.8838635371248);
I8964_2168=Complex(Vr8964[1],Vr8964[2])*Complex(-0.0,4504.504504504504)+Complex(Vr2168[1],Vr2168[2])*Complex(0.0,-4504.504504504504);
I3659_5996=Complex(Vr3659[1],Vr3659[2])*Complex(42.91845493562232,-486.40915593705296)+Complex(Vr5996[1],Vr5996[2])*Complex(-42.91845493562232,486.40915593705296);
I5762_5996=Complex(Vr5762[1],Vr5762[2])*Complex(41.29576947783794,-477.1955584105717)+Complex(Vr5996[1],Vr5996[2])*Complex(-41.29576947783794,477.1955584105717);
I8181_8179=Complex(Vr8181[1],Vr8181[2])*Complex(-30.55692459339576,312.46919664859536)+Complex(Vr8179[1],Vr8179[2])*Complex(30.55692459339576,-312.46919664859536);
I8181_7762=Complex(Vr8181[1],Vr8181[2])*Complex(-17.210119550295573,199.3171985127255)+Complex(Vr7762[1],Vr7762[2])*Complex(17.210119550295573,-199.3171985127255);
I9025_7762=Complex(Vr9025[1],Vr9025[2])*Complex(-16.164539618516862,195.51395538587064)+Complex(Vr7762[1],Vr7762[2])*Complex(16.164539618516862,-195.51395538587064);
I8179_5509=Complex(Vr8179[1],Vr8179[2])*Complex(-15.19157811755818,142.47236775115374)+Complex(Vr5509[1],Vr5509[2])*Complex(15.19157811755818,-142.47236775115374);
I8179_7762=Complex(Vr8179[1],Vr8179[2])*Complex(-10.548785028171462,124.10335327260542)+Complex(Vr7762[1],Vr7762[2])*Complex(10.548785028171462,-124.10335327260542);
I5509_1579=Complex(Vr5509[1],Vr5509[2])*Complex(-10.880733559273416,110.66200608579211)+Complex(Vr1579[1],Vr1579[2])*Complex(10.880733559273416,-110.66200608579211);
I8335_1531=Complex(Vr8335[1],Vr8335[2])*Complex(-0.0,4504.504504504504)+Complex(Vr1531[1],Vr1531[2])*Complex(0.0,-4504.504504504504);
I7762_2268=Complex(Vr7762[1],Vr7762[2])*Complex(-11.015787102650695,127.75024744417297)+Complex(Vr2268[1],Vr2268[2])*Complex(11.015787102650695,-127.75024744417297);
I1579_5848=Complex(Vr1579[1],Vr1579[2])*Complex(30.1559060341968,-272.910949609481)+Complex(Vr5848[1],Vr5848[2])*Complex(-30.1559060341968,272.910949609481);
I7051_8847=Complex(Vr7051[1],Vr7051[2])*Complex(47.53755466818785,-560.9431450846167)+Complex(Vr8847[1],Vr8847[2])*Complex(-47.53755466818785,560.9431450846167);
I317_6233=Complex(Vr317[1],Vr317[2])*Complex(409.83606557377044,-4508.196721311475)+Complex(Vr6233[1],Vr6233[2])*Complex(-409.83606557377044,4508.196721311475);
I1611_8420=Complex(Vr1611[1],Vr1611[2])*Complex(0.0,-4504.504504504504)+Complex(Vr8420[1],Vr8420[2])*Complex(-0.0,4504.504504504504);
I6069_9192=Complex(Vr6069[1],Vr6069[2])*Complex(0.3192070193778214,-24.534911937695313)+Complex(Vr9192[1],Vr9192[2])*Complex(-0.29783706705153445,22.892373188202424);
I6069_1968=Complex(Vr6069[1],Vr6069[2])*Complex(-0.3163768440415278,24.243045964605884)+Complex(Vr1968[1],Vr1968[2])*Complex(0.34681696945016915,-26.575585065834147);
I6704_4586=Complex(Vr6704[1],Vr6704[2])*Complex(-0.26393739199208854,22.083812741918244)+Complex(Vr4586[1],Vr4586[2])*Complex(0.2858299666258633,-23.91557865807628);
I2441_3506=Complex(Vr2441[1],Vr2441[2])*Complex(0.20117703895729308,-23.06106388296779)+Complex(Vr3506[1],Vr3506[2])*Complex(-0.1916036272044324,21.963657035969);
I1676_228=Complex(Vr1676[1],Vr1676[2])*Complex(-0.2854748750055636,20.407364222942057)+Complex(Vr228[1],Vr228[2])*Complex(0.3053252936467109,-21.82638480463029);
I7180_2168=Complex(Vr7180[1],Vr7180[2])*Complex(-0.3382448832653567,25.098236079953164)+Complex(Vr2168[1],Vr2168[2])*Complex(0.3660508369410746,-27.16147612971887);
I6833_8964=Complex(Vr6833[1],Vr6833[2])*Complex(0.38083116113354265,-28.461702943990776)+Complex(Vr8964[1],Vr8964[2])*Complex(-0.3431307803371276,25.64413666105041);
I3659_3242=Complex(Vr3659[1],Vr3659[2])*Complex(-0.26393739199208854,22.083812741918244)+Complex(Vr3242[1],Vr3242[2])*Complex(0.2858299666258633,-23.91557865807628);
I9025_7563=Complex(Vr9025[1],Vr9025[2])*Complex(-0.23440149347535696,20.915731169112608)+Complex(Vr7563[1],Vr7563[2])*Complex(0.25070053827047356,-22.370100909652773);
I2267_5210=Complex(Vr2267[1],Vr2267[2])*Complex(0.2897120556223067,-27.25447057555748)+Complex(Vr5210[1],Vr5210[2])*Complex(-0.2801686507980523,26.356681060328043);
I7762_271=Complex(Vr7762[1],Vr7762[2])*Complex(-0.27693101911112805,22.052017051819128)+Complex(Vr271[1],Vr271[2])*Complex(0.29182088810584045,-23.237697319868072);
I2268_2908=Complex(Vr2268[1],Vr2268[2])*Complex(0.23612903168485305,-22.733401536129485)+Complex(Vr2908[1],Vr2908[2])*Complex(-0.2206913878513607,21.24713721050041);
I317_2449=Complex(Vr317[1],Vr317[2])*Complex(0.2975700335577194,-23.553924133507856)+Complex(Vr2449[1],Vr2449[2])*Complex(-0.27764861252113077,21.977059574541904);
I7637_8581=Complex(Vr7637[1],Vr7637[2])*Complex(0.37464549014392845,-64.51811613045274)+Complex(Vr8581[1],Vr8581[2])*Complex(0.10752422877803897,64.51911427481082);
I5848_7526=Complex(Vr5848[1],Vr5848[2])*Complex(0.9704027171276081,-103.83309073265406)+Complex(Vr7526[1],Vr7526[2])*Complex(-1.2940272012621905,103.82956181228626);
I2520_4665=Complex(Vr2520[1],Vr2520[2])*Complex(0.37032576360809594,-25.598697083183975)+Complex(Vr4665[1],Vr4665[2])*Complex(-0.3455335647118248,23.88494110955606);
I5996_8420=Complex(Vr5996[1],Vr5996[2])*Complex(0.41976989212422355,-27.103351542229717)+Complex(Vr8420[1],Vr8420[2])*Complex(-0.3876184567767529,25.027424537555717);
I2154_5996=Complex(Vr2154[1],Vr2154[2])*Complex(0.9180123103614796,-100.99155427654455)+Complex(Vr5996[1],Vr5996[2])*Complex(-0.6480124259998506,100.99364763038301);

//Voltage Magnitude Equations:
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

cns_Vabs89 = Vr89[1]^2 + Vr89[2]^2;
cns_Vabs228 = Vr228[1]^2 + Vr228[2]^2;
cns_Vabs271 = Vr271[1]^2 + Vr271[2]^2;
cns_Vabs317 = Vr317[1]^2 + Vr317[2]^2;
cns_Vabs659 = Vr659[1]^2 + Vr659[2]^2;
cns_Vabs792 = Vr792[1]^2 + Vr792[2]^2;
cns_Vabs955 = Vr955[1]^2 + Vr955[2]^2;
cns_Vabs1037 = Vr1037[1]^2 + Vr1037[2]^2;
cns_Vabs1163 = Vr1163[1]^2 + Vr1163[2]^2;
cns_Vabs1317 = Vr1317[1]^2 + Vr1317[2]^2;
cns_Vabs1367 = Vr1367[1]^2 + Vr1367[2]^2;
cns_Vabs1445 = Vr1445[1]^2 + Vr1445[2]^2;
cns_Vabs1531 = Vr1531[1]^2 + Vr1531[2]^2;
cns_Vabs1579 = Vr1579[1]^2 + Vr1579[2]^2;
cns_Vabs1611 = Vr1611[1]^2 + Vr1611[2]^2;
cns_Vabs1616 = Vr1616[1]^2 + Vr1616[2]^2;
cns_Vabs1676 = Vr1676[1]^2 + Vr1676[2]^2;
cns_Vabs1815 = Vr1815[1]^2 + Vr1815[2]^2;
cns_Vabs1968 = Vr1968[1]^2 + Vr1968[2]^2;
cns_Vabs2107 = Vr2107[1]^2 + Vr2107[2]^2;
cns_Vabs2154 = Vr2154[1]^2 + Vr2154[2]^2;
cns_Vabs2168 = Vr2168[1]^2 + Vr2168[2]^2;
cns_Vabs2267 = Vr2267[1]^2 + Vr2267[2]^2;
cns_Vabs2268 = Vr2268[1]^2 + Vr2268[2]^2;
cns_Vabs2299 = Vr2299[1]^2 + Vr2299[2]^2;
cns_Vabs2441 = Vr2441[1]^2 + Vr2441[2]^2;
cns_Vabs2449 = Vr2449[1]^2 + Vr2449[2]^2;
cns_Vabs2520 = Vr2520[1]^2 + Vr2520[2]^2;
cns_Vabs2870 = Vr2870[1]^2 + Vr2870[2]^2;
cns_Vabs2908 = Vr2908[1]^2 + Vr2908[2]^2;
cns_Vabs3097 = Vr3097[1]^2 + Vr3097[2]^2;
cns_Vabs3242 = Vr3242[1]^2 + Vr3242[2]^2;
cns_Vabs3279 = Vr3279[1]^2 + Vr3279[2]^2;
cns_Vabs3493 = Vr3493[1]^2 + Vr3493[2]^2;
cns_Vabs3506 = Vr3506[1]^2 + Vr3506[2]^2;
cns_Vabs3659 = Vr3659[1]^2 + Vr3659[2]^2;
cns_Vabs4014 = Vr4014[1]^2 + Vr4014[2]^2;
cns_Vabs4423 = Vr4423[1]^2 + Vr4423[2]^2;
cns_Vabs4427 = Vr4427[1]^2 + Vr4427[2]^2;
cns_Vabs4495 = Vr4495[1]^2 + Vr4495[2]^2;
cns_Vabs4586 = Vr4586[1]^2 + Vr4586[2]^2;
cns_Vabs4665 = Vr4665[1]^2 + Vr4665[2]^2;
cns_Vabs4929 = Vr4929[1]^2 + Vr4929[2]^2;
cns_Vabs5097 = Vr5097[1]^2 + Vr5097[2]^2;
cns_Vabs5155 = Vr5155[1]^2 + Vr5155[2]^2;
cns_Vabs5210 = Vr5210[1]^2 + Vr5210[2]^2;
cns_Vabs5416 = Vr5416[1]^2 + Vr5416[2]^2;
cns_Vabs5509 = Vr5509[1]^2 + Vr5509[2]^2;
cns_Vabs5587 = Vr5587[1]^2 + Vr5587[2]^2;
cns_Vabs5762 = Vr5762[1]^2 + Vr5762[2]^2;
cns_Vabs5776 = Vr5776[1]^2 + Vr5776[2]^2;
cns_Vabs5848 = Vr5848[1]^2 + Vr5848[2]^2;
cns_Vabs5996 = Vr5996[1]^2 + Vr5996[2]^2;
cns_Vabs6069 = Vr6069[1]^2 + Vr6069[2]^2;
cns_Vabs6233 = Vr6233[1]^2 + Vr6233[2]^2;
cns_Vabs6293 = Vr6293[1]^2 + Vr6293[2]^2;
cns_Vabs6542 = Vr6542[1]^2 + Vr6542[2]^2;
cns_Vabs6704 = Vr6704[1]^2 + Vr6704[2]^2;
cns_Vabs6798 = Vr6798[1]^2 + Vr6798[2]^2;
cns_Vabs6826 = Vr6826[1]^2 + Vr6826[2]^2;
cns_Vabs6833 = Vr6833[1]^2 + Vr6833[2]^2;
cns_Vabs7051 = Vr7051[1]^2 + Vr7051[2]^2;
cns_Vabs7180 = Vr7180[1]^2 + Vr7180[2]^2;
cns_Vabs7279 = Vr7279[1]^2 + Vr7279[2]^2;
cns_Vabs7526 = Vr7526[1]^2 + Vr7526[2]^2;
cns_Vabs7563 = Vr7563[1]^2 + Vr7563[2]^2;
cns_Vabs7637 = Vr7637[1]^2 + Vr7637[2]^2;
cns_Vabs7762 = Vr7762[1]^2 + Vr7762[2]^2;
cns_Vabs7829 = Vr7829[1]^2 + Vr7829[2]^2;
cns_Vabs7960 = Vr7960[1]^2 + Vr7960[2]^2;
cns_Vabs8103 = Vr8103[1]^2 + Vr8103[2]^2;
cns_Vabs8179 = Vr8179[1]^2 + Vr8179[2]^2;
cns_Vabs8181 = Vr8181[1]^2 + Vr8181[2]^2;
cns_Vabs8229 = Vr8229[1]^2 + Vr8229[2]^2;
cns_Vabs8329 = Vr8329[1]^2 + Vr8329[2]^2;
cns_Vabs8335 = Vr8335[1]^2 + Vr8335[2]^2;
cns_Vabs8420 = Vr8420[1]^2 + Vr8420[2]^2;
cns_Vabs8574 = Vr8574[1]^2 + Vr8574[2]^2;
cns_Vabs8581 = Vr8581[1]^2 + Vr8581[2]^2;
cns_Vabs8605 = Vr8605[1]^2 + Vr8605[2]^2;
cns_Vabs8847 = Vr8847[1]^2 + Vr8847[2]^2;
cns_Vabs8921 = Vr8921[1]^2 + Vr8921[2]^2;
cns_Vabs8964 = Vr8964[1]^2 + Vr8964[2]^2;
cns_Vabs9024 = Vr9024[1]^2 + Vr9024[2]^2;
cns_Vabs9025 = Vr9025[1]^2 + Vr9025[2]^2;
cns_Vabs9064 = Vr9064[1]^2 + Vr9064[2]^2;
cns_Vabs9192 = Vr9192[1]^2 + Vr9192[2]^2;
cns_Vabs9239 = Vr9239[1]^2 + Vr9239[2]^2;

end case89_2;