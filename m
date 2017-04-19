From: Wouter Verhelst <wouter@debian.org>
Subject: Re: gcc possibly generating invalid assembler
Date: Wed, 19 Apr 2017 09:39:38 +0200
Message-ID: <20170419073938.235okxaw2e4rw3ev@grep.be>
References: <5db978c6-15ce-c60e-d350-f9e87154e0b2@physik.fu-berlin.de>
 <20170414073651.bwpg7plhfz23v24b@grep.be>
 <cf267478-6b32-a822-c01d-2b6bfbe2f98f@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from latin.grep.be ([46.4.76.168]:33776 "EHLO latin.grep.be"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1760291AbdDSHjs (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 19 Apr 2017 03:39:48 -0400
Content-Disposition: inline
In-Reply-To: <cf267478-6b32-a822-c01d-2b6bfbe2f98f@physik.fu-berlin.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Tue, Apr 18, 2017 at 08:42:32PM +0200, John Paul Adrian Glaubitz wrote:
> On 04/14/2017 09:36 AM, Wouter Verhelst wrote:
> > Then I ran 'make CFLAGS=-save-temps' to see whether it perhaps did add
> > some inline assembly somewhere but you missed the #include and this time
> > it... worked?
> 
> Actually, adding -save-temps to CFLAGS doesn't help. However, since you
> wrote "CFLAGS=-save-temps" instead of "CFLAGS+=-save-temps", I assume
> you overrode the optimization level which has influence on the code
> generation.

Good point, but nope, even with 'CFLAGS+=-save-temps' it succeeds.

Next attempt, "make V=1" returns the following command line:

m68k-linux-gnu-gcc -DHAVE_CONFIG_H -I. -I../.. -I../../urcu -I../..  -I../.. -I../../tests/common -g -g -O2 -pthread -MT test_urcu_defer.o -MD -MP -MF .deps/test_urcu_defer.Tpo -c -o test_urcu_defer.o test_urcu_defer.c 

when I add CFLAGS=-save-temps (or CFLAGS+=, it makes not difference), it
turns out that the bit "-g -O2 -pthread" is dropped; it may be either
due to lack of pthread support, or the optimization level. Feels like
someone failed to read the automake documentation properly (CFLAGS is
supposed to remain unset; and indeed checking out configure.ac reveals
some CFLAGS munging that shouldn't happen).

Anyway, that means the most likely cause is the optimizer.

-- 
< ron> I mean, the main *practical* problem with C++, is there's like a dozen
       people in the world who think they really understand all of its rules,
       and pretty much all of them are just lying to themselves too.
 -- #debian-devel, OFTC, 2016-02-12
