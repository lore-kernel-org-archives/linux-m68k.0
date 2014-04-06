From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: SCSI OOPS.
Date: Mon, 7 Apr 2014 09:25:44 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1404070913270.11236@nippy.intranet>
References: <alpine.LNX.2.00.1402151533350.16321@nippy.intranet> <CAMuHMdULJ+61j4SreJXjPwnHVcQ_W4_ousfBzZz1+RqgF+hSGA@mail.gmail.com> <OF85B22C02.E99ADB8D-ONCA257C82.007AA014-CA257C82.007B99D2@csc.com> <CAMuHMdUcy5dCrPr03bNsDcVMCRh6zJxD33fSw2eBB0Y4=zi7ag@mail.gmail.com>
 <OF159B0259.BD2F9FC2-ONCA257CB2.001A1A26-CA257CB2.006D8EE0@csc.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:57383 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754135AbaDFX0I (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 6 Apr 2014 19:26:08 -0400
In-Reply-To: <OF159B0259.BD2F9FC2-ONCA257CB2.001A1A26-CA257CB2.006D8EE0@csc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Stephen N Chivers <schivers@csc.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, geert.uytterhoeven@gmail.com, Kars de Jong <jongk@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Mon, 7 Apr 2014, Stephen N Chivers wrote:

> 
> It looks like a toolchain problem, I added plenty of printks to the path 
> leading to the first access to the chip and the fault went away. 

If you can suppress the printk output (by setting console log level 
perhaps) and still avoid the crash, then I'd replace the printk with (a 
suitable) udelay. If that still avoids the crash, I'd say it's timing 
related. But I'd still compare the disassembly of the working driver code 
and that of the bad code.

OTOH, if the crash only disappears when printk actually sends some I/O to 
the console then it could be that the hardware isn't configured properly.

Of course, I'm only guessing here. Sorry I can't be of more help.

-- 
