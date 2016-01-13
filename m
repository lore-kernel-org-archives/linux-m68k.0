From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [linux-rt-devel:for-kbuild-bot/prepare-release 32/256] warning:
 (DEBUG_ATOMIC_SLEEP) selects PREEMPT_COUNT which has unmet direct
 dependencies (COLDFIRE)
Date: Wed, 13 Jan 2016 11:27:38 +0100
Message-ID: <20160113102738.GA29964__9663.90752369097$1452680897$gmane$org@linutronix.de>
References: <201512240942.TkGuKeY2%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201512240942.TkGuKeY2%fengguang.wu@intel.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, kbuild-all@01.org, David Howells <dhowells@redhat.com>, Richard Kuo <rkuo@codeaurora.org>, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

* kbuild test robot | 2015-12-24 09:57:43 [+0800]:

>All warnings (new ones prefixed by >>):
>
>warning: (DEBUG_ATOMIC_SLEEP) selects PREEMPT_COUNT which has unmet direct dependencies (COLDFIRE)

The situation slightly changed. Before the patch in question:
|warning: (PREEMPT && DEBUG_ATOMIC_SLEEP) selects PREEMPT_COUNT which has unmet direct dependencies (COLDFIRE)

so it is just s@PREEMPT@PREEMPT_COUNT@.

This pops up because DEBUG_ATOMIC_SLEEP can be selected while
kernel/Kconfig.preempt has not been included into Kconfig. This warning
is not limited to m68k but should also pop up on alpha / frv and hexagon.
Those architectures don't include kernel/Kconfig.preempt at all.

Is this something that should be fixed?

Sebastian
