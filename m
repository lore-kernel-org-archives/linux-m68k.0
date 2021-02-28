Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5901BC433DB
	for <linux-m68k@archiver.kernel.org>; Sun, 28 Feb 2021 08:53:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1497164E4A
	for <linux-m68k@archiver.kernel.org>; Sun, 28 Feb 2021 08:53:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhB1Iwe (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 28 Feb 2021 03:52:34 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:1342 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230075AbhB1Iwd (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Sun, 28 Feb 2021 03:52:33 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11S8iu2M187713;
        Sun, 28 Feb 2021 03:51:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=K9szTQDEGc3EKRbOdcU2FUOxbC9U4s9KWviixOrBzLU=;
 b=iPfYGAcHFdHWDYQg0TeJ1RODTP+RY8XIsTiqZfrEVyrPRjuiYZLXVIk6SLAyAGVM3uRd
 udpTooXBCYdUY2cW8L6LGH0Bv95hNknobJayX5Mzfsvja7TA4PnPUOdDVZCsuhRzWMcE
 8/JV3w6Vp5E91+twajRbw1rNoK6c8P8N/OwZcldSCbRNmHKiTvTpI7rLjDOZ8cCQ5Bmk
 47aaY3xD998tRgBLuwrLrnf9T8/qcOF/Dh/jTv0FTGdMoqOiPjooMQLmaaQEZ37P/wI/
 NL8osZvWuNBqGKAd8AAGceKw6z5m6RKkAb4tsgerlEbJTPGutemF/cH/7N/8O8U2WG0D sg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3707x7g30b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 28 Feb 2021 03:51:45 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
        by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11S8mt41005860;
        Sun, 28 Feb 2021 08:51:43 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma03fra.de.ibm.com with ESMTP id 36ydq80e24-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 28 Feb 2021 08:51:43 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 11S8pR6s21823930
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sun, 28 Feb 2021 08:51:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 384ACA4060;
        Sun, 28 Feb 2021 08:51:41 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9D3DFA405B;
        Sun, 28 Feb 2021 08:51:40 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.51.238])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Sun, 28 Feb 2021 08:51:40 +0000 (GMT)
Date:   Sun, 28 Feb 2021 10:51:38 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Angelo Dureghello <angelo@kernel-space.org>
Cc:     gerg@linux-m68k.org, akpm@linux-foundation.org,
        linux-m68k@vger.kernel.org
Subject: Re: [PATCH] m68k: fix flatmem memory model setup
Message-ID: <20210228085138.GM1854360@linux.ibm.com>
References: <20210227232058.215436-1-angelo@kernel-space.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210227232058.215436-1-angelo@kernel-space.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-28_03:2021-02-26,2021-02-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 impostorscore=0 mlxscore=0 mlxlogscore=964 spamscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102280071
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi,

On Sun, Feb 28, 2021 at 12:20:58AM +0100, Angelo Dureghello wrote:
> Detected a broken boot on mcf54415, likely introduced from
> 
> commit 4bfc848e0981
> ("m68k/mm: enable use of generic memory_model.h for !DISCONTIGMEM")
> 
> Fix ARCH_PFN_OFFSET to be a pfn.
> 
> Signed-off-by: Angelo Dureghello <angelo@kernel-space.org>
> ---
>  arch/m68k/include/asm/page_mm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
> index 8cfc92451711..84551b1a8b93 100644
> --- a/arch/m68k/include/asm/page_mm.h
> +++ b/arch/m68k/include/asm/page_mm.h
> @@ -167,7 +167,7 @@ static inline __attribute_const__ int __virt_to_node_shift(void)
>  	((__p) - pgdat->node_mem_map) + pgdat->node_start_pfn;		\
>  })
>  #else
> -#define ARCH_PFN_OFFSET (m68k_memory[0].addr)
> +#define ARCH_PFN_OFFSET	(PAGE_OFFSET >> PAGE_SHIFT)

Please keep m68k_memory[0].addr and only add the PAGE_SHIFT I've forgot in
4bfc848e0981. 
Some of the configurations with motorola mmu would be broken with static
PAGE_OFFSET and they require the actual detected memory start to be used as
ARCH_PFN_OFFSET.

>  #include <asm-generic/memory_model.h>
>  #endif
>  
> -- 
> 2.30.1
> 

-- 
Sincerely yours,
Mike.
