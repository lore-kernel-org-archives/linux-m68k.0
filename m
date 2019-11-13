Return-Path: <SRS0=9xw0=ZF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF06C43331
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Nov 2019 14:01:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1745821783
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Nov 2019 14:01:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=teoenmingcorp.onmicrosoft.com header.i=@teoenmingcorp.onmicrosoft.com header.b="PEMiX0um"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727621AbfKMOBc (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Nov 2019 09:01:32 -0500
Received: from mail-eopbgr1310084.outbound.protection.outlook.com ([40.107.131.84]:16267
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726010AbfKMOBc (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 13 Nov 2019 09:01:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdXPM6hkKOb3KhxSO8OuvsV0mPkS2qH9e9IK082+WjW13E6xVJqX+dSXzadfbXqWG9aEQqAR3ABgLSMo1w82vqZYoMgkuH5HHqL04BGat2DTdn5cyBVmbSldYTNvY9J+NNRwarR/VxuQvnrizzE/Z/b4sREY+yxJ31wqp5zYGIlTJuVjz2F5KQBSIU5FtZ3WbqDoxphIrU76biZBG+JbwoOMK5hEKUQKIkNpDfup6V6YRqHQ4Z77vekA3yBgNbdisZcmFIL045vgaaz5ZxAGQbL5fKCJpGJc+Bmcbulld+cmy2eEopcPSwoO3MmAU4k1yN/1BgqVWry+dmQ7QmsKXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7nHEsLaw1Cz9+X1pVruDRkVipWsrR4oCuWZw9ccmmc=;
 b=BeOyICbIskQK4wqzkalAg/+3smL/elCpsU2/WdQBSpZS6jtJjK6RNSdWMrGXa8BWbwVP/D600V0sUPsUkrA8tJLGoC/g/91jk5DyiaNnoN1BMmks3DVc2I8xkKIHDVsvqRSh1loCliJe3zs1GxUv5GR5j/wh9JVsvqo1nlwJpKqbMF9DIQ4nA4q6W963GGp5+jIJTGX5p0AoEOchNY/bMgPV7mxj6xRnA4+wbWMzh+MGPCDIN9FPIdKXiNu39ty4YmOxei6chB65sUDJkQZZmJi1yzuKyQBWIa9pm4U7q4TWQUVl7h1b/0MLpNV8M+VHx0mbpIMn3XW1fthe9UI6Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=teo-en-ming-corp.com; dmarc=pass action=none
 header.from=teo-en-ming-corp.com; dkim=pass header.d=teo-en-ming-corp.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=teoenmingcorp.onmicrosoft.com; s=selector2-teoenmingcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7nHEsLaw1Cz9+X1pVruDRkVipWsrR4oCuWZw9ccmmc=;
 b=PEMiX0umTU44ZvG18D+8heMXcL8XO8pot8thACr6zG8Ky5cTgm4tfBpl06BMvjweYRPoR4q3tkBrUwD0Ooxv55nVl9anJFMaP4lC2wSYyjbKrSB82a9DdXcmxxG/b7NidLXJXGrDbFGw6MpeqjOjUcdtgpXtO93SPFqvUjL6/l0=
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com (10.170.143.19) by
 SG2PR01MB2598.apcprd01.prod.exchangelabs.com (20.177.169.79) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.24; Wed, 13 Nov 2019 14:01:28 +0000
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::49d4:fc70:bde2:c3a]) by SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::49d4:fc70:bde2:c3a%2]) with mapi id 15.20.2430.028; Wed, 13 Nov 2019
 14:01:28 +0000
From:   Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
To:     "linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>
CC:     Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
Subject: Singapore Democratic Party leader Dr. Chee Soon Juan encouraged me to
 try applying for refugee status/political asylum in several countries
Thread-Topic: Singapore Democratic Party leader Dr. Chee Soon Juan encouraged
 me to try applying for refugee status/political asylum in several countries
