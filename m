Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC164C76196
	for <linux-m68k@archiver.kernel.org>; Tue,  4 Apr 2023 00:10:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjDDAKZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 3 Apr 2023 20:10:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjDDAKX (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 3 Apr 2023 20:10:23 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF0DE3ABF
        for <linux-m68k@lists.linux-m68k.org>; Mon,  3 Apr 2023 17:10:21 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 80FD15C01F1;
        Mon,  3 Apr 2023 20:10:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 03 Apr 2023 20:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1680567018; x=1680653418; bh=j6FKPBcKKt4z9
        g+eX+Kx/lsFsh/iGXPxCHV+/aO3v+g=; b=MG8zNZYI5oQUPDwejoZHWGJh4WwgW
        w7sKnYtcHAHfz17gCRHFSh4tocRAtsLmeQMPuUqSZkscFcPATNzS89hzAeV/LDmf
        t/Z2rc5tKJRU7yZ657j1qB5vrt+Vd3KhgfaZJWS+Tt7tHYc18iMb5ygc0qs3ZXun
        +Ffe9ICYtrd8LDQyWK2+GjIMrIrAwjcjpr08aga0vj90yzrWl09fCDN01XU04j9F
        aWoGc+sngTvbsdmS1ZLq8HubsEr5qFTDqR7c47ZDl1CZH4eE6BtMag+gGKEYJk+f
        mKvU3QVo+5H/PfwOanFmt887ZXdpOQArGOCPjGUREsWD0XjQDgGXVR0Xw==
X-ME-Sender: <xms:6morZCdwgdiFokstjjoe21NIA7DDHn79bZDE4f-ZJ6DtwvrNE5FSWg>
    <xme:6morZMPmyfeHtD3vXt0xO0QgwbVII34lpbdZO65gJAs3h1apmWq_beQOcpPmkA5fj
    vQsgvXZXzmkpeKZ3QM>
X-ME-Received: <xmr:6morZDjLbrPKDeE1nl86F_mUBSjxr2lBQJ_X_9Xf3CErer_5P22SyVJ4Biv6lMJRpR9pn2raD7-z9SZ_EXsR_zLK2ASuAx6hHTI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeikedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpedttdevfeevvdelvddtveekveekudejfeefieekgfevleevkeduvefhvdeh
    iefggfenucffohhmrghinhepuggvsghirghnrdhorhhgpdhsthgrtghkohhvvghrfhhloh
    ifrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:6morZP9CRB1uRj9We7do0DVeUauTTmWapNZKbcONl1BmKPUpntUSSA>
    <xmx:6morZOtkmesoQzTnCQ7zIec_s8QAbgjsgb6QBtFmtIgkL0jn_xzVpw>
    <xmx:6morZGG2hXTMdeFKAXey2rhXLKzT796px0F5lLsdCKCjipx584n0RQ>
    <xmx:6morZDUPm1b8lNTXxOFN1wVFlHFq-Bb8HNKEYXHOQdaKPbbMiVqnRA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Apr 2023 20:10:15 -0400 (EDT)
Date:   Tue, 4 Apr 2023 10:13:24 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: core dump analysis, was Re: stack smashing detected
In-Reply-To: <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com>
Message-ID: <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <aee359a6-b5e0-fbe2-3988-779f8601f106@gmail.com> <8042d988-6dd9-8170-60e9-cdf19118440f@yahoo.com> <a8f06e4b-db28-c8f9-5e21-3ea0f3eebacd@linux-m68k.org> <bb27b393-3d02-f42c-5c7f-c27d4936ece9@linux-m68k.org>
 <37da2ca2-dd99-8417-7cae-a88e2e7fc1b6@yahoo.com> <30a1be59-a1fd-f882-1072-c7db8734b1f1@gmail.com> <39f79c2d-e803-d7b1-078f-8757ca9b1238@yahoo.com> <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com> <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com>
 <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org> <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com> <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org>
 <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home> <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org> <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 3 Apr 2023, Michael Schmitz wrote:

> On 2/04/23 22:46, Finn Thain wrote:
> 
> > This is odd:
> >
> > https://sources.debian.org/src/dash/0.5.12-2/src/jobs.c/?hl=1165#L1165
> >
> >    1176          do {
> >    1177                  gotsigchld = 0;
> >    1178                  do
> >    1179                          err = wait3(status, flags, NULL);
> >    1180                  while (err < 0 && errno == EINTR);
> >    1181
> >    1182                  if (err || (err = -!block))
> >    1183                          break;
> >    1184
> >    1185                  sigblockall(&oldmask);
> >    1186
> >    1187                  while (!gotsigchld && !pending_sig)
> >    1188                          sigsuspend(&oldmask);
> >    1189
> >    1190                  sigclearmask();
> >    1191          } while (gotsigchld);
> >    1192
> >    1193  return err;
> >
> > Execution of dash under gdb doesn't seem to agree with the source code
> > above.
> >
> > If wait3() returns the child pid then the break should execute. And it
> > does return the pid (4107) but the while loop was not terminated. Hence
> > wait3() was called again and the same breakpoint was hit again. Also, the
> 
> I wonder whether line 1182 got miscompiled by gcc. As err == 4107 it's > 
> 0 and the break clearly ought to have been taken, and the second 
> condition (which changes err) does not need to be examined.  Do the same 
> ordering constraints apply to '||' as to '&&' ?
> 

AFAICT, the source code is valid. This article has some information: 
https://stackoverflow.com/questions/628526/is-short-circuiting-logical-operators-mandated-and-evaluation-order

It looks like I messed up. waitproc() appears to have been invoked
twice, which is why wait3 was invoked twice...

GNU gdb (Debian 13.1-2) 13.1
...
(gdb) set osabi GNU/Linux
(gdb) file /bin/dash
Reading symbols from /bin/dash...
Reading symbols from /usr/lib/debug/.build-id/aa/4160f84f3eeee809c554cb9f3e1ef0686b8dcc.debug...
(gdb) b waitproc
Breakpoint 1 at 0xc346: file jobs.c, line 1168.
(gdb) b jobs.c:1180
Breakpoint 2 at 0xc390: file jobs.c, line 1180.
(gdb) run
Starting program: /usr/bin/dash 
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/m68k-linux-gnu/libthread_db.so.1".
# x=$(:)
[Detaching after fork from child process 570]

Breakpoint 1, waitproc (status=0xeffff86a, block=1) at jobs.c:1168
1168    jobs.c: No such file or directory.
(gdb) c
Continuing.

Breakpoint 2, waitproc (status=0xeffff86a, block=1) at jobs.c:1180
1180    in jobs.c
(gdb) info locals
oldmask = {__val = {1997799424, 49154, 396623872, 184321, 3223896090, 53249, 
    3836788738, 1049411610, 867225601, 3094609920, 0, 1048580, 2857693183, 
    4184129547, 3435708442, 863764480, 184321, 3844141055, 4190425089, 
    4127248385, 3094659084, 597610497, 4135112705, 3844079616, 131072, 
    37355520, 184320, 3878473729, 3844132865, 3094663168, 3549089793, 
    3844132865}}
flags = 2
err = 570
oldmask = <optimized out>
flags = <optimized out>
err = <optimized out>
(gdb) c
Continuing.

Breakpoint 1, waitproc (status=0xeffff86a, block=0) at jobs.c:1168
1168    in jobs.c
(gdb) c
Continuing.

Breakpoint 2, waitproc (status=0xeffff86a, block=0) at jobs.c:1180
1180    in jobs.c
(gdb) info locals
oldmask = {__val = {1997799424, 49154, 396623872, 184321, 3223896090, 53249, 
    3836788738, 1049411610, 867225601, 3094609920, 0, 1048580, 2857693183, 
    4184129547, 3435708442, 863764480, 184321, 3844141055, 4190425089, 
    4127248385, 3094659084, 597610497, 4135112705, 3844079616, 131072, 
    37355520, 184320, 3878473729, 3844132865, 3094663168, 3549089793, 
    3844132865}}
flags = 3
err = -1
oldmask = <optimized out>
flags = <optimized out>
err = <optimized out>
(gdb) c
Continuing.
# 

> What does the disassembly of this section look like?
> 
> > while loop should have ended after the first iteration because gotsigchild
> > should have been set by the signal handler which executed before wait3()
> > even returned...
> 
> Setting gotsigchild > 0 would cause the while loop to continue, no?
> 

Right. Sorry for the noise.
