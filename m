From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: Linux/m68k on Atari
Date: Sat, 18 Apr 2009 01:59:42 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0904180157220.28195@zirkon.biophys.uni-duesseldorf.de>
References: <20090327163917.e2b1d865.mandin.patrice@orange.fr>
 <1239307252.11875.4.camel@joy>
 <20090410185538.04034623.mandin.patrice@orange.fr>
 <alpine.DEB.1.00.0904120652210.2715@zirkon.biophys.uni-duesseldorf.de>
 <20090412094419.ab2ba909.mandin.patrice@orange.fr>
 <alpine.DEB.1.00.0904140429240.18464@zirkon.biophys.uni-duesseldorf.de>
 <20090414084002.2d6f20ef.mandin.patrice@orange.fr>
 <alpine.DEB.1.00.0904140911470.29340@zirkon.biophys.uni-duesseldorf.de>
 <10f740e80904160219j7f4a71e5rceb634e3fb9cc4a3@mail.gmail.com>
 <alpine.DEB.1.00.0904170304330.18855@zirkon.biophys.uni-duesseldorf.de>
 <10f740e80904170026x6a35fbd6k9106163a7d74b05b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-apollo.uni-duesseldorf.de ([134.99.128.36]:61545 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755518AbZDQX7n (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Fri, 17 Apr 2009 19:59:43 -0400
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KI900C00RZI6C00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Sat, 18 Apr 2009 01:59:42 +0200 (MEST)
In-reply-to: <10f740e80904170026x6a35fbd6k9106163a7d74b05b@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Patrice Mandin <mandin.patrice@orange.fr>, debian-68k@lists.debian.org, linux-m68k@vger.kernel.org

Hi Geert,

> > What is the reason for dropping chunks that are residing below the fisrst one,
> > in paging_init ??
> 
> `git blame' tells you that code was added by
> 
> commit 12d810c1b8c2b913d48e629e2b5c01d105029839
> Author: Roman Zippel <zippel@linux-m68k.org>
> Date:   Thu May 31 00:40:54 2007 -0700
> 
>     m68k: discontinuous memory support
> 
> Probably discontigmem supports only increasing physical addresses of the
> multiple memory chunks :-(

Looks like it... We can fix the bootstrap, but I fear that won't change a thing 
(I could not see where the early startup code would refer to the memory chunks 
at all).
 
> But the newer sparsemem generic model may support it, see
> Documentation/memory-hotplug.txt.

Thanks, I'll have a look at that.

	Michael

