From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH/resend] m68k/net: Remove obsolete IRQ_FLG_* users
Date: Sun, 11 Dec 2011 14:45:10 -0500 (EST)
Message-ID: <20111211.144510.1167905221040455468.davem@davemloft.net>
References: <1323594245-25269-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1323594245-25269-1-git-send-email-geert@linux-m68k.org>
Sender: netdev-owner@vger.kernel.org
To: geert@linux-m68k.org
Cc: netdev@vger.kernel.org, linux-m68k@kernel.org
List-Id: linux-m68k@vger.kernel.org

From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 11 Dec 2011 10:04:05 +0100

> The m68k core irq code stopped honoring these flags during the irq
> restructuring in 2006.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Acked-by: David S. Miller <davem@davemloft.net>
