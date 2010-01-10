From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: "m68k: Cleanup linker scripts using new linker script macros." and old binutils (was: Re: [PATCH] m68k: Atari EtherNAT - Nicolas Pitre has a new email address)
Date: Sun, 10 Jan 2010 21:40:40 +0100
Message-ID: <m2wrzpk81j.fsf@igel.home>
References: <10f740e81001100128q644cae1eg61c12b64f22e8398@mail.gmail.com>
	<alpine.DEB.1.10.1001101100540.1326@dr-wily.mit.edu>
	<alpine.DEB.2.00.1001102020420.19754@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:38269 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752561Ab0AJUko (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 Jan 2010 15:40:44 -0500
In-Reply-To: <alpine.DEB.2.00.1001102020420.19754@zirkon.biophys.uni-duesseldorf.de>
	(Michael Schmitz's message of "Sun, 10 Jan 2010 21:12:59 +0100 (CET)")
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Tim Abbott <tabbott@ksplice.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

Michael Schmitz <schmitz@biophys.uni-duesseldorf.de> writes:

> FWIW: when stripping the new kernel, I get this warning:
>
> BFD: st7CwWnM: warning: allocated section `.init_end' not in segment

This is actually your problem.  The .init_end section is kind of special
because it only contains an ALIGN.  What do you get from running
"readelf -l vmlinux"?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
