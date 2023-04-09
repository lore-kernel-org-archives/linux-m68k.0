Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7DBAC761A6
	for <linux-m68k@archiver.kernel.org>; Sun,  9 Apr 2023 07:28:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjDIH2x (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 9 Apr 2023 03:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjDIH2w (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 9 Apr 2023 03:28:52 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0070659D7
        for <linux-m68k@lists.linux-m68k.org>; Sun,  9 Apr 2023 00:28:50 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 9E4245C00FE;
        Sun,  9 Apr 2023 03:28:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 09 Apr 2023 03:28:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1681025327; x=1681111727; bh=1s9vHm/rFXL9X
        fc2+bwIY0yuCltrvy3D53aWYVfIwfs=; b=Vh+sigbCKitp1J5d9r4xw5bNWUSYv
        S6t7uQmWGYMexix1PfIv88a6hWWQDFWlUdAQNjZvFiXnLwrW9CbE2Mmb7cfpKlw7
        GU9RjhOolQ/AcE+YW4/e8MOESWm0uK+LdUmEKbNYCKB0miYUM7FNmVjUDIA3eGDk
        C8dDiC2pngQ/qLAgkf/jf59IJfawBnrI9kOE0STg1Ml8y0D0fFi3Wy9QlveItw6m
        A72kMfJ5Yhl6aJq0gW2yjWxuhrcuFXrkXAilQTKs4AiMvh0H/j+PcWXebLBmfdYL
        7U9pdhkz9dV8J+STXmq32PCcoGbvavK+zjDagoJUMrTaqWjZTvDLoF7KQ==
X-ME-Sender: <xms:L2kyZCasI1ceTQQraj1hwzww90yA9gHadQdCxYl7fWUfD81OZCKa_Q>
    <xme:L2kyZFaM2BUpo1mheyXe4FChh6EMLksxtlqgLrGtrz9L3vKHPYW_d2spPj0zm4T34
    74Ej0CjOpo27ROv3Gg>
X-ME-Received: <xmr:L2kyZM9c8cVUbsr03zr53aOUpWDi3fxEelODert9flz4mMtvXBhvSdnJH9uPlCgdexec0ZI8hHLaS4SRaWMDySYyz6GcO52vFJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejledgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:L2kyZErq3XbfRBgKWH-CBaVnotouTllh9eOFjzI6RV3d2QAtEYvsIw>
    <xmx:L2kyZNoBd2G2t-IVKH3StQuA2MO7jpSWZa9piyjvIlQkspkaH6OPBw>
    <xmx:L2kyZCRCNK2F7f5uX0V1WCp4o7aiW0GwhnNCn-XpNl2icwt8o9xUXw>
    <xmx:L2kyZMSk-Y9lpI2iYMUmlHi3vvaB4dy5SSizItoqKKF8E_7QTt5xYQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Apr 2023 03:28:44 -0400 (EDT)
Date:   Sun, 9 Apr 2023 17:32:03 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: dash behaviour, was Re: core dump analysis
In-Reply-To: <5cc7a1f6-e19d-bb8e-3ddc-e1ef796c145f@gmail.com>
Message-ID: <cb7b71a0-5ecd-e416-e54a-f0d38e4e578a@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com> <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org> <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com> <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org>
 <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org> <87zg7rap45.fsf@igel.home> <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org>
 <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com> <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org> <8ff53c49-331e-1388-31c5-79cf21a2c201@gmail.com>
 <77321c26-fd0f-5975-0ab6-a726ee995358@linux-m68k.org> <7d9d587a-c3e1-5d89-4962-b92e025821af@gmail.com> <c84c961a-b98d-ff9c-ae25-3f5a26395a15@linux-m68k.org> <5cc7a1f6-e19d-bb8e-3ddc-e1ef796c145f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, 9 Apr 2023, Michael Schmitz wrote:

> Am 09.04.2023 um 16:42 schrieb Finn Thain:
> > On Sun, 9 Apr 2023, Michael Schmitz wrote:
> >
> >>>
> >>> The only way I have found to alter dash's inclination to crash is to 
> >>> reboot. (I said previously I was unable to reproduce this in a 
> >>> single user mode shell but it turned out to be more subtle.)
> >>
> >> I wonder what could change from one boot to another - can you have 
> >> dash (and its subshells) dump /proc/self/maps and see whether there's 
> >> any variation in that? But what we really need is the physical 
> >> mappings. How can we find those?
> >>
> >> With the kernel RNG disabled, I would expect neither of these 
> >> mappings to change between boots?
> >>
> >
> > It looks like the stack area still changes across invocations:
> 
> Yep, but running the same commands in the same order across different 
> boots, does it still change?
> 
> (I'm making a huge assumption here - that timing of the boot process and 
> hence evolution of the kernel RNG is sufficiently deterministic. And 
> this might apply only to the shells run from sysvinit, since that does 
> require no keyboard input ...)
> 
> Looks like cat < /proc/self/maps | grep stack would give us enough 
> information without overwhelming the serial console?
> 
> OTOH - if you can show the error is gone without stack address 
> randomization, that would be a hint maybe?
> 

The results below were produced with 'norandmaps' added to the kernel 
parameters to avoid ASLR.

root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
root@debian:~# echo 3 > /proc/sys/vm/drop_caches 
[  913.560000] bash (1024): drop_caches: 3
root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
root@debian:~# sh /etc/init.d/mountdevsubfs.sh start
*** stack smashing detected ***: terminated
Aborted (core dumped)
root@debian:~# sh -c "md5sum < /proc/self/maps"
baacbaf944fb01d3200d924da7f7a815  -
root@debian:~# sh -c "md5sum < /proc/self/maps"
baacbaf944fb01d3200d924da7f7a815  -
root@debian:~# sh -c "md5sum < /proc/self/maps"
baacbaf944fb01d3200d924da7f7a815  -
root@debian:~# sh -c "md5sum < /proc/self/maps"
baacbaf944fb01d3200d924da7f7a815  -
root@debian:~# sh -c "cat < /proc/self/maps"
c0000000-c0021000 r-xp 00000000 08:06 38780      /usr/lib/m68k-linux-gnu/ld.so.1
c0021000-c0023000 rw-p 00000000 00:00 0 
c0023000-c0024000 r--p 00021000 08:06 38780      /usr/lib/m68k-linux-gnu/ld.so.1
c0024000-c0026000 rw-p 00022000 08:06 38780      /usr/lib/m68k-linux-gnu/ld.so.1
c002a000-c0199000 r-xp 00000000 08:06 38786      /usr/lib/m68k-linux-gnu/libc.so.6
c0199000-c019a000 ---p 0016f000 08:06 38786      /usr/lib/m68k-linux-gnu/libc.so.6
c019a000-c019c000 r--p 00170000 08:06 38786      /usr/lib/m68k-linux-gnu/libc.so.6
c019c000-c01a0000 rw-p 00172000 08:06 38786      /usr/lib/m68k-linux-gnu/libc.so.6
c01a0000-c01aa000 rw-p 00000000 00:00 0 
d0000000-d0019000 r-xp 00000000 08:06 32713      /usr/bin/dash
d001b000-d001c000 r--p 00019000 08:06 32713      /usr/bin/dash
d001c000-d001d000 rw-p 0001a000 08:06 32713      /usr/bin/dash
d001d000-d001f000 rwxp 00000000 00:00 0          [heap]
d001f000-d0040000 rwxp 00000000 00:00 0          [heap]
effdf000-f0000000 rw-p 00000000 00:00 0          [stack]


So I guess this bug has more to do with timing and little to do with 
state, contrary to my guesswork above. And no doubt I will have to 
contradict myself again if/when it turns out that uninitialized memory is 
a factor :-/
