Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF12E936EC
	for <linux-m68k@archiver.kernel.org>; Thu,  5 Oct 2023 00:49:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234566AbjJEAta (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 4 Oct 2023 20:49:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233179AbjJEAt3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 4 Oct 2023 20:49:29 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ECCCAD
        for <linux-m68k@lists.linux-m68k.org>; Wed,  4 Oct 2023 17:49:25 -0700 (PDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
        by sin.source.kernel.org (Postfix) with ESMTP id E0BC9CE1FDA;
        Thu,  5 Oct 2023 00:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A40F5C433C8;
        Thu,  5 Oct 2023 00:49:21 +0000 (UTC)
Message-ID: <f9dc98e1-83b0-4345-b4e8-f833f0e73e58@linux-m68k.org>
Date:   Thu, 5 Oct 2023 10:49:19 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: use kernel's generic libgcc functions
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
References: <20230913071350.1939818-1-gerg@kernel.org>
 <CAMuHMdXT6+UfUY_1GKefQ7-9a+a1QcX7spBJk6+qY6yUXyNQkA@mail.gmail.com>
Content-Language: en-US
From:   Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <CAMuHMdXT6+UfUY_1GKefQ7-9a+a1QcX7spBJk6+qY6yUXyNQkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 5/10/23 00:52, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Wed, Sep 13, 2023 at 9:14 AM Greg Ungerer <gerg@kernel.org> wrote:
>> From: Greg Ungerer <gerg@linux-m68k.org>
>>
>> The arch/m68k/lib versions of the libgcc functions: ashldi3, ashrdi3
>> and lshrdi3 were taken directly from an older version of gcc.
>> We can use the kernel's own generic lib versions of these - they are
>> virtually identical. Switch to those and remove the m68k local ones.
>>
>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> 
> Thanks for your patch!
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> i.e. will queue in the m68k for-v6.7 branch.
> 
>> --- a/arch/m68k/Kconfig
>> +++ b/arch/m68k/Kconfig
>> @@ -19,6 +19,9 @@ config M68K
>>          select GENERIC_CPU_DEVICES
>>          select GENERIC_IOMAP
>>          select GENERIC_IRQ_SHOW
>> +       select GENERIC_LIB_ASHLDI3
>> +       select GENERIC_LIB_ASHRDI3
>> +       select GENERIC_LIB_LSHRDI3
>>          select HAS_IOPORT if PCI || ISA || ATARI_ROM_ISA
>>          select HAVE_ARCH_SECCOMP
>>          select HAVE_ARCH_SECCOMP_FILTER
> 
> I guess we can select GENERIC_LIB_MULDI3 if CPU_HAS_NO_MULDIV64
> and clean up arch/m68k/lib/muldi3.c, too?

Yes, that is true.

I was hoping we might be able to do something a little more clever.
The common muldi3.c is almost identical except our local macro for
umul_ppmm(). But looking at the common lib/muldi3.c code it has been
setup to handle an arch local definition of that. I didn't spend too much
time looking at it yet, not sure where we could put that for the whole
mechanism to work though.

Regards
Greg

