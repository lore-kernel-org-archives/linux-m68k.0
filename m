From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] m68k/head.S: CONSOLE_DEBUG should depend on
 CONFIG_FONT_SUPPORT
Date: Tue, 27 May 2014 19:50:53 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1405271949180.800@nippy.intranet>
References: <1401176502-11664-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1401176502-11664-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org


On Tue, 27 May 2014, Geert Uytterhoeven wrote:

> allmodconfig:
> 
> arch/m68k/kernel/head.o: In function `debug_cons_nputs':
> (.init.text+0x1500): undefined reference to `font_vga_8x8'
> make[3]: *** [vmlinux] Error 1

Thanks for fixing this.

-- 
