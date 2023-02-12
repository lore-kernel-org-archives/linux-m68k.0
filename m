Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35479C64ED8
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Feb 2023 17:38:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjBLRip (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Feb 2023 12:38:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjBLRin (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 12 Feb 2023 12:38:43 -0500
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B9411654
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Feb 2023 09:38:42 -0800 (PST)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-16a7f5b6882so12813306fac.10
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Feb 2023 09:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=gEc3d6k45zjDeEZHbol4IIwzjmxqM4mBWgDI31Sfc5o=;
        b=R330sse/EVLRGFL0igafPWieDgvfGLbUv1mxwjjJZAHpBvZcU2/Gg7Ye7o55WJDp/T
         d/MkHSIY+rV5WmpmEtSQ3EcpkVyHgH/g8WGwdicgdAr8s7fVYzB3M6AQYSXN1fWO7dsD
         adnG3ljI9LKreMS0IYacGj+zm2/uKWOjveyAMeTbeBXzAlA0+lDjE38oWr0kFL4x/3pl
         NtGAiadx3cotdBgXvBg6mFyqYNavUvZnDTVR9OSu3hxj7Glcs0NmbhgPuh+/V46P8f0N
         UAStFFymZhcq+751kC0Xe8LgThvdTeD+HxCq3F5UGXwSHXYBMgqQ0gCOk/Vyqx7W2YhY
         u2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEc3d6k45zjDeEZHbol4IIwzjmxqM4mBWgDI31Sfc5o=;
        b=qnZ/MHJfE8Lua1tyAE5jfY5vtlM601G2lCcMovNeHWaxQKV6q+zvys/5WwwtmGNCnh
         P6B43etDL0nqVFgtgRcE9UfF8eq2hmRTjYmDJr8Fj32eLEEDFDYV8bSOHL/rhOYI087s
         6SlCniBx1tJVTXy04XjKItj1poQojHcIM3NgyV6eqluxn4ykgpSDN+jg7dBrxC3tx17r
         xsSyyxN/1ASYITUwYIA768PfR5cr+G+lD/IJSrWNArcvSctCtCao+xmwZdi/YjZzFPRg
         Y7ZWR12vSix8yv6c9oZr5VAKNk+gEJnj1/ZE62J2w1U6c0MR7ZkG506pptEBJbwGBI6y
         BSIQ==
X-Gm-Message-State: AO0yUKWrmZqSeShMUZr7PttyDAyrMLVbn/gJkIVAq5rPxu3WgUVcGnGn
        kLe8mktTLDaGGjATj18gQuA=
X-Google-Smtp-Source: AK7set/4d6sAa3sFADK7k8Ny8wL2J6QT+VlS2G9nj4JhFjRiy2CF6KFV2p0y673SokHVHJOuHdHtkw==
X-Received: by 2002:a05:6870:2885:b0:16e:a65:3b8e with SMTP id gy5-20020a056870288500b0016e0a653b8emr473342oab.9.1676223521592;
        Sun, 12 Feb 2023 09:38:41 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n40-20020a056870822800b0013bc95650c8sm4012885oae.54.2023.02.12.09.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 09:38:41 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <64f2ba37-d869-0160-1a89-d7f15d243d05@roeck-us.net>
Date:   Sun, 12 Feb 2023 09:38:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 4/4] mm, arch: add generic implementation of
 pfn_valid() for FLATMEM
Content-Language: en-US
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Matt Turner <mattst88@gmail.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Simek <monstr@monstr.eu>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rich Felker <dalias@libc.org>,
        Richard Weinberger <richard@nod.at>,
        Russell King <linux@armlinux.org.uk>,
        Stafford Horne <shorne@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vineet Gupta <vgupta@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-mm@kvack.org,
        linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
        openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
        x86@kernel.org, Huacai Chen <chenhuacai@loongson.cn>
References: <20230129124235.209895-1-rppt@kernel.org>
 <20230129124235.209895-5-rppt@kernel.org>
 <20230212161320.GA3784076@roeck-us.net> <Y+kTHsaq8FAG72CX@kernel.org>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <Y+kTHsaq8FAG72CX@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 2/12/23 08:26, Mike Rapoport wrote:
> Hi Guenter,
> 
> On Sun, Feb 12, 2023 at 08:13:20AM -0800, Guenter Roeck wrote:
>> On Sun, Jan 29, 2023 at 02:42:35PM +0200, Mike Rapoport wrote:
>>> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>>>
>>> Every architecture that supports FLATMEM memory model defines its own
>>> version of pfn_valid() that essentially compares a pfn to max_mapnr.
>>>
>>> Use mips/powerpc version implemented as static inline as a generic
>>> implementation of pfn_valid() and drop its per-architecture definitions.
>>>
>>
>> With this patch in the tree, sh4 and sh4eb qemu emulations no longer boot.
>> Reverting this patch fixes the problem.
>   
> Can you please test with only partial revert for arch/sh?
> 

Sure, that works as well.

Guenter

