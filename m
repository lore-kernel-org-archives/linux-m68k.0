Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4441862A
	for <linux-m68k@lists.linux-m68k.org>; Thu, 17 Oct 2024 01:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729127642; cv=fail; b=bndudGuJUv2trKax41VkD5jku/QDn74MDMDiLvUOrG8am9UP4vnJH/TrL8G57+6lpK/k1tTR4nQ50/fDpheqLLtkCZHeh5i004hLNzpe5JEiblyQTOezWIWMqdb1yCKCnNj1Y8XqJnC+azYtBrmIovp62//5ztt463jesMCTABo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729127642; c=relaxed/simple;
	bh=veHM0PkM79jthvMhkPkB4stWde2qFYHACBO0nK2dDdQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=n98Yexf4LMLhCWHEkZ7ya0IiKaPDygy35jOnjKFgSRfh2X+GVXAxD/d3cHyeDRXJY+OoE9yOJ70pMoGanGtJSPBmS4YvBXH0U8SEw8mjSE5Of7We7COep6pKM9lucvPxCSFjBJcvc9IkX1Ydffab1IQLsPgZ8VA9fOwPtUZtjIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TLgfjJTW; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TLgfjJTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729127638; x=1760663638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=veHM0PkM79jthvMhkPkB4stWde2qFYHACBO0nK2dDdQ=;
  b=TLgfjJTW/FzQzuHxVqL9/wibZA9YE85UqAts79je/Y1iOrO4BooRGKw1
   VAQNKpmzp0hXQRb6+8VaYqFH7X+Nim5FSrCh2qqz2cRz9ic0bEFcROqSH
   QsINECh8+02FWrL28nUTTJe5nkbD1EZxSOCpoAwr1QXaxsIkVkak4VYte
   TXRZPmt16EK6zheeTqBP6f8VIHvAyl/4IVrHKrrnPjK9HiiOKaHbdmwsa
   5fGKOAB+EzoOD4OiuCfC29vmpfUi3Wa53QBhuwyThTP1qIGI1d9BGie3J
   yM9hs/5G8bICrWWqr0d7fDG7iz0NOIaVaIMfCxPxl4cYoqD0ZGP4hd+yK
   Q==;
X-CSE-ConnectionGUID: 0ag3gfbFS4mGlwQA2mavCA==
X-CSE-MsgGUID: Wl8jNXwaSx6YYgFcaJ66Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="39967571"
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; 
   d="scan'208";a="39967571"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 18:13:55 -0700
