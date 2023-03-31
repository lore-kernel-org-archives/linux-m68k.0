Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23DAC7619A
	for <linux-m68k@archiver.kernel.org>; Fri, 31 Mar 2023 03:30:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjCaDaj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 30 Mar 2023 23:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjCaDae (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 30 Mar 2023 23:30:34 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4103118F8D
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Mar 2023 20:30:31 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 6FF015C021D;
        Thu, 30 Mar 2023 23:30:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 30 Mar 2023 23:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1680233429; x=1680319829; bh=0fjdS5R2UFvCj
        FAmo0jnOTFCOxDFse3OHOMfn2N/vVU=; b=XqtTnadU7fyMLhXkKQL4VQQwt06To
        aDg/qQdHHfcp9YT7e7CSAvBlgpKpwU1aZaA1FECgGG9wBzSHH0ITfJbXog1h+XnD
        Or6EiVVKkg5zmfo7aEqMQT2w6c9z0QUS/a9kGqx+QNwJ6FRNKfSEBacL7Pp+V3H9
        CerBgUFs1bsmD/3e3L90oPmPkcOmIs5nWuxz0HL7SkBosgS5YWg+izZXe1pgPOSz
        CV6HsZehR60GFIkEM6kU1wsKbX2FLLaduz+qxBq17sfZ8Icwt5gfzEdtSlLDyFNB
        vlzUnPGZvm8hl4xL3Fj9Phsb/lgDeJlXMCoyAxzya55eVNcmDkF5VwGTw==
X-ME-Sender: <xms:1VMmZNazU7mLHTnSWqUW3uGcPqHX78lTDNLnnz4wh7knQYxGiNohOg>
    <xme:1VMmZEbyc8Fnm2XGXOjWxiBKjYi8JlHyUtFrvmoTkudmamZHY5AlPYhw4AUYFqEaz
    uwLLIhdryYIbU8fbTs>
X-ME-Received: <xmr:1VMmZP9j8Y1lqfQLlgHQRVzZjsHQuOZQ6YY2vOs4lWhX5gIrSvr3tRLyj5mjm9s8jFPkcaiNmiiXIe6FImhIsYOjoDS7wt803NM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeitddgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvufgjkfhfgggtsehttdertd
    dttddvnecuhfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidq
    mheikehkrdhorhhgqeenucggtffrrghtthgvrhhnpeffjeegjeefuedvleekgeeileegud
    fhgfduudeifefhhffhvdfghfdttddtjeejteenucffohhmrghinhepuggvsghirghnrdho
    rhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:1VMmZLoZluWfhBZyXZ9qKuVkqSgHmndjUxICTkc88hmBHzsbJ06OLg>
    <xmx:1VMmZIrUwdtpJHQcrgO6JQ0flJA0XjqCaYc_WWVzCovCwdEyr8iTjg>
    <xmx:1VMmZBQXmtKWdqaN1CuSwVyPbpD2tjBmZXjy5VEk-z__tY32FPk20g>
    <xmx:1VMmZOHnTeGlL2lDDL_92ftGujqb-5AYEqpFCgx3HjsoP7mveWqTww>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Mar 2023 23:30:26 -0400 (EDT)
Date:   Fri, 31 Mar 2023 14:33:29 +1100 (AEDT)
From:   Finn Thain <fthain@linux-m68k.org>
To:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: core dump analysis, was Re: stack smashing detected
In-Reply-To: <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org>
Message-ID: <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <203b8fd4-6618-27a8-7d18-d50e7accfa4b@gmail.com> <33d7ea3e-9bd2-16e4-4d9a-f7aa5657a0f7@yahoo.com> <c267a9fc-7788-f905-d984-e0372d50d0ec@gmail.com> <dff09ed2-af93-fd43-6d6f-045a6fc0e30d@gmail.com>
 <c01e2f1c-425f-478d-918e-cd1fd37e0008@yahoo.com> <aee359a6-b5e0-fbe2-3988-779f8601f106@gmail.com> <8042d988-6dd9-8170-60e9-cdf19118440f@yahoo.com> <a8f06e4b-db28-c8f9-5e21-3ea0f3eebacd@linux-m68k.org> <bb27b393-3d02-f42c-5c7f-c27d4936ece9@linux-m68k.org>
 <37da2ca2-dd99-8417-7cae-a88e2e7fc1b6@yahoo.com> <30a1be59-a1fd-f882-1072-c7db8734b1f1@gmail.com> <39f79c2d-e803-d7b1-078f-8757ca9b1238@yahoo.com> <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com> <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com>
 <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org> <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com> <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On 28 March 2023, I wrote,

> 
> Looking at sysdeps/unix/sysv/linux/wait3.c, I guess the only possible 
> place for a buffer overrun would be struct __rusage64 usage64. 
> https://sources.debian.org/src/glibc/2.36-8/sysdeps/unix/sysv/linux/wait3.c/?hl=41#L41
> 

... but now I see the usage64 variable is not involved at all because 
__wait3() was passed a NULL pointer: 
https://sources.debian.org/src/dash/0.5.12-2/src/jobs.c/?hl=1179#L1179

So NULL (rather than &usage64) was passed to the wait4() syscall which 
means the kernel didn't invoke copy_to_user() at all. AFAICS there's no 
possible buffer overflow in __wait3(), __wait4_time64() etc.

That suggests to a problem with GCC's SSP detector.

Here's a more complete backtrace and some disassembly.

# gdb
GNU gdb (Debian 13.1-2) 13.1
...
(gdb) set osabi GNU/Linux
(gdb) file /bin/dash
Reading symbols from /bin/dash...
Reading symbols from /usr/lib/debug/.build-id/aa/4160f84f3eeee809c554cb9f3e1ef0686b8dcc.debug...
(gdb) 
(gdb) core /root/core.0
warning: core file may not match specified executable file.
[New LWP 366]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/m68k-linux-gnu/libthread_db.so.1".
Core was generated by `/bin/sh /etc/init.d/mountkernfs.sh reload'.
Program terminated with signal SIGABRT, Aborted.
#0  __pthread_kill_implementation (threadid=3222954656, signo=6, no_tid=0)
    at pthread_kill.c:44
44      pthread_kill.c: No such file or directory.
(gdb) bt
#0  __pthread_kill_implementation (threadid=3222954656, signo=6, no_tid=0)
    at pthread_kill.c:44
#1  0xc00a7080 in __pthread_kill_internal (signo=6, threadid=3222954656)
    at pthread_kill.c:78
#2  __GI___pthread_kill (threadid=3222954656, signo=6) at pthread_kill.c:89
#3  0xc0064c22 in __GI_raise (sig=6) at ../sysdeps/posix/raise.c:26
#4  0xc0052faa in __GI_abort () at abort.c:79
#5  0xc009b328 in __libc_message (action=<optimized out>, fmt=<optimized out>)
    at ../sysdeps/posix/libc_fatal.c:155
#6  0xc012a3c2 in __GI___fortify_fail (
    msg=0xc0182c5e "stack smashing detected") at fortify_fail.c:26
#7  0xc012a3a0 in __stack_chk_fail () at stack_chk_fail.c:24
#8  0xc00e0172 in __wait3 (stat_loc=<optimized out>, options=<optimized out>, 
    usage=<optimized out>) at ../sysdeps/unix/sysv/linux/wait3.c:41
#9  0xd000c38e in waitproc (status=0xefee110e, block=1) at jobs.c:1179
#10 waitone (block=1, job=0xd0021930) at jobs.c:1055
#11 0xd000c5b8 in dowait (block=1, jp=0xd0021930) at jobs.c:1137
#12 0xd000ddb0 in waitforjob (jp=0xd0021930) at jobs.c:1014
#13 0xd000aade in expbackq (flag=324, cmd=0xd00222c4) at expand.c:520
#14 argstr (p=<optimized out>, flag=68) at expand.c:335
#15 0xd000b5ce in expandarg (arg=0xd00222ac, arglist=0xefee13bc, flag=4)
    at expand.c:192
#16 0xd0007e2a in evalcommand (cmd=<optimized out>, flags=<optimized out>)
    at eval.c:855
#17 0xd0006ffc in evaltree (n=0xd0022294, flags=0) at eval.c:300
#18 0xd0006e96 in evaltree (n=0xd0022294, flags=0) at eval.c:300
#19 0xd0006e6a in evaltree (n=0xd002224c, flags=0) at eval.c:292
#20 0xd0006e6a in evaltree (n=0xd00220d4, flags=0) at eval.c:292
#21 0xd0006e6a in evaltree (n=0xd002208c, flags=0) at eval.c:292
#22 0xd000746a in evalfun (func=0xd0022078, argc=<optimized out>, 
    argv=0xd001e61c <stackbase+376>, flags=<optimized out>) at eval.c:1009
#23 0xd0008176 in evalcommand (cmd=<optimized out>, flags=<optimized out>)
    at eval.c:921
#24 0xd0006ffc in evaltree (n=0xd001e588 <stackbase+228>, flags=1)
    at eval.c:300
#25 0xd00084c8 in evaltreenr (flags=1, n=0xd001e588 <stackbase+228>)
    at eval.c:347
#26 evalbackcmd (n=<optimized out>, result=0xefee17d4) at eval.c:650
#27 0xd000a984 in expbackq (flag=324, cmd=0xd001e588 <stackbase+228>)
    at expand.c:495
#28 argstr (p=<optimized out>, flag=68) at expand.c:335
#29 0xd000b5ce in expandarg (arg=0xd001e5b0 <stackbase+268>, 
    arglist=0xefee191c, flag=4) at expand.c:192
#30 0xd0007e2a in evalcommand (cmd=<optimized out>, flags=<optimized out>)
    at eval.c:855
#31 0xd0006ffc in evaltree (n=0xd001e5c0 <stackbase+284>, flags=0)
    at eval.c:300
#32 0xd000e3c0 in cmdloop (top=0) at main.c:246
#33 0xd000e588 in dotcmd (argc=2, argv=<optimized out>) at main.c:341
#34 0xd0007a12 in evalbltin (cmd=0xd001b598 <builtincmd>, 
    argc=<optimized out>, argv=<optimized out>, flags=<optimized out>)
    at eval.c:967
#35 0xd00080ca in evalcommand (cmd=<optimized out>, flags=<optimized out>)
    at eval.c:910
#36 0xd0006ffc in evaltree (n=0xd001e4e8 <stackbase+68>, flags=0) at eval.c:300
#37 0xd000e3c0 in cmdloop (top=1) at main.c:246
#38 0xd0005018 in main (argc=<optimized out>, argv=<optimized out>)
    at main.c:181
(gdb) frame 8
#8  0xc00e0172 in __wait3 (stat_loc=<optimized out>, options=<optimized out>, 
    usage=<optimized out>) at ../sysdeps/unix/sysv/linux/wait3.c:41
41      ../sysdeps/unix/sysv/linux/wait3.c: No such file or directory.
(gdb) info frame
Stack level 8, frame at 0xefee10e0:
 pc = 0xc00e0172 in __wait3 (../sysdeps/unix/sysv/linux/wait3.c:41); 
    saved pc = 0xd000c38e
 called by frame at 0xefee11dc, caller of frame at 0xefee106c
 source language c.
 Arglist at 0xefee10d8, args: stat_loc=<optimized out>, 
    options=<optimized out>, usage=<optimized out>
 Locals at 0xefee10d8, Previous frame's sp is 0xefee10e0
 Saved registers:
  a2 at 0xefee106c, a3 at 0xefee1070, a5 at 0xefee1074, fp at 0xefee10d8,
  pc at 0xefee10dc
(gdb) x/32z 0xefee1060
0xefee1060:     0xc0182c5e      0xc0198000      0xc00e0172      0xd001e718
0xefee1070:     0xd001e498      0xd001b874      0x00170700      0x00170700
0xefee1080:     0x00170700      0x00005360      0x0000e920      0x00000006
0xefee1090:     0x00002000      0x00000002      0x00171f20      0x00171f20
0xefee10a0:     0x00171f20      0x000000e0      0x000000e0      0x00000006
0xefee10b0:     0x00000004      0x00000004      0x00000174      0x00000000
0xefee10c0:     0x00000000      0x00000008      0x0000016f      0x0000000a
0xefee10d0:     0x00000000      0x00ac3dbe      0xd001c1ec      0xd000c38e
(gdb)
0xefee10e0:     0xefee111e      0x00000000      0x00000000      0x00000001
0xefee10f0:     0x00000001      0xefee1284      0x00000044      0xd0017714
0xefee1100:     0x00000100      0xd0021930      0xd001c1ec      0xd001e498
0xefee1110:     0xd001b874      0xefee1308      0xc0023e8c      0xefee0000
0xefee1120:     0x00000044      0xd0017714      0x00000100      0xefee1274
0xefee1130:     0xc0023e8c      0xd001c028      0xd001b874      0xefee1208
0xefee1140:     0x00000000      0xc0023e8c      0x00000000      0x00000000
0xefee1150:     0x00000000      0x00000000      0x00000000      0x00000000
(gdb) print &usage64
$1 = (struct __rusage64 *) 0xefee107c
(gdb) disass
Dump of assembler code for function __wait3:
   0xc00e0070 <+0>:     linkw %fp,#-96
   0xc00e0074 <+4>:     moveml %a2-%a3/%a5,%sp@-
   0xc00e0078 <+8>:     lea %pc@(0xc0198000),%a5
   0xc00e0080 <+16>:    movel %fp@(8),%d0
   0xc00e0084 <+20>:    moveal %fp@(16),%a2
   0xc00e0088 <+24>:    moveal %a5@(108),%a3
   0xc00e008c <+28>:    movel %a3@,%fp@(-4)
   0xc00e0090 <+32>:    tstl %a2
   0xc00e0092 <+34>:    beqw 0xc00e0152 <__wait3+226>
   0xc00e0096 <+38>:    pea %fp@(-92)
   0xc00e009a <+42>:    movel %fp@(12),%sp@-
   0xc00e009e <+46>:    movel %d0,%sp@-
   0xc00e00a0 <+48>:    pea 0xffffffff
   0xc00e00a4 <+52>:    bsrl 0xc00e0174 <__GI___wait4_time64>
   0xc00e00aa <+58>:    lea %sp@(16),%sp
   0xc00e00ae <+62>:    tstl %d0
   0xc00e00b0 <+64>:    bgts 0xc00e00c8 <__wait3+88>
   0xc00e00b2 <+66>:    moveal %fp@(-4),%a0
   0xc00e00b6 <+70>:    movel %a3@,%d1
   0xc00e00b8 <+72>:    cmpl %a0,%d1
   0xc00e00ba <+74>:    bnew 0xc00e016c <__wait3+252>
   0xc00e00be <+78>:    moveml %fp@(-108),%a2-%a3/%a5
   0xc00e00c4 <+84>:    unlk %fp
   0xc00e00c6 <+86>:    rts
   0xc00e00c8 <+88>:    pea 0x44
   0xc00e00cc <+92>:    clrl %sp@-
   0xc00e00ce <+94>:    pea %a2@(4)
   0xc00e00d2 <+98>:    movel %d0,%fp@(-96)
   0xc00e00d6 <+102>:   bsrl 0xc00b8850 <__GI_memset>
   0xc00e00dc <+108>:   movel %fp@(-88),%a2@
   0xc00e00e0 <+112>:   movel %fp@(-80),%a2@(4)
   0xc00e00e6 <+118>:   movel %fp@(-72),%a2@(8)
   0xc00e00ec <+124>:   movel %fp@(-64),%a2@(12)
   0xc00e00f2 <+130>:   movel %fp@(-60),%a2@(16)
   0xc00e00f8 <+136>:   movel %fp@(-56),%a2@(20)
   0xc00e00fe <+142>:   movel %fp@(-52),%a2@(24)
   0xc00e0104 <+148>:   movel %fp@(-48),%a2@(28)
   0xc00e010a <+154>:   movel %fp@(-44),%a2@(32)
   0xc00e0110 <+160>:   movel %fp@(-40),%a2@(36)
   0xc00e0116 <+166>:   movel %fp@(-36),%a2@(40)
   0xc00e011c <+172>:   movel %fp@(-32),%a2@(44)
   0xc00e0122 <+178>:   movel %fp@(-28),%a2@(48)
   0xc00e0128 <+184>:   movel %fp@(-24),%a2@(52)
   0xc00e012e <+190>:   movel %fp@(-20),%a2@(56)
   0xc00e0134 <+196>:   movel %fp@(-16),%a2@(60)
   0xc00e013a <+202>:   movel %fp@(-12),%a2@(64)
   0xc00e0140 <+208>:   movel %fp@(-8),%a2@(68)
   0xc00e0146 <+214>:   lea %sp@(12),%sp
   0xc00e014a <+218>:   movel %fp@(-96),%d0
   0xc00e014e <+222>:   braw 0xc00e00b2 <__wait3+66>
   0xc00e0152 <+226>:   clrl %sp@-
   0xc00e0154 <+228>:   movel %fp@(12),%sp@-
   0xc00e0158 <+232>:   movel %d0,%sp@-
   0xc00e015a <+234>:   pea 0xffffffff
   0xc00e015e <+238>:   bsrl 0xc00e0174 <__GI___wait4_time64>
   0xc00e0164 <+244>:   lea %sp@(16),%sp
   0xc00e0168 <+248>:   braw 0xc00e00b2 <__wait3+66>
   0xc00e016c <+252>:   bsrl 0xc012a38c <__stack_chk_fail>
End of assembler dump.
(gdb) 

Note that __wait3(stat_loc, options, NULL) reduces to,

	return __wait4_time64(-1, stat_loc, options, NULL);

So I think the branch at __wait3+34 was taken, and after bsr 
__GI___wait4_time64, the branch at __wait3+248 would have been taken. Then 
the canary located at %fp@(-4) was compared with %a3@. From the hex dump 
above, %fp@(-4) is 0xd000c38e.

As for %a3, we know its value when SIGABRT was caught, and if I'm not 
mistaken, %a3 was not altered by __stack_chk_fail or 
__GI___fortify_fail...

(gdb) frame 7
#7  0xc012a3a0 in __stack_chk_fail () at stack_chk_fail.c:24
24      stack_chk_fail.c: No such file or directory.
(gdb) info frame
Stack level 7, frame at 0xefee106c:
 pc = 0xc012a3a0 in __stack_chk_fail (stack_chk_fail.c:24); 
    saved pc = 0xc00e0172
 called by frame at 0xefee10e0, caller of frame at 0xefee1060
 source language c.
 Arglist at 0xefee105c, args: 
 Locals at 0xefee105c, Previous frame's sp is 0xefee106c
 Saved registers:
  a5 at 0xefee1064, pc at 0xefee1068
(gdb) disass
Dump of assembler code for function __stack_chk_fail:
   0xc012a38c <+0>:     movel %a5,%sp@-
   0xc012a38e <+2>:     lea %pc@(0xc0198000),%a5
   0xc012a396 <+10>:    movel %a5@(10696),%sp@-
   0xc012a39a <+14>:    bsrl 0xc012a3a0 <__GI___fortify_fail>
End of assembler dump.
(gdb) frame 6
#6  0xc012a3c2 in __GI___fortify_fail (
    msg=0xc0182c5e "stack smashing detected") at fortify_fail.c:26
26      fortify_fail.c: No such file or directory.
(gdb) info frame
Stack level 6, frame at 0xefee1060:
 pc = 0xc012a3c2 in __GI___fortify_fail (fortify_fail.c:26); 
    saved pc = 0xc012a3a0
 called by frame at 0xefee106c, caller of frame at 0xefee1044
 source language c.
 Arglist at 0xefee1040, args: msg=0xc0182c5e "stack smashing detected"
 Locals at 0xefee1040, Previous frame's sp is 0xefee1060
 Saved registers:
  d2 at 0xefee1050, d3 at 0xefee1054, a5 at 0xefee1058, pc at 0xefee105c
(gdb) disass
Dump of assembler code for function __GI___fortify_fail:
   0xc012a3a0 <+0>:     moveml %d2-%d3/%a5,%sp@-
   0xc012a3a4 <+4>:     lea %pc@(0xc0198000),%a5
   0xc012a3ac <+12>:    movel %sp@(16),%d3
   0xc012a3b0 <+16>:    movel %a5@(10700),%d2
   0xc012a3b4 <+20>:    movel %d3,%sp@-
   0xc012a3b6 <+22>:    movel %d2,%sp@-
   0xc012a3b8 <+24>:    pea 0x1
   0xc012a3bc <+28>:    bsrl 0xc009b1d8 <__libc_message>
=> 0xc012a3c2 <+34>:    lea %sp@(12),%sp
   0xc012a3c6 <+38>:    movel %d3,%sp@-
   0xc012a3c8 <+40>:    movel %d2,%sp@-
   0xc012a3ca <+42>:    pea 0x1
   0xc012a3ce <+46>:    bsrl 0xc009b1d8 <__libc_message>
   0xc012a3d4 <+52>:    lea %sp@(12),%sp
   0xc012a3d8 <+56>:    bras 0xc012a3b4 <__GI___fortify_fail+20>
End of assembler dump.
(gdb) info reg
d0             0x0                 0
d1             0x16e               366
d2             0xc0182c76          -1072157578
d3             0xc0182c5e          -1072157602
d4             0xefee1122          -269610718
d5             0x1                 1
d6             0xd0021930          -805168848
d7             0x100               256
a0             0xc01a62a0          0xc01a62a0
a1             0xffffffe6          0xffffffe6
a2             0x0                 0x0
a3             0xefee1068          0xefee1068
a4             0xd001e71c          0xd001e71c <pending_sig>
a5             0xc0198000          0xc0198000
fp             0xefee10d8          0xefee10d8
sp             0xefee1044          0xefee1044
ps             0x10                [ X ]
pc             0xc012a3c2          0xc012a3c2 <__GI___fortify_fail+34>
fpcontrol      0x0                 0
fpstatus       0x0                 0
fpiaddr        0x0                 0x0

So %a3 was a pointer into stack frame 6??

(gdb) x/z $a3
0xefee1068:     0xc00e0172

Clearly 0xd000c38e != 0xc00e0172 (that is, %fp@(-4) != %a3@) but did the 
canary value change? It rather looks like the canary pointer is wrong...

Another way to find the value of %a3 during __wait3() execution is to look 
at its initialization: moveal %a5@(108),%a3. And we can see from 'info 
frame' above that __stack_chk_fail() saved %a5 at 0xefee1064.

(gdb) x/4z 0xefee1060
0xefee1060:     0xc0182c5e      0xc0198000      0xc00e0172      0xd001e718
(gdb) x/z *0xefee1064+108
0xc019806c:     Cannot access memory at address 0xc019806c

Anyway, if the analysis is right (hopefully someone can confirm that) 
this looks like a GCC bug.

I'm not sure why it only shows up during (sysvinit) init script execution. 
The canary value is derived from /dev/urandom so I guess the failure is 
intermittent because it is connected to kernel PRNG state during early 
startup.
