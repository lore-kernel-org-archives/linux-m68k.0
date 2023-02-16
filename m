Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D50C636CC
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Feb 2023 12:57:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjBPM5I (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 16 Feb 2023 07:57:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjBPM5H (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 16 Feb 2023 07:57:07 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A79B3B853
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Feb 2023 04:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676552176;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0brO8VK06ZnIcshoHVvytI1fhIpz6iPLFoXabkZbK1Y=;
        b=hwwdyHcZsebtKDs7I9jLlFB315caVPD1Uc4RvNeQoxG5AgZ3ec6hO7Bsz6u0UNemtNzfFL
        ucy8IHdZRggpsdj8qdF9gFtSojDsJYdOubkIdzkB0Wij9COsbDfhh0dRSKLmnc6o+z4ZdU
        0AySlsP9A4zXVcftVcfNGo9S3CfNHg0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-25-L8vduoyHNHiEfw-wMfJKbQ-1; Thu, 16 Feb 2023 07:56:15 -0500
X-MC-Unique: L8vduoyHNHiEfw-wMfJKbQ-1
Received: by mail-wm1-f72.google.com with SMTP id l31-20020a05600c1d1f00b003deab30bb8bso805125wms.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Feb 2023 04:56:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0brO8VK06ZnIcshoHVvytI1fhIpz6iPLFoXabkZbK1Y=;
        b=uey2KXhr4E4jb6U4vIId1c6hS9qyKSwCZILv2Zpz9Yf7AAVVOupmAbzrRL0ToE6wFC
         8Q6Bvmk2somtfP7fgv/RA7W53BXHuYfA1PlGwipXy31Z4Oy5YlIHnrrTjlyggUv8Gsrs
         Bn93kLgnLxI7HV6lvjyOr0qGoOvTl+8wbWLA9xGKFcr9dOyQQ2q/jKXbzfmTCorj97X/
         Wj6nu4f2vTgFOhBieCp/Qd3x04E4CWoXawQIY8vJvy+TsCOrmMzTCzZoGJUYtk86MI9w
         LTA3PErZF2KTot3da/pcEzaiXu9lFzgnwZlLO1+RSXx3lVD1YfhEH6MwhDeCn+g1WGix
         SwkA==
X-Gm-Message-State: AO0yUKW8a6BVTVbrEalLq201EjGoC/i94Zlp+VhGCzZdfXsCfDsMMLdo
        aW6SglsuvHm7zHn7dAhRW/sKof7X6pGRPc/eqEGJh2I7rC4nZK0SY4J4BqEemHSlpt2UMLR4nyc
        35Ylnuz1vXxOXj8uFDpjl2SrEYSjH
X-Received: by 2002:a5d:4382:0:b0:2c5:5da4:a3b1 with SMTP id i2-20020a5d4382000000b002c55da4a3b1mr5067819wrq.69.1676552174378;
        Thu, 16 Feb 2023 04:56:14 -0800 (PST)
X-Google-Smtp-Source: AK7set8ga4/l/6qx8d8pgKP4FREWjdTFn59p9XK8gw6tuQF/ZAJU23f5WU3594HK3YmofYUfawVPeA==
X-Received: by 2002:a5d:4382:0:b0:2c5:5da4:a3b1 with SMTP id i2-20020a5d4382000000b002c55da4a3b1mr5067803wrq.69.1676552173996;
        Thu, 16 Feb 2023 04:56:13 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:bc00:2acb:9e46:1412:686a? (p200300cbc708bc002acb9e461412686a.dip0.t-ipconnect.de. [2003:cb:c708:bc00:2acb:9e46:1412:686a])
        by smtp.gmail.com with ESMTPSA id e14-20020a5d530e000000b002c553e061fdsm1373550wrv.112.2023.02.16.04.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 04:56:13 -0800 (PST)
Message-ID: <30bc98f3-2048-1b2e-88b5-4e54dff8e0fa@redhat.com>
Date:   Thu, 16 Feb 2023 13:56:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] sh: initialize max_mapnr
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rich Felker <dalias@libc.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mm@kvack.org, linux-sh@vger.kernel.org
References: <20230214140729.1649961-1-rppt@kernel.org>
 <20230214140729.1649961-3-rppt@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230214140729.1649961-3-rppt@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 14.02.23 15:07, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> sh never initializes max_mapnr which is used by the generic
> implementation of pfn_valid().
> 
> Initialize max_mapnr with set_max_mapnr() in sh::paging_init().
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: e5080a967785 ("mm, arch: add generic implementation of pfn_valid() for FLATMEM")
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>   arch/sh/mm/init.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
> index 506784702430..bf1b54055316 100644
> --- a/arch/sh/mm/init.c
> +++ b/arch/sh/mm/init.c
> @@ -301,6 +301,7 @@ void __init paging_init(void)
>   	 */
>   	max_low_pfn = max_pfn = memblock_end_of_DRAM() >> PAGE_SHIFT;
>   	min_low_pfn = __MEMORY_START >> PAGE_SHIFT;
> +	set_max_mapnr(max_low_pfn - min_low_pfn);
>   
>   	nodes_clear(node_online_map);
>   

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

