From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Testers with real m68k hardware needed
Date: Wed, 10 May 2017 23:08:12 +0200
Message-ID: <e860e027-11ca-e590-59bb-40134fdedd2a@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:46682 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752941AbdEJVIO (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 10 May 2017 17:08:14 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi!

liburcu is currently missing support m68k. The maintainer of the Debian package
has kindly written a patch which adds m68k support to the library [1]. However,
he was told by upstream that the patch should be tested on real hardware.

So, for anyone currently running Debian/m68k, your help is needed. I do have
various m68k machines with Debian myself, but they are currently offline but
I am planning on bringing them back online in some months.

Thus, in the meantime it would be great if someone else with real hardware
readily available could help.

To test, do the following:

# apt update
# apt install git
# apt build-dep liburcu
# mkdir liburcu
# cd liburcu
# git clone https://github.com/mjeanson/userspace-rcu.git
# cd userspace-rcu/
# git checkout m68k
# ./bootstrap
# ./configure
# make | liburcu-build.log
# make check | tee  liburcu-check.log

Then please post both liburcu-build.log and liburcu-check.log to the list.

Thanks,
Adrian

> [1] https://github.com/mjeanson/userspace-rcu/commit/b4aa8c191528081d28b1538f0156b91f6cdd1f25

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
