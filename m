Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A6CC07E96
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 05:48:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 031A561C99
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 05:48:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbhGHFvd (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 8 Jul 2021 01:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhGHFvd (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 8 Jul 2021 01:51:33 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33DA8C061574
        for <linux-m68k@lists.linux-m68k.org>; Wed,  7 Jul 2021 22:48:52 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id f20so4484824pfa.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Jul 2021 22:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=Lsph+p7wbvVzpqJsvKjOyQSyZJwvPjGkeeGOuzxf4R0=;
        b=XNCx9lo8BuilyTXv2JHWNnDUWoHxWQuWGO/Gxw4pNW+5lOnV2sGiiumvtUTVKC47us
         0KSP7WXMA+joDj0ZsbMMbXpqnNixn9qBsvbmy4nADJcyqOqF2RoEti5KJqJsGTBL72rp
         dN707SxtcRcvU+cGIsf5UIk6Mx4+YZVGWwzV+/rUETRKhfnnac79iX5bxeiv+Md7kzgK
         GyHyc/FEksBOe6FXPTgNSvCsZpVog8lyMNk064rtUWxWoAJSeLh1mA5J2iYsyiZNVIot
         OMqS2I4lpaEQXEduuvqK08f+NOMnxoW5tQS1PhWCkb+EVQsyHVrE2UwTl8wkoTF58g22
         smyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=Lsph+p7wbvVzpqJsvKjOyQSyZJwvPjGkeeGOuzxf4R0=;
        b=AMlPi+mDurOF4bcL1DjejxEN80wxbfct1wdTTX1m0d6eTAThRYOR0Qwuzu0BHkM0tZ
         Wyq7Zra+CJLuV0JynPpJKQn5XHJRt2G62ufJ3fbuX39i24YESF0ncQADAaNGlbPzgU+g
         6gUr1vxokz5X5sN/1WJpgWFQR+FsExCQ+34o/UzMApUMC0pPFPrJ0CZ7ag/pZTmNTPcQ
         wtefqHe4KLS+tVLM1qooBo66/a0fWgde+j79vMCO5kxMnXms96Pi/kwlCLX+/rcA1Phi
         aB6XUEzoZY1lY3Zis9te0LhFXme7o2/+xnxkXxwimOEPzKZicRXogM/wirGuV643e/oI
         HAUQ==
X-Gm-Message-State: AOAM532mUY98DX5F1dJXmcv7MFD6x1pWAZXx1+vnElPIFxdZ/y1nW9p1
        Qo6oXB3KxR5sWOd2ruh/M327sDnRI5o=
X-Google-Smtp-Source: ABdhPJw0rvdYnW9AcHR3aqJmATDJXL4fcii4SD/DiO7qTLtU8O17BmXXBhH/t0g/RdNjoMgl8k32kw==
X-Received: by 2002:a63:4f06:: with SMTP id d6mr21261928pgb.304.1625723331322;
        Wed, 07 Jul 2021 22:48:51 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id gl17sm8215914pjb.13.2021.07.07.22.48.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Jul 2021 22:48:50 -0700 (PDT)
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
To:     Christoph Hellwig <hch@lst.de>
References: <1625708899-29013-1-git-send-email-schmitzmic@gmail.com>
 <CAHk-=whRp-m0DFPF27=OZzMq4b=16J+6bQEG_jeDM=osuuZF2w@mail.gmail.com>
 <CAHk-=wgCp0X4Q=GkDF1j1=_XTq4gA_ZsKUXfkPBeeTJcoS6gwQ@mail.gmail.com>
 <20210708043145.GB17672@lst.de>
 <38991687-7b33-994b-b7d3-22400872a45a@gmail.com>
 <20210708045804.GA18249@lst.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <147ffcbd-f946-bb6c-b7bc-35c0672572ce@gmail.com>
Date:   Thu, 8 Jul 2021 17:48:46 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210708045804.GA18249@lst.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Christoph,

Am 08.07.2021 um 16:58 schrieb Christoph Hellwig:
> On Thu, Jul 08, 2021 at 04:33:08PM +1200, Michael Schmitz wrote:
>>> Yes, that problem exists, but just removing the # causes "inst" to go
>>> into the cpp output.  Let me brush up my cpp-foo.
>>
>> Putting quotes around 'inst' makes it compile for me.
>
> Do you just want to take the series over from here?  I think you are
> about 15 times more qualified than me anyway :)

Not in a million years :-) A brief look at my patch review history on 
linux-m68k will disabuse you of that notion. I routinely hit v6 and 
higher ... I'm a simple hobbyist, and a little out of my depth here.

Cheers,

	Michael

