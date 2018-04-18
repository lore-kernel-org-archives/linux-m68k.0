From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 04/10] net: ax88796: Add block_input/output hooks to
 ax_plat_data
Date: Wed, 18 Apr 2018 03:19:01 +0200
Message-ID: <20180418011901.GC22103@lunn.ch>
References: <1523916285-6057-5-git-send-email-schmitzmic@gmail.com>
 <201804180104.AHpJjbYg%fengguang.wu@intel.com>
 <CAOmrzkKSmp5phhLYvs14N13tPCuAYCOi-2eBrRqnOgB6+Q6Nyw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOmrzkKSmp5phhLYvs14N13tPCuAYCOi-2eBrRqnOgB6+Q6Nyw@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: kbuild test robot <lkp@intel.com>, kbuild-all@01.org, netdev <netdev@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Michael Karcher <Michael.Karcher@fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
List-Id: linux-m68k@vger.kernel.org

On Wed, Apr 18, 2018 at 12:53:21PM +1200, Michael Schmitz wrote:
> I think this is a false positive - we're encouraged to provide the
> full parameter list for functions, so the sreuct sk_buff* can't be
> avoided.

Hi Michael

How is <linux/skbuff.h> being included?

You probably want to build using the .config file and see.

    Andrew
