Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A423101EE
	for <linux-m68k@lists.linux-m68k.org>; Sat, 10 Aug 2024 03:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723259752; cv=none; b=udLzSm5PXnw++4+bnh133BxMemcJetfdo2+AGvcgJBWp5aaq0SBQXRWZKG38Brz4OUq0GY4o7ASrnYWb3FsySbifUMbcPFL9FfKBnFzREwgi5SDZU+gK0ljm5k4RPZv109cknlMHXpP7rAWDKO6Cr1E2DIzb8wh4kkmSs1TZWoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723259752; c=relaxed/simple;
	bh=Be84GO7N4BH5zpSOuChQNElYKiSRBH2gSJ31CTaS7mg=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=MsR+aMIAJHRkfs7Ympvaep36Qiil1CwSI2J7Lj3E8KHiR4KsHaHVdSYeAYLRcEcAJnGAVsMYYNFyklqPTPBrbIgtrcbhH+bN41drCgJaIhce+ugoCupRV1fAxR1ZIYslNAq9YZtecui/qsaOOBTpjspaAiN4QgLpa6tww6q3oec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JaRiTRQZ; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaRiTRQZ"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3db157cb959so1827658b6e.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Aug 2024 20:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723259750; x=1723864550; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LENh4ltuf2VSY8ytKoi8W2LQRhHBN2PA+DHuAreopv4=;
        b=JaRiTRQZchbQPz8i/GAiE2Pq7O6WHzqX3qZbb0uDpQgoCu2fhnkTQZXI0rYU3VbVi0
         SoPJD88HgkacPYIEskz8dYlyrm4ydyGfMU6JXHHaFjaS14YiAzFZJP0UtYx6Qzz9YcGx
         qDLjm7/OcC+sE4wrGMUWXkZoqD8eOpOzqT5bCFpAXDOEkt3HudPK1kZ1GhGsKQ2rIt4g
         x4TQPvOOhlp0W1raY8G9ZMT9JgqJEKojnb31mdS0/GV7Dp5fBh4VAiKSewR1ApBs1K7Z
         yWIXx20PF3xpfljDPp+lEYMq680BwoMQqcGOV0dc5lXZRjpV825Xn6fjB9H2gfxhDa0m
         CttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723259750; x=1723864550;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LENh4ltuf2VSY8ytKoi8W2LQRhHBN2PA+DHuAreopv4=;
        b=QQds1Mv5yTfn+tXtyOSHsiAyhYFPAwNnPZ+/4SgJIN1rxyFXhlYf5v8q8PsqtrP5vN
         wL4Iab+xlgp3tqihXNhBl3hgf17EK5MWKH6COoBsfx008q5bbaH/YDB/rRkhJaq4s3uT
         crLtn7pVv91NN52Foj7bY8sm1FBLi4sUL7pKSsevfw5fCj8pr2+4hN23w3dMU9QdxXMd
         H9dGh4E/OTVKKtEO2P0XcqAdsFU2gF6wMZXAFvva31MpWdgdmKauvhRYGvKCYUds8po4
         kOTa8sVhQBbJx+MWwCDkjn9pvgV9n55SG3m9Fur1Jgoh9AG7R0vPEo8NplF2qLfacZUh
         Qg7g==
X-Forwarded-Encrypted: i=1; AJvYcCUoouJXHt2LiV5itnFe//ATc7dwO4xo2chSQCb+Xl+bBPR6SI5iEPVkZ9pqfylzTCMEFwyYi4Os3UGjYNA7SlJzTOjUsOn4fn4DxCQ9OV/h
X-Gm-Message-State: AOJu0YyRBnEHbU/gO0LeQ8MxmSmowgwyo96PrWzEgAT+5IwOhxhbrKeM
	S4QoYCMP2lJtfXTlWIuCDdisLUCiRUQFRSuzb/4RnuFJ4QwlEP5W
X-Google-Smtp-Source: AGHT+IE8lUvCOgLLGXmbU8VKYEG1R2XHOz7xYvdnREI/e2ndx4frsaTfZ4i7vGNjt17ZoeQjcaqU9w==
X-Received: by 2002:a05:6808:1403:b0:3d6:2b12:7dc0 with SMTP id 5614622812f47-3dc416870b7mr5006842b6e.20.1723259750056;
        Fri, 09 Aug 2024 20:15:50 -0700 (PDT)
