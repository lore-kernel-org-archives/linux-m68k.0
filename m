From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 0/2] net-next: cleanup use of lib8390.c code in xsurf100.c
Date: Sun, 10 Jun 2018 16:22:37 +1200
Message-ID: <1528604559-972-1-git-send-email-schmitzmic@gmail.com>
References: <CAMuHMdVfjE=+YiqCrPfGObeYYkQwKGiQEWyprQr-n9z7J9-X-A@mail.gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVfjE=+YiqCrPfGObeYYkQwKGiQEWyprQr-n9z7J9-X-A@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: linux-m68k@vger.kernel.org, andrew@lunn.ch, geert@linux-m68k.org, fthain@telegraphics.com.au, kernel@mkarcher.dialup.fu-berlin.de
List-Id: linux-m68k@vger.kernel.org

As suggested by Geert, xsurf100.c really does not need to duplicate code
from lib8390.c which is already part of ax88796.c, by including that file.

All we need from lib8390.c in the xsurf100 block output function is one
single function: ax_NS8390_init(). Export this symbol through a wrapper in
ax88796.c (the original __NS8390_init() is a static function) so the
xsurf100 driver can use it. 

This is rather a quick band-aid fix to deal with the ugliest code duplication
(including lib8390.c where it really isn't needed). The xsurf100 block_input 
and block_output functions are almost exact duplicates of the generic ax88796
functions, and changing those to make use of platform-specific block MMIO
transfer functions would allow all duplicated code to be removed from
xsurf100.c. This will be addressed in a later patch.

Changes from earlier RFC version:

- rebased on net-next so patch 2 applies cleanly
- use a non-static wrapper for ax_NS8390_init() alias __NS8390_init() so 
  this driver can be compiled in. 

Tested on Amiga hardware (elgar).

Cheers,

	Michael 
