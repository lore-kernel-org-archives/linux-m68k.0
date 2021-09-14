Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A156EC433EF
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Sep 2021 02:43:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86548610F9
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Sep 2021 02:43:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234374AbhINCpD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Sep 2021 22:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237565AbhINCpA (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 13 Sep 2021 22:45:00 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B0ADC061574
        for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Sep 2021 19:43:43 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so993232pjr.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 13 Sep 2021 19:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=P3HS+opHVeUDOpS7ECfeBu57LC5rzLw41hq5HfKvEBs=;
        b=pxxD3kh1LwgXGIo4kPLIkg1bS3H2FdXs31zmstZ3PUoxv3p1nQnstxcgOVo9CfwE1F
         E8gzoFKdigXnI8/k7O1x5oIYrTRpxs5BsN8ERpwkvCUyo7EQT1/J2Kz5Akhi40PxZvJt
         M1S69+00h3JvF+z5a+2cTlPj5UMEg9zIN1pfJ0H3lVBzvjujTCDCSvQRYALBdYMc0VT+
         7fkNB4ONOF8s7Xf1cCfc3oWHqPpgWOwpxCblYltQCc9RY3yrFJz+nUMeO3qDlscax5NZ
         mhlcf/k+aA9dQujTIueTBoF6PkUckqQ6D3b90E9sF4RGZct/hQNzSkWKrv4XT28rGvjs
         h3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=P3HS+opHVeUDOpS7ECfeBu57LC5rzLw41hq5HfKvEBs=;
        b=2IIOkROZOgVaR6CimijX8d0qp9gJ98Ymj2BKtOm95WTnGmrrHzF3growdTsc1p8Kk4
         7J7vXOin2jKwKfGUdlzLxKTax7T6MqYggXz1FVaZ05DHZlwaKxis3tMZCS1ewnEw6d0g
         2hR19TdlBF5s2MBjTWZuNGlZWBA7niXE3fbtmJ7aeS/MHPUUAdnE0gESbsb1iZnSWFzj
         PJfdy641wTFJNc+GXGY6hom3j7wxVvXFFqecvd/SSyOXOBjmw8Z0jLQ01eCfR1Ps+jiK
         NDzpbhBjCjFNbJVWvHFoEr+jR0TA0l1saJUBjKVwTXQHkxCY8KFzRFvYesEB6d/Veo5c
         0kIA==
X-Gm-Message-State: AOAM5321BdD1nVI32w9KASR184rbRsE7gU5hskzZXx8X+GXf9v/YngjK
        GCAgBKwkwHBio61a/V+fyYKW/nKqH38=
X-Google-Smtp-Source: ABdhPJwcjrN1ftm2qT++JG43MHCOvvA6TO8S8jeAPl7wKqFSPxLiOWr30nYBdgBL2diQ7LqslEia6g==
X-Received: by 2002:a17:90a:718c:: with SMTP id i12mr3023809pjk.182.1631587422548;
        Mon, 13 Sep 2021 19:43:42 -0700 (PDT)
Received: from Schmitz-MacBook-Pro.local (222-155-4-20-adsl.sparkbb.co.nz. [222.155.4.20])
        by smtp.googlemail.com with ESMTPSA id l75sm9242558pga.19.2021.09.13.19.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 19:43:41 -0700 (PDT)
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Andreas Schwab <schwab@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
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
From:   Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: RFC: remove set_fs for m68k
Message-ID: <d08e51a8-c5c4-c8be-e8d4-2bfc13b4a48b@gmail.com>
Date:   Tue, 14 Sep 2021 14:43:32 +1200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgEFfm61UP3tfkVthVoivsyo0m4c-HrKo7SP8fwZTn4tA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Linus,

having run stress tests on a kernel with Al Viro's signal handling fixes
applied for the past two days with no further errors, I am now quite
confident that the format error I saw in resume_userspace() and a bus
error in setup_frame() were caused by multiple pending signals, and the
resulting stack mangling that Al's patches fix.

I'll try to conclusively prove that for the setup_frame() case, but for
the sake of bringing Christoph's set_fs patches for m68k to a close,
I'll go with this assumption.

Al: I'm still poring over some of the subtleties of your patch series,
but you can add my Tested-by at least (030 only).

Cheers,

=C2=A0=C2=A0=C2=A0 Michael


Am 24.08.21 um 05:59 schrieb Linus Torvalds:
> On Sun, Aug 22, 2021 at 12:34 PM Michael Schmitz <schmitzmic@gmail.com>=
 wrote:
>> Got this overnight:
>>
>>> [536154.200000] *** FORMAT ERROR ***   FORMAT=3D0
>>> [536154.210000] Current process id is 4656
>>> [536154.230000] BAD KERNEL TRAP: 00000000
>>> [536154.240000] Modules linked in: atari_scsi ne 8390p [last unloaded=
: atari_scsi]
>>> [536154.260000] PC: [<00002a8c>] resume_userspace+0x14/0x16
>>> [536154.270000] SR: 2208  SP: 977bd1be  a2: 8009b5e8
>>> [536154.290000] d0: 8009b5e8    d1: cfcfcfcf    d2: 00000000    d3: f=
fffffff
>>> [536154.300000] d4: 00000000    d5: 00000000    a0: 8008a108    a1: 8=
009b7df
>>> [536154.320000] Process savelog (pid: 4656, task=3De49aa246)
>>> [536154.330000] Frame format=3D0
>>> [536154.340000] Stack from 00cc5fa4:
>>> [536154.340000]         02088004 3666b008 1c0eb209 007eb5e8 8006a2d0 =
efaec378 8004366c 61ff61ff
>>> [536154.340000]         8006a2d4 8006a2d2 00000000 030dfffb 0044fffa =
0e000000 fffa1a00 fffa1c00
>>> [536154.340000]         fffa1e00 fffb0e40 fffb0e80 00049b66 00000040 =
005f5800 00000001
> Strange. If I read that stack frame correctly, that seems to be an
> exception frame of type 0xb ("Long Bus Cycle").
>
> Plus the frame content is then apparently corrupted enough that the
> rte causes an exception on trying to restore it.
>
> None of which makes sense or seems to have much at all to do with any
> of these patches. Yes, we mess with the exception frame, but only for
> fork(), and while "copy_process()" doesn't set any frame type, I see
> only two cases:
>
>  - the kernel thread one does a "memset()" to clear it, so you should
> end up with frame type 0
>
>  - the user thread case copies the original frame format (which I
> think is just the system call frame from the TRAP instruction).
>
> Are you 100% sure your hardware is stable?
>
>                   Linus

