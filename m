Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D066CC47082
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Jun 2021 03:02:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF29D60240
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Jun 2021 03:02:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbhFHDEb (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 7 Jun 2021 23:04:31 -0400
Received: from mail-pf1-f181.google.com ([209.85.210.181]:41683 "EHLO
        mail-pf1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbhFHDEa (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 7 Jun 2021 23:04:30 -0400
Received: by mail-pf1-f181.google.com with SMTP id x73so14610494pfc.8
        for <linux-m68k@lists.linux-m68k.org>; Mon, 07 Jun 2021 20:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=4zyzSgjehYpTMwvkMAdkEk8UOEiuBvRn+Lbe9JMcg3U=;
        b=KmwLevrVyZBLk+TmP9kkEbneRprDD+cTDc0mI24ZPzZmmSOvZrTtua9iRD/F86olxj
         XQxcHOeBpFNwsT9mafmBM5kWyJ5XrWUflmotaFtnE7CrU+ZNcSTaL+MwfZ/XEhPwkqoh
         tFMfhaAChKjg9eh1pl1MkH1RhJtk5qjpF56DA3DJsM1Ch/LcuBuocp0puIiG3kwKqHUm
         UWfOYdYCU/z4HKw6sRU32qcaLzeoAFtB2Dj9sJGsoJuDoRumahYiN8zrIbcjhQxmxO4R
         T6cDnViulSmU4/FnHqs+kV1rZL5UoNK/Q/BAVrKvzVrc0muqKf+yHnUpydwdsMJPp0CX
         jzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=4zyzSgjehYpTMwvkMAdkEk8UOEiuBvRn+Lbe9JMcg3U=;
        b=tpUWM9I7E+N1u09vsocLnWiWpwg6CjcEm8r+UrkhN402nnZZWuz+bsXre3oeR9GmgW
         kQCyH0GVD3G29qbdHC/aVGNYcPi+YXFSjzM0z57HrVFUajsDP6+8WAt2DQtOMxsvz/l8
         gx7EvXIH8UD8KkV7c+SHch9C8esBABTooJsBSx4/p7B8I68EwOIs3bb3Ym3VYNWLwz2+
         RfSSlQLeGX9wsS6U9l5OaJ4Ka41pYLV6m9UK+6hH2NB3k9915BftaFNWWbf/P6fbJYCD
         RNmY2Mdbhy72NDpTISwlft67rPWXNDjcDSEdp/sjHbOtIHbSlGoplnL2dERA2yVqR6O3
         5FTw==
X-Gm-Message-State: AOAM532AA3zm0WeI0atjbvngIdVMdjEuxxICQdkcguhZWqGOrOfX0Op4
        oVAPsMsWMEHh/WzdB5yUtmo=
X-Google-Smtp-Source: ABdhPJyvDlTti6C1rnpagcKLHVsTYa+kmn9kiphYRNiQIyDb3KlqCPzQXCo032VmJ6SiL+ifXjSD1w==
X-Received: by 2002:a63:9515:: with SMTP id p21mr18889215pgd.333.1623121297946;
        Mon, 07 Jun 2021 20:01:37 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id s22sm1671639pfg.197.2021.06.07.20.01.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 20:01:37 -0700 (PDT)
Subject: Re: [PATCH] m68k/q40: Replace q40ide with pata_falcon and falconide
To:     Finn Thain <fthain@linux-m68k.org>
References: <352239036981177050c296ca3deb84a102d9faa2.1622970906.git.fthain@linux-m68k.org>
 <e250cffb-9edd-1b84-3826-58079758b35a@gmail.com>
 <4a32d59-ebb-9dc-fec7-ad172547d9a3@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Richard Zidlicky <rz@linux-m68k.org>,
        Jens Axboe <axboe@kernel.dk>,
        "David S. Miller" <davem@davemloft.net>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        linux-ide@vger.kernel.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <3b789204-a959-a266-9fc3-1b2be09c981a@gmail.com>
Date:   Tue, 8 Jun 2021 15:01:30 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <4a32d59-ebb-9dc-fec7-ad172547d9a3@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,



Am 07.06.2021 um 14:07 schrieb Finn Thain:
> On Mon, 7 Jun 2021, Michael Schmitz wrote:
>
>> Hi Finn,
>>
>> are there any substantial changes from what I'd tested before?
>
> The request_region() stuff is new, and I reworked the host->get_lock and
> host->release_lock changes. So you may want to review it again.

Done that - the weirdness around request_irq() that I remembered is not 
actually an issue, that's taken care of by setting host->get_lock. And 
your patch doesn't change anything for Falcon.

Tested on my Falcon - I can still use both IDE and SCSI (no stress test 
done but I doubt it would turn out much different).

Not setting host->get_lock on Q40 will correctly request the IRQ for IDE 
there, the same lowlevel IO routines can be shared by both, and there 
wasn't ever much more that these old drivers did.

Please add my Reviewed-by as well as Tested-by.

Cheers,

	Michael


>> Your patch conflicts with (I think) the Mac IDE patches now in Geert's
>> tree, and I'd rather avoid hand-patching the lot if at all possible:
>>
>> m68k_q40_Replace_q40ide_with_pata_falcon_and_falconide
>> Applying: m68k/q40: Replace q40ide with pata_falcon and falconide
>> error: patch failed: arch/m68k/configs/multi_defconfig:351
>> error: arch/m68k/configs/multi_defconfig: patch does not apply
>> error: patch failed: drivers/ide/Kconfig:731
>> error: drivers/ide/Kconfig: patch does not apply
>> error: patch failed: drivers/ide/Makefile:29
>> error: drivers/ide/Makefile: patch does not apply
>>
>
> I should have sent these as a two-part series. Sorry about that.
> You'll need to apply this patch first:
> https://lore.kernel.org/linux-ide/3de9a93d-2f7-a650-1fa-c2129a4a765b@nippy.intranet/T/
>
>> What's your baseline for this patch?
>>
>
> I've used v5.12 and v5.13-rc5, but mostly I develop on the mac68k branch
> in my github repository.
>
>> (In the alternative: just add my Tested-by if nothing changed aside from the
>> IO region reservation)
>>
>
> I have tested these patches in Aranym (including a multi-platform
> atari/q40 build which required your ISA fix) but I don't have any way to
> test the q40-only code.
>
