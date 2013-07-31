From: Timur Tabi <timur@tabi.org>
Subject: Re: [PATCH 2/2] Convert PowerPC macro spin_event_timeout() to
 architecture independent macro
Date: Wed, 31 Jul 2013 18:44:58 -0500
Message-ID: <CAOZdJXVvNBR-qf7LXNOHZVstH_Rebxwn-wAkSaBS53Wn55mYCw@mail.gmail.com>
References: <1375187900-17582-1-git-send-email-B44344@freescale.com>
 <1375187900-17582-3-git-send-email-B44344@freescale.com>
 <20130731071630.GI8868@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130731071630.GI8868@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-m32r-ja@ml.linux-m32r.org, linux-m68k@vger.kernel.org, heiko.carstens@de.ibm.com, mattw@codeaurora.org, sparclinux@vger.kernel.org, sam@ravnborg.org, linux-s390@vger.kernel.org, jesper.nilsson@axis.com, linux@arm.linux.org.uk, takata@linux-m32r.org, Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <rob.herring@calxeda.com>, john.stultz@linaro.org, Stephen Warren <swarren@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-m32r@ml.linux-m32r.org, Arpit Goel <B44344@freescale.com>, gregkh@linuxfoundation.org, lkml <linux-kernel@vger.kernel.org>, schwidefsky@de.ibm.com, linux390@de.ibm.com, philb@gnu.org, David Miller <davem@davemloft.net>
List-Id: linux-m68k@vger.kernel.org

On Wed, Jul 31, 2013 at 2:16 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>
> What do you do here if jiffies aren't incrementing (i.e
> interrupts are disabled). The time_before() check won't work
> there and it would be nice if we were able to use this in such
> situations. I think powerpc gets around this by reading the
> hardware timer directly?

I believe that jiffies is always a global variable.  It should behave
the same on PowerPC as on other architectures.

The answer to your question is that you should not use
spin_event_timeout() in interrupt context, because it yields.

(FYI, I'm the author of spin_event_timeout(), so please CC: me on all
changes to it)
