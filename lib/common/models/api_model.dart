class ApiModel {
  bool? success;
  String? terms;
  String? privacy;
  int? timestamp;
  String? target;
  Rates? rates;

  ApiModel(
      {this.success,
      this.terms,
      this.privacy,
      this.timestamp,
      this.target,
      this.rates});

  ApiModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    terms = json['terms'];
    privacy = json['privacy'];
    timestamp = json['timestamp'];
    target = json['target'];
    rates = json['rates'] != null ? new Rates.fromJson(json['rates']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['terms'] = this.terms;
    data['privacy'] = this.privacy;
    data['timestamp'] = this.timestamp;
    data['target'] = this.target;
    if (this.rates != null) {
      data['rates'] = this.rates!.toJson();
    }
    return data;
  }
}

class Rates {
  double? d611;
  double? aBC;
  double? aCP;
  double? aCT;

  double? aDA;
  double? aDCN;
  double? aDL;
  double? aDX;
  double? aDZ;
  double? aE;
  double? aGI;
  double? aIB;
  double? aIDOC;
  double? aION;
  double? aIR;
  double? aLT;
  double? aMB;
  double? aMM;
  double? aNT;
  double? aPC;
  double? aPPC;
  double? aRC;
  double? aRCT;
  double? aRDR;
  double? aRK;
  double? aRN;
  double? aSAFE2;
  double? aST;
  double? aTB;
  double? aTM;
  double? aURS;
  double? aVAX;
  double? aVT;
  double? bAR;
  double? bASH;
  double? bAT;
  double? bAY;
  double? bBP;
  double? bCD;
  double? bCH;
  double? bCN;
  double? bCPT;
  double? bEE;
  double? bIO;
  double? bLC;
  double? bLOCK;
  double? bLU;
  double? bLZ;
  double? bMC;
  double? bNB;
  double? bNT;
  double? bOST;
  double? bQ;
  double? bQX;
  double? bRD;
  double? bRIT;
  int? bT1;
  int? bT2;
  double? bTC;
  double? bTCA;
  double? bTCS;
  double? bTCZ;
  int? bTG;
  int? bTLC;
  double? bTM;

  double? bTQ;
  double? bTS;
  double? bTX;
  double? bURST;
  double? cALC;
  double? cAS;
  double? cAT;
  double? cCRB;
  double? cDT;
  double? cESC;
  double? cHAT;
  double? cJ;
  double? cL;
  double? cLD;
  int? cLOAK;
  double? cMT;
  double? cND;
  double? cNX;
  double? cPC;
  double? cRAVE;
  double? cRC;
  double? cRE;
  double? cRW;
  double? cTO;
  double? cTR;
  double? cVC;
  double? dAS;
  double? dASH;
  double? dAT;
  int? dATA;
  double? dBC;
  double? dBET;
  double? dCN;
  double? dCR;
  double? dCT;
  double? dEEP;
  double? dENT;
  double? dGB;
  double? dGD;
  double? dIM;
  double? dIME;
  double? dMD;
  double? dNT;
  double? dOGE;
  double? dRGN;
  int? dRZ;
  double? dSH;
  double? dTA;
  int? eC;
  double? eDG;
  double? eDO;
  double? eDR;
  double? eKO;
  double? eLA;
  double? eLF;
  double? eMC;
  double? eMGO;
  double? eNG;
  double? eNJ;
  double? eOS;
  double? eRT;
  double? eTC;
  double? eTH;
  double? eTN;
  double? eTP;
  double? eTT;
  double? eVR;
  double? eVX;
  double? fCT;
  double? fLP;
  double? fOTA;
  double? fRST;
  double? fUEL;
  double? fUN;
  double? fUNC;
  double? fUTC;
  double? gAME;
  double? gAS;
  double? gBYTE;
  double? gMX;
  double? gNO;
  double? gNT;
  double? gNX;
  double? gRC;
  int? gRS;
  int? gRWI;
  double? gTC;
  double? gTO;
  double? gUP;
  double? gVT;
  double? gXS;
  double? hAC;
  int? hNC;
  double? hSR;
  double? hST;
  double? hVN;
  double? iCN;
  int? iCOS;
  double? iCX;
  double? iGNIS;
  double? iLC;
  double? iNK;
  double? iNS;
  double? iNSN;
  double? iNT;
  double? iOP;
  double? iOST;
  double? iTC;
  double? kCS;
  double? kICK;
  double? kIN;
  double? kLC;
  double? kMD;
  double? kNC;
  int? kRB;
  double? lA;
  double? lEND;
  double? lEO;
  double? lINDA;
  double? lINK;
  double? lOC;
  double? lOG;
  double? lRC;
  double? lSK;
  double? lTC;
  double? lUN;
  double? lUX;
  double? mAID;
  double? mANA;
  double? mCAP;
  double? mCO;
  double? mDA;
  double? mDS;
  double? mIOTA;
  double? mKR;
  double? mLN;
  double? mNX;
  double? mOD;
  double? mOIN;
  double? mONA;
  double? mTL;
  double? mTN;
  double? mTX;
  double? nAS;
  double? nAV;
  double? nBT;
  double? nDC;
  double? nEBL;
  double? nEO;
  double? nEU;
  double? nEWB;
  double? nGC;
  double? nKC;
  double? nLC2;
  double? nMC;
  double? nMR;
  double? nULS;
  int? nVC;
  double? nXT;
  double? oAX;
  double? oBITS;
  double? oC;
  double? oCN;
  double? oDN;
  double? oK;
  double? oMG;
  double? oMNI;
  int? oRE;
  double? oRME;
  double? oST;
  int? oTN;
  double? oTX;
  double? oXY;
  double? pART;
  double? pAY;
  double? pBT;
  double? pCS;
  double? pIVX;
  double? pIZZA;
  int? pLBT;
  double? pLR;
  double? pOE;
  double? pOLY;
  double? pOSW;
  double? pOWR;
  double? pPC;
  double? pPT;
  double? pPY;
  double? pRC;
  double? pRES;
  double? pRG;
  double? pRL;
  double? pRO;
  double? pURA;
  int? pUT;
  double? qASH;
  int? qAU;
  double? qSP;
  double? qTUM;
  double? qUN;
  double? r;
  int? rBIES;
  double? rCN;
  double? rDD;
  int? rDN;