X-CSE-ConnectionGUID: UKTmT051RLSh/FBUfhQD9A==
X-CSE-MsgGUID: P66HkAQbTAah4P2BvDgwUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; 
   d="scan'208";a="83456763"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Oct 2024 18:13:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 18:13:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 18:13:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 18:13:54 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 18:13:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZF9oqfwGKCjT+jU67ukuSll2DGLj/dLiAOK8k9rsPI5eH6YQZZobTibQv8vsO+QSqbYrw8g7uE/6WnPnpwXeH0kgaKbaxZaUvmic5UoIiBH4XfDTmGx4GfKJeiAkL5+WPEaTE5pbEdn5eNFK4kQHek1PrrosE22D0+LYaeShcFFjq3ElsGOKRnvMHUCzsEf5sqKR5rb3D0vbM0uA806RQYbzkWXi7KLd3RmAb9jrOWV02coZMrvBxHrrX4JEb9u+SyEHWYOBL217Y2txhpTkudGSupqDOywZk61iTDs45l07RBeVD6glxIvYDw6/tnEkBayfozyU1k4HQ2nfbPGJ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5L0otNNzGhWvYzIhjGV/mLnmoVoVz8Nd6fAz0xM1e3Q=;
 b=heot7WNGJylba1C2IXmjx/EbNKD/Sz9xTn8yotNzm45oTO8DyfSg9pN7msCADqz/jwOu3K+QmmOxR10DG9uL3jq8S3vlzld2VDZONNoUEVNsTc2utjaHihYShVbRJjri/03AwSiZ7FJjoxCoin+kPJJs45rT0BXdJPRko+x8RwRNs/WvLj7kZ/jbqbKqqBxWU3LdA0aotRGQvWOgZQ0WKErCZnoLkuC3mHKSzL5oWZFbJjDv5rxeNzuY9nlKtoYkSQ4/zNJA1xYeRMzuJ5rFN3qQV7OfEzC54hoDl9ltZdjYznFeBR8XstWvvDqMZ2x+HIlB8gh171rqhFE70IeQMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by LV1PR11MB8849.namprd11.prod.outlook.com (2603:10b6:408:2b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.31; Thu, 17 Oct
 2024 01:13:52 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 01:13:52 +0000
Date: Thu, 17 Oct 2024 09:13:44 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-m68k@lists.linux-m68k.org>,
	<uclinux-dev@uclinux.org>
Subject: [gerg-m68knommu:cf 1/11] lib/muldi3.c:53:28: sparse: sparse: asm
 output is not an lvalue
Message-ID: <ZxBkyGblxJ7jWzBI@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|LV1PR11MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 862377b8-2ee3-40de-0400-08dcee48f6a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tx5VwNUlGPWh75wn90VyS9iFZGtH5d0c/cBD2dDFyfmQmyDtA1JETWRDQo6S?=
 =?us-ascii?Q?zpIZHQK1RH/Vvm9rI4tHcOZzSjzR97nAii4D9M7RSm2IFBVUjB47a3cUCWtS?=
 =?us-ascii?Q?0PZy8ASB2+F+/47zmwlggkrdVRu6Vuf1nMxcthMdGF39khRfoBeEXvArZCCA?=
 =?us-ascii?Q?s1jiLKuinc5vDsX5ecF3qH72y57reQ9cqqn47FCMR/iVxSUjP3km8f0kjOoo?=
 =?us-ascii?Q?jeJF+8GejQqoNuivIayXC5Pxx+x+RzF1HdPiERyBV5JJ3hQ4L42ynPWqFEYy?=
 =?us-ascii?Q?/QP181PnBE41NcryB93K/M+MdFl8Pb0UZHF0+J/OYgwyjcU1eFl13iEa7r3F?=
 =?us-ascii?Q?nqibNv6iccklSyUgurxZHvczIoUWVnMQ90O16DP636yqN2zhW5DhpQ9NpGAa?=
 =?us-ascii?Q?GmMfiNP+I/V1mg4L+K6jnS+XHdaZr5Y3DXuAtPt+koRm/W/3oWefU2zSxMWb?=
 =?us-ascii?Q?5fqcnuejc5YdlchWltudW3yumhhLIBkqFKtzjkmtZl6m6u8Wy4VvjmPxUWxQ?=
 =?us-ascii?Q?aTFrb28ZJzTGxYTq8OS54eLJxr2ch2x6XGQYBXo1IZN3Oi88WJLWVcV7Ribg?=
 =?us-ascii?Q?Ay10UpntPJ7+W4JlYR7b0R+IkcYxPFTnoud/dhaE1vmJlCTQ9W8153QnF3Aj?=
 =?us-ascii?Q?ItHKUfoaO84cwUtpg77NqkM2L6cgePio0EXpABksyCyGZvo1fFoRWi0qITYa?=
 =?us-ascii?Q?M/LEwB7p3b242lO7RmLf/AR6poSqGH0PRN7hQFU6pvbFU4LfgkMVOKfa/vka?=
 =?us-ascii?Q?CnFCTlPUNg5D8W290M+PUCRH1w4g1rMVZLL1DX30NL1okLY0c6cvhXfcGekM?=
 =?us-ascii?Q?eIgMIzLAqPjgKtvhSOF1BGvfmyll3Gc1VRPWSYCdlwbEqk29sq2do241mrEM?=
 =?us-ascii?Q?ItBkd9WJ/GMPX4MBrPczWq9Kd7p1xrJL/P2B3gVnVY0pRq7zZ2LtAk/Raqyi?=
 =?us-ascii?Q?hn6YDjHYBf22Kl7gorKpzGscCMFrJTQpfK46B5cnJ2yZbq9BPzZAWExXePZD?=
 =?us-ascii?Q?L+KK2o6Rx0wVaePM+VlVB0fXLjxUjYsaqhUtXana5Utw53a78XGWRS/mgLGy?=
 =?us-ascii?Q?I+C1/n8e+p6Y0T6ldL9bg0Y9eLOPWHh7pEr3D9imnBs1hYaHaqwX+TVN3eb4?=
 =?us-ascii?Q?fiON3/lu9xU3oSMYRkHFmVNUSDMXgegZGP1gDEUIQLzrX1gVZLrWOqapjzMO?=
 =?us-ascii?Q?xZuXaJ1q9rWXloVo6mq2o8HL6iHSv21UKGKabiRKLXl7l1oBgCfV+XTANvT1?=
 =?us-ascii?Q?SJfix3HjAv9GDY16UWY6pR0NaCEE8R7Fs/T8JH4Xgg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nXWh9p39Ph5XI9JNkoIyHQMojWvrHRZC45Z7+/BxYj1DWexj1uCrJG8ruR2n?=
 =?us-ascii?Q?Yqv+2tCZhR/lhvUAGv7W3yt7OpdsnUoED3CoEPzyLdHUQMZPLYAYENecmjcR?=
 =?us-ascii?Q?6WmNuJ3iXJ+iux0uUix0t4M30u5ScMYA1leuRSvkBla/YXik2FsKjE8ruQl2?=
 =?us-ascii?Q?Exdc7vIf8PP1pww1G6Jo/ALqQ5IKbn7Xl1ueRXBoqu4BamWseg50p2FmR6oZ?=
 =?us-ascii?Q?0GJLyzVHbvz9sQqVGWRwm4Ydcc1RPYoe8exkVoKKCIjUNAyCva06/JCUZ0uv?=
 =?us-ascii?Q?IW0yTMWIBPPn+B8aHkMXP41u9uD3gutOoQtCoXFc/g83875jNgIlbOh4DvtD?=
 =?us-ascii?Q?NSKuVechkT7POs9oK6vDJ640dv9LlB76D/w9wTsm8sAJsYCswiXWq9ljjUYa?=
 =?us-ascii?Q?ezAzRG7YGGBo/kSog8HTMyqdNJfeunPVOrLqv30j38KTuTZZM/WISBkx/AHc?=
 =?us-ascii?Q?z6nTybXfhLBNt0MJesru0KYcemuBmYmcplQj0+G8DYt45ro6KEyN15qYNir/?=
 =?us-ascii?Q?+1scv7CYfxBrArQS2dAm+DEWsOQFrf8tjopkoZUWWHdEZuwOV48Hml+Sgnl5?=
 =?us-ascii?Q?4alW/JfgGdWlVq7X7jm5m5z2qFZZwOynfdlcpM0kw3kvd/d9Jcji5ckJUEG6?=
 =?us-ascii?Q?6lrWYiy9ER9fkrAxunRBnVZtZ3XbnIXQHiovgao4T4B8kPmJZuwJqpoYC9v7?=
 =?us-ascii?Q?eN4y0s3TLRUEPNhIlPd1OpWU0Szj45QSWAqljuc5MINUJXya23OWxpw33lU/?=
 =?us-ascii?Q?MSf/TnK521UnxCqTWLQjWPPqKyzGYqztUMv71KC4zUj9JWOZlm7aY3wtIw5L?=
 =?us-ascii?Q?hXgB7HaFXKUShN+fOd3fRbRj5fhMzFkPoXNuRvg0vDI8w4OE9aj4/nNJUqo4?=
 =?us-ascii?Q?WavF6h9gWilzT/2gatqY+vSJWyBR2p54BUfF6D/bQYPy86q74XZ1xCHunVpX?=
 =?us-ascii?Q?xiNpyXaQNCUtNxCAiTATr0fjr0Tw/fFTmR5Pm6G/bmwDd+jWGt6r0wmLv/j7?=
 =?us-ascii?Q?02KyKqP1CoA3qDd//bAN2stx0kFuTPAd8SmTbjGQ/wQh0kPVYmHsmyLDpj5T?=
 =?us-ascii?Q?7vSgZOwn37y6Xr8jTwT/PFP/qYkiVU9P2gYu8q3HDVyF4mACzykdQ+oh/eRf?=
 =?us-ascii?Q?rMm9svYsEpqAIuDMNcdOHRxJKzpdigq5WRYq2IHbuHf407htTrcqewp7tik8?=
 =?us-ascii?Q?9kdUU4LO1Aee924bSwD5uZbiHDyqyahn38rSNaZJ3hdtNxf2qjE9zElxMakt?=
 =?us-ascii?Q?m6t+Uo+AKfKYcy0zv9vDpHJjuOGtpKKisixKmiD5PCsCJ/qWMCWMfnuyzOFQ?=
 =?us-ascii?Q?SQmY96GeZUQtYpszi1SMr38eYzMm+rvnhX6l++GxVZ5QkfSiQUtkXj3F93d8?=
 =?us-ascii?Q?mCWbTBuZZGObjN+IhIcMO7c1IIn7Ok2O0Qvp7xIbIkEPUUQCjf+cq4Oou5Fz?=
 =?us-ascii?Q?NarJQ4H4gyjEsq4y01Z+kvfY2bE2++nHQTBPGIaU7fUMB4oxIrjU6CCywOGT?=
 =?us-ascii?Q?hSPFd+tVRs2xXF12NFrzu4GZPiv+OF4h4O+oWtZaPBGgklEr3lIEJo2En/1G?=
 =?us-ascii?Q?FZxBgdbsSfJJrW9Zx82Sd6iWS1Ng5yup+9RvQGEC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 862377b8-2ee3-40de-0400-08dcee48f6a1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 01:13:52.5403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOqs964zn/fu9eTaOGBQFXerA/o+dOEpUMD0ve75T77K6UgouBHWeT+qG2owfCItt7cT98lWV1YxkTpdqSimng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8849
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git cf
head:   472b9fae6baae3d777a1d49fa38893ad0e5f0d67
commit: 050dde147e3a6afee3df72e7252c9b59856cc2b9 [1/11] m68k: use kernel's generic muldi3 libgcc function
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: m68k-randconfig-r113-20241009 (https://download.01.org/0day-ci/archive/20241009/202410091720.grDsayDh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241009/202410091720.grDsayDh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410091720.grDsayDh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/muldi3.c:53:28: sparse: sparse: asm output is not an lvalue
>> lib/muldi3.c:53:28: sparse: sparse: asm output is not an lvalue
>> lib/muldi3.c:53:28: sparse: sparse: not addressable
>> lib/muldi3.c:53:28: sparse: sparse: generating address of non-lvalue (11)
>> lib/muldi3.c:53:28: sparse: sparse: generating address of non-lvalue (11)

vim +53 lib/muldi3.c

b35cd9884fa5d8 Palmer Dabbelt 2017-05-23  48  
b35cd9884fa5d8 Palmer Dabbelt 2017-05-23  49  long long notrace __muldi3(long long u, long long v)
b35cd9884fa5d8 Palmer Dabbelt 2017-05-23  50  {
b35cd9884fa5d8 Palmer Dabbelt 2017-05-23  51  	const DWunion uu = {.ll = u};
b35cd9884fa5d8 Palmer Dabbelt 2017-05-23  52  	const DWunion vv = {.ll = v};
b35cd9884fa5d8 Palmer Dabbelt 2017-05-23 @53  	DWunion w = {.ll = __umulsidi3(uu.s.low, vv.s.low)};

:::::: The code at line 53 was first introduced by commit
:::::: b35cd9884fa5d81c9d5e7f57c9d03264ae2bd835 lib: Add shared copies of some GCC library routines

:::::: TO: Palmer Dabbelt <palmer@dabbelt.com>
:::::: CC: Palmer Dabbelt <palmer@dabbelt.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

