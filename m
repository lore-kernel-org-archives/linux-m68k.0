Return-Path: <SRS0=Rs50=ZE=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1A1C43331
	for <linux-m68k@archiver.kernel.org>; Tue, 12 Nov 2019 14:50:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9CC412067B
	for <linux-m68k@archiver.kernel.org>; Tue, 12 Nov 2019 14:50:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=teoenmingcorp.onmicrosoft.com header.i=@teoenmingcorp.onmicrosoft.com header.b="MlZvu0Pa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfKLOul (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 12 Nov 2019 09:50:41 -0500
Received: from mail-eopbgr1310070.outbound.protection.outlook.com ([40.107.131.70]:42720
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726388AbfKLOul (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 12 Nov 2019 09:50:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bIHhRgcnuYWLBMX94HdcRLlSsHC2xFPD+u6b6jqQp3c3VHDoNNEB4btZfoy8L9VZXXLvr7k+/kAlqAbOYAEQHme3w0X4x6gUk/KchkhUTQcPFMDz/8yqTNSHEJwkgurjiEURN0kFO41NCnALv5PLxTN/8uQcZ4Ujmh+5llw+1Cx7Jhh5aKJT6tBSys9muig9257iBUV7QKS8p1rroDn3a6J5Sb4JHUi11YdUcSX3ytPQo7s7RFJBH33Fg6X+pvBBWrmmlXob+kAqSFbZmYKG2QRPVKbmb0x1s2yTOxUkXZ2DIDxBY7prTivBoJGFeBMAmijL9TFNRm7uyUnjV74uvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJk0GU250nrR5/HeqLoiSSgrZSiNRxwQgrPt8ZNvfv8=;
 b=B7g/jrJMveRFT/a0nbFkkAy3EgKx21KQM8EIgaQ0WoiR036PU6JdEi3/JwmqN/keAor11X8NkLSV7dEVvjqXla3r1J3vnssO/OSnqQteV5hieH01J7h6gUiZT1t1Bokjt1cq1oda6pZoYtRKrbposm8eE6Rf5Zrol/41O1b/lwWjarKX/Bw6MMmaCfNoxLYA5Qw3Um8FGrwAwtSUT+LD906iF5VrlKV2fXr2dfVz0tjiyOh+lBQy5ApoHNpvj/OnlZrsl3bs7RNvFlVfSVRtXKJ5RTj5oWz0ZnMv/WHlUslBUjzbtDItqPuwL4dVFwG8/tdzlCYrTx9xuY0ZghgvRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=teo-en-ming-corp.com; dmarc=pass action=none
 header.from=teo-en-ming-corp.com; dkim=pass header.d=teo-en-ming-corp.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=teoenmingcorp.onmicrosoft.com; s=selector2-teoenmingcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJk0GU250nrR5/HeqLoiSSgrZSiNRxwQgrPt8ZNvfv8=;
 b=MlZvu0Pai8aIQeDwU+m+x2P6gOzS44oTY/mak94+5FhT4+qxQM1yaSe+9bWa0VtCQbsMieVMxVxoBUWk4R42fVtnj0kVt323F0C1YzQNjWP+PSQiFC4lGGN9lF8DLPph2Q3xHpMTFXDN4yj2GuJCZLj+UEqY5EmCmrAkZY5MptA=
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com (10.170.143.19) by
 SG2PR01MB2014.apcprd01.prod.exchangelabs.com (52.133.138.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Tue, 12 Nov 2019 14:50:35 +0000
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::49d4:fc70:bde2:c3a]) by SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::49d4:fc70:bde2:c3a%2]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 14:50:35 +0000
From:   Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
To:     "linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>
CC:     Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
Subject: I just got to know another 2 Singaporeans who were denied/refused
 government jobs because of their remarks on the Singapore Government
Thread-Topic: I just got to know another 2 Singaporeans who were
 denied/refused government jobs because of their remarks on the Singapore
 Government
Thread-Index: AdWZaIJc1Ug/jsDPRpig+NagWJvknA==
Date:   Tue, 12 Nov 2019 14:50:35 +0000
Message-ID: <SG2PR01MB2141B27101106BEA70B8729387770@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ceo@teo-en-ming-corp.com; 
x-originating-ip: [118.189.211.120]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bbe9ab27-88a9-4c2e-5a61-08d7677fad05
x-ms-traffictypediagnostic: SG2PR01MB2014:
x-ms-exchange-purlcount: 4
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SG2PR01MB2014FC719290C00B72F6F15487770@SG2PR01MB2014.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39830400003)(136003)(376002)(346002)(366004)(396003)(199004)(189003)(33656002)(81166006)(14454004)(6116002)(64756008)(316002)(66476007)(2906002)(66556008)(76116006)(3846002)(66946007)(966005)(99286004)(25786009)(8676002)(8936002)(81156014)(508600001)(66446008)(2501003)(4326008)(6436002)(6306002)(6916009)(476003)(5640700003)(9686003)(7696005)(14444005)(256004)(186003)(26005)(6506007)(71190400001)(71200400001)(305945005)(74316002)(7736002)(107886003)(52536014)(2351001)(5660300002)(66066001)(486006)(55016002)(86362001)(102836004);DIR:OUT;SFP:1101;SCL:1;SRVR:SG2PR01MB2014;H:SG2PR01MB2141.apcprd01.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: teo-en-ming-corp.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DMVMi+1JGKPlorpqLKVeAHWbVHmOhutfEQVq4syobCMX1s4eVABmMvzD7Epd7J5+RE4/cZ17Lj5r7H3KSEMV8xSZ5llz0STQ9/NatC/fXdsHx3QRIzx8u2uU4fRUzkQgUAjGi6TkDSl8QPSAE2bpXKaLhkXQVUW2SC9w/UC6tZyvKSRTcPR+1SCAZAYcquT1djKifUmsQcgHrUT0ZEKB6z/TW1nZM8Vy6UtF3n7nkYoWCa/KXLOzZwW+kygXfmeo1A8Iv0fJ+FORYfZT71s6ojTu9m0PqfG6EC1kgz1FbIVU1bh/u+S7hQQQBCQbo81fZnYq8uzLu9uIfPVcV494jdn009pTCLjQsjQa53tr2IoNd+sskJqwTmy5tzCKV4S1MMmXVx/w8HbKF+cSwp6VL36WM17tWp1dsG7B6Dtry2x2ZGKQpVcTK8lEVAZOryomhgyI2JnA35I9+M5huoIw+MROh25KeisQbD68K+CUMfk=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: teo-en-ming-corp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe9ab27-88a9-4c2e-5a61-08d7677fad05
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 14:50:35.7071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b3f6ae-c453-4b93-aec9-f17508e5885c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ocIhX0uHXXfOTIuYFqtRcZk6fl+sMiAAf/7U6VdcwR0OyCBaL8z5BTl2hHvGaKWybVHfD0kOYOPrx/kvdX/dSnyXcY2EqUzrzp6TMOMnECE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR01MB2014
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Subject: I just got to know another 2 Singaporeans who were denied/refused =
government jobs because of their remarks on the Singapore Government

