Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84E03B7770
	for <linux-m68k@lists.linux-m68k.org>; Sun, 27 Sep 2026 13:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790514230; cv=fail; b=KyT+jOvreZ35dRSitt64MnGV1IKnacZgYv2tktsJEhqY7gBzWLX9KILvI8e5/kufn8BuZuzW2R8Am2d7wjONRywsiwX32gdQT7tcRgwfW9oBoRoaa+15nfH1MAlyvgd7Jc4MhpjOIGPnp6W9UIdM7vTXsEdqNqVCSXw4sjyhfLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790514230; c=relaxed/simple;
	bh=snA/ypN6E768DIWMRJ4scTgFK3GiqKtXkSC31apeq+k=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=OhQWNncFU39ngybU9BebeU3B2bNU7Mrm10WqUj6ara77WfATywJy+/xKCWNMQoFHenjXUyMmbJJMt1vJkn1nYXXE22wtT8kQb4+ECmgdYHbco36zYCWB/5FrNGuDcTxZUgPbWjrTcfpOcxw7nF1dIdfU3CHJdWWbcLftgtBa5A8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SNw76jcP; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SNw76jcP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790514229; x=1822050229;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=snA/ypN6E768DIWMRJ4scTgFK3GiqKtXkSC31apeq+k=;
  b=SNw76jcP8UBFAgxhGjFTvnH8cXy4y6Mduu7TQDyD3JuVwRkrM8HXoGF+
   3extL6n2v8QDUeLmzhPJeDRk2pL/vP9OUgj3z8HzmBIEMV8SAJw5WmbYm
   whvnJ+YmJxNnHzKPXikok1cm0sVD4MSOF7te0ZffGIJdU/XqcEsqEgR1x
   OTl7jlGFGvN/0RrARcGwxa0ohNUdOIwFtIz+C61+IFQHb37i6pV6utIAp
   AXaeAzQO0L/is/pVPDDbO4iyzSLnCbk45dbr3aYsEkF7jSZoPTQJgcK8m
   4BOuQAMGoVV/YW7AClxA4/lSBzXLk9uXx9pe9Yylnfsj7QmFTFtchM67U
   A==;
