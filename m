Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC06C433EF
	for <linux-m68k@archiver.kernel.org>; Thu,  9 Sep 2021 22:51:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6528161104
	for <linux-m68k@archiver.kernel.org>; Thu,  9 Sep 2021 22:51:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346669AbhIIWwh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 9 Sep 2021 18:52:37 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:45913 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346823AbhIIWwh (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 9 Sep 2021 18:52:37 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 6BF125C00AA;
        Thu,  9 Sep 2021 18:51:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 09 Sep 2021 18:51:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=D8igUa
        VpqcpJzfWdUJmoy8sdbCD7fCQkGTQo9D0aprY=; b=JIazriTaTo0oYYAo4ZVxyd
        QqLHZoDpU77Vy5k+oQqmJJYg5SkJtRpMNjTQVixA4L+hfEE0F+rXNzeM/yPxJafv
        anBxFOVXOX7FBcV/DLnDfrnVRJuh0sBwT9z8JdNey46x9ZNyPi+2huLAAoz9cUuG
        YSm0IIHLIJR/BdRZCD2lo6lpahE6pNK9wiGzY5aK+B1LJosYL+I6gMXAF2mxHHXt
        jfhLVJ5rpPZ79VbhB7mlmZHy7UG5yZhffJv7z3RtiJ2GoDABiVeVWS/XUNKuGPC2
        YoEtfeCL4+AZViANgV/3ULn3FCAcXyWYaA/Mlujbtt9euGJVaqITOhXa5OGOEHRw
        ==
X-ME-Sender: <xms:7o86YbYuTy_HpAxFjTTK42JoTw4yiWm_7-fbaPMMgkR1AjM2tunSDA>
    <xme:7o86YaaDbHR3TuONmpgx_ZXWeDrXLx8vLR78RjvWTfW8UhwEAiNK4R7RLRimiZ8p4
    TPLab4jwnvCAkY-jz0>
X-ME-Received: <xmr:7o86Yd-J41iQf-UCzi2RLwr0eFHJqlU2qXLz09iYB04OEiZ4AGAf9ig0EnXNoXA8MHQn1mjUzV2nsUuklT_LEL7xzMFEwVYGPYH7yw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegtddgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
    hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
    htvghrnhepffduhfegfedvieetudfgleeugeehkeekfeevfffhieevteelvdfhtdevffet
    uedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
    hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:7o86YRp6Nwf--KeADtS1xpxL6mXutRY2TYULwWegI8wSBvjQXwcyiA>
    <xmx:7o86YWodjkIier_H797Vxil0IcD9yRmyGcRjcZ_RMDlP6EiK5kwWIA>
    <xmx:7o86YXRejo9yC_5hAEyJ1cfLK-8Rk2IihE7M5HLe3JNobznJQnFPDw>
    <xmx:7o86YUFFg_gZLfvDWXBEgjKPyujMSm6yWEZzPWCHAgRAhKP0cpsWYg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Sep 2021 18:51:23 -0400 (EDT)
Date:   Fri, 10 Sep 2021 08:51:15 +1000 (AEST)
From:   Finn Thain <fthain@linux-m68k.org>
To:     Michael Schmitz <schmitzmic@gmail.com>
cc:     linux-m68k@vger.kernel.org
Subject: Re: Mainline kernel crashes, was Re: RFC: remove set_fs for m68k
In-Reply-To: <42b30d4f-b871-51ea-1b0e-479f4fe096eb@gmail.com>
Message-ID: <7ac7a41a-53f9-b13c-83fa-2c6b8ef2b90@linux-m68k.org>
References: <20210721170529.GA14550@lst.de> <20210815074236.GA23777@lst.de> <63c35a20-3eec-1825-fa18-5df28f5b6eaa@gmail.com> <20210816065851.GA26665@lst.de> <23f745f2-9086-81fb-3d9e-40ea08a1923@linux-m68k.org> <20210816075155.GA29187@lst.de>
 <d407a2a1-738b-5cd5-c2ed-b7250c5da8ec@gmail.com> <83571ae-10ae-2919-cde-b6b4a5769c9@linux-m68k.org> <dc594142-e459-533e-cac2-c7a213cec464@gmail.com> <f4ab2dcb-6761-c60b-54ce-35d0d017d371@gmail.com> <d772d22e-a945-3e35-80a2-f4783893bea@linux-m68k.org>
 <b2c55280-657b-51c2-065c-3fc93db050b9@gmail.com> <d7b8f7eb-fc18-c8d-fe3e-dcdf19d3f4b@linux-m68k.org> <755e55ba-4ce2-b4e4-a628-5abc183a557a@linux-m68k.org> <b52a10fe-3e4b-5740-d3f8-52bce3bc988@linux-m68k.org> <31f27da7-be60-8eb-9834-748b653c2246@linux-m68k.org>
 <ed2ca322-b957-cd52-8d2f-a8edd2785625@linux-m68k.org> <977bb34f-6de9-3a9e-818f-b1aa0758f78f@gmail.com> <fa8682aa-c5f4-7995-166d-8fa899594b19@linux-m68k.org> <42b30d4f-b871-51ea-1b0e-479f4fe096eb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, 8 Sep 2021, Michael Schmitz wrote:

> 
> In a related case, I've managed to swap my 'resume_userspace' format 
> error for a nice 'illegal instruction' format error apparently caused by 
> an invalid function pointer in __handle_irq_event_percpu(), just by 
> disabling all interrupts upon entering the auto_inthandler and 
> user_inthandler exception handlers. This bug is quite readily reproduced 
> by running your kernel_coverage.sh script in a loop (panics on the first 
> stress test on the second pass):
> 
> Stress run 2
> Logging to stress-ng-20210908-0838.log
> ./kernel-coverage.sh: line 272: lcov: command not found
> running --fork 1 --fork-vm -t 60 --timestamp --no-rand-seed --times
> stress-ng: 08:40:08.70 info:  [1914] setting to a 60 second run per stressor
> stress-ng: 08:40:08.82 info:  [1914] dispatching hogs: 1 fork
> packet_write_wait: Connection to 10.1.1.4 port 22: Broken pipe
> 
> Why disabling interrupts during interrupt processing would make matters 
> worse doesn't make any sense to me...
> 

Are you able to reproduce that with a stock mainline build?