Today, 12 November 2019 Tuesday Singapore Time, I got to know another 2 Sin=
gaporeans who were denied/refused government jobs because of their remarks =
on the Singapore Government.

Donald Trump (not his real name of course), who is a recruitment consultant=
 at job agency Nanotechnology Infocomms (not the real name of the job agenc=
y of course) in Singapore, communicated to me he is aware of another 2 Sing=
aporeans who were denied/refused government jobs because of their remarks o=
n the Singapore Government.

According to Donald Trump, the 1st Singaporean passed the first round of se=
curity clearance but failed the second round of security clearance. On furt=
her thoughts, the 1st Singaporean thought he may have been denied/refused t=
he government job because of his remarks on the Singapore Government.

According to Donald Trump, the 2nd Singaporean was working in a semi-govern=
ment job involving classified information of government ministers in Singap=
ore. According to Donald Trump, the 2nd Singaporean refused to sign Non-Dis=
closure Agreement (NDA) because he argued that government ministers in Sing=
apore are public figures. The 2nd Singaporean was subsequently forced to re=
sign or terminated from employment.

Due to privacy laws in Singapore (Personal Data Protection Act (PDPA)), Don=
ald Trump cannot reveal the names of the two Singaporean Targeted Individua=
ls to me. Privacy laws also exist in the European Union and the United Stat=
es.

The General Data Protection Regulation (EU) 2016/679 (GDPR) is a regulation=
 in EU law on data protection and privacy for all individual citizens of th=
e European Union (EU) and the European Economic Area (EEA). It also address=
es the transfer of personal data outside the EU and EEA areas. The GDPR aim=
s primarily to give control to individuals over their personal data and to =
simplify the regulatory environment for international business by unifying =
the regulation within the EU.[1] Superseding the Data Protection Directive =
95/46/EC, the regulation contains provisions and requirements related to th=
e processing of personal data of individuals (formally called data subjects=
 in the GDPR) inside the EEA, and applies to any enterprise established in =
the EEA or-regardless of its location and the data subjects' citizenship-th=
at is processing the personal information of data subjects inside the EEA.

The Privacy Act of 1974 (Pub.L. 93-579, 88 Stat. 1896, enacted December 31,=
 1974, Title 5 United States Code Section =A7 552a), a United States federa=
l law, establishes a Code of Fair Information Practice that governs the col=
lection, maintenance, use, and dissemination of personally identifiable inf=
ormation about individuals that is maintained in systems of records by fede=
ral agencies. A system of records is a group of records under the control o=
f an agency from which information is retrieved by the name of the individu=
al or by some identifier assigned to the individual. The Privacy Act requir=
es that agencies give the public notice of their systems of records by publ=
ication in the Federal Register. The Privacy Act prohibits the disclosure o=
f information from a system of records absent of the written consent of the=
 subject individual, unless the disclosure is pursuant to one of twelve sta=
tutory exceptions. The Act also provides individuals with a means by which =
to seek access to and amendment of their records and sets forth various age=
ncy record-keeping requirements. Additionally, with people granted the righ=
t to review what was documented with their name, they are also able to find=
 out if the "records have been disclosed".. and are also given the rights t=
o make corrections.[1]

I am now aware I am definitely not alone and I am definitely not the only T=
argeted Individual (TI) in Singapore. So far Donald Trump is the only recru=
itment consultant from only one job agency in Singapore whom I have spoken =
to. Hence there could be a lot more Targeted Individuals out there in Singa=
pore whom I am not aware of yet.







-----BEGIN EMAIL SIGNATURE-----

The Gospel for all Targeted Individuals (TIs):

[The New York Times] Microwave Weapons Are Prime Suspect in Ills of
U.S. Embassy Workers

Link:=A0https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microw=
ave.html

***************************************************************************=
*****************

Singaporean Mr. Turritopsis Dohrnii Teo En Ming's Academic
Qualifications as at 14 Feb 2019 and refugee seeking attempts at the
United Nations Refugee Agency Bangkok (21 Mar 2017) and in Taiwan (5
Aug 2019):

[1]=A0https://tdtemcerts.wordpress.com/

[2]=A0https://tdtemcerts.blogspot.sg/

[3]=A0https://www.scribd.com/user/270125049/Teo-En-Ming

-----END EMAIL SIGNATURE-----

