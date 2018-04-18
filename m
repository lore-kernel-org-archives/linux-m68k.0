From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 04/10] net: ax88796: Add block_input/output hooks to ax_plat_data
Date: Wed, 18 Apr 2018 15:39:59 +1200
Message-ID: <CAOmrzkLR7VQ6E1dV-HA3DyBtoqvoEz3FXNVeL9Oi2dMRYA4xaw@mail.gmail.com>
References: <1523916285-6057-5-git-send-email-schmitzmic@gmail.com>
 <201804180104.AHpJjbYg%fengguang.wu@intel.com> <CAOmrzkKSmp5phhLYvs14N13tPCuAYCOi-2eBrRqnOgB6+Q6Nyw@mail.gmail.com>
 <20180418011901.GC22103@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180418011901.GC22103@lunn.ch>
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: kbuild test robot <lkp@intel.com>, kbuild-all@01.org, netdev <netdev@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Michael Karcher <Michael.Karcher@fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

Hi Andrew,

ax88796 includes it via linux/netdevice.h. mac-anubis.c doesn't.

Michael Karcher's patches have added forward derclarations for struct
netdevice and struct platform_data already - I'll add struct sk_buff
as suggested by Finn.

Cheers,

  Michael


On Wed, Apr 18, 2018 at 1:19 PM, Andrew Lunn <andrew@lunn.ch> wrote:
> On Wed, Apr 18, 2018 at 12:53:21PM +1200, Michael Schmitz wrote:
>> I think this is a false positive - we're encouraged to provide the
>> full parameter list for functions, so the sreuct sk_buff* can't be
>> avoided.
>
> Hi Michael
>
> How is <linux/skbuff.h> being included?
>
> You probably want to build using the .config file and see.
>
>     Andrew
