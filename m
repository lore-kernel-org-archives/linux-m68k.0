Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA76FC761AF
	for <linux-m68k@archiver.kernel.org>; Sun,  2 Apr 2023 04:09:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbjDBEJl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 2 Apr 2023 00:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDBEJk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 2 Apr 2023 00:09:40 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC5124AC6
        for <linux-m68k@lists.linux-m68k.org>; Sat,  1 Apr 2023 21:09:39 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id le6so25066671plb.12
        for <linux-m68k@lists.linux-m68k.org>; Sat, 01 Apr 2023 21:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680408578;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ME1qGm7E625gMZgaiMcMCL1YydFL9dIVuK3qYg75DUI=;
        b=ZEDoPLNZl+0tWwLYkKtzA/eNnvRur3GqjOSEcv0aVY1h2Cbp3tiB2SAIk8Hh7qdHF8
         y2xlWe//Q/TkVUtnILjKEPGWTOT3Sip7Aglr5HNPtljh1EcOlEOeY9wDLfOCcy4tJygH
         t+SZXJ5kUVG6V9kwGzzSyda7hVsaWtmCBPXrJM1Kj3q1K42p2xQ86ubUrc2HJ8kRMMoV
         GC+cPMUcEPq0NVodi8Pi88D4eInyAvI4fecRM/gnMzuFyNBasrbeEdoQLSu6CmuEqrPf
         D6kTEKw//KJdck2W6zZQAB75Uk5sNhIPgHr85D6s30wF+lr9df2gwryZ+CRX9V51u36k
         7JsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680408578;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ME1qGm7E625gMZgaiMcMCL1YydFL9dIVuK3qYg75DUI=;
        b=aIupKYmxOUO56du9rzkC7uj6i09sLCWiO03w6wY5XJ73xxLcIOVHHYft6mwRI7BkxO
         CL93Gf1J5BoJlqN66I86Otd6CfU1cJfWGlzmDTSvDIGqZSVXizgZf4oYa+52EqwleFFw
         Cq479GzDbeIgmJpHqfuO6G9TlUJPtDrNdAjCmenHfXp5jG3Xy/owl0OlbEhXtg0rvDnN
         V6gBPbXtkIXHUUUItSLou6I//mpvnq9onO83aHkxy7ZPVZg/swZWFCS1DN53pozjZ1mD
         qIRKmzi5k3lMdp788en2UZDK7X094cTqnkiXAJlAR13D7Juyy7HF+u03kB1qqKGi2W3k
         Tnww==
X-Gm-Message-State: AAQBX9fiD9pCA2kf6wfmDAjBOzIrg6wC0jSViizGf34Q8dMny3im19p2
        wqMeXffr4r5pIt2uQleE50hP/ho3k9o=
X-Google-Smtp-Source: AK7set8m/rf3OMLbZE0B2wZ3oMtbJ9iFAuBAk/OmEqgDpIWzVLgHRJbtGkTZdyQM+cRvYeOJZ9mb+g==
X-Received: by 2002:a17:90b:4b09:b0:239:ea16:5b13 with SMTP id lx9-20020a17090b4b0900b00239ea165b13mr36626981pjb.14.1680408578085;
        Sat, 01 Apr 2023 21:09:38 -0700 (PDT)
Received: from [10.1.1.24] (222-152-221-232-adsl.sparkbb.co.nz. [222.152.221.232])
        by smtp.gmail.com with ESMTPSA id ge13-20020a17090b0e0d00b0023fbb21214bsm7310073pjb.17.2023.04.01.21.09.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Apr 2023 21:09:37 -0700 (PDT)
Subject: Re: core dump analysis, was Re: stack smashing detected
To:     Finn Thain <fthain@linux-m68k.org>, debian-68k@lists.debian.org,
        linux-m68k@lists.linux-m68k.org
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <c267a9fc-7788-f905-d984-e0372d50d0ec@gmail.com>
 <dff09ed2-af93-fd43-6d6f-045a6fc0e30d@gmail.com>
 <c01e2f1c-425f-478d-918e-cd1fd37e0008@yahoo.com>
 <aee359a6-b5e0-fbe2-3988-779f8601f106@gmail.com>
 <8042d988-6dd9-8170-60e9-cdf19118440f@yahoo.com>
 <a8f06e4b-db28-c8f9-5e21-3ea0f3eebacd@linux-m68k.org>
 <bb27b393-3d02-f42c-5c7f-c27d4936ece9@linux-m68k.org>
 <37da2ca2-dd99-8417-7cae-a88e2e7fc1b6@yahoo.com>
 <30a1be59-a1fd-f882-1072-c7db8734b1f1@gmail.com>
 <39f79c2d-e803-d7b1-078f-8757ca9b1238@yahoo.com>
 <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com>
 <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com>
 <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org>
 <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com>
 <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org>
 <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org>
 <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org>
 <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <6c4d497e-6f0e-35cc-908e-9ef98151a56a@gmail.com>
