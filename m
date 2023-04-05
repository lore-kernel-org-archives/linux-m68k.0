Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0909AC76188
	for <linux-m68k@archiver.kernel.org>; Wed,  5 Apr 2023 01:57:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236386AbjDEB5Q (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 4 Apr 2023 21:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236228AbjDEB5P (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 4 Apr 2023 21:57:15 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 517503599
        for <linux-m68k@lists.linux-m68k.org>; Tue,  4 Apr 2023 18:57:14 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 898D43200A77;
        Tue,  4 Apr 2023 21:57:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 04 Apr 2023 21:57:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1680659831; x=1680746231; bh=tqE/I/sEglgze
        BwM9iiMj3XIF8W7OeFEENh2QVdJ4fU=; b=m8dgXVyQp+ZJ8cSP5FwI2SYpCTByj
        aNPN+2hhUkJEGNrmfnQqVDacuEjRvvp4hGG/udHr04ypDp08y9dYQKkYPOAAyRwb
        NjoEoca68jOU0q2OzPTT7N3+cUA7a4orc79xuYW8YQfbU8UjHAWibf7gAjXJs/24
        IG4sWbFtdhh/Uo0vY/XpKiVPr7RIilUJC85/w8QA9FvkdZOh+8GG7KNEJso8stil
        ZGD8vwCIzXAhmvWMmVT3wuXKu82oD0PoK4r3uGwxRObfVFAMo8FRDXAYQ7BsNM//
        C8GBIysHQpXRivBVQFPK0FZX0P7LUy5KW68LxL41ZSFA2VgBjjKFOSSSw==
X-ME-Sender: <xms:dtUsZNRVIFxR5F9fH-DGTcTD4wPkSX5aatFvOeTVsmvOSehVMDTrtA>
    <xme:dtUsZGwfR4ZLbUQRmcA78wRiqk7bet2MLtcFn5-QYkTS7fbILNw7oiLg4q-yMV7gY
    SayXD_mxccGZljMgkU>
X-ME-Received: <xmr:dtUsZC3Bc6kgqXlMwBz_XfLxrBdXX0PDNdCCTw3tsiJuPLSSWxjDJApQsvLDSK7SdeHebhRrBpHh83y_YEy3EcKJrdTknQgoJOM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejtddghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpefghfeihfegvdffueekffettedtjeduudeludekudeuhfefhfejiedvgefg
    uddtveenucffohhmrghinhepuggvsghirghnrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieek
    khdrohhrgh
X-ME-Proxy: <xmx:dtUsZFAaN4ZXjVDNnY6OWCJt7RbACEnxc7riLTSNsC_kmckT1dOmlA>
    <xmx:dtUsZGjYHYXJXd9gGhBOLL-N86Sdj06JsxnTHRbUNHN5eXpEEGq8nQ>
    <xmx:dtUsZJow6a6T2cSHp-vBVqkbvm2GEeu8g0q9X0f5mHSr063j1xRJ7Q>
    <xmx:d9UsZKYfWR-zL_wn4QDPk21HvAcJXAfIy6m9oC7WVoB7RGbnSsFRlA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 21:57:07 -0400 (EDT)
Date:   Wed, 5 Apr 2023 12:00:04 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     Andreas Schwab <schwab@linux-m68k.org>,
        debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: core dump analysis, was Re: stack smashing detected
In-Reply-To: <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com>
Message-ID: <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <a8f06e4b-db28-c8f9-5e21-3ea0f3eebacd@linux-m68k.org> <bb27b393-3d02-f42c-5c7f-c27d4936ece9@linux-m68k.org> <37da2ca2-dd99-8417-7cae-a88e2e7fc1b6@yahoo.com> <30a1be59-a1fd-f882-1072-c7db8734b1f1@gmail.com>
 <39f79c2d-e803-d7b1-078f-8757ca9b1238@yahoo.com> <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com> <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com> <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org> <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com>
 <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home>
 <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org> <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 5 Apr 2023, Michael Schmitz wrote:

> On 4/04/23 12:13, Finn Thain wrote:
> > It looks like I messed up. waitproc() appears to have been invoked
> > twice, which is why wait3 was invoked twice...
> >
> > GNU gdb (Debian 13.1-2) 13.1
> > ...
> > (gdb) set osabi GNU/Linux
> > (gdb) file /bin/dash
> > Reading symbols from /bin/dash...
> > Reading symbols from
> > /usr/lib/debug/.build-id/aa/4160f84f3eeee809c554cb9f3e1ef0686b8dcc.debug...
> > (gdb) b waitproc
> > Breakpoint 1 at 0xc346: file jobs.c, line 1168.
> > (gdb) b jobs.c:1180
> > Breakpoint 2 at 0xc390: file jobs.c, line 1180.
> > (gdb) run
> > Starting program: /usr/bin/dash
> > [Thread debugging using libthread_db enabled]
> > Using host libthread_db library "/lib/m68k-linux-gnu/libthread_db.so.1".
> > # x=$(:)
> > [Detaching after fork from child process 570]
> >
> > Breakpoint 1, waitproc (status=0xeffff86a, block=1) at jobs.c:1168
> > 1168    jobs.c: No such file or directory.
> > (gdb) c
> > Continuing.
> >
> > Breakpoint 2, waitproc (status=0xeffff86a, block=1) at jobs.c:1180
> > 1180    in jobs.c
> > (gdb) info locals
> > oldmask = {__val = {1997799424, 49154, 396623872, 184321, 3223896090, 53249,
> >      3836788738, 1049411610, 867225601, 3094609920, 0, 1048580, 2857693183,
> >      4184129547, 3435708442, 863764480, 184321, 3844141055, 4190425089,
> >      4127248385, 3094659084, 597610497, 4135112705, 3844079616, 131072,
> >      37355520, 184320, 3878473729, 3844132865, 3094663168, 3549089793,
> >      3844132865}}
> > flags = 2
> > err = 570
> > oldmask = <optimized out>
> > flags = <optimized out>
> > err = <optimized out>
> > (gdb) c
> > Continuing.
> >
> > Breakpoint 1, waitproc (status=0xeffff86a, block=0) at jobs.c:1168
> > 1168    in jobs.c
> > (gdb) c
> > Continuing.
> >
> > Breakpoint 2, waitproc (status=0xeffff86a, block=0) at jobs.c:1180
> > 1180    in jobs.c
> > (gdb) info locals
> > oldmask = {__val = {1997799424, 49154, 396623872, 184321, 3223896090, 53249,
> >      3836788738, 1049411610, 867225601, 3094609920, 0, 1048580, 2857693183,
> >      4184129547, 3435708442, 863764480, 184321, 3844141055, 4190425089,
> >      4127248385, 3094659084, 597610497, 4135112705, 3844079616, 131072,
> >      37355520, 184320, 3878473729, 3844132865, 3094663168, 3549089793,
> >      3844132865}}
> > flags = 3
> > err = -1
> > oldmask = <optimized out>
> > flags = <optimized out>
> > err = <optimized out>
> > (gdb) c
> > Continuing.
> > #
> >
> That means we may well see both signals delivered at the same time if the
> parent shell wasn't scheduled to run until the second subshell terminated
> (answering the question I was about to ask on your other mail, the one about
> the crashy script with multiple subshells).
> 

How is that possible? If the parent does not get scheduled, the second 
fork will not take place.

> Now does waitproc() handle that case correctly? The first signal 
> delivered results in err == child PID so the break is taken, causing 
> exit from waitproc().

I don't follow. Can you rephrase that perhaps?

For a single subshell, the SIGCHLD signal can be delivered before wait4 is 
called or after it returns. For example, $(sleep 5) seems to produce the 
latter whereas $(:) tends to produce the former.

> Does waitproc() get called repeatedly until an error is returned?
> 

It's complicated...
https://sources.debian.org/src/dash/0.5.12-2/src/jobs.c/?hl=1122#L1122

I don't care that much what dash does as long as it isn't corrupting it's 
own stack, which is a real possibility, and one which gdb's data watch 
point would normally resolve. And yet I have no way to tackle that.

I've been running gdb under QEMU, where the failure is not reproducible. 
Running dash under gdb on real hardware is doable (RAM permitting). But 
the failure is intermittent even then -- it only happens during execution 
of certain init scripts, and I can't reproduce it by manually running 
those scripts.

(Even if I could reproduce the failure under gdb, instrumenting execution 
in gdb can alter timing in undesirable ways...)

So, again, the best avenue I can think of for such experiments to modify 
the kernel to either keep track of the times of the wait4 syscalls and 
signal delivery and/or push the timing one way or the other e.g. by 
delaying signal delivery, altering scheduler behaviour, etc. But I don't 
have code for that. I did try adding random delays around kernel_wait4() 
but it didn't have any effect...
