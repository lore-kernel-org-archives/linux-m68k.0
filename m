Return-Path: <SRS0=j0Rh=54=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB5E5C2BB85
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Apr 2020 23:17:48 +0000 (UTC)
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A5B97206E5
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Apr 2020 23:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5B97206E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=telegraphics.com.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-m68k-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgDLXRr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Apr 2020 19:17:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:37414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgDLXRr (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 12 Apr 2020 19:17:47 -0400
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au [98.124.60.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BCF20C0A88B5
        for <linux-m68k@vger.kernel.org>; Sun, 12 Apr 2020 16:17:47 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id F119322A90;
        Sun, 12 Apr 2020 19:17:43 -0400 (EDT)
Date:   Mon, 13 Apr 2020 09:17:40 +1000 (AEST)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Rob Landley <rob@landley.net>
cc:     Laurent Vivier <laurent@vivier.eu>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k@vger.kernel.org
Subject: Re: Running m68k on qemu with external initramfs?
In-Reply-To: <e0d7b1eb-c577-88ba-e318-a6b3b41f875c@landley.net>
Message-ID: <alpine.LNX.2.22.394.2004130915290.8@nippy.intranet>
References: <0e69cfc4-3bcd-25c3-0d32-665ef50f815c@landley.net> <08DCD73D-7BC1-4F38-87DE-ED4DBD5978DA@physik.fu-berlin.de> <f1f62d19-bee9-537d-5641-8435567fb380@vivier.eu> <e0d7b1eb-c577-88ba-e318-a6b3b41f875c@landley.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, 12 Apr 2020, Rob Landley wrote:

> 
> What I've hit now is either a compiler bug or a subtle enough stack 
> corruption it doesn't manifest on any other platform and I haven't 
> spotted it. I can fix it by adding a NOP function call right before the 
> segfault, but for the moment I'm just punting worrying about it until 
> after the next toybox release.
> 

Can you provide us with an initramfs/initrd that would reproduce this?

I can try it on Aranym and Laurent or Stan may be willing to test on 
Motorola hardware.
