Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D20C4338F
	for <linux-m68k@archiver.kernel.org>; Tue, 24 Aug 2021 08:08:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7E8961262
	for <linux-m68k@archiver.kernel.org>; Tue, 24 Aug 2021 08:08:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234817AbhHXIJe (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 24 Aug 2021 04:09:34 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:47573 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233910AbhHXIJe (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 24 Aug 2021 04:09:34 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4Gv1w00KQ5z1qwy3;
        Tue, 24 Aug 2021 10:08:48 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4Gv1vz6hN0z1qrPD;
        Tue, 24 Aug 2021 10:08:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id WH0VIjsn3-mU; Tue, 24 Aug 2021 10:08:46 +0200 (CEST)
X-Auth-Info: v8toCXE3qtc9wyAbYZtoLYoxUA8oPbPmjsqpNi4VWOKSUworSbaTCk7uTuarJU+/
Received: from igel.home (ppp-46-244-170-245.dynamic.mnet-online.de [46.244.170.245])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Tue, 24 Aug 2021 10:08:46 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
        id 99FB32C0CFF; Tue, 24 Aug 2021 10:08:45 +0200 (CEST)
From:   Andreas Schwab <schwab@linux-m68k.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: RFC: remove set_fs for m68k
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
        <b211dea5-ec59-21db-4235-387d7983905c@gmail.com>
        <CAHk-=wib3p3rn+4YgS+dVVb=VciMGXJwGL-SiMY9QTytDMF08w@mail.gmail.com>
X-Yow:  It's the RINSE CYCLE!!  They've ALL IGNORED the RINSE CYCLE!!
Date:   Tue, 24 Aug 2021 10:08:45 +0200
In-Reply-To: <CAHk-=wib3p3rn+4YgS+dVVb=VciMGXJwGL-SiMY9QTytDMF08w@mail.gmail.com>
        (Linus Torvalds's message of "Mon, 23 Aug 2021 14:49:48 -0700")
Message-ID: <87zgt79sdu.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Aug 23 2021, Linus Torvalds wrote:

> On Mon, Aug 23, 2021 at 2:31 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>>
>> Hi Linus,
>>
>>
>> On 24/08/21 05:59, Linus Torvalds wrote:
>> > On Sun, Aug 22, 2021 at 12:34 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> >> Got this overnight:
>> >>
>> >>> [536154.200000] *** FORMAT ERROR ***   FORMAT=0
>> >>> [536154.210000] Current process id is 4656
>> >>> [536154.230000] BAD KERNEL TRAP: 00000000
>> >>> [536154.240000] Modules linked in: atari_scsi ne 8390p [last unloaded: atari_scsi]
>> >>> [536154.260000] PC: [<00002a8c>] resume_userspace+0x14/0x16
>> >>> [536154.270000] SR: 2208  SP: 977bd1be  a2: 8009b5e8
>> >>> [536154.290000] d0: 8009b5e8    d1: cfcfcfcf    d2: 00000000    d3: ffffffff
>> >>> [536154.300000] d4: 00000000    d5: 00000000    a0: 8008a108    a1: 8009b7df
>> >>> [536154.320000] Process savelog (pid: 4656, task=e49aa246)
>> >>> [536154.330000] Frame format=0
>> >>> [536154.340000] Stack from 00cc5fa4:
>> >>> [536154.340000]         02088004 3666b008 1c0eb209 007eb5e8 8006a2d0 efaec378 8004366c 61ff61ff
>> >>> [536154.340000]         8006a2d4 8006a2d2 00000000 030dfffb 0044fffa 0e000000 fffa1a00 fffa1c00
>> >>> [536154.340000]         fffa1e00 fffb0e40 fffb0e80 00049b66 00000040 005f5800 00000001
>> > Strange. If I read that stack frame correctly, that seems to be an
>> > exception frame of type 0xb ("Long Bus Cycle").
>>
>> Not sure where you get the 0xb from - the frame format I see is 0.
>
> The "Frame format=0" is, afaik, the format of when the error happens.
>
> But I'm looking at what the stack contents are at the time of the
> exception, to see what actually *triggered* the error.
>
> And if I read it right, the RTE that took the format error fault had this stack:
>
>         02088004 3666b008 1c0eb209 ..
>
> and that means that it tried to return with status register 0208
> (which looks correct: supervisor bit clear), to PC 80043666 (which
> might be right - it's a similar address to the ones in A0/A1).
>
> And then the format/vector value is b008.
>
> That is, if I read it right, format 0xb, which is that "Long Bus Cycle" thing.

Right.  It was a fault in stage C of the instruction pipeline (SSW =
0xb209) at 0x8006a2d2-2 (BADDR-2).

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
