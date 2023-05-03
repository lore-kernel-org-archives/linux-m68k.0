Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E340DC77B78
	for <linux-m68k@archiver.kernel.org>; Wed,  3 May 2023 05:50:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbjECFur (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 3 May 2023 01:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjECFup (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 3 May 2023 01:50:45 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A312D4E
        for <linux-m68k@lists.linux-m68k.org>; Tue,  2 May 2023 22:50:43 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-24e16918323so1874000a91.2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 02 May 2023 22:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683093043; x=1685685043;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGie2Wifm00jcuC6Ky5HNYtTJCCjnvKHoolJoUUcM/g=;
        b=SxDNqedDcisP8jGkkP17fe4bobfkHiMhGM6/Buxk1eg2WiL6LAnwOXU0Z+U8mPAgHO
         BfQoghhiES129HVi4A2YDnWvqiqeIUrEL9BLWkJ6GOb6L2Hxq1UciuQS5xJUg0Yen5Zj
         f5EawP8GjmK/eDuPHEhowUr59A6/0gRM5p2nt6aYaLkpfdhJczFelS39wfdm0BTHF0dc
         Wim9oIPAMiDwYU2jScoC5XDK7iI1ScN89UirmA6SAYwmR+xD+IiE+mHcpUsmjdPU/x+z
         5Hg6buA+AM0z4VDiZArfJKhq/OA395I3yeB1uSZ8yERrslaNGMzpG6l9nTLOKStbqjxX
         xXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683093043; x=1685685043;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XGie2Wifm00jcuC6Ky5HNYtTJCCjnvKHoolJoUUcM/g=;
        b=FGGy40sLXX8D4bPk7aXpRnz3OW9h/CyWwgk/9fwsvqEgM4z2oKYLvnmRZA5yVK7Hw6
         B07ktSSNO+JRjoo8BlkQcX0BNKW6i4QXxziD52iQJfl7KBWfSLjyjWoUVfmZYY5+ZNix
         BL7HQd9zijWZU8JyFS9qwEiuEEItVHvJMcA9cB5b87RIEw5mroMr4TCUyw3NoEFHX+oY
         Ii6AjKELcT9KRG+0Oo1TKvdow4gsDUsjeFF2uC2OUBxaqcDhYR6ACDQJtplDcAJp5Db1
         Bxonj+PthcWM2MkTbhxhVttsOxtQPyBRa83lcYvklP8OTfH1Ckb4ycObH7RREBKhqc2X
         RU0w==
X-Gm-Message-State: AC+VfDz3cAHC3eur8e+B11dj5NAHlSSpEMtf+dtqWY9K0nQVH/us5bJ3
        u8hwEMO71Fg+PvCDTh9TC7clq9vl9ww=
X-Google-Smtp-Source: ACHHUZ632FTm6xJskwplPp1IWWl/PRZy+DlKnzZULtZIYS3Kqp0AmgCs+4qkVxae/EeZnyXxpnREXA==
X-Received: by 2002:a17:90a:c302:b0:24b:af7d:201d with SMTP id g2-20020a17090ac30200b0024baf7d201dmr19573475pjt.24.1683093043029;
        Tue, 02 May 2023 22:50:43 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id fy17-20020a17090b021100b0024e208a6464sm480608pjb.15.2023.05.02.22.50.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 May 2023 22:50:42 -0700 (PDT)
Subject: Re: [PATCH RFC 2/2] m68k: Make allowance for signal delivery
 following an address error
To:     Finn Thain <fthain@linux-m68k.org>
References: <cover.1683010227.git.fthain@linux-m68k.org>
 <f94a7736c10bc4f256bef5b826419faacb297f4a.1683010227.git.fthain@linux-m68k.org>
 <f4280683-9044-3858-3262-16080e584c96@gmail.com>
 <421fd88f-1c91-8fb9-98a8-6ac3974bd9c9@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Andreas Schwab <schwab@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <268271f3-7d2c-bb2f-f0e4-b26bc80ac015@gmail.com>
Date:   Wed, 3 May 2023 17:50:36 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <421fd88f-1c91-8fb9-98a8-6ac3974bd9c9@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 03.05.2023 um 16:11 schrieb Finn Thain:
> On Wed, 3 May 2023, Michael Schmitz wrote:
>
>> So the case that you are concerned about here is where the instruction
>> in execution is e.g. a moveml using USP as one of the data addresses
>> (making USP unreliable) and the instruction faulting is one of the next
>> ones being decoded. [...]
>
> Right. The instruction in execution may be an incomplete stack operation
> like MOVEM. If the signal handler fixes up the address error, that stack
> operation might be resumed after sys_sigreturn(), like the bus error case.
> The kernel allows the exception frame to fixed up by the user program.

Right - we don't have anything at present that would use signal handlers 
in this way (that we'd know of) but it's a legitimate use.

>> (You mentioned cpBcc or cpDBcc instructions in another mail - where did
>> you find that? It's not mentioned in my copy of the 030 UM...)
>>
>
> It's in the 3rd edition (1990), section 10.5.2.8.
> https://www.nxp.com/files-static/32bit/doc/ref_manual/MC68030UM-P1.pdf
> https://www.nxp.com/files-static/32bit/doc/ref_manual/MC68030UM-P2.pdf

Thanks - I have those but hadn't looked at that section yet.

Linux requires a FPU (real or emulated) and FPU conditional instructions 
might hit this bug (even though any code compiled by our binutils should 
avoid it). Better fix this now that we're poking around in this area of 
the kernel.

>> I'm not trying to say this all isn't necessary for address errors. I'm
>> just trying to understand why it is.
>>
>
> I haven't yet tried to write code to demonstrate the theoretical address
> error issue but I can attempt that if need be. However, such code would be
> moot if this patch is going to be required anyway, just to fix the bus
> error case...

No, seeing the coprocessor conditional branch case we want this patch 
even if we decide to handle data faults differently.

That is, unless Andreas can come up with a reason why calculated branch 
target adresses cannot be used with these coprocessor branch instructions?

Cheers,

	Michael

