From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: coldfire v4e and CONFIG_PREEMPT support
Date: Tue, 24 Jan 2012 15:32:13 +1000
Message-ID: <4F1E425D.7090000@snapgear.com>
References: <1327211472.37668.YahooMailClassic@web160605.mail.bf1.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1327211472.37668.YahooMailClassic@web160605.mail.bf1.yahoo.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Lars Michael <lh_post@yahoo.com>
Cc: linux-m68k@lists.linux-m68k.org

Hi Lars,

On 22/01/12 15:51, Lars Michael wrote:
> Hi Geert,
>
> On Fri, Jan 20, 2012 at 14:59, Geert<geert@xxxxxxxxxxxxxx>  wrote:
>>> On Fri, Jan 20, 2012 at 14:47, Jensen, Bjarne<bkj@xxxxxxx>  wrote:
>>> We are developing an application on a board with a Coldfire v4e processor>>(m54418) and are wondering if it will be possible to make the kernel
>>> preemptive and how much effort it will take. Has anyone tried it with this>>processor?
>
>> Generic preempt support relies on the spinlocks that were introduced when
>> adding SMP support. So far we never had SMP support for m68k, hence we
>> didn't do a proper conversion from disable_irq()/enable_irq() to spinlocks,
>> and kept on using the simpler local_irq_*() ops in arch/m68k and in several
>> drivers. These have to be fixed first.
>
> Bjarne and I work together, our embedded system (mcf54418, kernel 2.6.29) runs a real-time critical app. and we have found that we are not being scheduled for longer periods of time when the kernel is busy. We believe the preempt option is the solution. Are there any current projects or plans to support preempt for m68k? This is a very high priority for us and we can do some coding, and certainly testing, but we need some expert guidance. Would you be interested in helping and seeing preempt supported on this arch?

A few years back someone contributed PREEMPT code for ColdFire. I can't
recall who it was right now, but it is in mainline. grep under
arch/m68k for PREEMPT and you will see the few bits added.

Worth having a look at first.

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