  double? rEBL;
  double? rEE;
  double? rEP;
  double? rEQ;
  double? rEV;
  double? rGC;
  double? rHOC;
  double? rIYA;
  int? rKC;
  double? rLC;
  double? rPX;
  double? rUFF;
  double? sALT;
  double? sAN;
  int? sBC;
  double? sC;
  double? sENT;
  int? sHIFT;
  double? sIB;
  double? sMART;
  double? sMLY;
  double? sMT;
  double? sNC;
  double? sNGLS;
  double? sNM;
  double? sNT;
  double? sOL;
  double? sPK;
  double? sRN;
  double? sTEEM;
  double? sTK;
  double? sTORJ;
  double? sTRAT;
  double? sTU;
  double? sTX;
  double? sUB;
  double? sUR;
  double? sWFTC;
  double? sYS;
  int? tAAS;
  double? tESLA;
  double? tHC;
  double? tHETA;
  double? tHS;
  double? tIO;
  int? tKN;
  double? tKY;
  double? tNB;
  double? tNT;
  double? tOA;
  double? tRC;
  double? tRIG;
  double? tRST;
  double? tRUMP;
  double? tRX;
  double? uBQ;
  double? uNO;
  double? uNRC;
  int? uQC;
  double? uSDT;
  double? uTK;
  double? uTT;
  double? vEE;
  double? vEN;
  double? vERI;
  double? vIA;
  double? vIB;
  double? vIBE;
  double? vOISE;
  double? vOX;
  double? vRS;
  double? vTC;
  double? vUC;
  double? wABI;
  double? wAVES;
  double? wAX;
  double? wC;
  double? wGR;
  double? wINGS;
  double? wLK;
  double? wOP;
  double? wPR;
  double? wRC;
  double? wTC;
  double? xAUR;
  double? xBP;
  double? xBY;
  double? xCP;
  double? xCXT;
  double? xDN;
  double? xEM;
  double? xGB;
  double? xHI;
  double? xID;
  double? xLM;
  double? xMR;
  double? xNC;
  double? xRB;
  double? xRP;
  double? xTO;
  double? xTZ;
  double? xUC;
  double? xVG;
  double? xZC;
  double? yEE;
  double? yOC;
  double? yOYOW;
  double? zBC;
  double? zCL;
  double? zEC;
  double? zEN;
  double? zIL;
  double? zNY;
  double? zRX;
  double? zSC;

