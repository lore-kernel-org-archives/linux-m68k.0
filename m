Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56212C4338F
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Aug 2021 21:31:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30A946103C
	for <linux-m68k@archiver.kernel.org>; Mon, 23 Aug 2021 21:31:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232894AbhHWVcj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 23 Aug 2021 17:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232748AbhHWVcj (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 23 Aug 2021 17:32:39 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B4A4C061575
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Aug 2021 14:31:56 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id e1so4018210plt.11
        for <linux-m68k@lists.linux-m68k.org>; Mon, 23 Aug 2021 14:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=4kFALGdpxhUuD7PLVRJhLkcmckpIQ7Z2DcLqHG/oCs0=;
        b=ZKcvN3gegMg2zaf4CXJo12cz97imli1X33vgd2CM2PvCtteEwwrE9KSe0KwkwsqfPi
         SsQIr9pv7mxh+3bepRARmNiXJxrNaNhDZW9mqhYmwX2ThtyrxXMaLCveXM7e1/RtaX/j
         8zUwjueZfWPSU+Z+uoAK8Hud4xLxiUJ3UL93/7oF56riwgut12iqRHXgYusVAMFaAJAj
         VgxfARVjiM2PMiSVGMwoqBCKiPzu7BLPjpxiSrINyBX0KDWiV17mMSZkdsZISOgkcH0D
         kMgZNHG81F5MHrlHk4KhTj2A/OotMIMcON6EckBSsqrqVB+oI9ShJ/ink7vhpsV/TnS5
         niRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=4kFALGdpxhUuD7PLVRJhLkcmckpIQ7Z2DcLqHG/oCs0=;
        b=FOkYPSJds11ElHBKdpTA1s+mdVaXlTS/vm86sdE6+dTqP6CCbXnZ0qFwPJI8BsQL0L
         y6xy7McfVDfoyDuaVTDwudMCIFMUc6vELwUeOqaIWfsrFN0zasiPW8KSzMvGJSB8Rmdu
         1G1uH7rkwP19ffaxKUtbSll9zRGORiB4vlhwBEy7SheLvY7nvw5HThZDK2K/Hrde8xqC
         vA2v/b6xyt8jsKw+xZu6I0ACl4SWTRoVoz6ymBR/yb2uWBGXoYfMcVJzLl4lXlRjz8nC
         XHl4GCDHhs2lthZeI9tP/k+Fg5T9AyUUaEGb8g5Ts47GDFDrKZimAZbC7zfDjfUbY2dT
         wj2Q==
X-Gm-Message-State: AOAM533uiZPOY1+ZdXKXmOiomRHk7oHCFsiR750SgktS7Xd2pq1Xgyed
        zlAqdgAtirjYLeB7lZ/oa9Ds9bY8CVg=
X-Google-Smtp-Source: ABdhPJymGUfw4jJ1CpHVflyWIK/aZEi5NITG+QOjtKOjEGkvHnX7MhvoqkfDrJfTedlMTuw819/4Sw==
X-Received: by 2002:a17:902:6b84:b029:ee:f966:1911 with SMTP id p4-20020a1709026b84b02900eef9661911mr30481066plk.69.1629754315325;
        Mon, 23 Aug 2021 14:31:55 -0700 (PDT)
Received: from [10.1.1.26] (222-155-6-212-adsl.sparkbb.co.nz. [222.155.6.212])
        by smtp.gmail.com with ESMTPSA id e12sm17021759pfv.146.2021.08.23.14.31.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Aug 2021 14:31:54 -0700 (PDT)
Subject: Re: RFC: remove set_fs for m68k
To:     Linus Torvalds <torvalds@linux-foundation.org>
References: <65a95ae0-4734-68ce-ef71-7491b5534718@gmail.com>
 <8f470389-fe8a-90b0-19a5-68f85526b30e@gmail.com>
 <20210721170529.GA14550@lst.de>
 <a70d80f4-6034-e20b-26c5-76609c52c92a@gmail.com>
 <20210723051126.GA31274@lst.de>
 <e9fb28d4-405a-5cc6-b071-707a2edbce92@gmail.com>
 <8884e940-22e8-72a5-e9ec-f9b2628b6ef4@gmail.com>
 <251aa093-047a-b37c-4e88-d543c6fa8bc6@gmail.com>
 <20210815074236.GA23777@lst.de>
 <63c35a20-3eec-1825-fa18-5df28f5b6eaa@gmail.com>
 <20210816065851.GA26665@lst.de>
 <e705cfe1-4386-d205-89c6-73e13335c792@gmail.com>
 <7517d306-21ad-daa1-a2fb-b273211cb588@gmail.com>
 <CAHk-=wgEFfm61UP3tfkVthVoivsyo0m4c-HrKo7SP8fwZTn4tA@mail.gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <b211dea5-ec59-21db-4235-387d7983905c@gmail.com>
Date:   Tue, 24 Aug 2021 09:31:12 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgEFfm61UP3tfkVthVoivsyo0m4c-HrKo7SP8fwZTn4tA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Linus,


On 24/08/21 05:59, Linus Torvalds wrote:
> On Sun, Aug 22, 2021 at 12:34 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Got this overnight:
>>
>>> [536154.200000] *** FORMAT ERROR ***   FORMAT=0
>>> [536154.210000] Current process id is 4656
>>> [536154.230000] BAD KERNEL TRAP: 00000000
>>> [536154.240000] Modules linked in: atari_scsi ne 8390p [last unloaded: atari_scsi]
>>> [536154.260000] PC: [<00002a8c>] resume_userspace+0x14/0x16
>>> [536154.270000] SR: 2208  SP: 977bd1be  a2: 8009b5e8
>>> [536154.290000] d0: 8009b5e8    d1: cfcfcfcf    d2: 00000000    d3: ffffffff
>>> [536154.300000] d4: 00000000    d5: 00000000    a0: 8008a108    a1: 8009b7df
>>> [536154.320000] Process savelog (pid: 4656, task=e49aa246)
>>> [536154.330000] Frame format=0
>>> [536154.340000] Stack from 00cc5fa4:
>>> [536154.340000]         02088004 3666b008 1c0eb209 007eb5e8 8006a2d0 efaec378 8004366c 61ff61ff
>>> [536154.340000]         8006a2d4 8006a2d2 00000000 030dfffb 0044fffa 0e000000 fffa1a00 fffa1c00
>>> [536154.340000]         fffa1e00 fffb0e40 fffb0e80 00049b66 00000040 005f5800 00000001
> Strange. If I read that stack frame correctly, that seems to be an
> exception frame of type 0xb ("Long Bus Cycle").
Not sure where you get the 0xb from - the frame format I see is 0. 0xb 
would print additional information before the stack dump. Format 0 
doesn't appear in the stack frame struct definition in asm/traps.h.

I have no 68k processor manual at hand, so no idea whether frame format 
0 even exists.
>
> Plus the frame content is then apparently corrupted enough that the
> rte causes an exception on trying to restore it.
>
> None of which makes sense or seems to have much at all to do with any
> of these patches. Yes, we mess with the exception frame, but only for
> fork(), and while "copy_process()" doesn't set any frame type, I see
> only two cases:
>
>   - the kernel thread one does a "memset()" to clear it, so you should
> end up with frame type 0
I need to reread your description of how the kernel thread creation 
works - ret_from_kernel_thread() uses the same return path that 
resume_userspace() appears on, so we might end up here through that 
path. I've an idea how to test this, but that might be a little acacemic...
>
>   - the user thread case copies the original frame format (which I
> think is just the system call frame from the TRAP instruction).
>
> Are you 100% sure your hardware is stable?
I've always thought so. But going back through quite a few years of 
console log dumps, I now see that this format error has happened as 
early as 2017 (kernel 4.10.0-rc2). So it appears this is not a 
regression caused by Christoph's patches after all.

Sorry for causing all this confusion...

Cheers,

     Michael





