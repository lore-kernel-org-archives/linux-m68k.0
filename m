Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083D6C76196
	for <linux-m68k@archiver.kernel.org>; Fri,  7 Apr 2023 04:00:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjDGEA0 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 7 Apr 2023 00:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjDGEA0 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 7 Apr 2023 00:00:26 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D69C10C1
        for <linux-m68k@lists.linux-m68k.org>; Thu,  6 Apr 2023 21:00:24 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id EC243320092B;
        Fri,  7 Apr 2023 00:00:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 07 Apr 2023 00:00:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1680840020; x=1680926420; bh=37vPuXrMYbtIe
        TzMbjymHTmi8tr/287ZOHFS21MPhOI=; b=M8Rgii9wytqwplzgAK/DZYtKEXWbQ
        YTZ8j81kZ6nMfKggQ/kVrPhTaqVk/dXF75vkXOvTIJh3/68BuohQzlFXF2tqjRDD
        cCykJRnvz2IZC2v7Qv4Xm3ODwdCZkPTBw15iPEuSfdxA+xXN8sp5SN9ohFKB1PGJ
        uAqxpvZFsNNLX9QaJgTPrne2LKtouIehdiO1dUDupQYvR92ohfRrziNcb9/nUXIJ
        rgRH/vIlfxHZsRcvhSCWUkQ7VGB7vKXkoTrYP9tj5l2LlpAIni68m6yfdruqE1OP
        inxLNH6QOk8Q/net6lFd7cpIJHPJSljQENPNMotcuAPXmc5SAVY3iQp3g==
X-ME-Sender: <xms:VJUvZChXd1fbdWw3f5XCToyGL0300QgIdUwYLy1bBqaVqdCy6IfP5Q>
    <xme:VJUvZDAo9MZLbIyeSIexcj7up0PnLVMNbuY6PaWe1Rkci01wFsI90nLaJgGFZ23OY
    f_H4rnr6LWrMsoOvQo>
X-ME-Received: <xmr:VJUvZKGUsLXp9Ws4fHtHjuQ7Nm8lLhujSgIhhLSvACjBNEHN8nSXcLeeLt4ApvL6OtA6dRFKJwqPoDSO1dlJo6uLHzyif4j3CFM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejgedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:VJUvZLRaB-le52VKuuAfm0mIpR6Fl394VBaKvu4cWYspB_Sedz7iBg>
    <xmx:VJUvZPwa08U2EK-5Y9L-f9VO-lQ3rOQRFBIn6RePs1unge4gtem5Lg>
    <xmx:VJUvZJ6BV84voPNZiBJSMTvsUIX_v8zQ8jtG4U3n8GOfcyWRnabWMg>
    <xmx:VJUvZNZEpbrD0stlWn6QW6v86xhyfp-LmFFWffnm6dWJAM24uNnvfg>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Apr 2023 00:00:17 -0400 (EDT)
Date:   Fri, 7 Apr 2023 14:03:28 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: dash behaviour, was Re: core dump analysis
In-Reply-To: <8ff53c49-331e-1388-31c5-79cf21a2c201@gmail.com>
Message-ID: <77321c26-fd0f-5975-0ab6-a726ee995358@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <37da2ca2-dd99-8417-7cae-a88e2e7fc1b6@yahoo.com> <30a1be59-a1fd-f882-1072-c7db8734b1f1@gmail.com> <39f79c2d-e803-d7b1-078f-8757ca9b1238@yahoo.com> <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com>
 <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com> <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org> <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com> <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org>
 <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home> <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org> <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com>
 <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org> <8ff53c49-331e-1388-31c5-79cf21a2c201@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, 7 Apr 2023, Michael Schmitz wrote:

> Am 05.04.2023 um 14:00 schrieb Finn Thain:
> > On Wed, 5 Apr 2023, Michael Schmitz wrote:
> >
> >> That means we may well see both signals delivered at the same time if 
> >> the parent shell wasn't scheduled to run until the second subshell 
> >> terminated (answering the question I was about to ask on your other 
> >> mail, the one about the crashy script with multiple subshells).
> >>
> >
> > How is that possible? If the parent does not get scheduled, the second 
> > fork will not take place.
> 
> I assumed subshells could run asynchronously, and the parent shell 
> continue until it hits a statement that needs the result of one of the 
> subshells.
> 

