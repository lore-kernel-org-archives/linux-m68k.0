Return-Path: <SRS0=aRi6=26=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF442C282DD
	for <linux-m68k@archiver.kernel.org>; Thu,  9 Jan 2020 15:33:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A88322064C
	for <linux-m68k@archiver.kernel.org>; Thu,  9 Jan 2020 15:33:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=teoenmingcorp.onmicrosoft.com header.i=@teoenmingcorp.onmicrosoft.com header.b="Ksc5t3c+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgAIPd7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 9 Jan 2020 10:33:59 -0500
Received: from mail-eopbgr1300050.outbound.protection.outlook.com ([40.107.130.50]:40619
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728098AbgAIPd7 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Thu, 9 Jan 2020 10:33:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGUhXl2GkLz6FynMOfT/NHlmOtkCEBQtTQsFBTn7ZPxqTwR/FeeZPQRvB1Ywib1LeIkxclbu/p4AF2VMLzUopLQbwLfypTpfBXfw+Spq3btJoevOmxTE2M+vjWPmwvYWs9CV83aGxEdpzcKY7rLrFwFSafSKOZ6dtvCCGlwYiQ+e9tXd6i7SWP1Jdr6vQA9GBXZ8giKmdw1HdPP/net8Cz1DQT10pv49kAaZgg89irbAtVRQR8Or+e86eogBeYZHWKBm2Wr7R04ZPIBziYNtWNtBPad5ZmgCMAI2o1Q/vQbu5+PqFbVPcmLAAzuNJGkexQ2ekvRzDvv+8y/PPPCqLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkC7wY334/PuMEgerBeWKWnU8lmu8c46b4WPaw0WM5I=;
 b=HVZltZ4kge5qo8iNgbsawHqqNENO4+jEeI9C/OJEOPJJ8yMPX1c4oZp28r+M3/MgVAsNF+0Sz5Dd4eHlkLbPIycJWK4lxhN53szOWHLgZbdDp6OTT6luTk3lzCrEDNmIy8N4ISKKAWr8Y583Dr5HK3il/8iRxC7GhK+svjAQbUD4QJCUvZUpXiTJLcGsFXzf+RXFTPVioH1Cu1g1f2G7xXymHJURYnQNHe5PW0pUhL/vfAueJFSwvjinZs3UzOklVeo0IXacLXYbCspEkqReMAewHxJFldDj3OtLITlAK84bNvQnfjChEt5MBEdtw8dMnpWHiHxfy8fpbKdddWPN8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=teo-en-ming-corp.com; dmarc=pass action=none
 header.from=teo-en-ming-corp.com; dkim=pass header.d=teo-en-ming-corp.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=teoenmingcorp.onmicrosoft.com; s=selector2-teoenmingcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkC7wY334/PuMEgerBeWKWnU8lmu8c46b4WPaw0WM5I=;
 b=Ksc5t3c+HoNbuqANvq3xMG4sCUxilSrYysupuxhKG194tawFO4NEhGMOEnl9+6ZmIJEslAZYkdLpGGXyX6EfOLYD6gt6XdeN7QK/h/HjRvfQqCO2oFDwSBUNl6SkDNQj8iHSUDudGLaz9xxiuF7jp6NwznvPtfGoVfHN9SzE/xI=
Received: from KU1PR01MB2134.apcprd01.prod.exchangelabs.com (10.170.174.138)
 by KU1PR01MB1894.apcprd01.prod.exchangelabs.com (10.170.173.138) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12; Thu, 9 Jan
 2020 15:33:53 +0000
Received: from KU1PR01MB2134.apcprd01.prod.exchangelabs.com
 ([fe80::8122:ca17:cba6:19aa]) by KU1PR01MB2134.apcprd01.prod.exchangelabs.com
 ([fe80::8122:ca17:cba6:19aa%5]) with mapi id 15.20.2623.010; Thu, 9 Jan 2020
 15:33:53 +0000
From:   Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
To:     "linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>
CC:     Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
Subject: Singapore Citizen Mr. Teo En Ming's Refugee Seeking Attempts as at 9
 Jan 2020 Thursday
Thread-Topic: Singapore Citizen Mr. Teo En Ming's Refugee Seeking Attempts as
 at 9 Jan 2020 Thursday
Thread-Index: AdXHAiJJ8kPXVsr3QEuGRpR7BE45eA==
Date:   Thu, 9 Jan 2020 15:33:52 +0000
Message-ID: <KU1PR01MB21341499E4FFA2BD9C2BA88687390@KU1PR01MB2134.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ceo@teo-en-ming-corp.com; 
x-originating-ip: [2401:7400:c802:de67:f1ab:6fde:d925:5c0c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0e6e342-23df-4897-ef33-08d795195569
x-ms-traffictypediagnostic: KU1PR01MB1894:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <KU1PR01MB1894DC70BEF00AA76432F3FD87390@KU1PR01MB1894.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 02778BF158
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(346002)(39830400003)(366004)(396003)(199004)(189003)(66556008)(66476007)(66946007)(76116006)(81166006)(81156014)(2906002)(33656002)(64756008)(66446008)(8676002)(316002)(508600001)(6506007)(4000180100002)(107886003)(71200400001)(4326008)(7696005)(55016002)(5660300002)(6916009)(186003)(52536014)(86362001)(966005)(8936002)(9686003);DIR:OUT;SFP:1101;SCL:1;SRVR:KU1PR01MB1894;H:KU1PR01MB2134.apcprd01.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: teo-en-ming-corp.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FrluvnQ8gzRGwCnvSFGfvTJBj+9RX2Izb8UxqmZJpA6sVo1J7aGLvBxXu3A9g8gQnM0Em4mgB3b4No4bzfDh4QGMUjJgY+43ENr0lioF5mUA7zpUwrLKxzhRtegiIBNdjV3W/srh0y2AGnSfl45JkZji8RE+JwFylXrBCpUg3sQUHqF3scE/MfCTd25UWFmVfejdEYilyZo31jaYpHFAEYUqS6TxQwftfPhwWXLpeD45AnirFAq0yg8wH1gQT8bUhHKogIibOQsDIfyFPvUprxc3pD/c7Z77Pkob6Q78byj3IWU6C/qBm4T5oQ3FnLkCnlFLJWiuxnjG+364jbOSYuNyyzY6et7IzNnchlRP7RtDP/CBycW0+o2JPbg+4iwicibpRVq/mUPA3TKeajoeaXvFq77FFYrKNIkExCq0irc8BgdN8VNznncvTTF4vDFRKOWl+ygQmTFe1M4iNY9PNj0nhvutXUfye8PRYCXaeg0/x2Z8SpTrcUWT+d56iaCGPBtf0M3atUgU4j+mULWNVQ==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: teo-en-ming-corp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e6e342-23df-4897-ef33-08d795195569
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2020 15:33:53.3712
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b3f6ae-c453-4b93-aec9-f17508e5885c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LixDgyPfCV/lJgUEttumRmagY5JBDcXUf9nODWTeyHsFZnho38LqRERXdM+kLO80aWpHsiZ26vcq695kpsfJO18wazFn8PlcbKFC+yUdooo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU1PR01MB1894
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

SUBJECT: Singapore Citizen Mr. Teo En Ming's Refugee Seeking Attempts as at=
 9 Jan 2020 Thursday

In reverse chronological order:

[1] Application for Offshore Refugee/Humanitarian Visa to Australia, 25 Dec=
 2019 (Christmas) to 9 Jan 2020

Photo #1: Page 1 of Form 842 Application for an Offshore Humanitarian visa,=
 Refugee and Humanitarian (Class XB) visa

Photo #2: Front of DHL Express plastic envelope (yellow)

Photo #3: Back of DHL Express plastic envelope (white)

Photo #4: DHL Express Shipment Waybill

Photo #5: DHL Express Shipment Tracking Online Page, showing that my applic=
ation for offshore refugee visa to Australia=20
was picked up at 1619 hours on 25 Dec 2019 in Singapore and delivered to Ca=
nberra - Braddon - Australia
on 30 Dec 2019 at 11:10 AM Braddon, Australian Capital Territory (ACT) Time

Photo #6: DHL Express Electronic Proof of Delivery, showing that my applica=
tion for offshore refugee visa to Australia=20
was received and signed by staff Mohsin Mahmood at the Special Humanitarian=
 Processing Center,=20
3 Lonsdale Street, Braddon, Australian Capital Territory (ACT) 2612, Canber=
ra, Australia.

Photo #7: Page 5 of Form 842 Application for an Offshore Humanitarian visa,=
 Refugee and Humanitarian (Class XB) visa, bearing the=20
official stamp of the Australian Government Department of Home Affairs at N=
ew South Wales (NSW):=20
"COURIER RECEIVED; HOME AFFAIRS; NSW; 27 DEC 2019" and=20
"HOME AFFAIRS; NSW; 27 DEC 2019" at the bottom.

References:

For the above-mentioned seven photos, please refer to my RAID 1 mirroring r=
edundant Blogger and Wordpress blogs at

https://tdtemcerts.blogspot.sg/

https://tdtemcerts.wordpress.com/



[2] Petition to the Government of Taiwan for Refugee Status, 5th
August 2019 Monday

Photo #1: At the building of the National Immigration Agency, Ministry
of the Interior, Taipei, Taiwan, 5th August 2019

Photo #2: Queue ticket no. 515 at the National Immigration Agency,
Ministry of the Interior, Taipei, Taiwan, 5th August 2019

Photo #3: Submission of documents/petition to the National Immigration
Agency, Ministry of the Interior, Taipei, Taiwan, 5th August 2019

Photos #4 and #5: Acknowledgement of Receipt (no. 03142) for the
submission of documents/petition from the National Immigration Agency,
Ministry of the Interior, Taipei, Taiwan, 5th August 2019, 10:00 AM

References:

(a) Petition to the Government of Taiwan for Refugee Status, 5th
August 2019 Monday (Blogger blog)

Link: https://tdtemcerts.blogspot.sg/2019/08/petition-to-government-of-taiw=
an-for.html

(b) Petition to the Government of Taiwan for Refugee Status, 5th
August 2019 Monday (Wordpress blog)

Link: https://tdtemcerts.wordpress.com/2019/08/23/petition-to-the-governmen=
t-of-taiwan-for-refugee-status/



[3] Application for Refugee Status at the United Nations High Commissioner =
for Refugees (UNHCR),=20
Bangkok, Thailand, 21st March 2017 Tuesday

References:

(a) [YOUTUBE] Vlog: The Road to Application for Refugee Status at the
United Nations High Commissioner for Refugees (UNHCR), Bangkok

Link: https://www.youtube.com/watch?v=3DutpuAa1eUNI

YouTube video Published on March 22nd, 2017

Views as at 9 Jan 2020: 659

YouTube Channel: Turritopsis Dohrnii Teo En Ming
Subscribers as at 9 Jan 2020: 3.14K
Link: https://www.youtube.com/channel/UC__F2hzlqNEEGx-IXxQi3hA







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

