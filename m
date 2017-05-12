From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Linux 4.11 FTBFS on m68k
Date: Fri, 12 May 2017 10:47:40 +0200
Message-ID: <20170512084740.GE29311@physik.fu-berlin.de>
References: <b9276262-0f50-02c3-1751-344651d7e377@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost5.zedat.fu-berlin.de ([130.133.4.89]:34013 "EHLO
        outpost5.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754971AbdELIrn (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Fri, 12 May 2017 04:47:43 -0400
Content-Disposition: inline
In-Reply-To: <b9276262-0f50-02c3-1751-344651d7e377@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>
Cc: Debian m68k <debian-68k@lists.debian.org>

On Sun, May 07, 2017 at 03:16:41PM +0200, John Paul Adrian Glaubitz wrote:
> Just noticed that currently the 4.11 kernel fails to build from source
> on m68k [1]:

Ok, this problem is actually Debian-specific. Debian's linux source
package contains a patch which removes the necessary #include
directive for <linux/compiler.h> [1].

I'll open a bug report.

Adrian

> [1] https://anonscm.debian.org/cgit/kernel/linux.git/tree/debian/patches/bugfix/m68k/revert-m68k-move-exports-to-definitions.patch#n150

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
