Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D2CC433E0
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Mar 2021 07:13:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32DF364E38
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Mar 2021 07:13:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232378AbhCAHNH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 Mar 2021 02:13:07 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5638 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232409AbhCAHNA (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 1 Mar 2021 02:13:00 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1216X8pd046196;
        Mon, 1 Mar 2021 01:59:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=aZ5r2NzPi/A4pzk/MREfy1tqOZanf+yJ0hrn09kfx0Q=;
 b=KEyam1TVYfMbk5F2QVPTrAREGjcD3KHYmuWf9xy0yAglrzlZu1JHdUSo33xydZeANIdM
 3EC4NAO3vWOCP0xaLE0VXQP3jJh15oArp/0EN2UmX5upFMJQHFk62Zvkkk9L0BVMH7OJ
 HuCaQyLdRzS/pjXwuvqe7FvElbt+lqJcTCRlBIij+Jm8drYWiTJ+9f/oKKVHwcoEJ8LC
 DHhLqmZzpCZ53TZR/H81qoB4JFoYWMwN3CpCUO/puSlq+rtXCLbs5aPLBzJfFN3tStiR
 8ES8aVN6ZWFXFEeQdMtQrgv1r97NtFUT2XobgMM7uPC/N0EWA0orQdO7H5tUMES2NqJZ Cw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0b-001b2d01.pphosted.com with ESMTP id 37041gmn0q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 01 Mar 2021 01:59:19 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1216wn4X000487;
        Mon, 1 Mar 2021 06:59:14 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma03ams.nl.ibm.com with ESMTP id 36ydq89jbp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 01 Mar 2021 06:59:13 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 1216wwj528508606
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 1 Mar 2021 06:58:58 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C1A5052059;
        Mon,  1 Mar 2021 06:59:11 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.18.192])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 34DFC52052;
        Mon,  1 Mar 2021 06:59:11 +0000 (GMT)
Date:   Mon, 1 Mar 2021 08:59:09 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Angelo Dureghello <angelo@kernel-space.org>
Cc:     gerg@linux-m68k.org, akpm@linux-foundation.org,
        linux-m68k@vger.kernel.org
Subject: Re: [PATCH v2] m68k: fix flatmem memory model setup
Message-ID: <YDyQvY/PtE+znuBJ@linux.ibm.com>
References: <20210228190828.392974-1-angelo@kernel-space.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210228190828.392974-1-angelo@kernel-space.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-01_02:2021-02-26,2021-03-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 mlxlogscore=891 mlxscore=0 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103010052
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Feb 28, 2021 at 08:08:28PM +0100, Angelo Dureghello wrote:
> Detected a broken boot on mcf54415, likely introduced from
> 
> commit 4bfc848e0981
> ("m68k/mm: enable use of generic memory_model.h for !DISCONTIGMEM")
> 
> Fix ARCH_PFN_OFFSET to be a pfn.
> 
> Signed-off-by: Angelo Dureghello <angelo@kernel-space.org>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
> Change for v2:
> - replace PAGE_OFFSET with m68k_memory[0].addr
> ---
>  arch/m68k/include/asm/page_mm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
> index 8cfc92451711..1c683ce57d48 100644
> --- a/arch/m68k/include/asm/page_mm.h
> +++ b/arch/m68k/include/asm/page_mm.h
> @@ -167,7 +167,7 @@ static inline __attribute_const__ int __virt_to_node_shift(void)
>  	((__p) - pgdat->node_mem_map) + pgdat->node_start_pfn;		\
>  })
>  #else
> -#define ARCH_PFN_OFFSET (m68k_memory[0].addr)
> +#define ARCH_PFN_OFFSET (m68k_memory[0].addr >> PAGE_SHIFT)
>  #include <asm-generic/memory_model.h>
>  #endif
>  
> -- 
> 2.30.1
> 

-- 
Sincerely yours,
Mike.
