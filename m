Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDAE7C761A6
	for <linux-m68k@archiver.kernel.org>; Tue, 28 Mar 2023 03:35:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjC1Dfi (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Mar 2023 23:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbjC1DfJ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Mar 2023 23:35:09 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB713C32
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Mar 2023 20:34:43 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 7C2AA320092A;
        Mon, 27 Mar 2023 23:34:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 27 Mar 2023 23:34:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1679974481; x=1680060881; bh=AhIj+tjC+n7yU
        E4WXQ+e+YfxhCUag4nho6eJgRAgadM=; b=vJjLVF3F7HLCaocWXpRUvPB4W85/7
        QAt/bLv7XBQIRablJGFI6k40wE8GVX/Cgpmvwx2dwBB7oASlwqIAYam4QKQnc6IU
        n8TG77CT38BHYi6rvRSv6B2Qv6tTrnr8Y/b6s+2eUi0oJo8zeAbBKYKw2WGaNwl2
        8uQ0BBOohymI1KDEwRv3FUtqGNO7+hEbOPAywF2qeaBhrF0WgQo2GAwrMZdoI9Yt
        CuLKGTBajWuR01lOkebLGi4HyXM0zxHhC64ExD3ez2NIU/g6ulPSE6li0VVDtR0K
        /ADNckmYskyGPh0Y4b7zIh/+Pg4YsFY/nU0/Vtp8dYYknQLiLSnI7JEbw==
X-ME-Sender: <xms:UGAiZO4CkT1Nr-x9Lhw_MzGF6KwM27yL-EjoCDSHFSEsDEjM9WDPUg>
    <xme:UGAiZH4vvt45ldRrzjWt6HeOCYaNtY4K0GmkBUJEMVhFZ3dLZxCUqo5Onz_j2tlPN
    NOHkFsB1pI04x876Lo>
X-ME-Received: <xmr:UGAiZNfELbkqC-Uhm3jcM1RbV7bcsGaCClyuFM5QTAIRy4Qlrx-6XGp2jVE-yrr73puox9XsC_pg0K8wHKF6TLVEA3AxRgr9Zcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehfedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvufgjkfhfgggtsehttdertd
    dttddvnecuhfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidq
    mheikehkrdhorhhgqeenucggtffrrghtthgvrhhnpeffjeegjeefuedvleekgeeileegud
    fhgfduudeifefhhffhvdfghfdttddtjeejteenucffohhmrghinhepuggvsghirghnrdho
    rhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:UGAiZLJlbSS0wSBZRO8kJfE14MmInYFsRsYnnWcuCg2_A8fn4cLMyg>
    <xmx:UGAiZCL9TSTQ6GxaivdT1wbNSsQDGzNvYQ-FbdBs6EiqlvntUBo2Rw>
    <xmx:UGAiZMzv394TXa8z2qsxIQ4GmkwtQx6UghPtkHLPeE_1-tW3bXAvCA>
    <xmx:UWAiZBmU_WS_EHFNbJfhle3ACV8FS-5QjSAD8Hr61MWnepyRjvLJcw>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Mar 2023 23:34:37 -0400 (EDT)
Date:   Tue, 28 Mar 2023 14:37:38 +1100 (AEDT)
From:   Finn Thain <fthain@linux-m68k.org>
To:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: core dump analysis, was Re: stack smashing detected
In-Reply-To: <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org>
Message-ID: <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <8d54f302-0a39-b8c7-4115-5c10c1d3769f@gmail.com> <203b8fd4-6618-27a8-7d18-d50e7accfa4b@gmail.com> <33d7ea3e-9bd2-16e4-4d9a-f7aa5657a0f7@yahoo.com> <c267a9fc-7788-f905-d984-e0372d50d0ec@gmail.com>
 <dff09ed2-af93-fd43-6d6f-045a6fc0e30d@gmail.com> <c01e2f1c-425f-478d-918e-cd1fd37e0008@yahoo.com> <aee359a6-b5e0-fbe2-3988-779f8601f106@gmail.com> <8042d988-6dd9-8170-60e9-cdf19118440f@yahoo.com> <a8f06e4b-db28-c8f9-5e21-3ea0f3eebacd@linux-m68k.org>
 <bb27b393-3d02-f42c-5c7f-c27d4936ece9@linux-m68k.org> <37da2ca2-dd99-8417-7cae-a88e2e7fc1b6@yahoo.com> <30a1be59-a1fd-f882-1072-c7db8734b1f1@gmail.com> <39f79c2d-e803-d7b1-078f-8757ca9b1238@yahoo.com> <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com>
 <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com> <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org> <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com> <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, 18 Feb 2023, I wrote:

> On Fri, 17 Feb 2023, Stan Johnson wrote:
> 
> > 
> > That's not to say a SIGABRT is ignored, it just doesn't kill PID 1.
> > 
> 
> I doubt that /sbin/init is generating the "stack smashing detected" 
> error but you may need to modify it to find out. If you can't figure out 
> which userland binary is involved, you'll have to focus on your custom 
> kernel binary, just as I proposed in my message dated 8 Feb 2023.
> 

Using the core dump I generated on my Mac LC III, and using a workaround 
for the gdb regression, I was able to get the backtrace below.

root@(none):/root# gdb
GNU gdb (Debian 13.1-2) 13.1
Copyright (C) 2023 Free Software Foundation, Inc.
...
(gdb) set osabi GNU/Linux
(gdb) exec /bin/dash
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
#9  0xd000c38e in ?? ()
#10 0xefee111e in ?? ()
#11 0x00000000 in ?? ()
(gdb) 

It appears that the failure was in glibc (though I guess the root cause 
may lie elsewhere). I have two more core files generated by dash (actually 
by `/bin/sh /etc/rcS.d/S08mountall.sh start') that give the same 
backtrace. So even though the failure is intermittent, the site of the 
buffer overrun seems to be consistent.

Looking at sysdeps/unix/sysv/linux/wait3.c, I guess the only possible 
place for a buffer overrun would be struct __rusage64 usage64.
https://sources.debian.org/src/glibc/2.36-8/sysdeps/unix/sysv/linux/wait3.c/?hl=41#L41

(gdb) select-frame 8
(gdb) print usage64
$3 = {ru_utime = {tv_sec = 6481621047248640, tv_usec = 91671782025504}, 
  ru_stime = {tv_sec = 25769811968, tv_usec = 8591449888}, {
    ru_maxrss = 1515296, __ru_maxrss_word = 1515296}, {ru_ixrss = 1515296, 
    __ru_ixrss_word = 1515296}, {ru_idrss = 224, __ru_idrss_word = 224}, {
    ru_isrss = 224, __ru_isrss_word = 224}, {ru_minflt = 6, 
    __ru_minflt_word = 6}, {ru_majflt = 4, __ru_majflt_word = 4}, {
    ru_nswap = 4, __ru_nswap_word = 4}, {ru_inblock = 372, 
    __ru_inblock_word = 372}, {ru_oublock = 0, __ru_oublock_word = 0}, {
    ru_msgsnd = 0, __ru_msgsnd_word = 0}, {ru_msgrcv = 8, 
    __ru_msgrcv_word = 8}, {ru_nsignals = 367, __ru_nsignals_word = 367}, {
    ru_nvcsw = 10, __ru_nvcsw_word = 10}, {ru_nivcsw = 0, 
    __ru_nivcsw_word = 0}}
(gdb)

Of course, at this point the damage has already been done and the culprit 
has gone. I guess there was a buffer overrun during the call to 
__wait4_time64(). 
https://sources.debian.org/src/glibc/2.36-8/sysdeps/unix/sysv/linux/wait4.c/?hl=26#L26

It's hard to read glibc source code without knowing what all the macros 
were set to (such as __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 and 
__TIMESIZE).

It would be disappointing if rusage64_to_rusage() in __wait3() was being 
applied to the result of rusage32_to_rusage64() from __wait4_time64(). 
Perhaps the ifdefs are arranged in such a way that it doesn't happen...

Anyway, does anyone know how to get a hex dump of the whole stack frame 
including the canary, in case there is something to be learned from that?
