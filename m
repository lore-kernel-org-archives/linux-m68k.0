Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0F6C7618E
	for <linux-m68k@archiver.kernel.org>; Sat, 22 Apr 2023 09:00:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjDVJAa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 22 Apr 2023 05:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjDVJA3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 22 Apr 2023 05:00:29 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D8A1BC2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Apr 2023 02:00:27 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1a50cb65c92so25372855ad.0
        for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Apr 2023 02:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682154027; x=1684746027;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBq48tKQXp+j6T8pF0DFf39nuxaSFc3DX1JaC3yIQT0=;
        b=eI/+m0ovstzHBOs627c6B3sWOFPK8Sev0/BihG+XlZDAHVambCxQxYPaXfzRl2m9jE
         JXGx2oj8fHh2S+0xhAONERz6vzRqxsFdYkM2JIuxRDU8G1yiPJAVDd+O/pQajsqbYrqE
         prZC+606bdS7urdGgtl5IpHruJoJLtzvDlNrxiFCXV54A2hG0buPOv01fW1dGYvYZudO
         UU0/DUPkrkvAltiq9I5Q6GcC1DScnao+JEAFm1FIFtb3Kd4UQHKhWhcVyv5h7vhPWVzS
         Lw4WrxgfvP/fdBtbst/waWI5jxpGuttpjZKn8pe2KpcUWtjg0kpERRAbVf4MDPQnS7HW
         45Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682154027; x=1684746027;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BBq48tKQXp+j6T8pF0DFf39nuxaSFc3DX1JaC3yIQT0=;
        b=bNpiyKBRpBhFBb1huUkSP3YBQXk1pxWCbvqAMDtqvBloJog0pLug5OfDhuHDshOvnL
         TOdAk2nguuHSJmvP8dl3RgqQDcaSW9WtxfrawQFRMy6Cb5WiiYm4FSVp+YLVnFtQ0QQH
         dc13JH9Wddg9cZ6ZZDcvHzPZ8TKlSqyPD3MpaEG0ovmREOA38v3wzkxP1HhQW8OKylwo
         gMlSMfm2YQG0V9fz1b6Vl21Pcm3TNjZtwD0xS0a9tkqi+149knAz/+Yamexsc3fp7+A4
         RHb9eTCuFr4jZQrLEnqilHhtUXZCMzv0LHVjfPFSKyOPZNi39jpaNCAKOF4AnNnEqsVP
         sM0w==
X-Gm-Message-State: AAQBX9c0CYCDkxBrXkqj4n6OthAxcqPJObPlrHLzetlXFDgVCuiIx4v0
        tBAUxrrz92jHz16PIq3TchnvHOju/Xg=
X-Google-Smtp-Source: AKy350bfJsM4ku5To6Ehtg06ufwr70dqVnJ2AZC1irgroaaj0xKsHQOzZWiKvo5IdDayUHc6XDBALg==
X-Received: by 2002:a17:902:d492:b0:1a9:3447:71fb with SMTP id c18-20020a170902d49200b001a9344771fbmr9083621plg.39.1682154026528;
        Sat, 22 Apr 2023 02:00:26 -0700 (PDT)
Received: from [10.1.1.24] (222-152-172-8-fibre.sparkbb.co.nz. [222.152.172.8])
        by smtp.gmail.com with ESMTPSA id iy17-20020a170903131100b001a1fe42a141sm3718699plb.115.2023.04.22.02.00.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Apr 2023 02:00:25 -0700 (PDT)
Subject: Re: reliable reproducer, was Re: core dump analysis
To:     Finn Thain <fthain@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com>
 <2f241963-44cd-3196-b39e-9c2d63cda1d3@linux-m68k.org>
 <60109ace-4e55-29da-86d9-35e931b11134@gmail.com>
 <c77fe8b3-03fa-491b-7c10-64f2e52c748a@linux-m68k.org>
 <d025ad67-9cc2-cf5a-09a7-ce1d8f66109b@gmail.com>
 <e777cb75-84f6-a61d-810a-2b6d0176e642@linux-m68k.org>
 <c519ff55-fa2a-56c8-6d72-c5afab38ef48@gmail.com>
 <54597ab3-2776-2a55-9952-3bfbbc329829@linux-m68k.org>
 <406cb339-0a0c-4d71-9b5c-c11568793c14@gmail.com>
 <bee7db9b-0f81-dc2e-c737-c8aa25fd0588@linux-m68k.org>
 <fee988a9-dea8-7cae-af02-dda9f12cae08@gmail.com>
 <d1599d1b-b47e-b8c7-6c33-5077c3301293@linux-m68k.org>
 <71af7b52-a1d4-581c-d5af-afce6991c48d@gmail.com>
 <a5036039-9758-f304-5659-49588a9f5165@linux-m68k.org>
 <7ea095ba-7df1-1ffe-e87d-12d46ebe72f6@gmail.com>
 <f890dd95-6bb9-8012-c49e-774fae71200d@gmail.com>
 <2fdc2819-526a-756f-19d0-ac1147f85b63@linux-m68k.org>
 <868b5214-fa13-dcf7-a671-9843169eea06@gmail.com>
 <b1488232-a826-a93a-4806-c11355cf3a77@gmail.com>
Cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <dea8213a-7b64-3273-2617-7340aebeb1d6@gmail.com>
Date:   Sat, 22 Apr 2023 21:00:21 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <b1488232-a826-a93a-4806-c11355cf3a77@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 22.04.2023 um 19:54 schrieb Michael Schmitz:
> Hi Finn,
>
> Am 21.04.2023 um 21:18 schrieb Michael Schmitz:
>> Hi Finn,
>>
>> Am 21.04.2023 um 20:30 schrieb Finn Thain:
>>> On Fri, 21 Apr 2023, Michael Schmitz wrote:
>>>
>>>>
>>>> How often did a page fault happen when executing moveml, in other
>>>> programs?
>>>>
>>>
>>> The printk() I placed in bus_error030() was conditional on the short
>>> word
>>> at the instruction pointer. It didn't consider all forms of movem, just
>>> 0x48e7 which is the start of "moveml X,%sp@-". This matched page
>>> faults in
>>> many of the programs that executed while booting to single user mode. I
>>> suppose most of them don't use signal handlers in the same way dash does
>>> otherwise they would probably be unreliable too.
>>
>> OK; so too much noise unless filtered on the command name...
>>
>> I'll try first to get register state at the time of signal delivery from
>> the sa_sigaction handler's ucontext parameter to see where the signal
>> stack falls in relation to the call frames from your rec() function on
>> the stack (and what the register contents were). Hope that won't be too
>
> Took a little while to figure out that the ucontext format changed in
> the decade or two since my userland's libc headers were generated. With
> the correct format, the information stored on th signal frame made a lot
> more sense.
>
> Log of your test program (attached), instrumented to keep track of user
> stack pointer in the parent process, user stack pointer in the signal
> handler, and stack pointer, pc and exceptiopn frame format from the
> signal stack (only the last few signals shown):
>
> parent usp  : 0xef97beb8
> handler tos : 0xef97bdc4
> handler usp : 0xef97bbe0
> signal usp  : 0xef97bea8
> signal pc   : 0xc009f37a
> signal fmtv : 0x800006ca
>
> parent usp  : 0xef969eb8
> handler tos : 0xef969dc4
> handler usp : 0xef969be0
> signal usp  : 0xef969ea8
> signal pc   : 0xc009f37a
> signal fmtv : 0x800006ca
>
> parent usp  : 0xef9530d0
> handler tos : 0xef952fec
> handler usp : 0xef952e08
> signal usp  : 0xef9530d0
> signal pc   : 0x800006dc
> signal fmtv : 0x91929394
>
> parent usp  : 0xef945eb8
> handler tos : 0xef945dc4
> handler usp : 0xef945be0
> signal usp  : 0xef945ea8
> signal pc   : 0xc009f37a
> signal fmtv : 0x800006ca
>
> parent usp  : 0xef933eb8
> handler tos : 0xef933dc4
> handler usp : 0xef933be0
> signal usp  : 0xef933ea8
> signal pc   : 0xc009f37a
> signal fmtv : 0x800006ca
>
> parent usp  : 0xef921edc
> handler tos : 0xef997984
> handler stack overwrote usp!
> handler usp : 0xef9977a0
> signal usp  : 0xef997a64
> signal pc   : 0x80000768
> signal fmtv : 0xa1a2a3a4
>
> Illegal instruction (core dumped)
>
> usp from the signal stack is below that of the parent process (before
> calling fork()).
>
> usp from the signal handler is below both of those. So far, so good.
>
> The top of the signal frame, however, is getting quite close to these
> stack pointers. In the last log, it has grown above the user stack pointer.
>
> Two things to note:
>
> - pc in the signal frame (from struct uc_mcontext) is either the return
> pc from the stack stuffing function, or something else I cannot work
> out. That part of ucontext appears valid.
>
> - what ought to be the frame format and vector offset does in fact hold
> varying longwords from the user stack. This information is not from
> struct uc_mcontext, but from extra information copied after struct
> ucontext ends. That wouldn't be there if at time of signal delivery,
> nothing had yet written to the area where the signal frame is stored.

Actually, 0x800006ca (should be format/vector but more likely a return 
address saved on the stack by rec()) is the instruction after fork() in 
rec(), and 0xc009f37a is the instuction after trap 0 in fork(). The 
signal frame pc seems to be anywhere in rec() ...

Cheers,

	Michael
