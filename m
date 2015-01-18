From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: The BigRAMPlus works - Re: kullervo with bigram
Date: Sun, 18 Jan 2015 13:36:35 +0100
Message-ID: <54BBA8D3.8020703__2019.1517346122$1421585006$gmane$org@physik.fu-berlin.de>
References: <54BACEB6.6060805@debian.org>	<20150118115355.GA20168@guido.earth.sol> <CAMuHMdXTyYp=7SOL4qG1JoK6x6zO5mqkGt9wKGXceqbjejMwgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXTyYp=7SOL4qG1JoK6x6zO5mqkGt9wKGXceqbjejMwgA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Debian m68k <debian-68k@lists.debian.org>

Hi Geert!

Important side note: We can no longer reproduce this particular crash.

All we get now is a CPU soft-lockup which goes away when using a memfile
to either exclude the BigRAMPlus ~256 MB from 0x40000000 _or_ the
accelerator's on-board memory ~128 MB from 0x07000000.

Thus, the memfile to run Linux in the accelerator's memory is:

2097152
0x07000000 134217728

and the memfile for running the kernel in the BigRAMPlus:

2097152
0x40000000 268435456

Both seem to work fine so far. Activating both regions will lead
to a soft-lockup right after the message "Freeing unused kernel
memory", using them mutually exclusively works.

Furthermore, we just wanted to use the BigRAMPlus as a swap device
now following Ingo's description [1]. Unfortunately, CONFIG_MTD
is not set in the current Debian m68k kernel and we therefore
can't use it.

Any chance we can activate that?

Adrian

> [1]
https://blog.windfluechter.net/content/blog/2013/12/18/1677-debian-donation-m68k-arrived

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
