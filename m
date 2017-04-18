From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: gcc possibly generating invalid assembler
Date: Tue, 18 Apr 2017 20:42:32 +0200
Message-ID: <cf267478-6b32-a822-c01d-2b6bfbe2f98f@physik.fu-berlin.de>
References: <5db978c6-15ce-c60e-d350-f9e87154e0b2@physik.fu-berlin.de>
 <20170414073651.bwpg7plhfz23v24b@grep.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:43032 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753015AbdDRSmf (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 18 Apr 2017 14:42:35 -0400
In-Reply-To: <20170414073651.bwpg7plhfz23v24b@grep.be>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Wouter Verhelst <wouter@debian.org>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On 04/14/2017 09:36 AM, Wouter Verhelst wrote:
> Then I ran 'make CFLAGS=-save-temps' to see whether it perhaps did add
> some inline assembly somewhere but you missed the #include and this time
> it... worked?

Actually, adding -save-temps to CFLAGS doesn't help. However, since you
wrote "CFLAGS=-save-temps" instead of "CFLAGS+=-save-temps", I assume
you overrode the optimization level which has influence on the code
generation.

Will verify that.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
