Return-Path: <SRS0=Ru6R=AA=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	URIBL_SBL,URIBL_SBL_A autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE4CC433DF
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Jun 2020 01:39:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F88C207FC
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Jun 2020 01:39:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbgFSBjy (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 18 Jun 2020 21:39:54 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:33074 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbgFSBjx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 18 Jun 2020 21:39:53 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by kvm5.telegraphics.com.au (Postfix) with ESMTP id B6EB427392;
        Thu, 18 Jun 2020 21:39:50 -0400 (EDT)
Date:   Fri, 19 Jun 2020 11:39:49 +1000 (AEST)
From:   Finn Thain <fthain@telegraphics.com.au>
To:     Josh Juran <jjuran@gmail.com>
cc:     linux-m68k@lists.linux-m68k.org
Subject: Re: penguin (was Re: Linux-mac68k project account maintenance)
In-Reply-To: <7A36365D-870D-46A2-9091-051074465693@gmail.com>
Message-ID: <alpine.LNX.2.22.394.2006190949530.11@nippy.intranet>
References: <alpine.LNX.2.22.394.2006151113030.17@nippy.intranet> <0A4C54D6-956E-4E46-90DB-BA89B0ED66EB@gmail.com> <alpine.LNX.2.22.394.2006151336260.34@nippy.intranet> <7A36365D-870D-46A2-9091-051074465693@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, 18 Jun 2020, Josh Juran wrote:

> On Jun 15, 2020, at 12:21 AM, Finn Thain <fthain@telegraphics.com.au> 
> wrote:
> 
> >> I'd also be interested in any hearing about efforts to virtualize Mac 
> >> OS or Mac applications on Linux/m68k, as I might be able to assist 
> >> with those.
> > 
> > I don't know of any MacOS virtualization efforts (kvm for linux-m68k?)
> 
> I've made a small first step -- my emulator runs Mac applications in 
> User mode.
> 

MAME/MESS can boot MacOS. There is work under way to boot MacOS in 
qemu-system-m68k.

But outside of A/UX, I don't know of any way to get hardware assisted 
virtualization for 68k MacOS applications.

> > Personally, I'd love to see EMILE ported to MacRelix, as a replacement 
> > for Penguin.
> 
> Okay, /that/ I wasn't expecting. :-)
> 
> Though now that I think about it, I can see the appeal.  The booter 
> itself becomes a command-line-only program, whose resource fork can be 
> empty.  You even get a rudimentary shell, a couple of scripting 
> languages, and some filesystem-bound GUI primitives.
> 

Yes, there would be an improvement in functionality. Presently I can't 
manage EMILE boot blocks from MacOS e.g. for rescue purposes. But there 
would also be an improvement in maintainability (compared to the existing 
Penguin codebase).

Certain code is needed anywhere that you unpack a kernel binary and launch 
it. Penguin and EMILE duplicate this functionality. EMILE has fewer bugs 
in this area and is more maintainable. A common codebase would be a win.

Penguin is more capable only inasmuch as it knows how to take over from 
MacOS (its drivers and its memory mappings). But this code may not be 
needed if a hypothetical "MacEMILE" could just setup the boot blocks, 
configure the boot device in PRAM and then restart. (That would be more 
like XPostFacto than Penguin, I suppose.)

So it's not necessary to port all of EMILE. The parts of EMILE that run in 
the ROM environment are presently built under Linux and would never need 
to be built in a different environment.

> And while MacRelix may be bloated by 1990 standards, you're not trying 
> to boot Linux on a 4 MiB machine.[1] (Plus, whatever RAM it uses you get 
> back after booting Linux.)
> 

In my experience, you need 12 MB RAM to boot the kernel (with a small 
initramfs), if you use MacOS and Penguin to do so.

> > Reason being, there are several Penguin bugs that result in boot 
> > crashes and some other bugs besides.
> 
> I got my start here fixing general Mac programming bugs in Penguin, and 
> if any have crept back in I can certainly take a look.  I've also got a 
> solid background in 68K machine-level programming now.
> 

I don't think the bugs "crept back in" -- AFAIK these aren't regressions. 
MacOS 7.5.3 with Penguin 19 did work on every machine I tested it on 
(almost all supported models). But you need various workarounds [2].

These are the bugs that I've come across:

  - Penguin fails to stop SONIC chip directly or close the MacOS driver.
    Network traffic can crash Linux with an unhandled interrupt. (This may 
    be true for NuBus NICs too, on machines that can't mask slot 
    interrupts.)

  - Penguin will hang after "slot_int_set: ..." when unpacking certain
    compressed kernel binaries.

  - To avoid kernel memory corruption, Penguin must not pre-configure
    serial ports on AV Macs. Probably have to close the .SerialDMA driver?

  - Part of the kernel command line gets erased somehow, making it hard to
    edit.

  - Log window is excruciatingly slow.

This isn't an exhaustive list. I think there are limits to what can be 
accomplished in a runtime environment provided by MacOS plus third-party 
drivers and extensions. (Though I suppose EMILE too must contend with 
random drivers executed from NuBus ROMs and Apple_Driver partitions.)

> > Almost all have workarounds, but you have to read the docs to find out 
> > about them (and go out of your way to apply them).
> 
> Is Penguin still built with a non-free compiler in a non-free OS? 

Back in 2008, Tony Mantler said that building Penguin 19 requires MPW.

> A port to Retro68 might help make it more maintainable.
> 

That's awesome. [3]
Can it be used to build MacRelix applications?

> Josh
> 
> [1] ... I hope. :-)
> 

[2] http://mac.linux-m68k.org/docs/penguin.php

[3] https://github.com/autc04/Retro68

