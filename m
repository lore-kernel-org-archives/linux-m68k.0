From: Lars Michael <lh_post@yahoo.com>
Subject: coldfire v4e and CONFIG_PREEMPT support
Date: Sat, 21 Jan 2012 21:51:12 -0800 (PST)
Message-ID: <1327211472.37668.YahooMailClassic@web160605.mail.bf1.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org

Hi Geert,

On Fri, Jan 20, 2012 at 14:59, Geert <geert@xxxxxxxxxxxxxx> wrote:
>>On Fri, Jan 20, 2012 at 14:47, Jensen, Bjarne <bkj@xxxxxxx> wrote:
>>We are developing an application on a board with a Coldfire v4e processor >>(m54418) and are wondering if it will be possible to make the kernel 
>>preemptive and how much effort it will take. Has anyone tried it with this >>processor?

>Generic preempt support relies on the spinlocks that were introduced when
>adding SMP support. So far we never had SMP support for m68k, hence we
>didn't do a proper conversion from disable_irq()/enable_irq() to spinlocks,
>and kept on using the simpler local_irq_*() ops in arch/m68k and in several
>drivers. These have to be fixed first.

Bjarne and I work together, our embedded system (mcf54418, kernel 2.6.29) runs a real-time critical app. and we have found that we are not being scheduled for longer periods of time when the kernel is busy. We believe the preempt option is the solution. Are there any current projects or plans to support preempt for m68k? This is a very high priority for us and we can do some coding, and certainly testing, but we need some expert guidance. Would you be interested in helping and seeing preempt supported on this arch?

Thanks and regards
Lars
