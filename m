Return-Path: <SRS0=6pxz=53=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF38DC2BA2B
	for <linux-m68k@archiver.kernel.org>; Sat, 11 Apr 2020 06:12:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 62AC42083E
	for <linux-m68k@archiver.kernel.org>; Sat, 11 Apr 2020 06:12:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725869AbgDKGMr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 11 Apr 2020 02:12:47 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:35378 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgDKGMr (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 11 Apr 2020 02:12:47 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 4000C2855D;
        Sat, 11 Apr 2020 02:12:45 -0400 (EDT)
Date:   Sat, 11 Apr 2020 16:12:42 +1000 (AEST)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Rob Landley <rob@landley.net>
cc:     linux-m68k@vger.kernel.org, Laurent Vivier <Laurent@Vivier.EU>
Subject: Re: Running m68k on qemu with external initramfs?
In-Reply-To: <b1e930f3-7775-6955-860e-a2886627caa8@landley.net>
Message-ID: <alpine.LNX.2.22.394.2004111608380.43@nippy.intranet>
References: <b1e930f3-7775-6955-860e-a2886627caa8@landley.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, 10 Apr 2020, Rob Landley wrote:

> I'm adding m68k support to toybox's "make root" target and I have a 
> kernel and a rootfs.cpio.gz, but qemu's -initrd option doesn't put the 
> rootfs image somewhere the m68k kernel can find it.
> 
> Is this a "modify qemu" problem or a "modify kernel" problem?
> 

It sounds more like a "modify kernel .config" problem. But it could be a 
regression; what versions of qemu and kernel did you try?

> Rob
> 
