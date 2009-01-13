From: "flameman mayer" <flamemaniii@gmail.com>
Subject: mac68k serial
Date: Tue, 13 Jan 2009 21:49:59 +0000
Message-ID: <1b1304130901131349n6b67eac5j1c17f4791dd6718e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org

hi,
I'm Carlo Pisani, alias "flameman", and i'm running this little
project: gentoo-m68k @ applem68k-LC475

( http://elinux.org/Mac68k-Flameman )


i'm working with kernel-2.6.27 and i have this issue

macserial kernel panic

unable to handle kernel NULL pointer de reference at virtual address
000004 modules linked in: m68k_handle_int+0x1c/0x36

call trace mac_scc_dispatch+0x3a/0x40 auto_irqhandler_fixup+0x4/0x6

kermel panic



also, i hacked the "emile-0.12" sources to build a monitor able to
serially talk: it works for both the 2 LC475 serial lines :P

is there anything about serial support for linux-m68k ?

regards
