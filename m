Return-Path: <SRS0=j0Rh=54=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8C8C2BB85
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Apr 2020 23:30:51 +0000 (UTC)
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7827E20692
	for <linux-m68k@archiver.kernel.org>; Sun, 12 Apr 2020 23:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7827E20692
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=telegraphics.com.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-m68k-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgDLXau (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Apr 2020 19:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:39488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgDLXau (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 12 Apr 2020 19:30:50 -0400
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au [98.124.60.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 58D9CC0A88B5
        for <linux-m68k@vger.kernel.org>; Sun, 12 Apr 2020 16:30:48 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id 2123D28D1A;
        Sun, 12 Apr 2020 19:30:44 -0400 (EDT)
Date:   Mon, 13 Apr 2020 09:30:40 +1000 (AEST)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Rob Landley <rob@landley.net>
cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        linux-m68k@vger.kernel.org, Laurent Vivier <Laurent@Vivier.EU>
Subject: GCC?, was Re: Running m68k on qemu with external initramfs?
In-Reply-To: <238ea76c-fa8e-0134-667b-3864938d9a78@landley.net>
Message-ID: <alpine.LNX.2.22.394.2004130922090.8@nippy.intranet>
References: <b1e930f3-7775-6955-860e-a2886627caa8@landley.net> <c4a784d9-2fef-ee90-9ff3-b1d8487e8a8b@physik.fu-berlin.de> <238ea76c-fa8e-0134-667b-3864938d9a78@landley.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, 12 Apr 2020, Rob Landley wrote:

> 
> 2) THEN the problem was that gcc is doing something in cd_main so that 
> the "chdir ." at the start of the shell setup (to set $PWD and friends) 
> is segfaulting, but it's a segfault that went away when I got near it 
> with printf() calls, and even write(1, "", 0); right before it made it 
> go away. Given that this code has run on 32 and 64 bit, big and little 
> endian, glibc musl and bionic, and on a target that's both nommu and 
> cares about alignment?

Are you sure that "gcc is doing something [wrong]"? Do you think it could 
be a QEMU bug? Can you provide some information about your tool chain?

> 
> Because I'm still halfway through teaching toysh about all the ${} 
> constructs. (Also, remind me to stick echo -e '\e[?7h' at the start of 
> my init script to undo the STUPID wordwrap disable escape that qemu's 
> bios outputs, which screws up bash's command line history too!)

How awful. It baffles me every time bash manages to mishandle unprintable 
output from a command such that it somehow becomes command line input 
which bash then attempts to execute! I wish I knew how to prevent that.