Date:   Sun, 2 Apr 2023 16:09:33 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

nice work!

Am 01.04.2023 um 22:27 schrieb Finn Thain:
> So, in summary, the canary validation failed in this case not because the
> canary got clobbered but because %a3 got clobbered, somewhere between
> __wait3+24 and __wait3+70 (below).
>
> The call to __GI___wait4_time64 causes %a3 to be saved to and restored
> from the stack, so stack corruption seems to be a strong possibility to
> explain the change in %a3.
>
> But if that's what happened, I'd expect __GI___wait4_time64 to report
> stack smashing, not __wait3... And it just begs the question, what then
> caused the corruption? Was it the wait4 syscall? Was it another thread?

Saved registers are restored from the stack before return from 
__GI___wait4_time64 but we don't know which of the two wait4 call sites 
was used, do we?

What registers does __m68k_read_tp@plt clobber?

> And why is it so rare?

Maybe an interaction between (multiple?) signals and syscall return... 
depends on how long we sleep in wait4, and whether a signal happens just 
during that time.

%a3 is the first register saved to the switch stack BTW.

That kernel does contain Al Viro's patch that corrected our switch stack 
handling in the signal return path? I wonder whether there's a potential 
race lurking in there?

And I just notice that we had had trouble with a copy_to_user in 
setup_frame() earlier (reason for my buserr handler patch). I wonder 
whether something's gone wrong there. Do you get a segfault instead of 
the abort signal if you drop my patch?

Cheers,

	Michael



