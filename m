From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH 04/10] net: ax88796: Add block_input/output hooks to ax_plat_data
Date: Wed, 18 Apr 2018 15:46:36 +1200
Message-ID: <CAOmrzkKZW5Wpe3LViue4wU6uzc9nwFfO1nKeBfaMcrzGNQopQA@mail.gmail.com>
References: <1523916285-6057-5-git-send-email-schmitzmic@gmail.com>
 <201804180104.AHpJjbYg%fengguang.wu@intel.com> <CAOmrzkKSmp5phhLYvs14N13tPCuAYCOi-2eBrRqnOgB6+Q6Nyw@mail.gmail.com>
 <alpine.LNX.2.21.1804181109040.8@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.21.1804181109040.8@nippy.intranet>
Sender: netdev-owner@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: kbuild test robot <lkp@intel.com>, kbuild-all@01.org, netdev <netdev@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Michael Karcher <Michael.Karcher@fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

Hi Finn,

On Wed, Apr 18, 2018 at 1:23 PM, Finn Thain <fthain@telegraphics.com.au> wrote:
> On Wed, 18 Apr 2018, Michael Schmitz wrote:
>
>> I think this is a false positive - we're encouraged to provide the
>> full parameter list for functions, so the sreuct sk_buff* can't be
>> avoided.
>>
>
> I don't think it's a false positive. I think ax88796.h would need to
> #include <linux/skbuff.h>.
>
> You may be able to get away with a forward declaration, as in,
> struct skbuff;
> but I'm not sure about that. I would have to build mach-anubis.c to check.

I've added a forward declaration for now - worked for struct
net_device as well (would have been missing from the mach-anubis.c
build as well because of the missing netdevice header).

> But why do you need to pass an skbuff pointer here? xs100_block_input()
> only accesses skb->data.

I'm forced to use the same interface as ax_block_input()
(xs100_block_input is a plug-in replacement for that). But both could
be changed. Let's leave that for later please.

> BTW, this patch has an unrelated whitespace change.

Fixed, thanks.

Cheers,

  Michael

>
> --
>
>> Cheers,
>>
>>   Michael
>>
>>
>> On Wed, Apr 18, 2018 at 6:46 AM, kbuild test robot <lkp@intel.com> wrote:
>> > Hi Michael,
>> >
>> > I love your patch! Perhaps something to improve:
>> >
>> > [auto build test WARNING on v4.16]
>> > [cannot apply to net-next/master net/master v4.17-rc1 next-20180417]
>> > [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>> >
>> > url:    https://github.com/0day-ci/linux/commits/Michael-Schmitz/New-network-driver-for-Amiga-X-Surf-100-m68k/20180417-141150
>> > config: arm-samsung (attached as .config)
>> > compiler: arm-linux-gnueabi-gcc (Debian 7.2.0-11) 7.2.0
>> > reproduce:
>> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>> >         chmod +x ~/bin/make.cross
>> >         # save the attached .config to linux build tree
>> >         make.cross ARCH=arm
>> >
>> > All warnings (new ones prefixed by >>):
>> >
>> >    In file included from arch/arm/mach-s3c24xx/mach-anubis.c:42:0:
>> >>> include/net/ax88796.h:35:11: warning: 'struct sk_buff' declared inside parameter list will not be visible outside of this definition or declaration
>> >        struct sk_buff *skb, int ring_offset);
>> >               ^~~~~~~
>> >
>> > vim +35 include/net/ax88796.h
>> >
>> >     20
>> >     21  struct ax_plat_data {
>> >     22          unsigned int     flags;
>> >     23          unsigned char    wordlength;    /* 1 or 2 */
>> >     24          unsigned char    dcr_val;       /* default value for DCR */
>> >     25          unsigned char    rcr_val;       /* default value for RCR */
>> >     26          unsigned char    gpoc_val;      /* default value for GPOC */
>> >     27          u32             *reg_offsets;   /* register offsets */
>> >     28          u8              *mac_addr;      /* MAC addr (only used when
>> >     29                                             AXFLG_MAC_FROMPLATFORM is used */
>> >     30
>> >     31          /* uses default ax88796 buffer if set to NULL */
>> >     32          void (*block_output)(struct net_device *dev, int count,
>> >     33                          const unsigned char *buf, int star_page);
>> >     34          void (*block_input)(struct net_device *dev, int count,
>> >   > 35                          struct sk_buff *skb, int ring_offset);
>> >     36  };
>> >     37
>> >
>> > ---
>> > 0-DAY kernel test infrastructure                Open Source Technology Center
>> > https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
