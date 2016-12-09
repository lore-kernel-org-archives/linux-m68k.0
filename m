From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 18/22] m68k/mm: kmap - Modernize printing of kernel
 messages
Date: Sat, 10 Dec 2016 09:50:09 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1612100948260.22611__13378.5260528841$1481323815$gmane$org@nippy.intranet>
References: <1481123360-10978-1-git-send-email-geert@linux-m68k.org> <1481123360-10978-19-git-send-email-geert@linux-m68k.org> <alpine.LNX.2.00.1612081022280.9219@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1612081022280.9219@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org


On Thu, 8 Dec 2016, I wrote:

> 
> On Wed, 7 Dec 2016, Geert Uytterhoeven wrote:
> 
> >   - Convert from printk() to pr_*(),
> >   - Add missing continuations,
> >   - Remove #undef DEBUG.
> > 
> > Note that "#ifdef DEBUG" is sometimes retained because pr_cont() is 
> > not optimized away when debugging is disabled.
> > 
> 
> I think that argues for using printk(KERN_DEBUG ...) and print(KERN_CONT 
> ...) inside #ifdef DEBUG, which would need no explanation.
> 
> If instead you use a combination of pr_debug and pr_cont and #ifdef 
> DEBUG, perhaps the explanation should be moved from the commit log to a 
> comment in the code?
> 

Perhaps a better solution than these alternatives would be,

#if defined(DEBUG)
#define pr_debug_cont pr_cont
#else
#define pr_debug_cont no_printk
#endif

But this API is still surprising and ugly. It doesn't work with 
CONFIG_DYNAMIC_DEBUG but that's not so important.

IMO, a far better linux/printk.h would have provided us with these 
definitions:

#define pr_emerg(fmt, ...) \
        printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
/* ... */
#define pr_debug(fmt, ...) \
        printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
#define pr_cont(fmt, ...) \
        printk(KERN_CONT fmt, ##__VA_ARGS__)

#if defined(CONFIG_DYNAMIC_DEBUG)
#define pr_debug_cond(fmt, ...) \
        dynamic_pr_debug(fmt, ##__VA_ARGS__)
#define pr_cont_cond(fmt, ...) \
        dynamic_pr_cont(fmt, ##__VA_ARGS__)
#elif defined(DEBUG)
#define pr_debug_cond(fmt, ...) \
        printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
#define pr_cont_cond(fmt, ...) \
        no_printk(KERN_CONT pr_fmt(fmt), ##__VA_ARGS__)
#else
#define pr_debug_cond(fmt, ...) \
        no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
#define pr_cont_cond(fmt, ...) \
        no_printk(KERN_CONT pr_fmt(fmt), ##__VA_ARGS__)
#endif

Which have the virtues of symmetry and least surprise.

-- 
