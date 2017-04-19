From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: gcc possibly generating invalid assembler
Date: Wed, 19 Apr 2017 09:46:24 +0200
Message-ID: <9c5075ae-4e80-be47-d318-dc38529f04a9@physik.fu-berlin.de>
References: <5db978c6-15ce-c60e-d350-f9e87154e0b2@physik.fu-berlin.de>
 <20170414073651.bwpg7plhfz23v24b@grep.be>
 <cf267478-6b32-a822-c01d-2b6bfbe2f98f@physik.fu-berlin.de>
 <20170419073938.235okxaw2e4rw3ev@grep.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:59033 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1760448AbdDSHq0 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 19 Apr 2017 03:46:26 -0400
In-Reply-To: <20170419073938.235okxaw2e4rw3ev@grep.be>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Wouter Verhelst <wouter@debian.org>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On 04/19/2017 09:39 AM, Wouter Verhelst wrote:
> Good point, but nope, even with 'CFLAGS+=-save-temps' it succeeds.

For me, building the package succeeds with the following added to
debian/rules:

ifeq ($(DEB_HOST_ARCH_CPU), m68k)
        export DEB_CFLAGS_MAINT_APPEND += -O0
endif

> Next attempt, "make V=1" returns the following command line:
> 
> m68k-linux-gnu-gcc -DHAVE_CONFIG_H -I. -I../.. -I../../urcu -I../..  -I../.. -I../../tests/common -g -g -O2 -pthread -MT test_urcu_defer.o -MD -MP -MF .deps/test_urcu_defer.Tpo -c -o test_urcu_defer.o test_urcu_defer.c 
> 
> Anyway, that means the most likely cause is the optimizer.

I agree. It's definitely the optimization level which triggers
the issue.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
