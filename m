Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67095C47080
	for <linux-m68k@archiver.kernel.org>; Tue,  1 Jun 2021 03:33:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 398D4611CA
	for <linux-m68k@archiver.kernel.org>; Tue,  1 Jun 2021 03:33:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbhFADes (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 31 May 2021 23:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232592AbhFADer (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 31 May 2021 23:34:47 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD074C061574
        for <linux-m68k@lists.linux-m68k.org>; Mon, 31 May 2021 20:33:06 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id e22so9656437pgv.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 31 May 2021 20:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=2I7gwiPNG3dO/hNb3HCWaBWdw5cnTwTu8xp12S8ELPw=;
        b=KvT51l0FzAYKMCO9gz6ILkE+MHmlZKbBt3AkzSG6UeevaRKx0Ctvrjj5uyLgSk9ejq
         lOpnFnHBoGGapBRfegDZYJSO6NTjlWz76RD+1lj7PlQpTc8xysjx8AbPyH/VdLckKhdL
         xftdVOcQnJdkfr9ja+zQKd94c5EzxG7JtndelRCnyhTCIOIeoLAmKo4MqDYAHcMJuG/U
         ruXMGcgMlMCl9XatyZZNUVBMA6Ddbk31l/vKGVwwO8yXcY4kUVsIk5kmZ+Oin18egDbf
         bFAoS1fYC3Idx4pCZyYsWic4niJGa+XmJ14+eCQOQtNj+kEizhFBQlDEswD0YD80k3Nw
         jtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=2I7gwiPNG3dO/hNb3HCWaBWdw5cnTwTu8xp12S8ELPw=;
        b=RLfWaLFQe52GVKiaZ/SQJRMmrDDfCSiN8lXtA9Kq27bsAo4V1itOqX13v0dyq0aHYW
         4Qn4umB0bixuwIr5kOJbIqKrt+mwgMns8Gy4+2lTp5Zqtl0hT8Zh0N9Vc05YmuhTgPDT
         67Fqsy8MJf+WkNDcqssdfwJPb0HGADkf43cR2sID5KrpTiFHQwW5ZMxBqEQQyrTJaOvd
         xtS36GuOTYUsoe+AIbhf8WDzzwPZdluG9ovjnQMomcKG7WJBOEVd5ZBLQrlvJq+HXmV9
         9F+Vs7FuNs9cOIERV+aANI3GIsxks65C9iklL5PyiwmrePfIr2i06Qq++4K7PtY9yCI0
         mYcg==
X-Gm-Message-State: AOAM531ju7+kLeMlXwZMUCWjieq2qKMcwK+8Zcwn2bcaKOtRkTzVJHnM
        ZbYuYyJxKdv9VWiYAERF8wl7g4BtZdk=
X-Google-Smtp-Source: ABdhPJzPsqmzRNJdoSviO43Z83f94QppThbv3sLgOPX6/ECZ/rrGSo+JoeIZjqHa5g0Ru0FgL5LiUg==
X-Received: by 2002:a63:5d19:: with SMTP id r25mr25105173pgb.317.1622518386067;
        Mon, 31 May 2021 20:33:06 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id r16sm2899711pfq.140.2021.05.31.20.33.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 May 2021 20:33:05 -0700 (PDT)
Subject: Re: [PATCH] m68k/mac: Replace macide driver with generic platform
 driver
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <793432cca963b632709c4d1312baa9874d73e1d8.1619341585.git.fthain@telegraphics.com.au>
 <ba908b1d-eab5-a4e5-0c0a-2c745287d121@physik.fu-berlin.de>
 <10a08764-c138-9fe5-966c-ce68349b9b6@nippy.intranet>
 <65f01f42-31d9-522a-e690-73d286405a01@gmail.com>
 <9650358f-a789-7dbd-4495-1d39ff321ded@nippy.intranet>
 <ada88dd6-f8d7-11dc-9a89-5c7e437a0981@gmail.com>
 <CAMuHMdUy_B_+pHZQpnDHYsee+gpXOs9ek_HaVxLjE2HVfGmLQg@mail.gmail.com>
Cc:     Finn Thain <fthain@fastmail.com.au>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Christoph Hellwig <hch@lst.de>,
        Joshua Thompson <funaho@jurai.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <e4635ac5-903a-a52e-51cf-b59295c76973@gmail.com>
Date:   Tue, 1 Jun 2021 15:32:59 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUy_B_+pHZQpnDHYsee+gpXOs9ek_HaVxLjE2HVfGmLQg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

Am 28.04.2021 um 18:53 schrieb Geert Uytterhoeven:
>>> I wonder whether q40 could re-use the pata_falcon driver . I suppose
>>
>> I'm pretty sure it could, but there is no reason why it would have to be
>> crippled in that way. Interrupts should work perfectly fine with IDE on
>> Q40.
>>
>> There is another reason why using the same module binary for both might
>> fail - the awkward address translation code in io_mm.h. Not certain at
>> all whether we can even have Q40 and Atari in the same kernel binary...
>
> That's supposed to work, else our multi_defconfig is broken.

Took a while to get back to this, but I believe unless this 
configuration sets CONFIG_ISA && !CONFIG_ATARI_ROM_ISA, Q40 ISA support 
will indeed be broken, due to

#define inb(port)       ((port) < 1024 ? isa_rom_inb(port) : in_8(port))

using incorrect address translation on Q40 (either that for the Atari 
ROM port, or none)? Not entirely sure what I had been smoking when 
writing that ...

Conversely, if that combination _is_ set, neither ROM port access nor 
IDE access on Atari will work (again due to incorrect address 
translation - indiscriminately applying the one required for the ROM 
port in that case, which is inappropriate for Atari IDE).

I'm currently considering a fix that does conditional address 
translation in isa_itb() and its buddys, and replaces in_8() by 
isa_inb() in the definition above (and equivalent changes elsewhere).

Can you see anything wrong with that, just off the bat?

Cheers,

	Michael

(CC: trimmed a little to cut down on spam to the general lists...)




