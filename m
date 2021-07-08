Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2269C07E96
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 04:33:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADCCD61CB0
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 04:33:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbhGHEfz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 8 Jul 2021 00:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhGHEfz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 8 Jul 2021 00:35:55 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B93DC061574
        for <linux-m68k@lists.linux-m68k.org>; Wed,  7 Jul 2021 21:33:14 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id a14so2280730pls.4
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Jul 2021 21:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=BnvKKw4gJWDcAHiv3yC9MLAtPVOLfnMx4yn3yzqY0RE=;
        b=dmvidQ2DxJUDFkx1ox+8fq+EvtVH7GzGIVDF5ttLgbXm2nxNKJXi5p+gsII5RIMRBT
         1zXNXC9Dy44ADFZhhzv3aaVANR5Ed8fSFF/8A+lFQnGz4yvAG/DeFRLSEWfqn2+SfHq4
         kXpIfmosPRf2rx3Q4j7OjmfqKiFTWKhDjHTl0/RLh/WM+csC0Bufsn29qi422eNMnOpd
         ciFzjVXwJM/N3hNPEzL/wi/PD0A7gC+Rrs8E4MC6xtVwdgvtf0oyAJ4vfSpOqxqX6mZt
         8peSkeovoYQpwxX73W7ybo25HF+dnaRnCikg0X57gupJ8+ipZGO1RDMk92zcszgVkTrM
         w0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=BnvKKw4gJWDcAHiv3yC9MLAtPVOLfnMx4yn3yzqY0RE=;
        b=dQ0a0bduInr4roBALCyS4YZtWsQklQnGVF+Ur7llKX/PWgnh4/niJSNN8koWOzHGjA
         ST+dues+1p46sFLYqPCt8A0JRNERyEuEQnQjek78yiFDx1/Xs2UnLJsz3h44M5+XH0EK
         CVD6NUoYjR7S26n9DC2KGo0xM3lBdZ8XF6KkQziOIXRj8AcVYQK5+9OfrB4puSwDCzxX
         aVPEmaVSA8o3nzIP3GdVK/8VOgyri9G9qlImCiXPe+MBQPfVsi5f56hwip3ApOi+8bEi
         1HAqm2UY1ACKf9CINRYdV2dCRHF2UlLnEESh4qyxCJ+9DX98k6c6gmXeUjmmx7XZ/GrJ
         k2PA==
X-Gm-Message-State: AOAM5333Sf/4dBcLcH0kyAXzrl5T05lgU7rVQEhw1+Mrqa9hdNbMShFT
        yV0eayw6V3cCBPEFeHdkz2IU4zknfzM=
X-Google-Smtp-Source: ABdhPJw8XypY0dZ43VOFCYHF6w6QLlQhuO3xXyNbQl8KwS+excQ4vo56UHCo/xwr3JPACI/Qgdf8PQ==
X-Received: by 2002:a17:902:a582:b029:129:c8a4:1e48 with SMTP id az2-20020a170902a582b0290129c8a41e48mr4436994plb.19.1625718793280;
        Wed, 07 Jul 2021 21:33:13 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id p3sm8288931pjt.0.2021.07.07.21.33.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Jul 2021 21:33:12 -0700 (PDT)
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
To:     Christoph Hellwig <hch@lst.de>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <1625708899-29013-1-git-send-email-schmitzmic@gmail.com>
 <CAHk-=whRp-m0DFPF27=OZzMq4b=16J+6bQEG_jeDM=osuuZF2w@mail.gmail.com>
 <CAHk-=wgCp0X4Q=GkDF1j1=_XTq4gA_ZsKUXfkPBeeTJcoS6gwQ@mail.gmail.com>
 <20210708043145.GB17672@lst.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <38991687-7b33-994b-b7d3-22400872a45a@gmail.com>
Date:   Thu, 8 Jul 2021 16:33:08 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210708043145.GB17672@lst.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

Am 08.07.2021 um 16:31 schrieb Christoph Hellwig:
> On Wed, Jul 07, 2021 at 08:01:33PM -0700, Linus Torvalds wrote:
>> The '#' turns the argument into a string, but it was already
>> _supposed_ to be a string. But no, the problem is that it turns the
>> macro name MOVES into the _string_ "MOVES".
>>
>> Which happens to compile just fine, because "moves" is a real
>> instruction. But it's actually _meant_ to be a macro that expands to
>> either the string "moves" or "move".
>>
>> So what happens is that at least in Christoph's version, I think the
>> code _always_ uses "MOVES", even in configurations where the macro
>> MOVES should have just become "move".
>>
>> So it all builds fine, looks fine to the assembler, but it uses the
>> wrong instruction.
>>
>> Macro expansion with the '#' character and other macros used as
>> arguments is something people need to be very careful with.  It's why
>> we have a whole header file for just the "stringify" operation, see
>> <linux/stringify.h>
>>
>> But in this case, it shouldn't have used '#' at all, since the
>> argument was already a string, and never needed to be turned into a
>> string by the pre-processor.
>
> Yes, that problem exists, but just removing the # causes "inst" to go
> into the cpp output.  Let me brush up my cpp-foo.

Putting quotes around 'inst' makes it compile for me.

Cheers,

	Michael


