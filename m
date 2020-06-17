Return-Path: <SRS0=A1Sv=76=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C56C433DF
	for <linux-m68k@archiver.kernel.org>; Wed, 17 Jun 2020 12:34:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E32720CC7
	for <linux-m68k@archiver.kernel.org>; Wed, 17 Jun 2020 12:34:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgFQMer (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 17 Jun 2020 08:34:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:46180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbgFQMer (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 17 Jun 2020 08:34:47 -0400
Received: from [192.168.0.106] (220-244-111-178.tpgi.com.au [220.244.111.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C02552078D;
        Wed, 17 Jun 2020 12:34:45 +0000 (UTC)
Subject: Re: [PATCH 2/2] m68k: mm: fix node memblock init
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Angelo Dureghello <angelo.dureghello@timesys.com>,
        Mike Rapoport <rppt@linux.ibm.com>
References: <20200617065341.32160-1-rppt@kernel.org>
 <20200617065341.32160-3-rppt@kernel.org>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <d40b68dc-b9aa-bcba-321b-fddfb22dd4b1@linux-m68k.org>
Date:   Wed, 17 Jun 2020 22:34:43 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200617065341.32160-3-rppt@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Mike,

On 17/6/20 4:53 pm, Mike Rapoport wrote:
> From: Angelo Dureghello <angelo.dureghello@timesys.com>
> 
> After pulling 5.7.0 (linux-next merge), mcf5441x mmu boot was
> hanging silently.
> 
> memblock_add() seems not appropriate, since using MAX_NUMNODES
> as node id, while memblock_add_node() sets up memory for node id 0.
> 
> Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Acked-by: Greg Ungerer <gerg@linux-m68k.org>

Regards
Greg


> ---
>   arch/m68k/mm/mcfmmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
> index 29f47923aa46..7d04210d34f0 100644
> --- a/arch/m68k/mm/mcfmmu.c
> +++ b/arch/m68k/mm/mcfmmu.c
> @@ -174,7 +174,7 @@ void __init cf_bootmem_alloc(void)
>   	m68k_memory[0].addr = _rambase;
>   	m68k_memory[0].size = _ramend - _rambase;
>   
> -	memblock_add(m68k_memory[0].addr, m68k_memory[0].size);
> +	memblock_add_node(m68k_memory[0].addr, m68k_memory[0].size, 0);
>   
>   	/* compute total pages in system */
>   	num_pages = PFN_DOWN(_ramend - _rambase);
> 
