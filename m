From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [RFC PATCH 0/2] net-next: cleanup use of lib8390.c code in xsurf100.c
Date: Sat,  9 Jun 2018 17:57:47 +1200
Message-ID: <1528523869-3403-1-git-send-email-schmitzmic@gmail.com>
References: <CAMuHMdWsibY4h5zwBC4qs8ZLq_1-627qjpeDLGzVjaGjG_A4PA@mail.gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWsibY4h5zwBC4qs8ZLq_1-627qjpeDLGzVjaGjG_A4PA@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: linux-m68k@vger.kernel.org, andrew@lunn.ch, geert@linux-m68k.org, fthain@telegraphics.com.au
List-Id: linux-m68k@vger.kernel.org

As suggested by Geert, xsurf100.c really does not need to duplicate code
from lib8390.c which is already part of ax88796.c, by including that file.

All we need from lib8390.c in the xsurf100 block output function is one
single function: ax_NS8390_init(). Export this symbol in ax88796.c so
the xsurf100 driver can use it. 

This is rather a quick band-aid fix to deal with the ugliest code duplication
(including lib8390.c where it really isn't needed). The xsurf100 block_input 
and block_output functiond are almost exact duplicated of the generic ax88796
functions, and changing those to make use of platform-specific block MMIO
transfer functions might be a better way to fix this issue. 

Tested on Amiga hardware (elgar).

Cheers,

	Michael 
