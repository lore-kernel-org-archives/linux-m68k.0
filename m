Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873F8C761A6
	for <linux-m68k@archiver.kernel.org>; Sun,  9 Apr 2023 04:39:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjDIEj2 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 9 Apr 2023 00:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjDIEj2 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 9 Apr 2023 00:39:28 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE24C40FB
        for <linux-m68k@lists.linux-m68k.org>; Sat,  8 Apr 2023 21:39:26 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 34B995C00D2;
        Sun,  9 Apr 2023 00:39:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 09 Apr 2023 00:39:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1681015166; x=1681101566; bh=6xUV+pB0OjZdP
        YlqiP2nURe4pL+I4KJuvslA4EXwnsI=; b=YwmxOwBPTJYtO89FBRhaPp6WcDni2
        HX5LTjAfIuKjACFR/J6D5/HyME5ZikXcPGpmAnBu+G2OkQMy0y0+cZdngmxEWUrc
        vivbfZ+o7eaTLbVdzDW2h/GIM7fT5tNwieXEdjcsyVmtaqrVditkhqiioI8u862J
        YWwbYNwrHjYmrB1TGSNBXT9Xh1QTjIoX6b6/Z3vlIltm8COwNw4AAbKBdCVG1wbg
        0CSbX1vjObSP3MZSOjGOGHbxI8WyKqGnn60Him2DHdPOgYK6Csnr15pQDTxVOaai
        llZM5ZpSE2rWQa17b8/QYOzzY8a05xNttj2mn51fiV3Kp+7lElcuWuKqQ==
X-ME-Sender: <xms:fkEyZKfAUTmr1e3JhnBI6_7ZCu7rK90WLX5FjkhCsDJvzREGal_oDg>
    <xme:fkEyZEMtz46pEaHSxN2cAsgEVULpXNNBADd5zSHdql00SrAGy7PpHEP_3k-i5fUAN
    F6R6NKuaDZN8xKg3pE>
X-ME-Received: <xmr:fkEyZLjPBLx0UzP3GZzmpmF_WCyjd4591vlTalUFWz-qX_n5mGaqxNLQ2jZcltkLD2w9DOAML4qGgl99w9eN6mLGVTVatMIkol4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejkedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:fkEyZH8tL7OCr_IIXDuMzyMAcWq91BjGzbo1LZMV7jO7cOSx7kvpkw>
    <xmx:fkEyZGs9Tv065Dl2X0g4Y8B4P8CuULvlIKjvq983llbsCiuwvB3MxA>
    <xmx:fkEyZOHkCA9zH8sPob9VRFqFhuXB1vHa-u9P2vE6ZDzSXGanM4rWlA>
    <xmx:fkEyZM0rh69eZXnjngUiT0BD0Zte0nRj2q8Msce3f1iLlr8B2B_kHg>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Apr 2023 00:39:23 -0400 (EDT)
Date:   Sun, 9 Apr 2023 14:42:42 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org
Subject: Re: dash behaviour, was Re: core dump analysis
In-Reply-To: <7d9d587a-c3e1-5d89-4962-b92e025821af@gmail.com>
Message-ID: <c84c961a-b98d-ff9c-ae25-3f5a26395a15@linux-m68k.org>
References: <4a9c1d0d-07aa-792e-921f-237d5a30fc44.ref@yahoo.com> <39f79c2d-e803-d7b1-078f-8757ca9b1238@yahoo.com> <c47abfdc-31c8-e7ed-1c14-90f68710f25d@gmail.com> <040ad66a-71dd-001b-0446-36cbd6547b37@yahoo.com> <5b9d64bb-2adc-20a2-f596-f99bf255b5cc@linux-m68k.org>
 <56bd9a33-c58a-58e0-3956-e63c61abe5fe@yahoo.com> <1725f7c1-2084-a404-653d-9e9f8bbe961c@linux-m68k.org> <e10b8e06-6a36-5c83-89da-bec8fd7d3ed9@linux-m68k.org> <19d1f2ac-67dd-5415-b64a-1e1b4451f01e@linux-m68k.org> <ef5bcf6f-3541-50c2-9b6a-5e9d2f9c68d5@linux-m68k.org>
 <87zg7rap45.fsf@igel.home> <5a5588ca-81c3-3f4c-fd43-c95e90b27939@linux-m68k.org> <67f6bc5f-e1fc-64b9-cb3c-1698cf4daf51@gmail.com> <9eea635f-c947-eae7-09fa-d39f00d91532@linux-m68k.org> <3dfea52a-b09e-517a-c3ca-4b559a3d9ce4@gmail.com>
 <23ddfd2a-1123-45ae-866d-158d45e23ba2@linux-m68k.org> <8ff53c49-331e-1388-31c5-79cf21a2c201@gmail.com> <77321c26-fd0f-5975-0ab6-a726ee995358@linux-m68k.org> <7d9d587a-c3e1-5d89-4962-b92e025821af@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, 9 Apr 2023, Michael Schmitz wrote:

> >
> > The only way I have found to alter dash's inclination to crash is to 
> > reboot. (I said previously I was unable to reproduce this in a single 
> > user mode shell but it turned out to be more subtle.)
> 
> I wonder what could change from one boot to another - can you have dash 
> (and its subshells) dump /proc/self/maps and see whether there's any 
> variation in that? But what we really need is the physical mappings. How 
> can we find those?
> 
> With the kernel RNG disabled, I would expect neither of these mappings 
> to change between boots?
> 

It looks like the stack area still changes across invocations:

# sh
# cat < /proc/self/maps
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
eff9f000-effc0000 rw-p 00000000 00:00 0          [stack]
# sh
# cat < /proc/self/maps
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
effd8000-efff9000 rw-p 00000000 00:00 0          [stack]
# sh
# cat < /proc/self/maps
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
#

That can be disabled easily though (see below). I'll have to modify some 
init scripts to find out what effect it has.

# setarch -R sh
# sh
# cat < /proc/self/maps
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
# md5sum < /proc/self/maps
baacbaf944fb01d3200d924da7f7a815  -
# sh
# md5sum < /proc/self/maps
baacbaf944fb01d3200d924da7f7a815  -
# sh
# md5sum < /proc/self/maps
baacbaf944fb01d3200d924da7f7a815  -
