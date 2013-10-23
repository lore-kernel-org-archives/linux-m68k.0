From: Andreas Schwab <schwab@suse.de>
Subject: Crash with FastRAM > 1008
Date: Wed, 23 Oct 2013 12:17:43 +0200
Message-ID: <mvmli1k5m0o.fsf@hawking.suse.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org

If you try to boot a kernel in aranym with FastRAM > 1008(*) you get a
crash during free_area_init_node, presumably because it cannot allocate
enough memory for the memmap.  It would be nice if there were a way to
get around this.  Theoretically, you should be able to have 2GB of
FastRAM or even more.

Andreas.

(*) You have to hack aranym to remove the MAP_32BIT flag in
src/Unix/vm_alloc.cpp.  Also, you'd better use video=atafb:off.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
