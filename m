From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Futex problems with firebird3.0 and openjdk-8 on m68k
Date: Wed, 10 May 2017 23:58:40 +0200
Message-ID: <3adce84b-790a-9e6f-724d-d8e873632aef@physik.fu-berlin.de>
References: <1628e911-c94f-2cdd-6c48-5a54829a032f@physik.fu-berlin.de>
 <Pine.BSM.4.64L.1705102120080.22216@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:47200 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753151AbdEJV6m (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 10 May 2017 17:58:42 -0400
In-Reply-To: <Pine.BSM.4.64L.1705102120080.22216@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On 05/10/2017 11:21 PM, Thorsten Glaser wrote:
> Does diffing the disassembly of (parts of) that give any meaningful
> information? Maybe rather the individual .a files in libjvm.a?

Hmm, that could be an idea. However, I don't have a static library at
the moment, just the dynamic one.

Here's a tarball containing the working one and the broken one, with
the SUSE one being the one that works:

> https://people.debian.org/~glaubitz/libjvm-m68k.tgz

> As for the main problem, no idea. I don’t even know what a futex is.
> Only that it has something to do with multiple CPUs. (And wasn’t m68k
> Linux currently single-CPU only?)

Well, futexes are used for locking and since the code in question
is capable of multi-threading in general, it would still contain
futex calls, wouldn't it?

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