>
> (gdb) disass __wait3
> Dump of assembler code for function __wait3:
>    0xc00e0070 <+0>:     linkw %fp,#-96
>    0xc00e0074 <+4>:     moveml %a2-%a3/%a5,%sp@-
>    0xc00e0078 <+8>:     lea %pc@(0xc0198000),%a5
>    0xc00e0080 <+16>:    movel %fp@(8),%d0
>    0xc00e0084 <+20>:    moveal %fp@(16),%a2
>    0xc00e0088 <+24>:    moveal %a5@(108),%a3
>    0xc00e008c <+28>:    movel %a3@,%fp@(-4)
>    0xc00e0090 <+32>:    tstl %a2
>    0xc00e0092 <+34>:    beqw 0xc00e0152 <__wait3+226>
>    0xc00e0096 <+38>:    pea %fp@(-92)
>    0xc00e009a <+42>:    movel %fp@(12),%sp@-
>    0xc00e009e <+46>:    movel %d0,%sp@-
>    0xc00e00a0 <+48>:    pea 0xffffffff
>    0xc00e00a4 <+52>:    bsrl 0xc00e0174 <__GI___wait4_time64>
>    0xc00e00aa <+58>:    lea %sp@(16),%sp
>    0xc00e00ae <+62>:    tstl %d0
>    0xc00e00b0 <+64>:    bgts 0xc00e00c8 <__wait3+88>
>    0xc00e00b2 <+66>:    moveal %fp@(-4),%a0
>    0xc00e00b6 <+70>:    movel %a3@,%d1
>    0xc00e00b8 <+72>:    cmpl %a0,%d1
>    0xc00e00ba <+74>:    bnew 0xc00e016c <__wait3+252>
>    0xc00e00be <+78>:    moveml %fp@(-108),%a2-%a3/%a5
>    0xc00e00c4 <+84>:    unlk %fp
>    0xc00e00c6 <+86>:    rts
>    0xc00e00c8 <+88>:    pea 0x44
>    0xc00e00cc <+92>:    clrl %sp@-
>    0xc00e00ce <+94>:    pea %a2@(4)
>    0xc00e00d2 <+98>:    movel %d0,%fp@(-96)
>    0xc00e00d6 <+102>:   bsrl 0xc00b8850 <__GI_memset>
>    0xc00e00dc <+108>:   movel %fp@(-88),%a2@
>    0xc00e00e0 <+112>:   movel %fp@(-80),%a2@(4)
>    0xc00e00e6 <+118>:   movel %fp@(-72),%a2@(8)
>    0xc00e00ec <+124>:   movel %fp@(-64),%a2@(12)
>    0xc00e00f2 <+130>:   movel %fp@(-60),%a2@(16)
>    0xc00e00f8 <+136>:   movel %fp@(-56),%a2@(20)
>    0xc00e00fe <+142>:   movel %fp@(-52),%a2@(24)
>    0xc00e0104 <+148>:   movel %fp@(-48),%a2@(28)
>    0xc00e010a <+154>:   movel %fp@(-44),%a2@(32)
>    0xc00e0110 <+160>:   movel %fp@(-40),%a2@(36)
>    0xc00e0116 <+166>:   movel %fp@(-36),%a2@(40)
>    0xc00e011c <+172>:   movel %fp@(-32),%a2@(44)
>    0xc00e0122 <+178>:   movel %fp@(-28),%a2@(48)
>    0xc00e0128 <+184>:   movel %fp@(-24),%a2@(52)
>    0xc00e012e <+190>:   movel %fp@(-20),%a2@(56)
>    0xc00e0134 <+196>:   movel %fp@(-16),%a2@(60)
>    0xc00e013a <+202>:   movel %fp@(-12),%a2@(64)
>    0xc00e0140 <+208>:   movel %fp@(-8),%a2@(68)
>    0xc00e0146 <+214>:   lea %sp@(12),%sp
>    0xc00e014a <+218>:   movel %fp@(-96),%d0
>    0xc00e014e <+222>:   braw 0xc00e00b2 <__wait3+66>
>    0xc00e0152 <+226>:   clrl %sp@-
>    0xc00e0154 <+228>:   movel %fp@(12),%sp@-
>    0xc00e0158 <+232>:   movel %d0,%sp@-
>    0xc00e015a <+234>:   pea 0xffffffff
>    0xc00e015e <+238>:   bsrl 0xc00e0174 <__GI___wait4_time64>
>    0xc00e0164 <+244>:   lea %sp@(16),%sp
>    0xc00e0168 <+248>:   braw 0xc00e00b2 <__wait3+66>
>    0xc00e016c <+252>:   bsrl 0xc012a38c <__stack_chk_fail>
> End of assembler dump.
> (gdb) disass __GI___wait4_time64
> Dump of assembler code for function __GI___wait4_time64:
>    0xc00e0174 <+0>:     lea %sp@(-80),%sp
>    0xc00e0178 <+4>:     moveml %d2-%d5/%a2-%a3/%a5,%sp@-
>    0xc00e017c <+8>:     lea %pc@(0xc0198000),%a5
>    0xc00e0184 <+16>:    movel %sp@(116),%d2
>    0xc00e0188 <+20>:    moveal %sp@(124),%a2
>    0xc00e018c <+24>:    moveal %a5@(108),%a3
>    0xc00e0190 <+28>:    movel %a3@,%sp@(104)
>    0xc00e0194 <+32>:    bsrl 0xc0052e2c <__m68k_read_tp@plt>
>    0xc00e019a <+38>:    movel %a0@(-29920),%d4
>    0xc00e019e <+42>:    bnew 0xc00e026c <__GI___wait4_time64+248>
>    0xc00e01a2 <+46>:    tstl %a2
>    0xc00e01a4 <+48>:    beqs 0xc00e01aa <__GI___wait4_time64+54>
>    0xc00e01a6 <+50>:    moveq #32,%d4
>    0xc00e01a8 <+52>:    addl %sp,%d4
>    0xc00e01aa <+54>:    movel %sp@(120),%d3
>    0xc00e01ae <+58>:    movel %sp@(112),%d1
>    0xc00e01b2 <+62>:    moveq #114,%d0
>    0xc00e01b4 <+64>:    trap #0
>    0xc00e01b6 <+66>:    cmpil #-4096,%d0
>    0xc00e01bc <+72>:    bhiw 0xc00e02a6 <__GI___wait4_time64+306>
>    0xc00e01c0 <+76>:    tstl %d0
>    0xc00e01c2 <+78>:    blew 0xc00e0256 <__GI___wait4_time64+226>
>    0xc00e01c6 <+82>:    tstl %a2
>    0xc00e01c8 <+84>:    beqw 0xc00e0256 <__GI___wait4_time64+226>
>    0xc00e01cc <+88>:    movel %sp@(32),%a2@(4)
>    0xc00e01d2 <+94>:    smi %d1
>    0xc00e01d4 <+96>:    extbl %d1
>    0xc00e01d6 <+98>:    movel %d1,%a2@
>    0xc00e01d8 <+100>:   movel %sp@(36),%a2@(12)
>    0xc00e01de <+106>:   smi %d1
>    0xc00e01e0 <+108>:   extbl %d1
>    0xc00e01e2 <+110>:   movel %d1,%a2@(8)
>    0xc00e01e6 <+114>:   movel %sp@(40),%a2@(20)
>    0xc00e01ec <+120>:   smi %d1
>    0xc00e01ee <+122>:   extbl %d1
>    0xc00e01f0 <+124>:   movel %d1,%a2@(16)
>    0xc00e01f4 <+128>:   movel %sp@(44),%a2@(28)
>    0xc00e01fa <+134>:   smi %d1
>    0xc00e01fc <+136>:   extbl %d1
>    0xc00e01fe <+138>:   movel %d1,%a2@(24)
>    0xc00e0202 <+142>:   movel %sp@(48),%a2@(32)
>    0xc00e0208 <+148>:   movel %sp@(52),%a2@(36)
>    0xc00e020e <+154>:   movel %sp@(56),%a2@(40)
>    0xc00e0214 <+160>:   movel %sp@(60),%a2@(44)
>    0xc00e021a <+166>:   movel %sp@(64),%a2@(48)
>    0xc00e0220 <+172>:   movel %sp@(68),%a2@(52)
>    0xc00e0226 <+178>:   movel %sp@(72),%a2@(56)
>    0xc00e022c <+184>:   movel %sp@(76),%a2@(60)
>    0xc00e0232 <+190>:   movel %sp@(80),%a2@(64)
>    0xc00e0238 <+196>:   movel %sp@(84),%a2@(68)
>    0xc00e023e <+202>:   movel %sp@(88),%a2@(72)
>    0xc00e0244 <+208>:   movel %sp@(92),%a2@(76)
>    0xc00e024a <+214>:   movel %sp@(96),%a2@(80)
>    0xc00e0250 <+220>:   movel %sp@(100),%a2@(84)
>    0xc00e0256 <+226>:   moveal %sp@(104),%a0
>    0xc00e025a <+230>:   movel %a3@,%d1
>    0xc00e025c <+232>:   cmpl %a0,%d1
>    0xc00e025e <+234>:   bnew 0xc00e02f2 <__GI___wait4_time64+382>
>    0xc00e0262 <+238>:   moveml %sp@+,%d2-%d5/%a2-%a3/%a5
>    0xc00e0266 <+242>:   lea %sp@(80),%sp
>    0xc00e026a <+246>:   rts
>    0xc00e026c <+248>:   bsrl 0xc00a1b88 <__GI___pthread_enable_asynccancel>
>    0xc00e0272 <+254>:   movel %d0,%d5
>    0xc00e0274 <+256>:   tstl %a2
>    0xc00e0276 <+258>:   beqs 0xc00e02c4 <__GI___wait4_time64+336>
>    0xc00e0278 <+260>:   moveq #32,%d4
>    0xc00e027a <+262>:   addl %sp,%d4
>    0xc00e027c <+264>:   movel %sp@(120),%d3
>    0xc00e0280 <+268>:   movel %sp@(112),%d1
>    0xc00e0284 <+272>:   moveq #114,%d0
>    0xc00e0286 <+274>:   trap #0
>    0xc00e0288 <+276>:   cmpil #-4096,%d0
>    0xc00e028e <+282>:   bhis 0xc00e02c8 <__GI___wait4_time64+340>
>    0xc00e0290 <+284>:   movel %d5,%sp@-
>    0xc00e0292 <+286>:   movel %d0,%sp@(32)
>    0xc00e0296 <+290>:   bsrl 0xc00a1bea <__GI___pthread_disable_asynccancel>
>    0xc00e029c <+296>:   addql #4,%sp
>    0xc00e029e <+298>:   movel %sp@(28),%d0
>    0xc00e02a2 <+302>:   braw 0xc00e01c0 <__GI___wait4_time64+76>
>    0xc00e02a6 <+306>:   movel %d0,%sp@(28)
>    0xc00e02aa <+310>:   bsrl 0xc0052e2c <__m68k_read_tp@plt>
>    0xc00e02b0 <+316>:   addal %a5@(2cf8),%a0
>    0xc00e02b8 <+324>:   movel %sp@(28),%d0
>    0xc00e02bc <+328>:   negl %d0
>    0xc00e02be <+330>:   movel %d0,%a0@
>    0xc00e02c0 <+332>:   moveq #-1,%d0
>    0xc00e02c2 <+334>:   bras 0xc00e0256 <__GI___wait4_time64+226>
>    0xc00e02c4 <+336>:   clrl %d4
>    0xc00e02c6 <+338>:   bras 0xc00e027c <__GI___wait4_time64+264>
>    0xc00e02c8 <+340>:   movel %d0,%sp@(28)
>    0xc00e02cc <+344>:   bsrl 0xc0052e2c <__m68k_read_tp@plt>
>    0xc00e02d2 <+350>:   addal %a5@(2cf8),%a0
>    0xc00e02da <+358>:   movel %sp@(28),%d0
>    0xc00e02de <+362>:   negl %d0
>    0xc00e02e0 <+364>:   movel %d0,%a0@
>    0xc00e02e2 <+366>:   movel %d5,%sp@-
>    0xc00e02e4 <+368>:   bsrl 0xc00a1bea <__GI___pthread_disable_asynccancel>
>    0xc00e02ea <+374>:   addql #4,%sp
>    0xc00e02ec <+376>:   moveq #-1,%d0
>    0xc00e02ee <+378>:   braw 0xc00e0256 <__GI___wait4_time64+226>
>    0xc00e02f2 <+382>:   bsrl 0xc012a38c <__stack_chk_fail>
> End of assembler dump.
>
