From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v2 3/8] net: ax88796: Do not free IRQ in ax_remove()
 (already freed in ax_close()).
Date: Wed, 18 Apr 2018 08:36:19 +1200
Message-ID: <CAOmrzkJzzOtmV3H1fTV1VBjpgS66HbO+Mw7_ZgDAwHYM_nTX8w@mail.gmail.com>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
 <1523930895-6973-4-git-send-email-schmitzmic@gmail.com> <CAMuHMdUZa31pbmyieoqyh-RnsRtFKPOVbrzC9DveV8h0sZh_qw@mail.gmail.com>
 <20180417.095115.87630263190451622.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180417.095115.87630263190451622.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Linux/m68k <linux-m68k@vger.kernel.org>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

Thanks Geert, I'll fix that.

I see my v2 series shows up as new series on patchwork - do I need to
do something different when tagging the next version, Dave?

Cheers,

  Michael


On Wed, Apr 18, 2018 at 1:51 AM, David Miller <davem@davemloft.net> wrote:
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Date: Tue, 17 Apr 2018 10:20:25 +0200
>
>> BTW, I have a git alias for that:
>>
>> $ git help fixes
>> `git fixes' is aliased to `show --format='Fixes: %h ("%s")' -s'
>> $ git fixes 82533ad9a1c
>> Fixes: 82533ad9a1c ("net: ethernet: ax88796: don't call free_irq
>> without request_irq first")
>
> Thanks for sharing :)
