Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA08C433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 09:04:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4F0F60F93
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 09:04:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235495AbhIPJGA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 16 Sep 2021 05:06:00 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:45473 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235383AbhIPJF4 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Thu, 16 Sep 2021 05:05:56 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id D8DA25C0213;
        Thu, 16 Sep 2021 05:04:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 16 Sep 2021 05:04:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=DYvpJ0
        Bqy+rlEO5uaZAc1jllXa7rejKQZ1vp7I2Sp2c=; b=FAusD1U8gYa0+5GPLwiECb
        z14cK+LRnGJEFy8x5h+yoXYU3QfnFILM1xzjqUHKD67d8gDsJhJynfQOl+niiaG1
        YhNFdi3oCdTVMTbzN9pETjm5y9ZvqbSFTQrfFpiSIfzRSCF5+zNIITPm1AS5UFa8
        /x+BCcSV1fOhmJuKzbHabyUQNZyyCqiGHauAOP+au0nwmabgU/2kNRMY+FROB9F/
        Sljq+K0l/ccqDs+3NxKohztRVXUyRa6F2jIaaFaUJdlZCWsP7Dwq+62aD8TBP+mw
        uexmZ7RPGavjFMS3VKYThz9scW0TFj5BLOfymTStAvgmyx4/6wTIhku4YPBY9C2g
        ==
X-ME-Sender: <xms:owhDYe0NzcJfv5VOfpy8bQfs87S4Hsi8cV0Uw78bVlVtw52lEN4WuA>
    <xme:owhDYRH4Q9DTzsm3bKssLnfEJTYJ4fp8hOkUBhuioRmV1ifF_6aKGeT8AQaWQftyY
    Nh1IaL5-RnXGQN0KPA>
X-ME-Received: <xmr:owhDYW493CKx_iY6wJKCqcyrpT5v97rOlghuRFQr6AbB_QATn5zLXahJ6h18i0wEXzoi2bnVx5PyMpsIcJhx7FKpy2GDymExn4rTXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepffduhfegfedvieetudfgleeugeehkeekfeevfffhieevteelvdfhtdevffet
    uedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:owhDYf1nQgG7d7qfJyPVLv4cutqSFCpp2XJ0QYthDtcBceFPbThKCg>
    <xmx:owhDYRFZM7IPdxZpY3t1xZ5V7pKTdMPER4xcLqSBgh6-KVwQkkh7kA>
    <xmx:owhDYY_OdFykJcSKf9amb-uuNjB5f9ykDYWX3SokA06kCrQqcxpbhQ>
    <xmx:owhDYQy8DumX1JJwKWgdouO_yDIZoRB4OUkcqUp7dHI_Ksw6fFjfpw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 05:04:33 -0400 (EDT)
Date:   Thu, 16 Sep 2021 19:04:28 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     linux-m68k@vger.kernel.org
Subject: Re: Mainline kernel crashes, was Re: RFC: remove set_fs for m68k
In-Reply-To: <c5ee66a3-5227-b49a-c9d7-c8f69a8aca97@gmail.com>
Message-ID: <19f1bb6c-5ac5-e7d-c7f4-f89b5e6c8ec6@linux-m68k.org>
References: <20210721170529.GA14550@lst.de> <b2c55280-657b-51c2-065c-3fc93db050b9@gmail.com> <d7b8f7eb-fc18-c8d-fe3e-dcdf19d3f4b@linux-m68k.org> <755e55ba-4ce2-b4e4-a628-5abc183a557a@linux-m68k.org> <b52a10fe-3e4b-5740-d3f8-52bce3bc988@linux-m68k.org>
 <31f27da7-be60-8eb-9834-748b653c2246@linux-m68k.org> <ed2ca322-b957-cd52-8d2f-a8edd2785625@linux-m68k.org> <977bb34f-6de9-3a9e-818f-b1aa0758f78f@gmail.com> <fa8682aa-c5f4-7995-166d-8fa899594b19@linux-m68k.org> <42b30d4f-b871-51ea-1b0e-479f4fe096eb@gmail.com>
 <7ac7a41a-53f9-b13c-83fa-2c6b8ef2b90@linux-m68k.org> <0477f373-86c9-dacb-a7b1-25fe4b3befd3@gmail.com> <2c624213-6a4-799c-45e-a1be578dd5f@linux-m68k.org> <d59a44c-ddea-a774-d217-2484ad582dc0@linux-m68k.org> <82f6f161-b9e0-bf9b-3c20-aa2ce810d99a@gmail.com>
 <4564a46-2115-9058-2a9-2d77736291c@linux-m68k.org> <b43a3f6d-3d91-e1c6-bafd-103326087d50@gmail.com> <189062a2-2b82-8185-2a5b-75a9282dca79@linux-m68k.org> <c5ee66a3-5227-b49a-c9d7-c8f69a8aca97@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 15 Sep 2021, Michael Schmitz wrote:

> On 15/09/21 13:38, Finn Thain wrote:
> > On Mon, 13 Sep 2021, Michael Schmitz wrote:
> > 
> > > > > Incidentally - have you ever checked whether Al Viro's signal 
> > > > > handling fixes have an impact on these bugs?
> > > > 
> > > > I will try that patch series if you think it is related.
> > > 
> > > Initial tests look promising (but I've said that before).
> > 
> > Here's what I found in recent tests on my Quadra 630.
> > 
> > The usual stress-ng panic can happen without list corruption, even 
> > with local_irq_save/restore() added to do_IRQ().
> > 
> > The panic did not show up at all during stress tests with Al's signal 
> > handling patch series.
> > 
> > I think my results are consistent with yours.
> 
> Thanks - that's encouraging to hear. My tests with Christoph's patches 
> on top of Al's haven't shown any further errors either, but I'll give 
> that combination some more workout.

Further stress testing here using Al's patches did eventually result in 
the same panic that I see using mainline (below).

> 
> Would you care to add your tested-by for Al's patches?

Sure. I haven't seen any regression, so
Tested-by: Finn Thain <fthain@linux-m68k.org>

---
running --mmap -1 --mmap-osync --mmap-bytes 100% -t 60 --timestamp --no-rand-seed --times
stress-ng: 22:52:11.63 info:  [5491] setting to a 60 second run per stressor
stress-ng: 22:52:11.64 info:  [5491] dispatching hogs: 1 mmap
[ 9858.090000] Kernel panic - not syncing: Aiee, killing interrupt handler!
[ 9858.090000] CPU: 0 PID: 5493 Comm: stress-ng Not tainted 5.14.0-multi-00003-gb2406d5d331a #7
[ 9858.090000] Stack from 00b4bde4:
[ 9858.090000]         00b4bde4 00488d5f 00488d5f 00040000 00b4be00 003f3630 00488d5f 00b4be20
[ 9858.090000]         003f2636 00040000 418004fc 00b4a000 009f8540 00b4a000 00a07440 00b4be5c
[ 9858.090000]         0003171e 00480965 00000009 418004fc 00b4a000 00000000 073f8000 00000009
[ 9858.090000]         00000008 00b4bf38 00a07440 00000006 00000000 00000001 00b4be6c 000318d4
[ 9858.090000]         00000009 01438f30 00b4beb8 0003ac18 00000009 0000000f 0000000e c043c000
[ 9858.090000]         00000000 073f8000 00000003 00b4bf98 eff82944 eff818a8 00039a22 00b4a000
[ 9858.090000] Call Trace: [<00040000>] rcu_free_pwq+0x1c/0x1e
[ 9858.090000]  [<003f3630>] dump_stack+0x10/0x16
[ 9858.090000]  [<003f2636>] panic+0xba/0x2bc
[ 9858.090000]  [<00040000>] rcu_free_pwq+0x1c/0x1e
[ 9858.090000]  [<0003171e>] do_exit+0x87e/0x9d6
[ 9858.090000]  [<000318d4>] do_group_exit+0x28/0xb6
[ 9858.090000]  [<0003ac18>] get_signal+0x126/0x720
[ 9858.090000]  [<00039a22>] send_signal+0xde/0x16e
[ 9858.090000]  [<00004f0c>] do_notify_resume+0x38/0x5dc
[ 9858.090000]  [<0003aad2>] force_sig_fault_to_task+0x36/0x3a
[ 9858.090000]  [<0003aaee>] force_sig_fault+0x18/0x1c
[ 9858.090000]  [<00007450>] send_fault_sig+0x44/0xc6
[ 9858.090000]  [<000069be>] buserr_c+0x2c8/0x6a2
[ 9858.090000]  [<00002cd8>] do_signal_return+0x10/0x1a
[ 9858.090000]  [<0018800e>] ext4_htree_fill_tree+0x154/0x32a
[ 9858.090000]  [<0010800a>] d_path+0x86/0x114
[ 9858.090000] 
[ 9858.090000] ---[ end Kernel panic - not syncing: Aiee, killing interrupt handler! ]---