Thread-Index: AdWaKs74Z6vqvmddRRuYNfWoajMCWQ==
Date:   Wed, 13 Nov 2019 14:01:27 +0000
Message-ID: <SG2PR01MB2141E8A64DB78CE4DD631CD587760@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ceo@teo-en-ming-corp.com; 
x-originating-ip: [2401:7400:c802:de67:9162:51ee:7860:8489]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6478dbeb-7e9a-4afa-ab16-08d76841fa89
x-ms-traffictypediagnostic: SG2PR01MB2598:
x-ms-exchange-purlcount: 4
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SG2PR01MB259869361387CCB57254787987760@SG2PR01MB2598.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0220D4B98D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(136003)(396003)(39830400003)(346002)(376002)(189003)(199004)(71190400001)(7696005)(25786009)(316002)(2501003)(86362001)(486006)(6506007)(71200400001)(2906002)(476003)(102836004)(46003)(9686003)(14444005)(6916009)(256004)(6116002)(107886003)(508600001)(8676002)(81156014)(14454004)(76116006)(6436002)(33656002)(2351001)(66476007)(4326008)(966005)(7736002)(55016002)(6306002)(305945005)(81166006)(5660300002)(8936002)(186003)(5640700003)(64756008)(66556008)(66946007)(99286004)(66446008)(74316002)(52536014);DIR:OUT;SFP:1101;SCL:1;SRVR:SG2PR01MB2598;H:SG2PR01MB2141.apcprd01.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: teo-en-ming-corp.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: No0tzwD7X4aW/eLp8LcRITuuAF5VobxOsNa+Q/P15HHQS6zQm56Zf2DsOpI54hmWS5W4mzcVrCzilXuk1ijdvOtXw5kcw59gE5Pr1qnopq7WSTOzHdG1ACa6XzijBdpV0qIw6blnnyjlroRZ/3/ASWa5bdYUlv2DbXQd/hWnAO9zzCukhmSEOW5ygI8WXOm+vvgSSOPr5deHUo7SCamb+pk/HGqubCEdGNdRSzBDp3WYilCymkNERpkxgbCmyOcgE9QifAEehwoDJzlfMATU8ziYce/xfs5HisIAa2DS2pTLNjIxAQ4mCbfS+L3bFOiQojeanyzAgu9PAOc7F6W1Hf6LjYV9mhVKkSfRlu9h1oXokHbQC9IFBCPr+EIIC/5J+Ex68Shuoek24DlE3vgc0dOEVxRuvQy70gBZvaxYDXaIzubINaiGscw0CJ5y54RhkzllhDY8fAPXvYlatnv+8bzlPJlR6A+R4NXQFuaPH60=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: teo-en-ming-corp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6478dbeb-7e9a-4afa-ab16-08d76841fa89
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2019 14:01:27.9544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b3f6ae-c453-4b93-aec9-f17508e5885c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cQYhd7Ews1Tn8rdxYLG1CknHsqR4nSxeDxJ2kzCYCUfKU5NMOnjcHfMzoCaY6hDRwVYLxMichLhOJeVaUJCtYFX1J+IJN0gQVV8R0l4uw5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR01MB2598
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Subject: Singapore Democratic Party leader Dr. Chee Soon Juan encouraged me=
 to try applying for refugee status/political asylum in several countries

I have a chance encounter with Singapore Democratic Party leader Dr. Chee S=
oon Juan along the street at Toa Payoh Lorong 4 on 13 November 2019 Wednesd=
ay at about 3:00 PM Singapore Time. I was on my way home after a 3-hour par=
t time/temporary job from 11 AM to 2 PM Singapore Time when I bumped into D=
r. Chee. We had a short discussion. I briefly told Dr. Chee of my plight fo=
r the past 13 years, which has been told countless times in my RAID 1 mirro=
ring redundant Blogger and Wordpress Blogs, my autobiography first draft 11=
 November 2019 and my countless international posts. Dr. Chee advised and e=
ncouraged me to try applying for refugee status/political asylum in several=
 countries. We parted soon after.

Teo En Ming's Archives and Records Administration (TEMARA). Office of the G=
rand Historian. Records made on 13 November 2019 Wednesday Singapore Time.

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

