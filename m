From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v2 3/8] net: ax88796: Do not free IRQ in ax_remove()
 (already freed in ax_close()).
Date: Tue, 17 Apr 2018 22:42:25 +0200
Message-ID: <045ca332-a22a-a55e-a5c7-9fee3f162434@physik.fu-berlin.de>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
 <1523930895-6973-4-git-send-email-schmitzmic@gmail.com>
 <dcbec8cb-8fc9-ffe6-a005-b04bbd30cd59@physik.fu-berlin.de>
 <CAOmrzk+uE_ouXCmmd78j0zG4QrqT=TvXNhMOQxtt5KWg8KS_cQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <CAOmrzk+uE_ouXCmmd78j0zG4QrqT=TvXNhMOQxtt5KWg8KS_cQ@mail.gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Linux/m68k <linux-m68k@vger.kernel.org>, Michael Karcher <Michael.Karcher@fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

On 04/17/2018 10:32 PM, Michael Schmitz wrote:
>> From: Michael Karcher <debian@mkarcher.dialup.fu-berlin.de>
> 
> I haven't found a way to change that in my tree yet, sorry. Unless
> someone has a simple way to fix patch authorship after a merge, I may
> have to reimport from scratch.

I guess you'll have to re-import then, sorry :(.

The correct mail address is:

Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>

which Michael uses for all his kernel work.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
