From: Wouter Verhelst <wouter@debian.org>
Subject: Re: gcc possibly generating invalid assembler
Date: Wed, 19 Apr 2017 09:51:50 +0200
Message-ID: <20170419075150.3qdr2ivgqxwmsm2f@grep.be>
References: <5db978c6-15ce-c60e-d350-f9e87154e0b2@physik.fu-berlin.de>
 <20170414073651.bwpg7plhfz23v24b@grep.be>
 <cf267478-6b32-a822-c01d-2b6bfbe2f98f@physik.fu-berlin.de>
 <20170419073938.235okxaw2e4rw3ev@grep.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from latin.grep.be ([46.4.76.168]:53906 "EHLO latin.grep.be"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1760593AbdDSHv7 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 19 Apr 2017 03:51:59 -0400
Content-Disposition: inline
In-Reply-To: <20170419073938.235okxaw2e4rw3ev@grep.be>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, Apr 19, 2017 at 09:39:38AM +0200, Wouter Verhelst wrote:
> Anyway, that means the most likely cause is the optimizer.

side note: there actually is some inline assembly, but it looks like
that's coming from places like /usr/m68k-linux-gnu/include/byteswap.h
etc, so not the cause of this problem

-- 
< ron> I mean, the main *practical* problem with C++, is there's like a dozen
       people in the world who think they really understand all of its rules,
       and pretty much all of them are just lying to themselves too.
 -- #debian-devel, OFTC, 2016-02-12
