Return-Path: <SRS0=2kwO=74=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 364E7C433DF
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 06:26:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B86E20707
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 06:26:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbgFOG0X (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 Jun 2020 02:26:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63552 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728210AbgFOG0X (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 15 Jun 2020 02:26:23 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05F643cs007807;
        Mon, 15 Jun 2020 02:26:20 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0a-001b2d01.pphosted.com with ESMTP id 31n42jsvua-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 15 Jun 2020 02:26:19 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05F6FZPD021960;
        Mon, 15 Jun 2020 06:26:18 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
        by ppma04ams.nl.ibm.com with ESMTP id 31mpe7tysu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 15 Jun 2020 06:26:18 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 05F6QGEX39321622
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Jun 2020 06:26:16 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id F2483AE053;
        Mon, 15 Jun 2020 06:26:15 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7CE5BAE058;
        Mon, 15 Jun 2020 06:26:15 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.190.184])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Mon, 15 Jun 2020 06:26:15 +0000 (GMT)
Date:   Mon, 15 Jun 2020 09:26:13 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Angelo Dureghello <angelo.dureghello@timesys.com>
Cc:     gerg@linux-m68k.org, linux-m68k@vger.kernel.org
Subject: Re: [PATCH] m68k: mm: fix node memblock init
Message-ID: <20200615062613.GA7811@linux.ibm.com>
References: <20200614225119.777702-1-angelo.dureghello@timesys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200614225119.777702-1-angelo.dureghello@timesys.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-15_01:2020-06-12,2020-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=899
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 suspectscore=0
 cotscore=-2147483648 adultscore=0 impostorscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006150050
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Ho Angelo,

On Mon, Jun 15, 2020 at 12:51:19AM +0200, Angelo Dureghello wrote:
> After pulling 5.7.0 (linux-next merge), mcf5441x mmu boot was
> hanging silently.
> 
> memblock_add() seems not appropriate, since using MAX_NUMNODES
> as node id, while memblock_add_node() sets up memory for node id 0.
> 
> Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>

The fix is correct, but it is not complete as nommu should be also
fixed.
I've updated your patch with nommu fix [1].

[1] https://lore.kernel.org/lkml/20200615062234.GA7882@kernel.org

> ---
>  arch/m68k/mm/mcfmmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
> index 29f47923aa46..7d04210d34f0 100644
> --- a/arch/m68k/mm/mcfmmu.c
> +++ b/arch/m68k/mm/mcfmmu.c
> @@ -174,7 +174,7 @@ void __init cf_bootmem_alloc(void)
>  	m68k_memory[0].addr = _rambase;
>  	m68k_memory[0].size = _ramend - _rambase;
>  
> -	memblock_add(m68k_memory[0].addr, m68k_memory[0].size);
> +	memblock_add_node(m68k_memory[0].addr, m68k_memory[0].size, 0);
>  
>  	/* compute total pages in system */
>  	num_pages = PFN_DOWN(_ramend - _rambase);
> -- 
> 2.26.2
> 

-- 
Sincerely yours,
Mike.
