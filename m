Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D8ADC7619A
	for <linux-m68k@archiver.kernel.org>; Sun,  2 Apr 2023 10:43:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbjDBKn4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 2 Apr 2023 06:43:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjDBKnc (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 2 Apr 2023 06:43:32 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB98113E2
        for <linux-m68k@lists.linux-m68k.org>; Sun,  2 Apr 2023 03:43:30 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 8C8C4320076F;
        Sun,  2 Apr 2023 06:43:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sun, 02 Apr 2023 06:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1680432208; x=1680518608; bh=F35xo6DgKnwBv
        5bj/IYbKCEDiwNYD16JelgVng8OzU0=; b=AQQrWm34DIrA2/KNxxKIKb8QN11Ms
        se9tjOu/L4YqjhVwr5sDwuFlofBuoJTj//1M/PL4T88xwIH8fxaO8GWS/Ac06j/u
        XJtiz1kXU7rNxShpb27oVTbNKtDED9xQIAFK/CoCjIn/zowvzdnJj5j0Ha1eXxGq
        cF/rTKYSd1xHGvDwoyaihi6AoHO9y7GBOK1D9HCnHuUGNjkGNln1bAwbZBmtqatR
        pugDlcDlf3XuGewKPkpC/E4ylgKnG6zhHncs6Ul0uzdtCkRscabud8Y92oGFGyMQ
        JYFJ2OHul+EbL5OKNL12J0nqkYEhZllBms5NIFlATn2jowHSXA79ycWjQ==
X-ME-Sender: <xms:T1wpZGJwkJxlBWleRRdSHGtt-ro_5Zsdj3nlM1us1NLiauw4BsBLvg>
    <xme:T1wpZOIBxkxGMKF9w9WxUGJjVq3HatTR3xTZfkuA2D7AZWKZQ9yjN2ecK4MvDTa1Z
    K5eWuERQqfmTEzjmxc>
X-ME-Received: <xmr:T1wpZGsxuEW1VCWZ5YMgVWC6hUq9oYTKCj6CQQjWWzl-rvMNc_vOlgPEvGSK3isD8nkS2XZCDVAaZevTbb8w9YMM9shIOgftZmo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeihedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpefghfeihfegvdffueekffettedtjeduudeludekudeuhfefhfejiedvgefg
    uddtveenucffohhmrghinhepuggvsghirghnrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieek
    khdrohhrgh
X-ME-Proxy: <xmx:T1wpZLaYWsmgRHBeKOcNJH53cMHkTqZ2kdrY3NsnxYW98cr-qzj73g>
    <xmx:T1wpZNZN0vhyAd4Xo1ViWvpo-qhOATn7GO02KyQ2htV2kxluoPN8oQ>
    <xmx:T1wpZHAEqLkqN1Zt5XbDij0ndQJlDhAazS0Lxy-b7WuWd71AiRxEhQ>
    <xmx:UFwpZODwMyWTdtM5oiR1M5cAtqioHBRMc2ux2m8XCz1-Cbvy0kz5Dw>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Apr 2023 06:43:25 -0400 (EDT)
Date:   Sun, 2 Apr 2023 20:46:31 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Andreas Schwab <schwab@linux-m68k.org>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: core dump analysis, was Re: stack smashing detected
In-Reply-To: <87zg7rap45.fsf@igel.home>
Message-ID: <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <dff09ed2-af93-fd43-6d6f-045a6fc0e30d@gmail.com> <c01e2f1c-425f-478d-918e-cd1fd37e0008@yahoo.com> <aee359a6-b5e0-fbe2-3988-779f8601f106@gmail.com> <8042d988-6dd9-8170-60e9-cdf19118440f@yahoo.com>
 <a8f06e4b-db28-c8f9-5e21-3ea0f3eebacd@linux-m68k.org> <bb27b393-3d02-f42c-5c7f-c27d4936ece9@linux-m68k.org> <37da2ca2-dd99-8417-7cae-a88e2e7fc1b6@yahoo.com> <30a1be59-a1fd-f882-1072-c7db8734b1f1@gmail.com> <39f79c2d-e803-d7b1-078f-8757ca9b1238@yahoo.com>
 <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com> <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com> <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org> <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com> <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org>
 <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On Sat, 1 Apr 2023, Andreas Schwab wrote:

> On Apr 01 2023, Finn Thain wrote:
> 
> > So, in summary, the canary validation failed in this case not because 
> > the canary got clobbered but because %a3 got clobbered, somewhere 
> > between __wait3+24 and __wait3+70 (below).
> >
> > The call to __GI___wait4_time64 causes %a3 to be saved to and restored 
> > from the stack, so stack corruption seems to be a strong possibility 
> > to explain the change in %a3.
> >
> > But if that's what happened, I'd expect __GI___wait4_time64 to report 
> > stack smashing, not __wait3...
> 
> The stask smashing probably didn't fire in __wait4_time64, because it 
> hit the saved register area, not the canary (which reside on the 
> opposite ends of the stack frame).
> 

OK.

This is odd:

https://sources.debian.org/src/dash/0.5.12-2/src/jobs.c/?hl=1165#L1165

  1176          do {
  1177                  gotsigchld = 0;
  1178                  do
  1179                          err = wait3(status, flags, NULL);
  1180                  while (err < 0 && errno == EINTR);
  1181
  1182                  if (err || (err = -!block))
  1183                          break;
  1184                  
  1185                  sigblockall(&oldmask);
  1186
  1187                  while (!gotsigchld && !pending_sig)
  1188                          sigsuspend(&oldmask);
  1189
  1190                  sigclearmask();
  1191          } while (gotsigchld);
  1192
  1193  return err;

Execution of dash under gdb doesn't seem to agree with the source code 
above.

If wait3() returns the child pid then the break should execute. And it 
does return the pid (4107) but the while loop was not terminated. Hence 
wait3() was called again and the same breakpoint was hit again. Also, the 
while loop should have ended after the first iteration because gotsigchild 
should have been set by the signal handler which executed before wait3() 
even returned...

...
(gdb) c
Continuing.
# 
# 
# x=$(:)
[Detaching after fork from child process 4107]

Program received signal SIGCHLD, Child status changed.
0xc00e81b6 in __GI___wait4_time64 (pid=-1, stat_loc=0xeffff87a, options=2, 
    usage=0x0) at ../sysdeps/unix/sysv/linux/wait4.c:35
35      ../sysdeps/unix/sysv/linux/wait4.c: No such file or directory.
(gdb) c
Continuing.

Breakpoint 3, waitproc (status=0xeffff86a, block=1) at jobs.c:1180
1180    jobs.c: No such file or directory.
(gdb) info locals
oldmask = {__val = {1101825, 3844132865, 2072969216, 192511, 4190371840, 
    4509697, 3836788738, 1049415681, 3837317121, 3094671359, 4184080384, 
    536870943, 717475840, 3485913089, 3836792833, 2072969216, 184321, 
    3844141055, 4190425089, 4127248385, 3094659084, 597610497, 4137734145, 
    3844079616, 131072, 269156352, 184320, 3878473729, 3844132865, 3094663168, 
    3549089793, 3844132865}}
flags = 2
err = 4107
oldmask = <optimized out>
flags = <optimized out>
err = <optimized out>
(gdb) print errno
$6 = 2
(gdb) c
Continuing.

Breakpoint 3, waitproc (status=0xeffff86a, block=0) at jobs.c:1180
1180    in jobs.c
(gdb) info locals
oldmask = {__val = {1101825, 3844132865, 2072969216, 192511, 4190371840, 
    4509697, 3836788738, 1049415681, 3837317121, 3094671359, 4184080384, 
    536870943, 717475840, 3485913089, 3836792833, 2072969216, 184321, 
    3844141055, 4190425089, 4127248385, 3094659084, 597610497, 4137734145, 
    3844079616, 131072, 269156352, 184320, 3878473729, 3844132865, 3094663168, 
    3549089793, 3844132865}}
flags = 3
err = -1
oldmask = <optimized out>
flags = <optimized out>
err = <optimized out>
(gdb) print errno
$7 = 10
(gdb) 