X-CSE-ConnectionGUID: nra+dSWsRKKeHQKjv3BYjw==
X-CSE-MsgGUID: TysyzXwbQ+qTWLML6TJpIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="101757875"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="101757875"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 06:03:48 -0700
X-CSE-ConnectionGUID: 1C4+uIiETWSA+M2Pm74MHQ==
X-CSE-MsgGUID: EvXhq7vRSTCn4tjbprTAvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="271289958"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 06:03:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 06:03:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 27 Sep 2026 06:03:47 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 06:03:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPnnAR+9Wb9Un/vs0yW7wdfgIZ/HDj7oCMLTGl4DeHybqU914dkudMgsmrEZygNRSOvI7t2S4mBq22w/6+wwLz+BUU3u3+i0brdTxtEDWoIHUZ7OwolmYfMxcdT9qX7Ky0J5DRq33dzigg3XnQR03P2xxMQ/JAMy8Pi5JeVH6SRHXYi+orLC18Qvgah+sURhM4snuJdXC2mkWMhz0hRv9xXzA7Icb92Ijijy6nGo8wJ1aVugVuM3JHtLVhUQI8spWMud2X3rqYhY8kCDx5OBXXxhv+Wcx28Dfg7AtYzm43r7/zxxPC6C9Zvdsj/wp4U3JmqS/w9WaSM1dFQIyJR+pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9K8h22n+MY+YBhwm+hgYIWAIEbIVc/Yxst+kyz1/MSQ=;
 b=YLksCcIDvzQvLYh4wBxw74TlhUj3SWVgCUrgSg9g5m8oJsBL07BFWoA5v/FxWpkozfqAnjMPHG9GEqG7U4/bwXT/NuN8gdlAf1pzxrJxI0iDHzc99NVHom8pcRfufXYgV2lCDMw56y52MCEUYmD5pZ7lfnylk2kE85iVk7ebhL4Y3BNJVg1nyxfUSH4hFVgrVWzAZ1P2iLIvHFYVepNiM5Wa4wqRfmDt3g5d/RAweo4Im1/TYvuNOFr/hpOh5CjzyBpazGjuXzFQIgRyxDMQNvkBnYi5pjbRD6SOokJdviZfvTvPrF2KQZKCAMGKFCeaLyD4+4Xu+oOUJcQaMT1BWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by PH7PR11MB6978.namprd11.prod.outlook.com (2603:10b6:510:206::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Sun, 27 Sep
 2026 13:03:37 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0451.022; Sun, 27 Sep 2026
 13:03:37 +0000
Date: Sun, 27 Sep 2026 21:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-m68k@lists.linux-m68k.org>,
	<uclinux-dev@uclinux.org>
Subject: [gerg-m68knommu:dt 2/22] drivers/tty/serial/mcf.c:586:25: sparse:
 sparse: unsigned value that used to be signed checked against zero?
Message-ID: <arkUIbwtVg/cMR9S@rli9-mobl>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:4:186::19) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|PH7PR11MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e285da7-a6ea-4d08-0b7a-08df1c97bead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: rwkdiCxDOASxlkNLHwDs6viyzMlAsvmeDS0SG1zWMqLOIHcZNw4vJA1+i5+piNKQgunNbXUN80H18F7Nh2Ly6RH/bmeUdE8jTxCIeOcZu7YH11JjDScyJSKcBn5fq2UufeYu2xWkJZ2oKtYCu7ifAGrkeL9D58Va8AuBn2JGw5vk9jM0nK00jdIlixB124Vx5yBuLNifVrJlitOo5OJu86q4nzPTSAM0GCvomOtSOfmOjnfNDauPfizizWeDn6BNXmRvmDxwIa4/kU3Q5cYBQTCbWC6Zeuna9FGRw/yax/b9M0mQA/yRdL3MlhFPBrY1Uy7ZyLXblHvKngZ+8hax4updPTC+1Q2OXZhGazuRjkALZPbsp4NVwkFu+c17erIQK0SmmeredxnS6Ry5lF2Z+WriQSLpDh5hC3x5n8V1zX3y4G6PavYSnmLJpQLgac1uK8TX4obSk5ZQWSFyKZTE2ws+5qlqbTomIr9WNvKrPnvgTN9Flp7lS8/+zasGOq2s7HyFn2YCE6cjMnOmgB94xpu1UparZxPWCBUpr6SyRUOqnsOa4jPEv7KPZURgZmHrTK+e4DzVD3pqjDA3yadbqEcuQRag/o7mY/D/cAefOxxyc1w3KWWt+8KxRkhyOwQJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jerzLFQnQG53n19R2t6jzSv0fXzX0myfgpfgXBiuMJXB9H2NW7GTvJoaMk?=
 =?iso-8859-1?Q?Lr2sNVJnJmBntS9moweMg9OSLtXpIdKYZ9jcjMdjAu0QFdQcq75gm1ZQWo?=
 =?iso-8859-1?Q?O5t90TH0ep58IH88zdi8U46ddcqs+SJuzg795CeGOa+0wiFybWknPQy0MQ?=
 =?iso-8859-1?Q?urjQDtvsVa54Rk99tSG7MYAc+lXo2sAzk53zgIp2+oT0/m6FcMBwvt6lAB?=
 =?iso-8859-1?Q?HlGGHWHzLI4rD/5l+mvh7k85wX8AP8g/vmmPkH1J5RjEYyoVXJaR2ku+GA?=
 =?iso-8859-1?Q?k/Yll5sFwF8dED8eLZJ3Kty+8j/W4Btbv0kev2tFAShZLwlT4WI6/OL4eZ?=
 =?iso-8859-1?Q?Z5Me943nz58Iy3OIc/oCEiYvkVvafSu0edzWigC94lIBseWUnvzgzWfG/Q?=
 =?iso-8859-1?Q?6ieO+FRLgDnJB/WFKUQH2NGf3T9GVzV9q7yGpky00SqARwWgs/vQEgtslH?=
 =?iso-8859-1?Q?IFQtuNQvTsPxaxW54vwAXr9ja5eYv1rtPcawameXP/t7Y2RSk+jDpfagzv?=
 =?iso-8859-1?Q?mYMgMh0r0oHevoN1lcOxk0B2o6seIPak1+6ijT2V6pHtjALnfgc/ySnkHe?=
 =?iso-8859-1?Q?3LIqNuxBj3fnnOyjlbrXkepWTm1yQEHHGEe+Ius+EI0UOJ2N07Awh4idRO?=
 =?iso-8859-1?Q?ragtt2xVdqe1O19607XhedwsPED/zpYQ9A9jvd4IJNMDcpLPdA4RjgKa29?=
 =?iso-8859-1?Q?GlGcLqM0klWD32Hdh2vRq6kR/hnmOpZWsFcgiAsYchRPGgIpAuminMA4rg?=
 =?iso-8859-1?Q?Io0HUdX2coAINIQornSH35L1RNOL1cpOlLQHAGAGHLO7JosVHrro2s2Rfp?=
 =?iso-8859-1?Q?zHFPOuMp38PE9Tw6DWcX9KSJenjhXSfzOld3Bn7vwaSjbF76DMFRx9P6s7?=
 =?iso-8859-1?Q?H4J7vOJsz8Wtvrzval3rRSFQHzj2Uq7wIqjdXRAIzPgAyHO4CfEC3+NDX/?=
 =?iso-8859-1?Q?NoA3vAOEHjG3QqBe+N9o4UJbfi/IV8ZhlGyC36qW+6Xrnaq6fFpPTEt+rr?=
 =?iso-8859-1?Q?f7rKD/E0HEeYxlKj4CWXqHpigF0RW2iiGQ6MVwwBf/O8p4Kc1DLJKCV/aU?=
 =?iso-8859-1?Q?EOIqqABF5PP/RrgMDPXBXIYDidhY/nMvLJYt+dpf2YMGEjq1Eq+rrWMJi6?=
 =?iso-8859-1?Q?Nj0tJbdDsyaynw83WFxcytlrB7iaGz7ZuyVJy3IwEOjLrkQ4EOdipiDUqB?=
 =?iso-8859-1?Q?bgsXTK++mIfEoAavlZn8NPE69A8fjn2n8psh50dtCOBwTcJ+WAuL4weYcU?=
 =?iso-8859-1?Q?4T4Hf8t1MgChL2jd0wHz+Qx6qixemUEiACrm7KtLzVapRgm4Ap/rg9umQI?=
 =?iso-8859-1?Q?qWwGQjIvB7JFgLKnPohdbLb5Q/lnNR63/zf6X0BecqHs8u7PJ1qVNXBCLr?=
 =?iso-8859-1?Q?SkjQUw5SkvrNpdfFwvVc2sF8XSpBGoW3tejYoGEyZMW05PzTiOookE9GAN?=
 =?iso-8859-1?Q?4Rafsqu8dIhjrLIPzhvc05pKbbPiWjrE8NtI2ALB1rL8s93V6QIQobRgqP?=
 =?iso-8859-1?Q?QZdSXgRuQ+eFReIqQ9sVpuhhoeTGdPy4dRHSXSk4BfuqWAihPRDGBFuaj6?=
 =?iso-8859-1?Q?y5FAG94GS1ewLdQNo5j7HMYQABxoLnkGYhkg/Y10ClSkO4HeWsfJfZBTXG?=
 =?iso-8859-1?Q?l7YwsQWxMHChRfxyYWIYT5pfx3I9uYvNhbFKFvjFoKG/n1Jt7oytnVJtqN?=
 =?iso-8859-1?Q?Eyeo4vJPU1eyV1Kqf0h9N8nXzJGAEuKtvMFsq7Soh9bPvPyeEPE735tyjb?=
 =?iso-8859-1?Q?ZrVED0gD1/zt/MsWx3Jc+Mp83jMNwfK7sPPh9ximcZz47+t4cesLAXsxko?=
 =?iso-8859-1?Q?oKfpwiI+3g=3D=3D?=
