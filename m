Return-Path: <SRS0=pfoz=3M=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F512C2D0DB
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Jan 2020 14:29:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58ED82087E
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Jan 2020 14:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579789764;
	bh=ez/6JX2xGbOJsnIuQVPOf4+j+91L5ey1MQH6rdwQxkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=kEgy+wa+QdadHe+Jpv8HypR7ahQQweUByh7bjPZbA3+hkRyGQrt7KdaJ8gFXMmooG
	 fuEOvIFzNWJbpOoXEco6X+FD6DIOupV3Kto0uL0oKHvJu9bP8f9qUurb9aThLvCio3
	 ohHe/sYObLxNNMAQweVqxKz0ziv9JIXi5P5uBoVE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbgAWO3Y (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 23 Jan 2020 09:29:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:33516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727307AbgAWO3X (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 23 Jan 2020 09:29:23 -0500
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B1802077C;
        Thu, 23 Jan 2020 14:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579789763;
        bh=ez/6JX2xGbOJsnIuQVPOf4+j+91L5ey1MQH6rdwQxkE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=faslfbwzBXBUjetdZ/tFitSEXFA8mssSeblKbisXfD3QOEDYM4bstH4QzWKYtayQJ
         nx77Rjj5TokMdEAqBD4FBcjRqCsaz8Dmu71oi7NQLhletqMfc3UFsoZ+cDAy1nAkVI
         GEfEcYaXT6Gm/cbR+agA6MPeA3Jz1pHQVCCz2v4w=
Date:   Thu, 23 Jan 2020 09:29:22 -0500
From:   Sasha Levin <sashal@kernel.org>
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: [PATCH AUTOSEL 4.4 064/174] m68k: mac: Fix VIA timer counter
 accesses
Message-ID: <20200123142922.GF1706@sasha-vm>
References: <20200116174251.24326-1-sashal@kernel.org>
 <20200116174251.24326-64-sashal@kernel.org>
 <alpine.LNX.2.21.1.2001170929550.255@nippy.intranet>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.21.1.2001170929550.255@nippy.intranet>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jan 17, 2020 at 10:21:26AM +1100, Finn Thain wrote:
>
>On Thu, 16 Jan 2020, Sasha Levin wrote:
>
>> From: Finn Thain <fthain@telegraphics.com.au>
>>
>> [ Upstream commit 0ca7ce7db771580433bf24454f7a1542bd326078 ]
>>
>
>This commit has been selected for 4.4, 4.9, 4.14 and 4.19. But this commit
>has questionable value without it's parent, commit 1efdd4bd2543 ("m68k:
>Call timer_interrupt() with interrupts disabled").
>
>For all stable branches, I'd prefer you selected both commits or neither,
>because I periodically backport to a branch based on stable/linux-4.14.y.

I've queued up 1efdd4bd2543 for all branches, thanks.

-- 
Thanks,
Sasha
