From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Testers with real m68k hardware needed
Date: Thu, 11 May 2017 19:01:51 +0200
Message-ID: <13b8a355-fbac-9316-0e5c-ea0a37126d9b@physik.fu-berlin.de>
References: <e860e027-11ca-e590-59bb-40134fdedd2a@physik.fu-berlin.de>
 <02c664a6-99ff-fb6c-2b82-e6f7c8b0ee83@vivier.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:37955 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1756019AbdEKRBy (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Thu, 11 May 2017 13:01:54 -0400
In-Reply-To: <02c664a6-99ff-fb6c-2b82-e6f7c8b0ee83@vivier.eu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <laurent@vivier.eu>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On 05/11/2017 06:31 PM, Laurent Vivier wrote:
>> After hours:
> 
> ...
>   CC       test_urcu_defer.o
> /tmp/cczwtyzj.s: Assembler messages:
> /tmp/cczwtyzj.s:298: Error: syntax error -- statement `add.l
> %d1,nr_writes@TLSLE+4(%a0)' ignored
> /tmp/cczwtyzj.s:421: Error: syntax error -- statement `add.l
> %d1,nr_writes@TLSLE+4(%a0)' ignored
> make[2]: *** [test_urcu_defer.o] Error 1
> Makefile:1059: recipe for target 'test_urcu_defer.o' failed
> make[2]: Leaving directory '/liburcu/userspace-rcu/tests/benchmark'
> Makefile:367: recipe for target 'all-recursive' failed
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory '/liburcu/userspace-rcu/tests'
> Makefile:474: recipe for target 'all-recursive' failed
> make: *** [all-recursive] Error 1

Ah, I forgot to mention that you need to build with --disable-compiler-tls.

Could you try again? Sorry for the extra effort.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