  Rates(
      {this.d611,
      this.aBC,
      this.aCP,
      this.aCT,
      this.aDA,
      this.aDCN,
      this.aDL,
      this.aDX,
      this.aDZ,
      this.aE,
      this.aGI,
      this.aIB,
      this.aIDOC,
      this.aION,
      this.aIR,
      this.aLT,
      this.aMB,
      this.aMM,
      this.aNT,
      this.aPC,
      this.aPPC,
      this.aRC,
      this.aRCT,
      this.aRDR,
      this.aRK,
      this.aRN,
      this.aSAFE2,
      this.aST,
      this.aTB,
      this.aTM,
      this.aURS,
      this.aVAX,
      this.aVT,
      this.bAR,
      this.bASH,
      this.bAT,
      this.bAY,
      this.bBP,
      this.bCD,
      this.bCH,
      this.bCN,
      this.bCPT,
      this.bEE,
      this.bIO,
      this.bLC,
      this.bLOCK,
      this.bLU,
      this.bLZ,
      this.bMC,
      this.bNB,
      this.bNT,
      this.bOST,
      this.bQ,
      this.bQX,
      this.bRD,
      this.bRIT,
      this.bT1,
      this.bT2,
      this.bTC,
      this.bTCA,
      this.bTCS,
      this.bTCZ,
      this.bTG,
      this.bTLC,
      this.bTM,
      this.bTQ,
      this.bTS,
      this.bTX,
      this.bURST,
      this.cALC,
      this.cAS,
      this.cAT,
      this.cCRB,
      this.cDT,
      this.cESC,
      this.cHAT,
      this.cJ,
      this.cL,
      this.cLD,
      this.cLOAK,
      this.cMT,
      this.cND,
      this.cNX,
      this.cPC,
      this.cRAVE,
      this.cRC,
      this.cRE,
      this.cRW,
      this.cTO,
      this.cTR,
      this.cVC,
      this.dAS,
      this.dASH,
      this.dAT,
      this.dATA,
      this.dBC,
      this.dBET,
      this.dCN,
      this.dCR,
      this.dCT,
      this.dEEP,
      this.dENT,
      this.dGB,
      this.dGD,
      this.dIM,
      this.dIME,
      this.dMD,
      this.dNT,
      this.dOGE,
      this.dRGN,
      this.dRZ,
      this.dSH,
      this.dTA,
      this.eC,
      this.eDG,
      this.eDO,
      this.eDR,
      this.eKO,
      this.eLA,
      this.eLF,
      this.eMC,
      this.eMGO,
      this.eNG,
      this.eNJ,
      this.eOS,
      this.eRT,
      this.eTC,
      this.eTH,
      this.eTN,
      this.eTP,
      this.eTT,
      this.eVR,
      this.eVX,
      this.fCT,
      this.fLP,
      this.fOTA,
      this.fRST,
      this.fUEL,
      this.fUN,
      this.fUNC,
      this.fUTC,
      this.gAME,
      this.gAS,
      this.gBYTE,
      this.gMX,
      this.gNO,
      this.gNT,
      this.gNX,
      this.gRC,
      this.gRS,
      this.gRWI,
      this.gTC,
      this.gTO,
      this.gUP,
      this.gVT,
      this.gXS,
      this.hAC,
      this.hNC,
      this.hSR,
      this.hST,
      this.hVN,
      this.iCN,
      this.iCOS,
      this.iCX,
      this.iGNIS,
      this.iLC,
      this.iNK,
      this.iNS,
      this.iNSN,
      this.iNT,
      this.iOP,
      this.iOST,
      this.iTC,
      this.kCS,
      this.kICK,
      this.kIN,
      this.kLC,
      this.kMD,
      this.kNC,
      this.kRB,
      this.lA,
      this.lEND,
      this.lEO,
      this.lINDA,
      this.lINK,
      this.lOC,
      this.lOG,
      this.lRC,
      this.lSK,
      this.lTC,
      this.lUN,
      this.lUX,
      this.mAID,
      this.mANA,
      this.mCAP,
      this.mCO,
      this.mDA,
      this.mDS,
      this.mIOTA,
      this.mKR,
      this.mLN,
      this.mNX,
      this.mOD,
      this.mOIN,
      this.mONA,
      this.mTL,
      this.mTN,
      this.mTX,
      this.nAS,
      this.nAV,
      this.nBT,
      this.nDC,
      this.nEBL,
      this.nEO,
      this.nEU,
      this.nEWB,
      this.nGC,
      this.nKC,
      this.nLC2,
      this.nMC,
      this.nMR,
      this.nULS,
      this.nVC,
      this.nXT,
      this.oAX,
      this.oBITS,
      this.oC,
      this.oCN,
      this.oDN,
      this.oK,
      this.oMG,
      this.oMNI,
      this.oRE,
      this.oRME,
      this.oST,
      this.oTN,
      this.oTX,
      this.oXY,
      this.pART,
      this.pAY,
      this.pBT,
      this.pCS,
      this.pIVX,
      this.pIZZA,
      this.pLBT,
      this.pLR,
      this.pOE,
      this.pOLY,
      this.pOSW,
      this.pOWR,
      this.pPC,
      this.pPT,
      this.pPY,
      this.pRC,
      this.pRES,
      this.pRG,
      this.pRL,
      this.pRO,
      this.pURA,
      this.pUT,
      this.qASH,
      this.qAU,
      this.qSP,
      this.qTUM,
      this.qUN,
      this.r,
      this.rBIES,
      this.rCN,
      this.rDD,
      this.rDN,
      this.rEBL,
      this.rEE,
      this.rEP,
      this.rEQ,
      this.rEV,
      this.rGC,
      this.rHOC,
      this.rIYA,
      this.rKC,
      this.rLC,
      this.rPX,
      this.rUFF,
      this.sALT,
      this.sAN,
      this.sBC,
      this.sC,
      this.sENT,
      this.sHIFT,
      this.sIB,
      this.sMART,
      this.sMLY,
      this.sMT,
      this.sNC,
      this.sNGLS,
      this.sNM,
      this.sNT,
      this.sOL,
      this.sPK,
      this.sRN,
      this.sTEEM,
      this.sTK,
      this.sTORJ,
      this.sTRAT,
      this.sTU,
      this.sTX,
      this.sUB,
      this.sUR,
      this.sWFTC,
      this.sYS,
      this.tAAS,
      this.tESLA,
      this.tHC,
      this.tHETA,
      this.tHS,
      this.tIO,
      this.tKN,
      this.tKY,
      this.tNB,
      this.tNT,
      this.tOA,
      this.tRC,
      this.tRIG,
      this.tRST,
      this.tRUMP,
      this.tRX,
      this.uBQ,
      this.uNO,
      this.uNRC,
      this.uQC,
      this.uSDT,
      this.uTK,
      this.uTT,
      this.vEE,
      this.vEN,
      this.vERI,
      this.vIA,
      this.vIB,
      this.vIBE,
      this.vOISE,
      this.vOX,
      this.vRS,
      this.vTC,
      this.vUC,
      this.wABI,
      this.wAVES,
      this.wAX,
      this.wC,
      this.wGR,
      this.wINGS,
      this.wLK,
      this.wOP,
      this.wPR,
      this.wRC,
      this.wTC,
      this.xAUR,
      this.xBP,
      this.xBY,
      this.xCP,
      this.xCXT,
      this.xDN,
      this.xEM,
      this.xGB,
      this.xHI,
      this.xID,
      this.xLM,
      this.xMR,
      this.xNC,
      this.xRB,
      this.xRP,
      this.xTO,
      this.xTZ,
      this.xUC,
      this.xVG,
      this.xZC,
      this.yEE,
      this.yOC,
      this.yOYOW,
      this.zBC,
      this.zCL,
      this.zEC,
      this.zEN,
      this.zIL,
      this.zNY,
      this.zRX,
      this.zSC});

