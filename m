From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 0/5] net: m68k: Allow modular build
Date: Tue, 29 Sep 2015 21:11:33 -0700 (PDT)
Message-ID: <20150929.211133.981150232001662857.davem__13283.5536067889$1443586310$gmane$org@davemloft.net>
References: <1443515046-13968-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1443515046-13968-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: paul.gortmaker@windriver.com, fthain@telegraphics.com.au, funaho@jurai.org, philb@gnu.org, netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org

From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Sep 2015 10:24:01 +0200

> This patch series makes the remaining m68k Ethernet drivers modular.
> It's an alternative to the last 3 patches of Paul Gortmaker's series
> "[PATCH net-next 0/6] make non-modular code explicitly non-modular".
> 
> Note that "[PATCH 5/5] net: macmace: Allow modular build" depends on
> "[PATCH 4/5] m68k/mac: Export Peripheral System Controller (PSC) base
> address to modules". Feel free to take the dependency through the netdev
> tree to avoid modular build breakage.
> 
> This was compile-tested only (mac_defconfig + allmodconfig) due to lack
> of hardware.

Series applied, thanks Geert.
