Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B9DC61DA4
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Feb 2023 12:56:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjBPM4g (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 16 Feb 2023 07:56:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjBPM4e (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 16 Feb 2023 07:56:34 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A64503B841
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Feb 2023 04:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676552152;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YQju69BiqsaDeQRQ67eE8xOTlMpUfeTc3HdbBLvKdtI=;
        b=gkkP3KVJzd4rX6j8ESMynH2sClNpp7sNYjpZxIqQNtv5z1yXtigMa0X5+V9ZMKLQHc3bny
        AgkVscmjKgpgzYPp8IPeOkPiP8LhO2o/ZKIntCW5sjPuqWZ8QdWmm12IX1U7T/6w1Tj/gl
        yxcbBDfLRYiOLcI9wfCb7cj5yy2bmKM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-JklqYdhUNXa50P8SZv2H8Q-1; Thu, 16 Feb 2023 07:55:46 -0500
X-MC-Unique: JklqYdhUNXa50P8SZv2H8Q-1
Received: by mail-wm1-f71.google.com with SMTP id bg3-20020a05600c3c8300b003e1e7d3cf9fso3102911wmb.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Feb 2023 04:55:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQju69BiqsaDeQRQ67eE8xOTlMpUfeTc3HdbBLvKdtI=;
        b=3ucZiAJPwavfzMvnwGXdz3onS+vPSyWBbfHxl/ya8NJcvYyTwXzk4fRB/gN5Kp1TQX
         gJLeiORXvtWQ4l5hXV0mHs3NULuagQMYtPnHdcqYpntas97Z9UHI3V74NPypbwJ8Yigo
         EvugDhpeIptbbitW5YWgV722OBaBcWSJmfY5kFRl2JiIftt1TNOhNf3EPVEqb+honq2l
         w6t3+1co/EOMG3FEFKQm2I9w6VP2EQzjWrORe9mW1vAbWQscS4cA25fddv8cW0QgxmIV
         beXnZyukfHQ+QZKEDIkQdyj2XOi0XEzYwWzGOcXNGKQXD/ji1jjVJTHK8OXhHqDdchMi
         yUpg==
X-Gm-Message-State: AO0yUKXg3lyFkXX0vlx8nnJZ/JBag4T/aRg7Rmh/zZ54WW8whsB4rtgY
        JZli9cgtxmkPf+GawZWDVZIGTZZwi+g/vHzdz20QuA4iFlC75TfjWVEPz9qCYiGgq9QNcwUFQlN
        LBrjU0u20GNYvfGlhYIGNyyIn/aOV
X-Received: by 2002:a05:600c:3095:b0:3e0:270f:dc88 with SMTP id g21-20020a05600c309500b003e0270fdc88mr4727011wmn.33.1676552145109;
        Thu, 16 Feb 2023 04:55:45 -0800 (PST)
X-Google-Smtp-Source: AK7set+7vAUFLmGpK/uGMNwqyeDbGIKjmd05FOFkQfPnLLLkNoDCGfYC4U+JHMip2ipd/4/xZ0D3Eg==
X-Received: by 2002:a05:600c:3095:b0:3e0:270f:dc88 with SMTP id g21-20020a05600c309500b003e0270fdc88mr4726994wmn.33.1676552144813;
        Thu, 16 Feb 2023 04:55:44 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:bc00:2acb:9e46:1412:686a? (p200300cbc708bc002acb9e461412686a.dip0.t-ipconnect.de. [2003:cb:c708:bc00:2acb:9e46:1412:686a])
        by smtp.gmail.com with ESMTPSA id i28-20020a1c541c000000b003dd1c45a7b0sm1803896wmb.23.2023.02.16.04.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 04:55:44 -0800 (PST)
Message-ID: <36284094-b8b7-abe2-3ac9-f504a7c8010f@redhat.com>
Date:   Thu, 16 Feb 2023 13:55:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] m68k/nommu: add missing definition of ARCH_PFN_OFFSET
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
 <20230214140729.1649961-2-rppt@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230214140729.1649961-2-rppt@kernel.org>
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
> On m68k/nommu RAM does not necessarily start at 0x0 and when it does not
> pfn_valid() uses a wrong offset into the memory map which causes silent
> boot failures.
> 
> Define ARCH_PFN_OFFSET to make pfn_valid() use the correct offset.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: d82f07f06cf8 ("m68k: use asm-generic/memory_model.h for both MMU and !MMU")
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

