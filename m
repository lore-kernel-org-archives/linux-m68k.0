From: Paul Bolle <pebolle@tiscali.nl>
Subject: CONFIG_FEC2
Date: Wed, 09 Nov 2011 20:35:41 +0100
Message-ID: <1320867341.27598.18.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Shawn Guo <shawn.guo@freescale.com>, "David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org

0) Commit b5074087add883d015827e3792e4e388cc2d40c3 ("net/fec: remove
config FEC2 as it's used nowhere") dropped config FEC2. But currently
there are still two references to CONFIG_FEC2 (both in
arch/m68k/platform/527x/config.c).

1) git revert b5074087add883d015827e3792e4e388cc2d40c3 doesn't do its
thing cleanly anymore. That's where I give up. Perhaps one of you does
know what to do next.


Paul Bolle
