From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Aranym, more than 244MB FastRAM, garbled display
Date: Mon, 11 Oct 2010 10:11:54 +0200
Message-ID: <AANLkTi=krrZGDqySPsDDcjAcM4w_SDWvX_hHSThY3N_m@mail.gmail.com>
References: <alpine.LNX.2.00.1010011728270.4788@halbrend.uninett.no>
	<m2tyl5u9hu.fsf@igel.home>
	<alpine.LNX.2.00.1010011908550.4788@halbrend.uninett.no>
	<Pine.BSM.4.64L.1010041947160.3776@herc.mirbsd.org>
	<AANLkTinq7CXPpYVfAYhgH9ea1FQs_f+AhYsU1-+ZdUx+@mail.gmail.com>
	<Pine.BSM.4.64L.1010060910520.21623@herc.mirbsd.org>
	<AANLkTi=ZrDoFPxFNZ3OKurvcrBuN3fS0gTvAeYpLQqCi@mail.gmail.com>
	<1286457082.1687.52.camel@joy-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:60890 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753136Ab0JKIL5 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 11 Oct 2010 04:11:57 -0400
Received: by wwj40 with SMTP id 40so3458089wwj.1
        for <linux-m68k@vger.kernel.org>; Mon, 11 Oct 2010 01:11:56 -0700 (PDT)
In-Reply-To: <1286457082.1687.52.camel@joy-desktop>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Petr Stehlik <pstehlik@sophics.cz>
Cc: linux-m68k@vger.kernel.org

Hi Petr,

>> Certainly - 640x480@1bit isn't much. Even less than sthigh IIRC.
>
> sthigh is 640x400@1bit, I believe, i.e. even less than vga2.
>

I stand corrected.

>> I wonder why it does depend on FastRAM size, though. ST-RAM eaten up
>> by page tables?
>
> why anything is stored in ST-RAM? Besides there's 14 MB of ST-RAM on
> ARAnyM, that should be plenty (compare with Falcon's 4 MB).

Due to some problem with memory management, the kernel treats all RAM
as equal, and allocates from the bottom up apparently.

The frame buffer is initialized rather late in the kernel init
procedure, and both kernel, ramdisk image and ramdisk will go into
ST-RAM. Maybe it's due to fragmentation of memory more than actual
memory usage in the end.

Ideally you would want to have the kernel, ramdisk etc. in FastRAM.
This would require FastRAM to be placed as the first memory chunk in
the bootinfo struct (for reasons of memory management setup that I've
forgotten the details of - maybe it's time to revisit that ...).
Anything I tried to remedy that has just failed to boot, so we seem
stuck with kernel in ST-RAM.

Cheers,

  Michael