X-Exchange-RoutingPolicyChecked: t0bMpyOCC3v9dYdIryWnKYZcCOB6sfuLuHnXBePh2/7JmkjBvaQ6L4SSpuGowMnWpg8u54tX2qlKx/quxq6t/cVT2bv9PxEbQLHg/IVlrX6pWXGJNFdnBn+meaAy9yvODeD+1f3UZbX0ZN1pXEMPI9N9HDOBHs7w9DtxIKMreKwuVLxTqQRXoQx04BwT9aToQZbCE97CO2eyLbaDEPRNHfQgFdkR3I4meFoBh0BMX6KVLSjaOpN3/b3EoFm3tRRmB/rrMxkwUD+XfFWhgFNasSBGCRQYZ0vsP4elEPZNPhTiv6lOyMa3VQSvt62zsDGXN725wHOVB7q8Sh3elWxOew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e285da7-a6ea-4d08-0b7a-08df1c97bead
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2026 13:03:37.6488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ynt2e/UEnK37GYZJJpa+cB8CPOEjRYCThtkKRKSktD1utaZgnvHnOnsKvgom34t7i95lYwwK5aoV/Ka5yaMYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6978
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   eafb2e6e489faacf921ddea1e9232e555f7abca6
commit: 9bf66b595d3a0930594f37daca3e4518227bcc6e [2/22] serial: mcf: convert to use proper platform resources
config: m68k-randconfig-r1305-20260926 (https://download.01.org/0day-ci/archive/20260926/202609262305.AW66PR73-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609262305.AW66PR73-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609262305.AW66PR73-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tty/serial/mcf.c:586:25: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/tty/serial/mcf.c:585:37: sparse: signed value source

vim +586 drivers/tty/serial/mcf.c

49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  570  
9671f09921d93e drivers/tty/serial/mcf.c Bill Pemberton    2012-11-19  571  static int mcf_probe(struct platform_device *pdev)
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  572  {
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  573  	struct uart_port *port;
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  574  	struct resource *res;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  575  
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  576  	if (pdev->id >= MCF_MAXPORTS)
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  577  		return -ENODEV;
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  578  	port = &mcf_ports[pdev->id].port;
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  579  
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  580  	port->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  581  	if (IS_ERR(port->membase))
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  582  		return PTR_ERR(port->membase);
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  583  	port->mapbase = res->start;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  584  
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  585  	port->irq = platform_get_irq(pdev, 0);
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15 @586  	if (port->irq < 0)
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  587  		return port->irq;
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  588  
9bf66b595d3a09 drivers/tty/serial/mcf.c Greg Ungerer      2025-01-15  589  	port->line = pdev->id;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  590  	port->type = PORT_MCF;
201d8975ae5ada drivers/tty/serial/mcf.c Greg Ungerer      2015-01-08  591  	port->dev = &pdev->dev;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  592  	port->iotype = SERIAL_IO_MEM;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  593  	port->uartclk = MCF_BUSCLK;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  594  	port->ops = &mcf_uart_ops;
5fda7a0e715c32 drivers/tty/serial/mcf.c Peter Hurley      2014-06-16  595  	port->flags = UPF_BOOT_AUTOCONF;
2fc0184dae7be5 drivers/tty/serial/mcf.c Ricardo Ribalda   2014-11-06  596  	port->rs485_config = mcf_config_rs485;
0139da50dc53f0 drivers/tty/serial/mcf.c Ilpo Järvinen     2022-07-04  597  	port->rs485_supported = mcf_rs485_supported;
4be87603b6dc9e drivers/tty/serial/mcf.c Angelo Dureghello 2020-10-02  598  	port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_MCF_CONSOLE);
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  599  
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  600  	uart_add_one_port(&mcf_driver, port);
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  601  	return 0;
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  602  }
49aa49bfd40d71 drivers/serial/mcf.c     Greg Ungerer      2007-10-23  603  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

