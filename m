Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012030.outbound.protection.outlook.com [52.101.66.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BAB2C11CF
	for <linux-m68k@lists.linux-m68k.org>; Fri, 18 Sep 2026 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741320; cv=fail; b=NOvcxTUn3Gz20SxRYAQkG65bZ4wtPynu02Ba8c7Yl01ORclqaFiSixBsI5UBqplsOHIVo0V6WV/sBUhYQ+hX5h+av61/H5tV48ek06hLVUAqHDcLddvOMYPr0h/oabX7Mzl0Sl3MTZsg1ADxFwH93ZPfCReViJrpnuaaTvK+yb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741320; c=relaxed/simple;
	bh=dNte0ixu1Ec0EhJzvwFMsSa9y26UmNHLO/whntMl3UE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jLqukj9y/ick+d2sp7MKBvn5e9wd+ogbP6wuClk2ZPDJqwoCRsYyg6PDoEk3eyXiAKbmc8WEJMA1q0fc51sPWtvI/scxVqlDVLsovTCNIbUV2C0h46hDR2XWLclbtID635i5VclYAuLQOVlx8I+pftdzOvRci154KWD0LNFTYUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pCFKF31T; arc=fail smtp.client-ip=52.101.66.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pCFKF31T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBjLw6tKxMenBrtnW4BujkqH0N5QhlNmWgC0P0SvaYhcD4F5u6jk1ag5giYN7GO7EtRNiNvY3ptOKP669xxMItmJfIP3/iKOay6TWodOGe3VD2hIY7SvF8FwN4O3180/VJgxTZjZxLO2EacvS2+u85r9KpDAxGkOy6xDjlxBeZGBOIAc9R4SlcCnqjqpvS92IMCgAUBpozpXnWE7yrIATAF3i6/fZEICPS+gOO0j2uA0+O5JiUze7aQevVrdZjr2bRowCL/DaPbwSusHYhWZSz1hS4vz5MFGz0+oIezyfd1j8gBKbQdKkxCJ6wfdi0hOj3YwukOxhaPliKHDqyIf2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZ8zeOWRqmBYQXAL5fF5M+o0HYFh7xYEZERdwnSrxTU=;
 b=zWC0mkLAcvzBtLBRGN+mEH+8qejwoNXlOmVroRmIXOimoCv6le/QBEJqWZlC1fbd5rOZdLxUBowz3Rg2PNd0dX0Na2LP8JaPzVOEPQWiXjXL78HVVtLg3CE6HbJpCuwY1QcDrJ3vMqBYB0MRv0pqik2VTvyKLytA3aGe+L7DOSOtuprKe5ss8u7kUgf099zYNuqeU2rM/drNj5mZ9M1FwAh/x6HC9s7NVatTNdc+rZIKjMZLoqeMY473J2AGM0iyuVFGzpLABUQD0X14CKtcD8hP/XkKfKbqwpnshF0WMdDI5gVoAHffOF2C9gGlL2CRthXfUbIvtrZKob+Gpiyl7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZ8zeOWRqmBYQXAL5fF5M+o0HYFh7xYEZERdwnSrxTU=;
 b=pCFKF31TSJChvHYgYadF4i+pNsWhGcGsZGnVSdyzO2nPobhtt1gED9B5v66aACAMo3AXFF/+HeTjC8QUGd4Me0lz7mPDA/V7mQ/SKaYTJ7usTVYEXM3ONdNHCRDamJIe4v2/DE9z/DCdlj/aJbD1Tkt65aajmG93VcL2bXdpeCQJVbs7jhWtRC7X0kXxjNlY0Nq58I8rQaZvcjW21iLxxxo9nZ/wqHHlHmKbLko0BO5bsKnUXeQtWBDWM3WLVIG/YNJshKwrM3F74fSf0KxywSk8XEg9T3rfRYXdkEPYufdSoExZNLwh2OXu0eeAaVMjVYOdlrMsJO4v50q3X02Wyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB11846.eurprd04.prod.outlook.com (2603:10a6:10:627::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Fri, 18 Sep
 2026 14:21:55 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 14:21:55 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	linux-m68k@lists.linux-m68k.org
Subject: [PATCH] zorro: use assign_bit() where applicable
Date: Fri, 18 Sep 2026 22:19:25 +0800
Message-ID: <20260918141926.3023230-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0154.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB11846:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cb605d6-7aa4-4a30-5a48-08df15903154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|19092799006|56012099006|10067099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	hjyS85qNAnBtDbZRoO5h123tM7SBHkMxt88nR7slmCSsdiHNbpcbE6NLCv4QR9lFAm2c9/Xg10fqbUvcTeBXnpCWZKd0D2uDRoeVlIET+ebvfoP9MmFfSvrLKZycMlKB+GZt0IKiYRM7uoAC64pCvmT1gosS89xlnnZbDWLa5VIfGX+X0oJ7a5abpUcNuI8G7si1EStJdthdF8yYIXcrWKGdvXAK/hzA68CdhPEkmdVLfMKNkJHQWh0EHzIgaKzGFEqQ5LC94kpCOJs9MIPff4Xl+YiIWEJMkHifyv11Vld7paTpohw3xFrPdxq5Cpoc6rJbmuyhKTnzeUiD5acPLV6r0ZtvfCg4lH3ypxWmrmul4OLEqF8iw1IYM/lsHqeR0085ns06dCHDnNZWrSucm5h5qkkXQdwxU3PlnIAo26Q6tSVsvTTDn8ifufni8trUiyN4YDQEMMgV+kQf+iS5CLk2uiHvMV0GYz9ZT+3xIxadlOAO6sMXssXFMlmzu3BjYQ9sDGojeMVTKd7hdwQYg5Gn6q+MN/gvjzw+MDBxSm+o54GbfYBKOxVm0t59/oRPvhG5+YX1B2yoW9UKwdxASAOEgFhh7cgqhNiy4bRRWkVaZV/bzZTQSkWL66LA8PvXuo/bZhtvlYGdKfNfJBc7N5XHE7K5h2OI2VrFnXNDJew=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(19092799006)(56012099006)(10067099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?icTweshW6tYZTtUg6BoMx4OpjG7ppIGJiv8fi5F/smZRIbWbrGKKXzV/T+k2?=
 =?us-ascii?Q?S9l9tvJBdXcaE91KGJuq6aJOksIIVyUZSGZ54l8Jfrp/m+cmKJqI91PG4GQM?=
 =?us-ascii?Q?2iqpBVsYjJohX2G71oyXHMh/9o9uwaCZSnIkf+OEFpIaeaiUzLSwF0xPxMGr?=
 =?us-ascii?Q?G9xHA8Ok7or3n8bx/fQ1CWx9nr+5JHGkibmIU//o/zZVv796VJ75U+1+Wy68?=
 =?us-ascii?Q?TNLKN4PnYVEm4rQ9hSHyCoL9G7GaJ8eoNElv/2wWktwLeFNpQwtF9DB9PV43?=
 =?us-ascii?Q?UyU5QLi9k+ebfaBjl7Xcf/z9ggUJ99pIwi7OUbwU5+jk5XMkPBoVXA//TOyf?=
 =?us-ascii?Q?aBtf4zyUA9s/u3ne+wQYgPm0dtDKVp88Bj+qTn/czeRiSO7NFbcx2hnnNNqf?=
 =?us-ascii?Q?L7kO0a04i37X934r/J2pZYDybvYINhChGP9RNvfrueC8r8jQYei7P77eQrjJ?=
 =?us-ascii?Q?eE4/7FWh1KnwYoYnnmemluXIEcKnki81NPw43jcuBkZJj5RIUT91UGe7Jtam?=
 =?us-ascii?Q?U0fMQpS82CuT2miRt7x5oIKUNDXBHE9VpHzirU7MjJZooIF9WwhDf8wXxFnC?=
 =?us-ascii?Q?Barm186m5GYSPniXqtf7KVCfK14KK9BR9NdvKHtJ0cNWT55gYn3zvjNIWdQR?=
 =?us-ascii?Q?BYVaO09PjAZ2uVdswRbUeds3jzgIylrwvPPdx5q8KmxfyF4O6AYH2klh+GHA?=
 =?us-ascii?Q?CWWwdmQDHBejOE4HldsoLjiViol/1eS5p5PI8pz/gHkYz/PEhQNfTYQu9dGy?=
 =?us-ascii?Q?Fhh/sFZNCwUJoFVYRo5GNrFWEWFoIlrjYyN39DdkrMB5dch5qSMbmkHMjCQ5?=
 =?us-ascii?Q?7VdZwnXQIlIC2QV3am1qGdXyqaDia4P54eRkK4SvfH7nvwTsk7L0Ux2+whu0?=
 =?us-ascii?Q?8It7vz5qDcgEbJkBXAqmV6KKdHEmfn9PLJkMv9yhlbIVJFnRMHYHHspWm+/o?=
 =?us-ascii?Q?KcRpvDHfu8C/eCxN8QNhs+d44xV8wulr2csv41F9b1sHNGeiBFRXemsd5g1D?=
 =?us-ascii?Q?dgLgTzWXZU6mUv+kzfivqTYhW1Ant1Yoq4WtLLdlBRpCMeVRBPZO7vuYjMPr?=
 =?us-ascii?Q?t01mkdrGC/3Jhl1jhq6dXBBjoF80VCGc7Eakkv8b4e9GBKpwIg570lqCLTMc?=
 =?us-ascii?Q?M49LZyvfl9gyG1xw8o33tFDgIYw7y22+7qDNIfT0lg/pEzQoiWD+cXDQJmzm?=
 =?us-ascii?Q?WgDflOw+Q/mRFoy4V/BF1i0OezwRxlybrR/udJw+TVsn6jGVFZ9G36My1Uhl?=
 =?us-ascii?Q?1ZOPM+fgc3B+eqlpaddd6QV43l1HWpG6fcHFFw4UiLpXRS8zZUsTUg8/Bq9C?=
 =?us-ascii?Q?0lUoFz1fCfKXiNpO6zivfVZSuS+eT1hsQgUmha1YwnM/tS8/Aw0Ogwv5b3Me?=
 =?us-ascii?Q?h2Fj5sKzwwfmbrebLIT/YUQaoEY9Zl7FUa64Dq/INSlacnWxeUFL1fCWSGGf?=
 =?us-ascii?Q?KKvtE8oTgADkUfE8xzyJwEjNrZhaxcgLaIg6gOLmxHYa3cwN39BhqmkAw7m8?=
 =?us-ascii?Q?w/jo7+N0+ZpK95yX+IjQISoc/oN1R9HlfLS5pczOpuUlxQr8S+sIEAu1toxs?=
 =?us-ascii?Q?0gE9muAvB398VBfIYGixHOU1B6pKQF/J1xEWkj7ohPvJnZyihdMboOfe2WYX?=
 =?us-ascii?Q?TI/XnmQqu51od7bo8zC3U4hmggJzeZ7zuId2wWiMQp3U0zw/7lDGX2RYgbB9?=
 =?us-ascii?Q?6JAjtKWME/IlneHok9BZBjJFxcI2w9T+qvjfa5PH77s3DCfCdHWrHryUJ5Du?=
 =?us-ascii?Q?EIUcVQYSwx1Jgh3ftIgly1dkq3PsspxhKVgckZUazJORNjwWWmxs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb605d6-7aa4-4a30-5a48-08df15903154
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 14:21:55.7859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zYQA2dbjlecICV4dqtcBgVbBCGvwrtyu3ESS40Ha/8SH9KOYWtiKnOVNgdWCh3xjAGO+fZGcnbxBEZe3RY+G0a1RV6moiAFyy/auIKTBanoLnZEXCE+8nACglZCrLSo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11846

From: Peng Fan <peng.fan@nxp.com>

Convert open-coded if/else with set_bit/clear_bit to the assign_bit API.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/zorro/zorro.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/zorro/zorro.c b/drivers/zorro/zorro.c
index 45495c423c79..cc3177cc681c 100644
--- a/drivers/zorro/zorro.c
+++ b/drivers/zorro/zorro.c
@@ -103,10 +103,7 @@ static void __init mark_region(unsigned long start, unsigned long end,
 	while (start < end) {
 		u32 chunk = start>>Z2RAM_CHUNKSHIFT;
 
-		if (flag)
-			set_bit(chunk, zorro_unused_z2ram);
-		else
-			clear_bit(chunk, zorro_unused_z2ram);
+		assign_bit(chunk, zorro_unused_z2ram, flag);
 		start += Z2RAM_CHUNKSIZE;
 	}
 }
-- 
2.51.0

