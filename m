From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH] m68k: Atari EtherNAT - Nicolas Pitre has a new email
 address
Date: Fri, 08 Jan 2010 23:34:10 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1001082331370.31802@zirkon.biophys.uni-duesseldorf.de>
References: <1261595749-23531-1-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-3-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-4-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-5-git-send-email-geert@linux-m68k.org>
 <alpine.DEB.2.00.1001040444110.8966@zirkon.biophys.uni-duesseldorf.de>
 <10f740e81001032327p11009b58t8fdd1a67848e9fc8@mail.gmail.com>
 <10f740e81001032343r5f7b8066p327c2220d426e783@mail.gmail.com>
 <alpine.DEB.2.00.1001070305380.15212@zirkon.biophys.uni-duesseldorf.de>
 <10f740e81001070919l214f5a2cn9d6f6c1422934a70@mail.gmail.com>
 <alpine.DEB.2.00.1001072029380.15106@zirkon.biophys.uni-duesseldorf.de>
 <10f740e81001080025s657d354fl49d5c49fb8d81294@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mailout-hades.uni-duesseldorf.de ([134.99.128.34]:62179 "EHLO
	mail.rz.uni-duesseldorf.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754121Ab0AHWeN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Jan 2010 17:34:13 -0500
Received: from pmxchannel-daemon.mail.rz.uni-duesseldorf.de by
 mail.rz.uni-duesseldorf.de
 (Sun Java(tm) System Messaging Server 6.3-6.03 (built Mar 14 2008; 32bit))
 id <0KVY006009CZMX00@mail.rz.uni-duesseldorf.de> for
 linux-m68k@vger.kernel.org; Fri, 08 Jan 2010 23:34:11 +0100 (MET)
In-reply-to: <10f740e81001080025s657d354fl49d5c49fb8d81294@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Hi Geert,

> > 2.18.1~cvs20080103-0ubuntu1 ... what is the host binutils even used for?
> 
> That's actually binutils-m68k-linux-gnu, built per instructions from RomanZ.

OK; I'll try and use that.

> > your .config results in the same error.
> 
> OK, so it's your toolchain.

3.3.6 and its binutils most likely. See below.
 
> > I'll verify that on the new tree, and start bisecting. Sigh.
> 
> Good luck!

7c5fd5619dc89fb52d2c2cf144fc6e4365427b86 is first bad commit
commit 7c5fd5619dc89fb52d2c2cf144fc6e4365427b86
Author: Tim Abbott <tabbott@ksplice.com>
Date:   Sun Sep 27 13:57:55 2009 -0400

    m68k: Cleanup linker scripts using new linker script macros.
    
    Signed-off-by: Tim Abbott <tabbott@ksplice.com>
    Tested-by: Andreas Schwab <schwab@linux-m68k.org>
    Cc: Roman Zippel <zippel@linux-m68k.org>
    Cc: Sam Ravnborg <sam@ravnborg.org>
    Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

:040000 040000 5bdbf7ce5dd4ea2f23669c6a6ec11192865b5bfa 
d3b7397533b0af6261747ccef3cff9cd40f6baf9 M	arch

Seems the linker script is not 3.3.6 safe?

	Michael