  Rates.fromJson(Map<String, dynamic> json) {
    d611 = json['611'];
    aBC = json['ABC'];
    aCP = json['ACP'];
    aCT = json['ACT'];
    aCT = json['ACT*'];
    aDA = json['ADA'];
    aDCN = json['ADCN'];
    aDL = json['ADL'];
    aDX = json['ADX'];
    aDZ = json['ADZ'];
    aE = json['AE'];
    aGI = json['AGI'];
    aIB = json['AIB'];
    aIDOC = json['AIDOC'];
    aION = json['AION'];
    aIR = json['AIR'];
    aLT = json['ALT'];
    aMB = json['AMB'];
    aMM = json['AMM'];
    aNT = json['ANT'];
    aPC = json['APC'];
    aPPC = json['APPC'];
    aRC = json['ARC'];
    aRCT = json['ARCT'];
    aRDR = json['ARDR'];
    aRK = json['ARK'];
    aRN = json['ARN'];
    aSAFE2 = json['ASAFE2'];
    aST = json['AST'];
    aTB = json['ATB'];
    aTM = json['ATM'];
    aURS = json['AURS'];
    aVAX = json['AVAX'];
    aVT = json['AVT'];
    bAR = json['BAR'];
    bASH = json['BASH'];
    bAT = json['BAT'];
    bAY = json['BAY'];
    bBP = json['BBP'];
    bCD = json['BCD'];
    bCH = json['BCH'];
    bCN = json['BCN'];
    bCPT = json['BCPT'];
    bEE = json['BEE'];
    bIO = json['BIO'];
    bLC = json['BLC'];
    bLOCK = json['BLOCK'];
    bLU = json['BLU'];
    bLZ = json['BLZ'];
    bMC = json['BMC'];
    bNB = json['BNB'];
    bNT = json['BNT'];
    bOST = json['BOST'];
    bQ = json['BQ'];
    bQX = json['BQX'];
    bRD = json['BRD'];
    bRIT = json['BRIT'];
    bT1 = json['BT1'];
    bT2 = json['BT2'];
    bTC = json['BTC'];
    bTCA = json['BTCA'];
    bTCS = json['BTCS'];
    bTCZ = json['BTCZ'];
    bTG = json['BTG'];
    bTLC = json['BTLC'];
    bTM = json['BTM'];
    bTM = json['BTM*'];
    bTQ = json['BTQ'];
    bTS = json['BTS'];
    bTX = json['BTX'];
    bURST = json['BURST'];
    cALC = json['CALC'];
    cAS = json['CAS'];
    cAT = json['CAT'];
    cCRB = json['CCRB'];
    cDT = json['CDT'];
    cESC = json['CESC'];
    cHAT = json['CHAT'];
    cJ = json['CJ'];
    cL = json['CL'];
    cLD = json['CLD'];
    cLOAK = json['CLOAK'];
    cMT = json['CMT*'];
    cND = json['CND'];
    cNX = json['CNX'];
    cPC = json['CPC'];
    cRAVE = json['CRAVE'];
    cRC = json['CRC'];
    cRE = json['CRE'];
    cRW = json['CRW'];
    cTO = json['CTO'];
    cTR = json['CTR'];
    cVC = json['CVC'];
    dAS = json['DAS'];
    dASH = json['DASH'];
    dAT = json['DAT'];
    dATA = json['DATA'];
    dBC = json['DBC'];
    dBET = json['DBET'];
    dCN = json['DCN'];
    dCR = json['DCR'];
    dCT = json['DCT'];
    dEEP = json['DEEP'];
    dENT = json['DENT'];
    dGB = json['DGB'];
    dGD = json['DGD'];
    dIM = json['DIM'];
    dIME = json['DIME'];
    dMD = json['DMD'];
    dNT = json['DNT'];
    dOGE = json['DOGE'];
    dRGN = json['DRGN'];
    dRZ = json['DRZ'];
    dSH = json['DSH'];
    dTA = json['DTA'];
    eC = json['EC'];
    eDG = json['EDG'];
    eDO = json['EDO'];
    eDR = json['EDR'];
    eKO = json['EKO'];
    eLA = json['ELA'];
    eLF = json['ELF'];
    eMC = json['EMC'];
    eMGO = json['EMGO'];
    eNG = json['ENG'];
    eNJ = json['ENJ'];
    eOS = json['EOS'];
    eRT = json['ERT'];
    eTC = json['ETC'];
    eTH = json['ETH'];
    eTN = json['ETN'];
    eTP = json['ETP'];
    eTT = json['ETT'];
    eVR = json['EVR'];
    eVX = json['EVX'];
    fCT = json['FCT'];
    fLP = json['FLP'];
    fOTA = json['FOTA'];
    fRST = json['FRST'];
    fUEL = json['FUEL'];
    fUN = json['FUN'];
    fUNC = json['FUNC'];
    fUTC = json['FUTC'];
    gAME = json['GAME'];
    gAS = json['GAS'];
    gBYTE = json['GBYTE'];
    gMX = json['GMX'];
    gNO = json['GNO'];
    gNT = json['GNT'];
    gNX = json['GNX'];
    gRC = json['GRC'];
    gRS = json['GRS'];
    gRWI = json['GRWI'];
    gTC = json['GTC'];
    gTO = json['GTO'];
    gUP = json['GUP'];
    gVT = json['GVT'];
    gXS = json['GXS'];
    hAC = json['HAC'];
    hNC = json['HNC'];
    hSR = json['HSR'];
    hST = json['HST'];
    hVN = json['HVN'];
    iCN = json['ICN'];
    iCOS = json['ICOS'];
    iCX = json['ICX'];
    iGNIS = json['IGNIS'];
    iLC = json['ILC'];
    iNK = json['INK'];
    iNS = json['INS'];
    iNSN = json['INSN'];
    iNT = json['INT'];
    iOP = json['IOP'];
    iOST = json['IOST'];
    iTC = json['ITC'];
    kCS = json['KCS'];
    kICK = json['KICK'];
    kIN = json['KIN'];
    kLC = json['KLC'];
    kMD = json['KMD'];
    kNC = json['KNC'];
    kRB = json['KRB'];
    lA = json['LA'];
    lEND = json['LEND'];
    lEO = json['LEO'];
    lINDA = json['LINDA'];
    lINK = json['LINK'];
    lOC = json['LOC'];
    lOG = json['LOG'];
    lRC = json['LRC'];
    lSK = json['LSK'];
    lTC = json['LTC'];
    lUN = json['LUN'];
    lUX = json['LUX'];
    mAID = json['MAID'];
    mANA = json['MANA'];
    mCAP = json['MCAP'];
    mCO = json['MCO'];
    mDA = json['MDA'];
    mDS = json['MDS'];
    mIOTA = json['MIOTA'];
    mKR = json['MKR'];
    mLN = json['MLN'];
    mNX = json['MNX'];
    mOD = json['MOD'];
    mOIN = json['MOIN'];
    mONA = json['MONA'];
    mTL = json['MTL'];
    mTN = json['MTN*'];
    mTX = json['MTX'];
    nAS = json['NAS'];
    nAV = json['NAV'];
    nBT = json['NBT'];
    nDC = json['NDC'];
    nEBL = json['NEBL'];
    nEO = json['NEO'];
    nEU = json['NEU'];
    nEWB = json['NEWB'];
    nGC = json['NGC'];
    nKC = json['NKC'];
    nLC2 = json['NLC2'];
    nMC = json['NMC'];
    nMR = json['NMR'];
    nULS = json['NULS'];
    nVC = json['NVC'];
    nXT = json['NXT'];
    oAX = json['OAX'];
    oBITS = json['OBITS'];
    oC = json['OC'];
    oCN = json['OCN'];
    oDN = json['ODN'];
    oK = json['OK'];
    oMG = json['OMG'];
    oMNI = json['OMNI'];
    oRE = json['ORE'];
    oRME = json['ORME'];
    oST = json['OST'];
    oTN = json['OTN'];
    oTX = json['OTX'];
    oXY = json['OXY'];
    pART = json['PART'];
    pAY = json['PAY'];
    pBT = json['PBT'];
    pCS = json['PCS'];
    pIVX = json['PIVX'];
    pIZZA = json['PIZZA'];
    pLBT = json['PLBT'];
    pLR = json['PLR'];
    pOE = json['POE'];
    pOLY = json['POLY'];
    pOSW = json['POSW'];
    pOWR = json['POWR'];
    pPC = json['PPC'];
    pPT = json['PPT'];
    pPY = json['PPY'];
    pRC = json['PRC'];
    pRES = json['PRES'];
    pRG = json['PRG'];
    pRL = json['PRL'];
    pRO = json['PRO'];
    pURA = json['PURA'];
    pUT = json['PUT'];
    qASH = json['QASH'];
    qAU = json['QAU'];
    qSP = json['QSP'];
    qTUM = json['QTUM'];
    qUN = json['QUN'];
    r = json['R'];
    rBIES = json['RBIES'];
    rCN = json['RCN'];
    rDD = json['RDD'];
    rDN = json['RDN'];
    rDN = json['RDN*'];
    rEBL = json['REBL'];
    rEE = json['REE'];
    rEP = json['REP'];
    rEQ = json['REQ'];
    rEV = json['REV'];
    rGC = json['RGC'];
    rHOC = json['RHOC'];
    rIYA = json['RIYA'];
    rKC = json['RKC'];
    rLC = json['RLC'];
    rPX = json['RPX'];
    rUFF = json['RUFF'];
    sALT = json['SALT'];
    sAN = json['SAN'];
    sBC = json['SBC'];
    sC = json['SC'];
    sENT = json['SENT'];
    sHIFT = json['SHIFT'];
    sIB = json['SIB'];
    sMART = json['SMART'];
    sMLY = json['SMLY'];
    sMT = json['SMT*'];
    sNC = json['SNC'];
    sNGLS = json['SNGLS'];
    sNM = json['SNM'];
    sNT = json['SNT'];
    sOL = json['SOL'];
    sPK = json['SPK'];
    sRN = json['SRN'];
    sTEEM = json['STEEM'];
    sTK = json['STK'];
    sTORJ = json['STORJ'];
    sTRAT = json['STRAT'];
    sTU = json['STU'];
    sTX = json['STX'];
    sUB = json['SUB'];
    sUR = json['SUR'];
    sWFTC = json['SWFTC'];
    sYS = json['SYS'];
    tAAS = json['TAAS'];
    tESLA = json['TESLA'];
    tHC = json['THC'];
    tHETA = json['THETA'];
    tHS = json['THS'];
    tIO = json['TIO'];
    tKN = json['TKN'];
    tKY = json['TKY'];
    tNB = json['TNB'];
    tNT = json['TNT'];
    tOA = json['TOA'];
    tRC = json['TRC'];
    tRIG = json['TRIG'];
    tRST = json['TRST'];
    tRUMP = json['TRUMP'];
    tRX = json['TRX'];
    uBQ = json['UBQ'];
    uNO = json['UNO'];
    uNRC = json['UNRC'];
    uQC = json['UQC'];
    uSDT = json['USDT'];
    uTK = json['UTK'];
    uTT = json['UTT'];
    vEE = json['VEE'];
    vEN = json['VEN'];
    vERI = json['VERI'];
    vIA = json['VIA'];
    vIB = json['VIB'];
    vIBE = json['VIBE'];
    vOISE = json['VOISE'];
    vOX = json['VOX'];
    vRS = json['VRS'];
    vTC = json['VTC'];
    vUC = json['VUC'];
    wABI = json['WABI'];
    wAVES = json['WAVES'];
    wAX = json['WAX'];
    wC = json['WC'];
    wGR = json['WGR'];
    wINGS = json['WINGS'];
    wLK = json['WLK'];
    wOP = json['WOP'];
    wPR = json['WPR'];
    wRC = json['WRC'];
    wTC = json['WTC'];
    xAUR = json['XAUR'];
    xBP = json['XBP'];
    xBY = json['XBY'];
    xCP = json['XCP'];
    xCXT = json['XCXT'];
    xDN = json['XDN'];
    xEM = json['XEM'];
    xGB = json['XGB'];
    xHI = json['XHI'];
    xID = json['XID'];
    xLM = json['XLM'];
    xMR = json['XMR'];
    xNC = json['XNC'];
    xRB = json['XRB'];
    xRP = json['XRP'];
    xTO = json['XTO'];
    xTZ = json['XTZ'];
    xUC = json['XUC'];
    xVG = json['XVG'];
    xZC = json['XZC'];
    yEE = json['YEE'];
    yOC = json['YOC'];
    yOYOW = json['YOYOW'];
    zBC = json['ZBC'];
    zCL = json['ZCL'];
    zEC = json['ZEC'];
    zEN = json['ZEN'];
    zIL = json['ZIL'];
    zNY = json['ZNY'];
    zRX = json['ZRX'];
    zSC = json['ZSC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['611'] = this.d611;
    data['ABC'] = this.aBC;
    data['ACP'] = this.aCP;
    data['ACT'] = this.aCT;
    data['ACT*'] = this.aCT;
    data['ADA'] = this.aDA;
    data['ADCN'] = this.aDCN;
    data['ADL'] = this.aDL;
    data['ADX'] = this.aDX;
    data['ADZ'] = this.aDZ;
    data['AE'] = this.aE;
    data['AGI'] = this.aGI;
    data['AIB'] = this.aIB;
    data['AIDOC'] = this.aIDOC;
    data['AION'] = this.aION;
    data['AIR'] = this.aIR;
    data['ALT'] = this.aLT;
    data['AMB'] = this.aMB;
    data['AMM'] = this.aMM;
    data['ANT'] = this.aNT;
    data['APC'] = this.aPC;
    data['APPC'] = this.aPPC;
    data['ARC'] = this.aRC;
    data['ARCT'] = this.aRCT;
    data['ARDR'] = this.aRDR;
    data['ARK'] = this.aRK;
    data['ARN'] = this.aRN;
    data['ASAFE2'] = this.aSAFE2;
    data['AST'] = this.aST;
    data['ATB'] = this.aTB;
    data['ATM'] = this.aTM;
    data['AURS'] = this.aURS;
    data['AVAX'] = this.aVAX;
    data['AVT'] = this.aVT;
    data['BAR'] = this.bAR;
    data['BASH'] = this.bASH;
    data['BAT'] = this.bAT;
    data['BAY'] = this.bAY;
    data['BBP'] = this.bBP;
    data['BCD'] = this.bCD;
    data['BCH'] = this.bCH;
    data['BCN'] = this.bCN;
    data['BCPT'] = this.bCPT;
    data['BEE'] = this.bEE;
    data['BIO'] = this.bIO;
    data['BLC'] = this.bLC;
    data['BLOCK'] = this.bLOCK;
    data['BLU'] = this.bLU;
    data['BLZ'] = this.bLZ;
    data['BMC'] = this.bMC;
    data['BNB'] = this.bNB;
    data['BNT'] = this.bNT;
    data['BOST'] = this.bOST;
    data['BQ'] = this.bQ;
    data['BQX'] = this.bQX;
    data['BRD'] = this.bRD;
    data['BRIT'] = this.bRIT;
    data['BT1'] = this.bT1;
    data['BT2'] = this.bT2;
    data['BTC'] = this.bTC;
    data['BTCA'] = this.bTCA;
    data['BTCS'] = this.bTCS;
    data['BTCZ'] = this.bTCZ;
    data['BTG'] = this.bTG;
    data['BTLC'] = this.bTLC;
    data['BTM'] = this.bTM;
    data['BTM*'] = this.bTM;
    data['BTQ'] = this.bTQ;
    data['BTS'] = this.bTS;
    data['BTX'] = this.bTX;
    data['BURST'] = this.bURST;
    data['CALC'] = this.cALC;
    data['CAS'] = this.cAS;
    data['CAT'] = this.cAT;
    data['CCRB'] = this.cCRB;
    data['CDT'] = this.cDT;
    data['CESC'] = this.cESC;
    data['CHAT'] = this.cHAT;
    data['CJ'] = this.cJ;
    data['CL'] = this.cL;
    data['CLD'] = this.cLD;
    data['CLOAK'] = this.cLOAK;
    data['CMT*'] = this.cMT;
    data['CND'] = this.cND;
    data['CNX'] = this.cNX;
    data['CPC'] = this.cPC;
    data['CRAVE'] = this.cRAVE;
    data['CRC'] = this.cRC;
    data['CRE'] = this.cRE;
    data['CRW'] = this.cRW;
    data['CTO'] = this.cTO;
    data['CTR'] = this.cTR;
    data['CVC'] = this.cVC;
    data['DAS'] = this.dAS;
    data['DASH'] = this.dASH;
    data['DAT'] = this.dAT;
    data['DATA'] = this.dATA;
    data['DBC'] = this.dBC;
    data['DBET'] = this.dBET;
    data['DCN'] = this.dCN;
    data['DCR'] = this.dCR;
    data['DCT'] = this.dCT;
    data['DEEP'] = this.dEEP;
    data['DENT'] = this.dENT;
    data['DGB'] = this.dGB;
    data['DGD'] = this.dGD;
    data['DIM'] = this.dIM;
    data['DIME'] = this.dIME;
    data['DMD'] = this.dMD;
    data['DNT'] = this.dNT;
    data['DOGE'] = this.dOGE;
    data['DRGN'] = this.dRGN;
    data['DRZ'] = this.dRZ;
    data['DSH'] = this.dSH;
    data['DTA'] = this.dTA;
    data['EC'] = this.eC;
    data['EDG'] = this.eDG;
    data['EDO'] = this.eDO;
    data['EDR'] = this.eDR;
    data['EKO'] = this.eKO;
    data['ELA'] = this.eLA;
    data['ELF'] = this.eLF;
    data['EMC'] = this.eMC;
    data['EMGO'] = this.eMGO;
    data['ENG'] = this.eNG;
    data['ENJ'] = this.eNJ;
    data['EOS'] = this.eOS;
    data['ERT'] = this.eRT;
    data['ETC'] = this.eTC;
    data['ETH'] = this.eTH;
    data['ETN'] = this.eTN;
    data['ETP'] = this.eTP;
    data['ETT'] = this.eTT;
    data['EVR'] = this.eVR;
    data['EVX'] = this.eVX;
    data['FCT'] = this.fCT;
    data['FLP'] = this.fLP;
    data['FOTA'] = this.fOTA;
    data['FRST'] = this.fRST;
    data['FUEL'] = this.fUEL;
    data['FUN'] = this.fUN;
    data['FUNC'] = this.fUNC;
    data['FUTC'] = this.fUTC;
    data['GAME'] = this.gAME;
    data['GAS'] = this.gAS;
    data['GBYTE'] = this.gBYTE;
    data['GMX'] = this.gMX;
    data['GNO'] = this.gNO;
    data['GNT'] = this.gNT;
    data['GNX'] = this.gNX;
    data['GRC'] = this.gRC;
    data['GRS'] = this.gRS;
    data['GRWI'] = this.gRWI;
    data['GTC'] = this.gTC;
    data['GTO'] = this.gTO;
    data['GUP'] = this.gUP;
    data['GVT'] = this.gVT;
    data['GXS'] = this.gXS;
    data['HAC'] = this.hAC;
    data['HNC'] = this.hNC;
    data['HSR'] = this.hSR;
    data['HST'] = this.hST;
    data['HVN'] = this.hVN;
    data['ICN'] = this.iCN;
    data['ICOS'] = this.iCOS;
    data['ICX'] = this.iCX;
    data['IGNIS'] = this.iGNIS;
    data['ILC'] = this.iLC;
    data['INK'] = this.iNK;
    data['INS'] = this.iNS;
    data['INSN'] = this.iNSN;
    data['INT'] = this.iNT;
    data['IOP'] = this.iOP;
    data['IOST'] = this.iOST;
    data['ITC'] = this.iTC;
    data['KCS'] = this.kCS;
    data['KICK'] = this.kICK;
    data['KIN'] = this.kIN;
    data['KLC'] = this.kLC;
    data['KMD'] = this.kMD;
    data['KNC'] = this.kNC;
    data['KRB'] = this.kRB;
    data['LA'] = this.lA;
    data['LEND'] = this.lEND;
    data['LEO'] = this.lEO;
    data['LINDA'] = this.lINDA;
    data['LINK'] = this.lINK;
    data['LOC'] = this.lOC;
    data['LOG'] = this.lOG;
    data['LRC'] = this.lRC;
    data['LSK'] = this.lSK;
    data['LTC'] = this.lTC;
    data['LUN'] = this.lUN;
    data['LUX'] = this.lUX;
    data['MAID'] = this.mAID;
    data['MANA'] = this.mANA;
    data['MCAP'] = this.mCAP;
    data['MCO'] = this.mCO;
    data['MDA'] = this.mDA;
    data['MDS'] = this.mDS;
    data['MIOTA'] = this.mIOTA;
    data['MKR'] = this.mKR;
    data['MLN'] = this.mLN;
    data['MNX'] = this.mNX;
    data['MOD'] = this.mOD;
    data['MOIN'] = this.mOIN;
    data['MONA'] = this.mONA;
    data['MTL'] = this.mTL;
    data['MTN*'] = this.mTN;
    data['MTX'] = this.mTX;
    data['NAS'] = this.nAS;
    data['NAV'] = this.nAV;
    data['NBT'] = this.nBT;
    data['NDC'] = this.nDC;
    data['NEBL'] = this.nEBL;
    data['NEO'] = this.nEO;
    data['NEU'] = this.nEU;
    data['NEWB'] = this.nEWB;
    data['NGC'] = this.nGC;
    data['NKC'] = this.nKC;
    data['NLC2'] = this.nLC2;
    data['NMC'] = this.nMC;
    data['NMR'] = this.nMR;
    data['NULS'] = this.nULS;
    data['NVC'] = this.nVC;
    data['NXT'] = this.nXT;
    data['OAX'] = this.oAX;
    data['OBITS'] = this.oBITS;
    data['OC'] = this.oC;
    data['OCN'] = this.oCN;
    data['ODN'] = this.oDN;
    data['OK'] = this.oK;
    data['OMG'] = this.oMG;
    data['OMNI'] = this.oMNI;
    data['ORE'] = this.oRE;
    data['ORME'] = this.oRME;
    data['OST'] = this.oST;
    data['OTN'] = this.oTN;
    data['OTX'] = this.oTX;
    data['OXY'] = this.oXY;
    data['PART'] = this.pART;
    data['PAY'] = this.pAY;
    data['PBT'] = this.pBT;
    data['PCS'] = this.pCS;
    data['PIVX'] = this.pIVX;
    data['PIZZA'] = this.pIZZA;
    data['PLBT'] = this.pLBT;
    data['PLR'] = this.pLR;
    data['POE'] = this.pOE;
    data['POLY'] = this.pOLY;
    data['POSW'] = this.pOSW;
    data['POWR'] = this.pOWR;
    data['PPC'] = this.pPC;
    data['PPT'] = this.pPT;
    data['PPY'] = this.pPY;
    data['PRC'] = this.pRC;
    data['PRES'] = this.pRES;
    data['PRG'] = this.pRG;
    data['PRL'] = this.pRL;
    data['PRO'] = this.pRO;
    data['PURA'] = this.pURA;
    data['PUT'] = this.pUT;
    data['QASH'] = this.qASH;
    data['QAU'] = this.qAU;
    data['QSP'] = this.qSP;
    data['QTUM'] = this.qTUM;
    data['QUN'] = this.qUN;
    data['R'] = this.r;
    data['RBIES'] = this.rBIES;
    data['RCN'] = this.rCN;
    data['RDD'] = this.rDD;
    data['RDN'] = this.rDN;
    data['RDN*'] = this.rDN;
    data['REBL'] = this.rEBL;
    data['REE'] = this.rEE;
    data['REP'] = this.rEP;
    data['REQ'] = this.rEQ;
    data['REV'] = this.rEV;
    data['RGC'] = this.rGC;
    data['RHOC'] = this.rHOC;
    data['RIYA'] = this.rIYA;
    data['RKC'] = this.rKC;
    data['RLC'] = this.rLC;
    data['RPX'] = this.rPX;
    data['RUFF'] = this.rUFF;
    data['SALT'] = this.sALT;
    data['SAN'] = this.sAN;
    data['SBC'] = this.sBC;
    data['SC'] = this.sC;
    data['SENT'] = this.sENT;
    data['SHIFT'] = this.sHIFT;
    data['SIB'] = this.sIB;
    data['SMART'] = this.sMART;
    data['SMLY'] = this.sMLY;
    data['SMT*'] = this.sMT;
    data['SNC'] = this.sNC;
    data['SNGLS'] = this.sNGLS;
    data['SNM'] = this.sNM;
    data['SNT'] = this.sNT;
    data['SOL'] = this.sOL;
    data['SPK'] = this.sPK;
    data['SRN'] = this.sRN;
    data['STEEM'] = this.sTEEM;
    data['STK'] = this.sTK;
    data['STORJ'] = this.sTORJ;
    data['STRAT'] = this.sTRAT;
    data['STU'] = this.sTU;
    data['STX'] = this.sTX;
    data['SUB'] = this.sUB;
    data['SUR'] = this.sUR;
    data['SWFTC'] = this.sWFTC;
    data['SYS'] = this.sYS;
    data['TAAS'] = this.tAAS;
    data['TESLA'] = this.tESLA;
    data['THC'] = this.tHC;
    data['THETA'] = this.tHETA;
    data['THS'] = this.tHS;
    data['TIO'] = this.tIO;
    data['TKN'] = this.tKN;
    data['TKY'] = this.tKY;
    data['TNB'] = this.tNB;
    data['TNT'] = this.tNT;
    data['TOA'] = this.tOA;
    data['TRC'] = this.tRC;
    data['TRIG'] = this.tRIG;
    data['TRST'] = this.tRST;
    data['TRUMP'] = this.tRUMP;
    data['TRX'] = this.tRX;
    data['UBQ'] = this.uBQ;
    data['UNO'] = this.uNO;
    data['UNRC'] = this.uNRC;
    data['UQC'] = this.uQC;
    data['USDT'] = this.uSDT;
    data['UTK'] = this.uTK;
    data['UTT'] = this.uTT;
    data['VEE'] = this.vEE;
    data['VEN'] = this.vEN;
    data['VERI'] = this.vERI;
    data['VIA'] = this.vIA;
    data['VIB'] = this.vIB;
    data['VIBE'] = this.vIBE;
    data['VOISE'] = this.vOISE;
    data['VOX'] = this.vOX;
    data['VRS'] = this.vRS;
    data['VTC'] = this.vTC;
    data['VUC'] = this.vUC;
    data['WABI'] = this.wABI;
    data['WAVES'] = this.wAVES;
    data['WAX'] = this.wAX;
    data['WC'] = this.wC;
    data['WGR'] = this.wGR;
    data['WINGS'] = this.wINGS;
    data['WLK'] = this.wLK;
    data['WOP'] = this.wOP;
    data['WPR'] = this.wPR;
    data['WRC'] = this.wRC;
    data['WTC'] = this.wTC;
    data['XAUR'] = this.xAUR;
    data['XBP'] = this.xBP;
    data['XBY'] = this.xBY;
    data['XCP'] = this.xCP;
    data['XCXT'] = this.xCXT;
    data['XDN'] = this.xDN;
    data['XEM'] = this.xEM;
    data['XGB'] = this.xGB;
    data['XHI'] = this.xHI;
    data['XID'] = this.xID;
    data['XLM'] = this.xLM;
    data['XMR'] = this.xMR;
    data['XNC'] = this.xNC;
    data['XRB'] = this.xRB;
    data['XRP'] = this.xRP;
    data['XTO'] = this.xTO;
    data['XTZ'] = this.xTZ;
    data['XUC'] = this.xUC;
    data['XVG'] = this.xVG;
    data['XZC'] = this.xZC;
    data['YEE'] = this.yEE;
    data['YOC'] = this.yOC;
    data['YOYOW'] = this.yOYOW;
    data['ZBC'] = this.zBC;
    data['ZCL'] = this.zCL;
    data['ZEC'] = this.zEC;
    data['ZEN'] = this.zEN;
    data['ZIL'] = this.zIL;
    data['ZNY'] = this.zNY;
    data['ZRX'] = this.zRX;
    data['ZSC'] = this.zSC;
    return data;
  }
}