Received: from [10.1.1.24] (222-152-175-63-fibre.sparkbb.co.nz. [222.152.175.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bba01c8dsm4179115ad.231.2024.08.09.20.15.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Aug 2024 20:15:49 -0700 (PDT)
Subject: Re: dump, restore
To: Finn Thain <fthain@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
References: <6d0e0caf-6d32-c7d0-c02c-42830d9636d0.ref@yahoo.com>
 <6d0e0caf-6d32-c7d0-c02c-42830d9636d0@yahoo.com>
 <ebf3c8dd-9c1d-602d-2f7a-9adb99950264@linux-m68k.org>
 <b18c5784-6f21-9a2c-422d-b6fd4c4811dc@yahoo.com>
 <be039a4b-639d-3b15-58e0-e7f2ff104240@linux-m68k.org>
 <43997c51-ef4e-9071-f9eb-087be2586490@linux-m68k.org>
Cc: debian-68k@lists.debian.org, Stan Johnson <userm57@yahoo.com>
From: Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <c3f33e0e-d04b-22e9-ee63-7783e6d12c62@gmail.com>
Date: Sat, 10 Aug 2024 15:15:44 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <43997c51-ef4e-9071-f9eb-087be2586490@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Finn,

Am 10.08.2024 um 12:42 schrieb Finn Thain:
>
> On Fri, 9 Aug 2024, I wrote:
>
>>
>> On Sat, 3 Aug 2024, Stan Johnson wrote:
>>
>>>
>>> Using "-a" appears to be a better option than just specifying a really
>>> long tape size. Unfortunately, it also doesn't work. The problem seems
>>> to affect only m68k; ppc-32, ppc-64, x86-32 and x86-64 all work as
>>> expected...
>>
>> I reproduced the problem in QEMU and found it went away when I ran dump
>> under Linux v5.6. So I went through a lot of "git bisect" steps and the
>> culprit appears to be commit ef2c41cf38a7 ("clone3: allow spawning
>> processes into cgroups"). That seems plausible, since we are seeing an
>> error from fork_clone_io() below...
>>
>> #ifdef __linux__
>> #if defined(SYS_clone) && defined(CLONE_IO)
>> pid_t
>> fork_clone_io(void)
>> {
>>         return syscall(SYS_clone, CLONE_ARGS);
>> }
>> #endif
>> #endif
>>
>> That code bypasses the C library so I suppose it's not too surprising
>> that different architectures give different results...
>>
>> Anyway, if I run dump under strace I see no CLONE_INTO_CGROUP flag:

strace may not be aware of the CLONE_INTO_CGROUP flag yet? How old is 
your strace binary?

>> clone(child_stack=NULL, flags=CLONE_IO|SIGCHLD) = -1 EBADF (Bad file
>> descriptor)
>>
>> The -EBADF result was introduced into cgroup_css_set_fork() by the
>> commit above. That should not happen unless CLONE_INTO_CGROUP was set,
>> but strace says its not. So I don't know what's going on here.
>>
>
> Here's what gdb says, FWIW...
>
> # gdb
> GNU gdb (Debian 13.1-3) 13.1
> ...
> (gdb) file /usr/sbin/dump
> Reading symbols from /usr/sbin/dump...
> Reading symbols from /usr/lib/debug/.build-id/24/071a827207bee9c025d364137514447279302b.debug...
> (gdb) run -0f /dev/null /dev/sda
> Starting program: /usr/sbin/dump -0f /dev/null /dev/sda
>   DUMP: Date of this level 0 dump: Fri Aug  9 23:37:15 2024
>   DUMP: Dumping /dev/sda (an unlisted file system) to /dev/null
>   DUMP: Label: none
>   DUMP: Writing 10 Kilobyte records
>   DUMP: mapping (Pass I) [regular files]
>   DUMP: mapping (Pass II) [directories]
>   DUMP: estimated 3595695 blocks.
>   DUMP: Context save fork fails in parent 671
> [Inferior 1 (process 671) exited with code 03]
> (gdb) b fork_clone_io
> Breakpoint 1 at 0x80009dbc: file tape.c, line 740.
> (gdb) run -0f /dev/null /dev/sda
> Starting program: /usr/sbin/dump -0f /dev/null /dev/sda
>   DUMP: Date of this level 0 dump: Fri Aug  9 23:38:17 2024
>   DUMP: Dumping /dev/sda (an unlisted file system) to /dev/null
>   DUMP: Label: none
>   DUMP: Writing 10 Kilobyte records
>   DUMP: mapping (Pass I) [regular files]
>   DUMP: mapping (Pass II) [directories]
>   DUMP: estimated 3595695 blocks.
>
> Program received signal SIGSEGV, Segmentation fault.
> 0x00000001 in ?? ()
> (gdb) l fork_clone_io
> warning: Source file is more recent than executable.
> 735
> 736     #ifdef __linux__
> 737     #if defined(SYS_clone) && defined(CLONE_IO)
> 738     pid_t
> 739     fork_clone_io(void)
> 740     {
> 741        pid_t res,parent;
> 742        parent=getppid();            /* az hackety hack... */
> 743
> 744        res=syscall(SYS_clone, CLONE_ARGS);
> 745        getppid();
> 746        /* as per clone call manpage: caching! */
> 747        getpid();
> 748     #ifdef __alpha__
> 749        syscall(SYS_getxpid);
> 750     #else
> 751         syscall(SYS_getpid);
> 752     #endif
> 753
> 754        /* az: clone manpage doesn't say jack about what the
> (gdb) disas fork_clone_io
> Dump of assembler code for function fork_clone_io:
>    0x80009dbc <+0>:     movel %d3,%sp@-
>    0x80009dbe <+2>:     movel %d2,%sp@-
>    0x80009dc0 <+4>:     bsrl 0x80004200 <getppid@plt>
>    0x80009dc6 <+10>:    movel %d0,%d3
>    0x80009dc8 <+12>:    clrl %sp@-
>    0x80009dca <+14>:    clrl %sp@-
>    0x80009dcc <+16>:    clrl %sp@-
>    0x80009dce <+18>:    movel #-2147483631,%sp@-
>    0x80009dd4 <+24>:    pea 0x78
>    0x80009dd8 <+28>:    bsrl 0x80003fd0 <syscall@plt>
>    0x80009dde <+34>:    movel %d0,%d2
>    0x80009de0 <+36>:    bsrl 0x80004200 <getppid@plt>
>    0x80009de6 <+42>:    bsrl 0x80003c9c <getpid@plt>
>    0x80009dec <+48>:    pea 0x14
>    0x80009df0 <+52>:    bsrl 0x80003fd0 <syscall@plt>
>    0x80009df6 <+58>:    bsrl 0x80004200 <getppid@plt>
>    0x80009dfc <+64>:    lea %sp@(24),%sp
>    0x80009e00 <+68>:    cmpl %d0,%d3
>    0x80009e02 <+70>:    beqs 0x80009e06 <fork_clone_io+74>
>    0x80009e04 <+72>:    clrl %d2
>    0x80009e06 <+74>:    movel %d2,%d0
>    0x80009e08 <+76>:    movel %sp@+,%d2
>    0x80009e0a <+78>:    movel %sp@+,%d3
>    0x80009e0c <+80>:    rts
> End of assembler dump.
> (gdb)
>
> Is this clone syscall (0x78) really executing sys_clone3()? Also,

Nope, syscall no. 120 calls __sys_clone() which in turn calls 
m68k_clone() which emulates sys_clone() (roundabout way due to different 
calling conventions on m68k).

clone3 is syscall 435 (calling __sys_clone3() -> m68k_clone3() -> 
sys_clone3()).

But as long as syscall() takes care of the calling convention, I see no 
reason why that way of calling sys_clone() would fail.

Cheers,

	Michael


> -2147483631 == CLONE_IO|SIGCHLD like strace said.
>
> And why does it crash when I set a break point?
>
