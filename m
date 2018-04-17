From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 3/8] net: ax88796: Do not free IRQ in ax_remove()
 (already freed in ax_close()).
Date: Tue, 17 Apr 2018 09:51:15 -0400 (EDT)
Message-ID: <20180417.095115.87630263190451622.davem@davemloft.net>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
        <1523930895-6973-4-git-send-email-schmitzmic@gmail.com>
        <CAMuHMdUZa31pbmyieoqyh-RnsRtFKPOVbrzC9DveV8h0sZh_qw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUZa31pbmyieoqyh-RnsRtFKPOVbrzC9DveV8h0sZh_qw@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: geert@linux-m68k.org
Cc: schmitzmic@gmail.com, glaubitz@physik.fu-berlin.de, netdev@vger.kernel.org, andrew@lunn.ch, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, kernel@mkarcher.dialup.fu-berlin.de
List-Id: linux-m68k@vger.kernel.org

From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Apr 2018 10:20:25 +0200

> BTW, I have a git alias for that:
> 
> $ git help fixes
> `git fixes' is aliased to `show --format='Fixes: %h ("%s")' -s'
> $ git fixes 82533ad9a1c
> Fixes: 82533ad9a1c ("net: ethernet: ax88796: don't call free_irq
> without request_irq first")

Thanks for sharing :)