That would be nice but I don't think dash is so sophisticated as to keep 
track of data dependencies between the various expressions and commands in 
a shell script.

> What is the point of subshells, if not to allow this?
> 

$ x=$(exit 123)
$ echo $?
123

$ set -e
$ x=$(false)

Anyway, my gut says that we're barking up the wrong tree. My recent tests 
show that the failure is not uniformly random. Either the script fails 
often or it fails not at all. It's as if there was some unknown variable 
that caused dash to corrupt its own stack.

> > Running dash under gdb on real hardware is doable (RAM permitting). 
> > But the failure is intermittent even then -- it only happens during 
> > execution of certain init scripts, and I can't reproduce it by 
> > manually running those scripts.
> >
> > (Even if I could reproduce the failure under gdb, instrumenting 
> > execution in gdb can alter timing in undesirable ways...)
> >
> > So, again, the best avenue I can think of for such experiments to 
> > modify the kernel to either keep track of the times of the wait4 
> > syscalls and
> 
> The easiest way to do that is to log all wait and signal syscalls, as 
> well as process exit. That might alter timing if these log messages go 
> to the serial console though. Is that what you have in mind?
> 

What I had in mind was collecting measurements in such way that would not 
impact timing, perhaps by storing them somewhere they could be retrieved 
from the process core dump.

But that's probably not realistic and it's probably pointless anyway -- I 
don't expect to find an old bug in common code like kernel/exit.c, or in a 
hot path like those in arch/m68k/kernel/entry.S.

More likely is that some kind of bug in dash causes it to corrupt its own 
stack when conditions are just right. I just need to figure out how to 
recreate those conditions. :-/

When dash is feeling crashy, you can get results like this:

root@debian:~# sh /etc/init.d/mountdevsubfs.sh 
*** stack smashing detected ***: terminated
Aborted (core dumped)
Warning: mountdevsubfs should be called with the 'start' argument.
root@debian:~# sh /etc/init.d/mountdevsubfs.sh 
*** stack smashing detected ***: terminated
Aborted (core dumped)
Warning: mountdevsubfs should be called with the 'start' argument.
root@debian:~# sh /etc/init.d/mountdevsubfs.sh 
*** stack smashing detected ***: terminated
Aborted (core dumped)
Warning: mountdevsubfs should be called with the 'start' argument.
root@debian:~# sh /etc/init.d/mountdevsubfs.sh 
*** stack smashing detected ***: terminated
Aborted (core dumped)
Warning: mountdevsubfs should be called with the 'start' argument.
root@debian:~# 

But when it's not feeling crashy, you can't:

root@debian:~# sh /etc/init.d/mountdevsubfs.sh 
Warning: mountdevsubfs should be called with the 'start' argument.
root@debian:~# sh /etc/init.d/mountdevsubfs.sh 
Warning: mountdevsubfs should be called with the 'start' argument.
root@debian:~# sh /etc/init.d/mountdevsubfs.sh 
Warning: mountdevsubfs should be called with the 'start' argument.
root@debian:~# sh /etc/init.d/mountdevsubfs.sh 
Warning: mountdevsubfs should be called with the 'start' argument.

The only way I have found to alter dash's inclination to crash is to 
reboot. (I said previously I was unable to reproduce this in a single user 
mode shell but it turned out to be more subtle.)

> > signal delivery and/or push the timing one way or the other e.g. by 
> > delaying signal delivery, altering scheduler behaviour, etc. But I 
> > don't have code for that. I did try adding random delays around 
> > kernel_wait4() but it didn't have any effect...
> >
> 
> I wonder whether it's possible to delay process exit (and parent process 
> signaling) by placing the exit syscall on a timer workqueue. But the 
> same effect could be had by inserting a sleep before subshell exit ...
> 
> And causing a half-dead task to schedule in order to delay signaling 
> doesn't seem safe to me ...
> 
